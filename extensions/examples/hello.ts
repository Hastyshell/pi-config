import type { ExtensionAPI } from "@mariozechner/pi-coding-agent";

// Sample extension: copy this file to extensions/hello.ts to auto-load it.
export default function (pi: ExtensionAPI) {
  pi.registerCommand("hello", {
    description: "Say hello from a sample extension",
    handler: async (args, ctx) => {
      ctx.ui.notify(`Hello ${args || "world"}!`, "info");
    }
  });
}
