local lspconfig = require('lspconfig')

lspconfig.clangd.setup({})
lspconfig.cmake.setup({})
lspconfig.docker_compose_language_service.setup({})
lspconfig.dockerls.setup {
    settings = {
        docker = {
	        languageserver = {
	            formatter = { ignoreMultilineInstructions = true, },
	        },
	    }
    }
}
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
