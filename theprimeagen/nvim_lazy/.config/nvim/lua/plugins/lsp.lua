return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local lsp = require('lsp-zero').preset({})

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
        -- Custom keybindings from your original setup
        local opts = {buffer = bufnr}

        -- Go to definition of symbol under cursor
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        -- Show hover information of symbol under cursor
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- Search for symbol in workspace
        vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
        -- Show diagnostics in a floating window
        vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
        -- Copy diagnostic to clipboard
        vim.keymap.set('n', '<leader>vc', function()
            local diagnostic = vim.diagnostic.get_line(0)[1]
            if diagnostic then
                vim.fn.setreg('+', diagnostic.message)
                print("Diagnostic copied to clipboard!")
            else
                print("No diagnostic message at current line")
            end
        end, opts)
        -- shows all diagnostics in a list
        vim.keymap.set('n', '<leader>va', function()
            local diagnostics = vim.diagnostic.get(0)
            if #diagnostics == 0 then
                print("No diagnostics found")
                return
            end

            local lines = {}
            for _, d in ipairs(diagnostics) do
                table.insert(lines, d.message)
            end

            local all_diagnostics = table.concat(lines, "\n")
            vim.fn.setreg('+', all_diagnostics)
            print("All diagnostics copied to clipboard!")
        end, opts)
        -- Jump to next diagnostic
        vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
        -- Jump to previous diagnostic
        vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
        -- Show code actions available at cursor position
        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
        -- Show references of symbol under cursor
        vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
        -- Rename symbol under cursor
        vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
        -- Show signature help while typing in insert mode
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
      end)

      -- Configure Lua language server
      lsp.nvim_workspace()

      -- Setup Mason
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {'ts_ls', 'rust_analyzer', 'lua_ls'},
        automatic_installation = true,  -- Add this line
        handlers = {
          lsp.default_setup,
          lua_ls = function()
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls({
              settings = {
                Lua = {
                  runtime = {
                    version = 'LuaJIT'
                  },
                  diagnostics = {
                    globals = {'vim'},
                  },
                  workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                  },
                },
              },
            }))
          end,
        },
      })

      lsp.setup()

      -- CMP setup
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
            -- Navigate to previous item in completion menu
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          -- Navigate to next item in completion menu
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Confirm selection
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          -- Show completion menu
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
        sources = {
          {name = 'nvim_lsp'},
          {name = 'luasnip'},
          {name = 'buffer'},
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end,
  },
}
