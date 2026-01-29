vim.lsp.inline_completion.enable(true)
-- load lsp/lua_ls.lua
local lua_ls_opts = require("lsp.lua_ls")
vim.lsp.config("lua_ls", lua_ls_opts)
vim.lsp.enable("lua_ls")
-- load lsp/kotlin.lua
local kotlin_opts = require("lsp.kotlin")
vim.lsp.config("kotlin", kotlin_opts)
vim.lsp.enable("kotlin")
-- load lsp/copilot.lua
local copilot_opts = require("lsp.copilot")
vim.lsp.config("copilot", copilot_opts)
vim.lsp.enable("copilot")
