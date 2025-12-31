require("flutter-tools").setup_project({
  {
    name = "Chrome Dev (debug)",
    target = "lib/main.dart",
    flutter_mode = "debug",
    device = "chrome",
  },
  {
    name = "Web-server Dev (debug)",
    target = "lib/main.dart",
    flutter_mode = "debug",
    device = "web-server",
    web_port = "1818",
    additional_args = { "--wasm", "--web-hostname=0.0.0.0" }
  },
})
