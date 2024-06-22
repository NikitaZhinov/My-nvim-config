require'nvim-treesitter.configs'.setup {
  	ensure_installed = { "bash", "c", "c_sharp", "cmake", "cpp", "css", "dockerfile",
			     "doxygen", "git_config", "git_rebase", "gitattributes",
			     "gitcommit", "gitignore", "html", "java", "javascript", "json",
			     "json5", "llvm", "lua", "luadoc", "luau", "make", "ninja",
			     "python", "rust", "sql", "ssh_config", "vim", "vimdoc", "yaml"
	},

	sync_install = false,
  	auto_install = true,

  	highlight = {
		enable = true,
	},
}
