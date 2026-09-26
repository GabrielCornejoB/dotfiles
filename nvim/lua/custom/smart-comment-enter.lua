-- Continue comments on new line
local function smart_enter()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]

  -- text before cursor
  local before = line:sub(1, col)

  -- match indentation + comment leader ONLY
  local comment_only = before:match("^%s*//%s*$")
                      or before:match("^%s*%-%-%s*$")

  if comment_only then
    -- delete the comment leader and create empty line
    return "<Esc>0d$i"
  end

  -- normal Enter (keeps comment continuation)
  return "<CR>"
end

vim.keymap.set("i", "<CR>", smart_enter, { expr = true })

