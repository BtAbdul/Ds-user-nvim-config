---@type MappingsTable
local M = {}
local fn = vim.fn
local cwd = vim.fn.stdpath "config" .. "/"
local config_dir = { cwd }

M.MarkdownPreview = {
  plugin = true,
  n = {
    ["<leader>m"] = {
      function()
        if vim.bo.filetype == "markdown" then
          vim.cmd "MarkdownPreviewToggle"
        else
          vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markdown-Preview" })
        end
      end,
      "Markdown Preview",
      opts = { silent = true },
    },
  },
}

M.NvimTree = {
  plugin = true,
  n = {
    ["<leader>e"] = { ":NvimTreeToggle<cr>", "Explorer", opts = { silent = true } },
  },
}

M.Dap = {
  plugin = true,
  n = {
    ["<leader>dc"] = { ":lua require'dap'.continue()<cr>", "Continue", opts = { silent = true } },
    ["<leader>do"] = { ":lua require'dap'.step_over()<cr>", "Step Over", opts = { silent = true } },
    ["<leader>di"] = { ":lua require'dap'.step_into()<cr>", "Step Into", opts = { silent = true } },
    ["<leader>du"] = { ":lua require'dap'.step_out()<cr>", "Step Out", opts = { silent = true } },
    ["<leader>db"] = { ":lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint", opts = { silent = true } },
    ["<leader>dB"] = {
      ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
      "Breakpoint Condition",
      opts = { silent = true },
    },
    ["<leader>dd"] = { ":lua require'dapui'.toggle()<cr>", "Dap UI", opts = { silent = true } },
    ["<leader>dl"] = { ":lua require'dap'.run_last()<cr>", "Run Last", opts = { silent = true } },
  },
}

M.Neotest = {
  plugin = true,
  n = {
    ["<leader>Tt"] = {
      function()
        vim.cmd 'lua require("neotest").run.run(vim.fn.expand "%")'
      end,
      "Run File",
      opts = { silent = true },
    },
    ["<leader>TT"] = {
      function()
        vim.cmd 'lua require("neotest").run.run(vim.loop.cwd())'
      end,
      "Run All Test Files",
      opts = { silent = true },
    },
    ["<leader>Tr"] = {
      function()
        vim.cmd 'lua require("neotest").run.run()'
      end,
      "Run Nearest",
      opts = { silent = true },
    },
    ["<leader>Td"] = {
      function()
        vim.cmd 'lua require("neotest").run.run { strategy = "dap" }'
      end,
      "Run Dap",
      opts = { silent = true },
    },
    ["<leader>Ts"] = {
      function()
        vim.cmd 'lua require("neotest").summary.toggle()'
      end,
      "Toggle Summary",
      opts = { silent = true },
    },
    ["<leader>To"] = {
      function()
        vim.cmd 'lua require("neotest").output.open { enter = true, auto_close = true }'
      end,
      "Show Output",
      opts = { silent = true },
    },
    ["<leader>TO"] = {
      function()
        vim.cmd 'lua require("neotest").output_panel.toggle()'
      end,
      "Toggle Output Panel",
      opts = { silent = true },
    },
    ["<leader>TS"] = {
      function()
        vim.cmd 'lua require("neotest").run.stop()'
      end,
      "Stop",
      opts = { silent = true },
    },
  },
}

M.Neovim = {
  n = {
    ["<leader>nf"] = {
      function()
        require("telescope.builtin").find_files {
          prompt_title = "Config Files",
          search_dirs = config_dir,
          cwd = cwd,
        }
      end,
      "Find Config Files",
      opts = { silent = true },
    },
    ["<leader>ng"] = {
      function()
        require("telescope.builtin").live_grep {
          prompt_title = "Config Files",
          search_dirs = config_dir,
          cwd = cwd,
        }
      end,
      "Grep Config Files",
      opts = { silent = true },
    },
    ["<leader>nc"] = {
      ":NvCheatsheet<cr>",
      "Cheatsheet",
      opts = { silent = true },
    },
    ["<leader>ni"] = {
      function()
        if vim.fn.has "nvim-0.9.0" == 1 then
          vim.cmd "Inspect"
        else
          vim.notify("Inspect isn't available in this neovim version", vim.log.levels.WARN, { title = "Inspect" })
        end
      end,
      "Inspect",
      opts = { silent = true },
    }, -- only available on neovim >= 0.9
    ["<leader>nm"] = { ":messages<cr>", "Messages", opts = { silent = true } },
    ["<leader>nh"] = { ":checkhealth<cr>", "Health", opts = { silent = true } },
    ["<leader>nv"] = {
      function()
        local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
        return vim.notify(version, vim.log.levels.INFO, { title = "Neovim Version" })
      end,
      "Version",
      opts = { silent = true },
    },
  },
}

