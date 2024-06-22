local lspconfig = require('lspconfig')

lspconfig.cmake.setup({})
lspconfig.csharp_ls.setup({})
lspconfig.docker_compose_language_service.setup({})
lspconfig.lua_ls.setup({})
lspconfig.postgres_lsp.setup({})
lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({
settrings = {
	['rust-analyzer'] = {
      		diagnostics = { enable = false; }
    	}
}
})
