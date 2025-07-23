local root_files = {
	".git",
}

return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'mason-org/mason.nvim',
		'mason-org/mason-lspconfig.nvim',

    "mfussenegger/nvim-jdtls",

		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',


		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',

		'stevearc/conform.nvim',
	},
	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "pyright", "html", "cssls", "quick_lint_js", "bashls", "jdtls", "vimls", "marksman", "yamlls", "nil_ls", "lua_ls" },
			automatic_enable = true,

      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup{}
        end,

        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup {
            settings = {
              Lua = {
                format = {
                  enable = true,
                  defaultConfig = {
                    indent_style = "space",
                    indent_size = "2",
                  }
                },
              }
            }
          }
        end,

        ["jdtls"] = function()
          require("lspconfig").jdtls.setup {}
        end,
      }
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

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
      virtual_text = true,
    })
	end
}