M.Telescope = {
  plugin = true,
  n = {
    ["<leader>fa"] = { ":Telescope autocommands<cr>", "Autocommmands", opts = { silent = true } },
    ["<leader>ff"] = { ":Telescope find_files<cr>", "Files", opts = { silent = true } },
    ["<leader>fm"] = { ":Telescope marks<cr>", "Marks", opts = { silent = true } },
    ["<leader>fw"] = { ":Telescope live_grep<cr>", "Word", opts = { silent = true } },
    ["<leader>ft"] = { ":Telescope themes<cr>", "Themes", opts = { silent = true } },
    -- B = { ":Telescope bookmarks<cr>", "Browswer Bookmarks" , opts = { silent = true }},
    ["<leader>fb"] = { ":Telescope buffers<cr>", "Buffers", opts = { silent = true } },
    ["<leader>fn"] = {
      ":lua require('telescope').extensions.notify.notify()<cr>",
      "Notify History",
      opts = { silent = true },
    },
    ["<leader>fp"] = { ":Telescope projects<cr>", "Projects", opts = { silent = true } },
    -- s = { ":Telescope persisted<cr>", "Sessions" , opts = { silent = true }},
    ["<leader>fh"] = { ":Telescope help_tags<cr>", "Help", opts = { silent = true } },
    ["<leader>fk"] = { ":Telescope keymaps<cr>", "Keymaps", opts = { silent = true } },
    ["<leader>fC"] = { ":Telescope commands<cr>", "Commands", opts = { silent = true } },
    ["<leader>fr"] = { ":Telescope oldfiles<cr>", "Recent Files", opts = { silent = true } },
    ["<leader>fH"] = { ":Telescope highlights<cr>", "Highlights", opts = { silent = true } },
    ["<leader>ls"] = { ":Telescope lsp_document_symbols<cr>", "Buffer Symbols", opts = { silent = true } },
    ["<leader>lS"] = { ":Telescope lsp_workspace_symbols<cr>", "Workspace Symbols", opts = { silent = true } },
    ["<leader>go"] = { ":Telescope git_status<cr>", "Open changed file", opts = { silent = true } },
    ["<leader>gb"] = { ":Telescope git_branches<cr>", "Checkout branch", opts = { silent = true } },
    ["<leader>gc"] = { ":Telescope git_commits<cr>", "Checkout commit", opts = { silent = true } },
  },
}

M.Toggleterm = {
  plugin = true,
  n = {
    ["<leader>tf"] = { ":ToggleTerm direction=float<cr>", "Float Terminal", opts = { silent = true } },
    ["<leader>th"] = { ":ToggleTerm size=10 direction=horizontal<cr>", "Horizontal Terminal", opts = { silent = true } },
    ["<leader>tv"] = { ":ToggleTerm size=50 direction=vertical<cr>", "Vertical Terminal", opts = { silent = true } },
  },
}

M.Trouble = {
  plugin = true,
  n = {
    ["<leader>ld"] = { ":TroubleToggle document_diagnostics<cr>", "Buffer Diagnostics", opts = { silent = true } },
    ["<leader>lw"] = { ":TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics", opts = { silent = true } },
    ["<leader>fT"] = { ":TodoTrouble<cr>", "Todo", opts = { silent = true } },
  },
}

