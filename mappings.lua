-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- TROUBLE NVIM --
    ["<leader>xx"] = {
      function() require("trouble").toggle() end,
    },
    ["<leader>xw"] = {
      function() require("trouble").toggle "workspace_diagnostics" end,
      desc = "Workspace Diagnostics",
    },
    ["<leader>xd"] = {
      function() require("trouble").toggle "document_diagnostics" end,
      desc = "Document Diagnostics",
    },
    ["<leader>xq"] = {
      function() require("trouble").toggle "quickfix" end,
      desc = "Quickfix",
    },
    ["<leader>xl"] = {
      function() require("trouble").toggle "loclist" end,
      desc = "Location List",
    },
    -- COMPILAR E RODAR --
    ["<leader>;"] = { name = "Compile & run" },
    ["<leader>;o"] = {
      function() vim.cmd [[CompilerToggleResults]] end,
      desc = "Compiler Results Toggle Open",
    },
    ["<leader>;c"] = {
      function() vim.cmd [[CompilerOpen]] end,
      desc = "Compiler Open",
    },
    ["<leader>;r"] = {
      function() require("executor").commands.run() end,
      desc = "Executor Run",
    },
    ["<leader>;s"] = {
      function() require("executor").commands.set_command() end,
      desc = "Set Command",
    },
    ["<leader>;p"] = {
      function() require("executor").commands.show_presets() end,
      desc = "Presets",
    },
    ["<leader>;d"] = {
      function() require("executor").commands.toggle_detail() end,
      desc = "Detail",
    },
    -- FILE EXPLORER
    ["<leader>e"] = {
      function() vim.cmd [[:NvimTreeToggle]] end,
      desc = "File explorer",
    },
    -- SEARCH AND REPLACE
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- ATALHOS PARA SEPRACAO DE JANELA
    -- ["<C-s>"] = { ":split<cr>", desc = "New Horizontal Window" },
    -- ATALHO PARA PROCURAR ARQUIVO
    ["<C-f>"] = {
      function() require("telescope.builtin").find_files() end,
      desc = "Find files",
    },
    -- REMAPS UTEIS
    ["<C-u>"] = { "<C-u>zz" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<leader>a"] = { "<C-6>", desc = "Open Last File"},
    ["n"] = { "nzz" }, 
    ["N"] = { "Nzz" }, 
    ["<C-g>"] = {
      function()
        local worktree = require("astronvim.utils.git").file_worktree()
        local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir) or ""
        require("astronvim.utils").toggle_term_cmd("lazygit " .. flags)
      end,
      desc = "ToggleTerm lazygit",
    },

  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    -- react-extract
    ["<leader>rn"] = {
      function()
        require("react-extract").extract_to_new_file()
      end,
      desc = "React extract to new file",
    },
    ["<leader>rc"] = {
      function()
        require("react-extract").extract_to_current_file()
      end,
      desc = "React extract to current file",
    },
    ["<leader>r"] = { name = "React Extract" },
  },
}
