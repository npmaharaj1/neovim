local root_files = {
	".git",
}

return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'mason-org/mason.nvim',
		'mason-org/mason-lspconfig.nvim',

		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',

		-- 'L3MON4D3/LuaSnip',
		-- 'saadparwaiz1/cmp_luasnip',

		-- 'stevearc/conform.nvim',
	},
	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "pyright", "html", "cssls", "quick_lint_js", "bashls", "ast_grep", "lua_ls", "vimls", "marksman", "yamlls" },
			automatic_enable = true,
		})

		local cmp = require('cmp')
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<A-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<A-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<A-u>'] = cmp.mapping.confirm({ select = true }),
				["<A-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' }, -- For luasnip users.
			}, {
				{ name = 'buffer' },
			})
		})


	end
}
