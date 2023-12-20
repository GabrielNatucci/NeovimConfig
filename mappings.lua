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
    -- EXPLORADOR DE ARQUIVOS
    ["<leader>e"] = {
      function() vim.cmd [[:NvimTreeToggle]] end,
      desc = "File explorer",
    },
    -- nnoremap <leader>e :NvimTreeToggle<CR>

    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
