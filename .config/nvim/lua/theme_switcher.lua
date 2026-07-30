local themes = {
  { name = "moonfly", short = "moon" },
  -- add more themes here, e.g.:
  { name = "tokyonight", short = "toky" },
}

local current_index = 1

local function apply_theme(index)
  local theme = themes[index]
  vim.cmd("colorscheme " .. theme.name)
  current_index = index
  print("Theme: " .. theme.name)
end

local function print_help()
  print("Theme Commands:")
  print("  :Theme <index>   -- switch to theme at index (0-based)")
  print("  :Theme prev      -- previous theme (wraps to highest)")
  print("  :Theme next      -- next theme (wraps to 0)")
  print("  :Theme <short>   -- switch to theme via short name")
  print("  :Theme help      -- show this help")
  print("")
  print("Available themes:")
  for idx, theme in ipairs(themes) do
    print(string.format("  [%d] %s  (short: %s)", idx - 1, theme.name, theme.short))
  end
end

local function theme_command(opts)
  local arg = opts.args

  if arg == "help" then
    print_help()
  elseif arg == "next" then
    local next_index = current_index + 1
    if next_index > #themes then
      next_index = 1
    end
    apply_theme(next_index)
  elseif arg == "prev" then
    local prev_index = current_index - 1
    if prev_index < 1 then
      prev_index = #themes
    end
    apply_theme(prev_index)
  elseif tonumber(arg) ~= nil then
    local index = tonumber(arg) + 1
    if themes[index] then
      apply_theme(index)
    else
      print("No theme at index " .. arg)
    end
  else
    local found_index = nil
    for i, theme in ipairs(themes) do
      if theme.short == arg then
        found_index = i
        break
      end
    end

    if found_index then
      apply_theme(found_index)
    else
      print("Theme '" .. arg .. "' not found. Use ':Theme help' for all options.")
    end
  end
end

vim.api.nvim_create_user_command("Theme", theme_command, { nargs = 1 })
