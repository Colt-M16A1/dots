require("mason").setup()
require("mason-lspconfig").setup()

local util = require "lspconfig/util"

-- LSP Languages
require'lspconfig'.clangd.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.lua_ls.setup({
  on_attach = function(client)
  local fname = vim.api.nvim_buf_get_name(0)
  if fname:match("garrysmod/") then
    client.stop()
  end
end,})


-- diagnostic symbols
local signs = { Error = "", Warn = "", Hint = "󰌶", Info =  ""}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.api.nvim_create_user_command("DiagnosticToggle", function()
		local config = vim.diagnostic.config
		local vt = config().virtual_text
		config {
			virtual_text = not vt,
			underline = not vt,
			signs = not vt,
		}
end, {desc = "toggle diagnostic"})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.opt.shortmess = vim.opt.shortmess + {c = true}
vim.api.nvim_set_option('updatetime', 300)

vim.cmd([[set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    " 󰆧  (Method)",
    " 󰊕  (Function)",
    "   (Constructor)",
    " 󰠴  (Field)",
    "[] (Variable)",
    " 󰌗  (Class)",
    " 󰜰  (Interface)",
    " 󰅩  (Module)",
    " 󰖷 (Property)",
    "   (Unit)",
    " 󰎠  (Value)",
    " 󰕘 (Enum)",
    " 󰌋  (Keyword)",
    "   (Snippet)",
    " 󰏘  (Color)",
    " 󰈔  (File)",
    " 󰈝  (Reference)",
    " 󰉋  (Folder)",
    "   (EnumMember)",
    " 󰞂  (Constant)",
    " 󰟦  (Struct)",
    "   (Event)",
    " 󰃬  (Operator)",
    " 󰊄  (TypeParameter)"
}

-- Glua Mess
local null_ls = require("null-ls")

local severities = {
    error = 1,
    warning = 2,
    information = 3,
    hint = 4,
}

local glualint = {
    name = "glualint",
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "lua" },
    generator = null_ls.generator({
        command = "glualint",
        args = { "lint", "--stdin" },
        to_stdin = true,
        from_stderr = true,
        format = "line",
				on_output = function(line)
					local pattern = "^.-: %[(%w+)%] line (%d+), column (%d+) %- line (%d+), column (%d+): (.+)$"
					local severity, start_line, start_col, end_line, end_col, message = line:match(pattern)

					if not severity then
						return nil
					end

					return {
						row = tonumber(start_line),
						col = tonumber(start_col),
						end_row = tonumber(end_line),
						end_col = tonumber(end_col),
						source = "glualint",
						message = message,
						severity = severity == "Error" and severities.error or severities.warning,
					}
			end,
		}),
}


--local glualint_formatting = {
--		method = null_ls.methods.FORMATTING,
--    filetypes = { "lua" },
--    generator = null_ls.generator({
--        command = "glualint",
--        args = { "pretty-print", "--stdin" },
--        to_stdin = true,
--    }),
--}

null_ls.setup({
    update_in_insert = true,
    sources = {
        glualint,
        null_ls.builtins.formatting.stylua.with({
            extra_args = { "--indent-width", "4", "--indent-type", "Spaces" },
        }),
--        glualint_formatting,
    },
})
