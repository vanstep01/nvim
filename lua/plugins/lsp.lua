local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {
  "tsserver",
  "cssls",
  "eslint",
  "lua_ls",
  "gopls",
  "svelte",
}

local lspconfig = require('lspconfig')
for _, server in pairs(servers) do
    lspconfig[server].setup {
        capabilities = capabilities
    }
end

lspconfig.svelte.setup {
  filetypes = { "svelte" },
  on_attach = function(client, bufnr)
    if client.name == 'svelte' then
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*.js", "*.ts", "*.svelte" },
        callback = function(ctx)
          client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
        end,
      })
    end
    if vim.bo[bufnr].filetype == "svelte" then
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*.js", "*.ts", "*.svelte" },
        callback = function(ctx)
          client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
        end,
      })
    end
  end
}

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = {buffer = ev.buf}
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<Leader>la', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<Leader>lf', function() vim.lsp.buf.format {async = true} end, opts)
    end
})
