return {
  cmd = {
    "env",
    "JAVA_TOOL_OPTIONS=-Xms128m -Xmx512m -XX:MaxMetaspaceSize=256m",
    "kotlin-language-server",
  },
  filetypes = { "kotlin" },
}