M.Lspsaga = {
  plugin = true,
  n = {
    ["<leader>la"] = { ":Lspsaga code_action<cr>", "Code Action", opts = { silent = true } },
    ["<leader>lo"] = { ":Lspsaga outline<cr>", "Code Outline", opts = { silent = true } },
    ["<leader>lI"] = { ":Lspsaga incoming_calls<cr>", "Incoming Calls", opts = { silent = true } },
    ["<leader>lO"] = { ":Lspsaga outgoing_calls<cr>", "Outgoing Calls", opts = { silent = true } },
    ["<leader>lr"] = { ":Lspsaga rename<cr>", "Rename", opts = { silent = true } },
  },
  v = {
    ["<leader>la"] = { ":Lspsaga code_action<cr>", "Code Action", opts = { silent = true } },
  },
}

M.Mason = {
  plugin = true,
  n = {
    ["<leader>lm"] = { ":Mason<cr>", "Mason Installer", opts = { silent = true } },
    ["<leader>lj"] = {
      ":Lspsaga diagnostic_jump_next<cr>",
      "Next Diagnostic",
      opts = { silent = true },
    },
    ["<leader>lk"] = {
      ":Lspsaga diagnostic_jump_prev<cr>",
      "Prev Diagnostic",
      opts = { silent = true },
    },
  },
}

M.LSP = {
  plugin = true,
  n = {
    ["<leader>lf"] = { ":Format<cr>", "Format", opts = { silent = true } },
    ["<leader>li"] = { ":LspInfo<cr>", "Info", opts = { silent = true } },
    ["<leader>lR"] = { ":LspRestart<cr>", "Restart", opts = { silent = true } },
  },
  v = {
    ["<leader>lf"] = { ":Format<cr>", "Format", opts = { silent = true } },
  },
}

if vim.lsp.inlay_hint then
  M.LSP.n["<leader>lh"] = { ":lua vim.lsp.inlay_hint(0, nil)<cr>", "Inlay Hint", opts = { silent = true } }
end

M.Git = {
  plugin = true,
  n = {
    ["<leader>gg"] = {
      function()
        ClickGit()
      end,
      "Lazygit",
      opts = { silent = true },
    },
    ["<leader>gj"] = { ":lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk", opts = { silent = true } },
    ["<leader>gk"] = { ":lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk", opts = { silent = true } },
    ["<leader>gl"] = { ":lua require 'gitsigns'.blame_line()<cr>", "Blame", opts = { silent = true } },
    ["<leader>gp"] = { ":lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk", opts = { silent = true } },
    ["<leader>gr"] = { ":lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk", opts = { silent = true } },
    ["<leader>gR"] = { ":lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer", opts = { silent = true } },
    ["<leader>gs"] = { ":lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk", opts = { silent = true } },
    ["<leader>gu"] = { ":lua reguire 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stgge Hunk", opts = { silent = true } },
    ["<leader>gd"] = {
      function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd "DiffviewOpen"
        else
          vim.cmd "DiffviewClose"
        end
      end,
      "Toggle Diffview",
      opts = { silent = true },
    },
  },
}

M.Lazy = {
  n = {
    ["<leader>pc"] = { ":Lazy clean<cr>", "Lazy Clean", opts = { silent = true } },
    ["<leader>pC"] = { ":Lazy check<cr>", "Lazy Check", opts = { silent = true } },
    ["<leader>pd"] = { ":Lazy debug<cr>", "Lazy Debug", opts = { silent = true } },
    ["<leader>pi"] = { ":Lazy install<cr>", "Lazy Install", opts = { silent = true } },
    ["<leader>ps"] = { ":Lazy sync<cr>", "Lazy Sync", opts = { silent = true } },
    ["<leader>pl"] = { ":Lazy log<cr>", "Lazy Log", opts = { silent = true } },
    ["<leader>ph"] = { ":Lazy home<cr>", "Lazy Home", opts = { silent = true } },
    ["<leader>pH"] = { ":Lazy help<cr>", "Lazy Help", opts = { silent = true } },
    ["<leader>pp"] = { ":Lazy profile<cr>", "Lazy Profile", opts = { silent = true } },
    ["<leader>pu"] = { ":Lazy update<cr>", "Lazy Update", opts = { silent = true } },
  },
}

