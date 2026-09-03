import { spawn } from "node:child_process";
import { fileURLToPath } from "node:url";

const root = fileURLToPath(new URL("..", import.meta.url));
const port = 9228;
const pageUrl = `file://${root}fixtures/release/browser.html`;
const chrome = spawn("google-chrome", ["--headless=new", "--no-sandbox", "--disable-gpu", "--disable-background-networking", "--allow-file-access-from-files", "--remote-allow-origins=*", "--remote-debugging-address=127.0.0.1", `--remote-debugging-port=${port}`, "--user-data-dir=/tmp/hx-opencv-release-cdp", pageUrl], { stdio: "ignore" });
const pause = (milliseconds) => new Promise((resolve) => setTimeout(resolve, milliseconds));
async function evaluate(expression) {
  const pages = await (await fetch(`http://127.0.0.1:${port}/json`)).json();
  const page = pages.find((candidate) => candidate.url === pageUrl);
  if (!page) throw new Error("browser fixture was not opened");
  const socket = new WebSocket(page.webSocketDebuggerUrl);
  await new Promise((resolve, reject) => { socket.addEventListener("open", resolve, { once: true }); socket.addEventListener("error", reject, { once: true }); });
  const response = await new Promise((resolve, reject) => {
    const timeout = setTimeout(() => reject(new Error("CDP evaluation timed out")), 5000);
    socket.addEventListener("message", (event) => { const message = JSON.parse(event.data); if (message.id === 1) { clearTimeout(timeout); resolve(message); } });
    socket.send(JSON.stringify({ id: 1, method: "Runtime.evaluate", params: { expression, returnByValue: true } }));
  });
  socket.close();
  return response.result.result.value;
}
try {
  let state;
  let lastError;
  for (let attempt = 0; attempt < 20; attempt++) {
    try {
      state = JSON.parse(await evaluate("JSON.stringify({ready:!!globalThis.__hxOpenCvReleaseReady,functions:[typeof globalThis.cv?.Mat,typeof globalThis.cv?.absdiff,typeof globalThis.cv?.cornerHarris,typeof globalThis.cv?.ORB,typeof globalThis.cv?.BackgroundSubtractorMOG2,typeof globalThis.cv?.QRCodeDetector,typeof globalThis.cv?.CLAHE,typeof globalThis.cv?.blobFromImage,typeof globalThis.cv?.Rodrigues],errors:globalThis.__hxOpenCvReleaseErrors})"));
      if (state.ready) break;
    } catch (error) {
      lastError = String(error?.message || error);
    }
    await pause(500);
  }
  if (!state?.ready || state.functions.some((value) => value !== "function") || state.errors.length !== 0) throw new Error(`browser release fixture failed: ${JSON.stringify(state)}${lastError ? ` (${lastError})` : ""}`);
  console.log(JSON.stringify({ browserRuntime: "ready", ...state }));
} finally {
  chrome.kill("SIGINT");
}
