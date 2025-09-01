return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function()
      return {
        filesystem = {
          window = {
            mappings = {
              -- disable fuzzy finder
              ["/"] = "noop",
              -- Jump to current nodes parent
              -- like `p` in NERDTree Mappings
              ["P"] = function(state)
                local tree = state.tree
                local node = tree:get_node()
                local parent_node = tree:get_node(node:get_parent_id())
                local renderer = require("neo-tree.ui.renderer")
                renderer.redraw(state)
                renderer.focus_node(state, parent_node:get_id())
              end,
              ["T"] = { "toggle_preview", config = { use_float = true } },
              ["Y"] = function(state)
                local node = state.tree:get_node()
                local filepath = node:get_id()
                local filename = node.name
                local modify = vim.fn.fnamemodify

                local vals = {
                  ["BASENAME"] = modify(filename, ":r"),
                  ["EXTENSION"] = modify(filename, ":e"),
                  ["FILENAME"] = filename,
                  ["PATH (CWD)"] = modify(filepath, ":."),
                  ["PATH (HOME)"] = modify(filepath, ":~"),
                  ["PATH (ABSOLUTE)"] = filepath,
                }
                local options = vim.tbl_filter(
                  function(val)
                    return vals[val] ~= ""
                  end,
                  vim.tbl_keys(vals)
                )
                if vim.tbl_isempty(options) then
                  vim.notify("No values to copy", vim.log.levels.WARN)
                  return
                end
                table.sort(options)
                vim.ui.select(options,
                  {
                    prompt = "Choose to copy to clipboard:",
                    format_item = function(item)
                      return ("%s: %s"):format(item, vals[item])
                    end,
                  },
                  function(choice)
                    local result = vals[choice]
                    if result then
                      vim.notify(("Copied: `%s`"):format(result))
                      vim.fn.setreg("+", result)
                    end
                  end
                )
              end,
            }
          },
          filtered_items = {
            visible = true,
            hide_dotfiles = false
          }
        }
      }
    end
  },
}