M.General = {
  i = {
    -- ["jk"] = {
    --   "<Esc>",
    --   "Enter insert mode",
    -- },

    ["<A-j>"] = {
      "<Esc>:m .+1<CR>==gi",
      "Move the line up",
      opts = { silent = true },
    },

    ["<A-k>"] = {
      "<Esc>:m .-2<CR>==gi",
      "Move the line down",
      opts = { silent = true },
    },
  },
  n = {
    -- ["<leader>a"] = { ":Nvdash<cr>", "Nvdash", opts = { silent = true } },
    ["<leader>r"] = { ":%d+<cr>", "Remove All Text", opts = { silent = true } },
    ["<leader>y"] = { ":%y+<cr>", "Yank All Text", opts = { silent = true } },
    ["<leader>q"] = { ":qa!<cr>", "Quit", opts = { silent = true } },
    ["<leader>c"] = { ":Bdelete!<cr>", "Close Buffer", opts = { silent = true } },
    ["<leader>ol"] = { ":set nu!<cr>", "Toggle line number", opts = { silent = true } },
    ["<leader>or"] = { ":set rnu!<cr>", "Toggle relative number", opts = { silent = true } },
    ["<leader>ot"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle Transparency",
    },
    ["<F5>"] = {
      function()
        RunCode()
      end,
      "Run Code",
      opts = { silent = true },
    },

    -- ["jk"] = {
    --   "<Esc>",
    --   "Enter insert mode",
    -- opts = { silent = true },
    -- },

    ["j"] = {
      "v:count == 0 ? 'gj' : 'j'",
      "Better Down",
      opts = { expr = true, silent = true },
    },

    ["k"] = {
      "v:count == 0 ? 'gk' : 'k'",
      "Better Up",
      opts = { expr = true, silent = true },
    },

    ["<C-j>"] = {
      "<C-w>j",
      "Go to upper window",
      opts = { silent = true },
    },

    ["<C-k>"] = {
      "<C-w>k",
      "Go to lower window",
      opts = { silent = true },
    },

    ["<C-h>"] = {
      "<C-w>h",
      "Go to left window",
      opts = { silent = true },
    },

    ["<C-l>"] = {
      "<C-w>l",
      "Go to right window",
      opts = { silent = true },
    },

    -- ["<Leader>w"] = {
    --   "<C-w>w",
    --   "Go to next window",
    -- opts = { silent = true },
    -- },

    [";"] = {
      function()
        if vim.bo.buftype == "terminal" then
          vim.cmd "Bdelete!"
          vim.cmd "silent! close"
        elseif #vim.api.nvim_list_wins() > 1 then
          vim.cmd "silent! close"
        else
          vim.notify("Can't Close Window", vim.log.levels.WARN, { title = "Close Window" })
        end
      end,
      "Close window",
      opts = { silent = true },
    },

    ["<C-Up>"] = {
      ":resize +2<CR>",
      "Add size at the top",
      opts = { silent = true },
    },

    ["<C-Down>"] = {
      ":resize -2<CR>",
      "Add size at the bottom",
      opts = { silent = true },
    },

    ["<C-Left>"] = {
      ":vertical resize +2<CR>",
      "Add size at the left",
      opts = { silent = true },
    },

    ["<C-Right>"] = {
      ":vertical resize -2<CR>",
      "Add size at the right",
      opts = { silent = true },
    },

    ["H"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Go to previous buffer",
      opts = { silent = true },
    },
    ["L"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Go to next buffer",
      opts = { silent = true },
    },

    ["<Left>"] = {
      ":tabprevious<CR>",
      "Go to previous tab",
      opts = { silent = true },
    },

    ["<Right>"] = {
      ":tabnext<CR>",
      "Go to next tab",
      opts = { silent = true },
    },

    ["<Up>"] = {
      ":tabnew<CR>",
      "New tab",
      opts = { silent = true },
    },

    ["<Down>"] = {
      ":tabclose<CR>",
      "Close tab",
      opts = { silent = true },
    },

    ["<"] = {
      "<<",
      "Indent backward",
      opts = { silent = true },
    },

    [">"] = {
      ">>",
      "Indent forward",
      opts = { silent = true },
    },

    ["<A-j>"] = {
      ":m .+1<CR>==",
      "Move the line up",
      opts = { silent = true },
    },

    ["<A-k>"] = {
      ":m .-2<CR>==",
      "Move the line down",
      opts = { silent = true },
    },
  },
  v = {
    ["j"] = {
      "v:count == 0 ? 'gj' : 'j'",
      "Better Down",
      opts = { expr = true, silent = true },
    },

    ["k"] = {
      "v:count == 0 ? 'gk' : 'k'",
      "Better Up",
      opts = { expr = true, silent = true },
    },

    ["p"] = {
      '"_dP',
      "Better Paste",
      opts = { silent = true },
    },

    -- ["jk"] = {
    --   "<Esc>",
    --   "Enter insert mode",
    -- },

    ["<"] = {
      "<gv",
      "Indent backward",
      opts = { silent = true },
    },

    [">"] = {
      ">gv",
      "Indent forward",
      opts = { silent = true },
    },

    ["<A-j>"] = {
      ":m '>+1<CR>gv=gv",
      "Move the selected text up",
      opts = { silent = true },
    },

    ["<A-k>"] = {
      ":m '<-2<CR>gv=gv",
      "Move the selected text down",
      opts = { silent = true },
    },
  },
  x = {

    ["j"] = {
      "v:count == 0 ? 'gj' : 'j'",
      "Better Down",
      opts = { expr = true, silent = true },
    },

    ["k"] = {
      "v:count == 0 ? 'gk' : 'k'",
      "Better Up",
      opts = { expr = true, silent = true },
    },

    ["<A-j>"] = {
      ":m '>+1<CR>gv=gv",
      "Move the selected text up",
      opts = { silent = true },
    },

    ["<A-k>"] = {
      ":m '<-2<CR>gv=gv",
      "Move the selected text down",
      opts = { silent = true },
    },
  },
  c = {
    ["<Tab>"] = {
      function()
        if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
          return "<CR>/<C-r>/"
        end
        return "<C-z>"
      end,
      "Word Search Increment",
      opts = { expr = true },
    },

    ["<S-Tab>"] = {
      function()
        if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
          return "<CR>?<C-r>/"
        end
        return "<S-Tab>"
      end,
      "Word Search Decrement",
      opts = { expr = true },
    },
  },
  t = {
    ["<Esc>"] = {
      "<C-\\><C-n>",
      "Enter insert mode",
      opts = { silent = true },
    },
  },
}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    -- cycle through buffers
    ["<tab>"] = "",
    ["<Up>"] = "",
    ["<Down>"] = "",
    ["<C-c>"] = "",
    ["<C-s>"] = "",
    ["<Esc>"] = "",
    ["<leader>rn"] = "",
    ["<leader>/"] = "",
    ["<S-tab>"] = "",
    ["<leader>x"] = "",
    ["gD"] = "",
    ["gd"] = "",
    ["K"] = "",
    ["gi"] = "",
    ["<leader>ls"] = "",
    ["<leader>D"] = "",
    ["<leader>ra"] = "",
    ["<leader>ca"] = "",
    ["gr"] = "",
    ["<leader>f"] = "",
    ["[d"] = "",
    ["]d"] = "",
    ["<leader>q"] = "",
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",
    ["<leader>e"] = "",
    ["<C-n>"] = "",
    ["<leader>fa"] = "",
    ["<leader>fw"] = "",
    ["<leader>fb"] = "",
    ["<leader>fh"] = "",
    ["<leader>fo"] = "",
    ["<leader>fz"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
    ["<leader>pt"] = "",
    ["<leader>th"] = "",
    ["<leader>b"] = "",
    ["<leader>ma"] = "",
    ["<leader>wK"] = "",
    ["<leader>wk"] = "",
    ["<leader>cc"] = "",
    ["]c"] = "",
    ["[c"] = "",
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["<leader>gb"] = "",
    ["<leader>td"] = "",
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    ["<leader>fm"] = "",
    ["<leader>ch"] = "",
    ["<leader>ff"] = "",
    ["<leader>n"] = "",
  },
}

return M
