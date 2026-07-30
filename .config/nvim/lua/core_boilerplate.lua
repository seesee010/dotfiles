-- Boilerplate templates per language.
-- cursor_line/cursor_col mark where the cursor should land after insertion (1-indexed).
-- filetype is the Neovim filetype to set after insertion (so LSP/syntax/treesitter attach correctly).
local templates = {
  c = {
    filetype = "c",
    lines = {
      "#include <stdio.h>",
      "",
      "int main(int argc, char *argv[]) {",
      "\t",
      "\treturn 0;",
      "}",
    },
    cursor_line = 4,
    cursor_col = 2,
  },
  cpp = {
    filetype = "cpp",
    lines = {
      "#include <iostream>",
      "",
      "int main(int argc, char *argv[]) {",
      "\t",
      "\treturn 0;",
      "}",
    },
    cursor_line = 4,
    cursor_col = 2,
  },
  zig = {
    filetype = "zig",
    lines = {
      "const std = @import(\"std\");",
      "",
      "pub fn main() !void {",
      "\t",
      "}",
    },
    cursor_line = 4,
    cursor_col = 2,
  },
  rust = {
    filetype = "rust",
    lines = {
      "fn main() {",
      "\t",
      "}",
    },
    cursor_line = 2,
    cursor_col = 2,
  },
  javascript = {
    filetype = "javascript",
    lines = {
      "function main() {",
      "\t",
      "}",
      "",
      "main();",
    },
    cursor_line = 2,
    cursor_col = 2,
  },
  typescript = {
    filetype = "typescript",
    lines = {
      "function main(): void {",
      "\t",
      "}",
      "",
      "main();",
    },
    cursor_line = 2,
    cursor_col = 2,
  },
  python = {
    filetype = "python",
    lines = {
      "def main():",
      "\t",
      "",
      "",
      "if __name__ == \"__main__\":",
      "\tmain()",
    },
    cursor_line = 2,
    cursor_col = 2,
  },
  lua = {
    filetype = "lua",
    lines = {
      "local function main()",
      "\t",
      "end",
      "",
      "main()",
    },
    cursor_line = 2,
    cursor_col = 2,
  },
  sh = {
    filetype = "sh",
    lines = {
      "#!/usr/bin/env bash",
      "set -euo pipefail",
      "",
      "main() {",
      "\t",
      "}",
      "",
      "main \"$@\"",
    },
    cursor_line = 5,
    cursor_col = 2,
  },
  bash = {
    filetype = "sh",
    lines = {
      "#!/usr/bin/env bash",
      "set -euo pipefail",
      "",
      "main() {",
      "\t",
      "}",
      "",
      "main \"$@\"",
    },
    cursor_line = 5,
    cursor_col = 2,
  },
  java = {
    filetype = "java",
    lines = {
      "public class Main {",
      "\tpublic static void main(String[] args) {",
      "\t\t",
      "\t}",
      "}",
    },
    cursor_line = 3,
    cursor_col = 3,
  },
  go = {
    filetype = "go",
    lines = {
      "package main",
      "",
      "func main() {",
      "\t",
      "}",
    },
    cursor_line = 4,
    cursor_col = 2,
  },
}

-- Maps Neovim filetype names to template keys (mostly 1:1, listed for clarity/extension).
local filetype_map = {
  c = "c",
  cpp = "cpp",
  zig = "zig",
  rust = "rust",
  javascript = "javascript",
  typescript = "typescript",
  python = "python",
  lua = "lua",
  sh = "sh",
  bash = "bash",
  java = "java",
  go = "go",
}

local function insert_template(key)
  local template = templates[key]
  if not template then
    print("No :Core template for '" .. key .. "'. Use ':Core help' to list available ones.")
    return
  end

  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, template.lines)

  -- Set filetype so LSP, treesitter and syntax highlighting attach as the target language,
  -- regardless of what the buffer's filetype was before.
  vim.bo[bufnr].filetype = template.filetype

  vim.api.nvim_win_set_cursor(0, { template.cursor_line, template.cursor_col })
  vim.cmd("startinsert!")
end

local function print_help()
  print("Core Commands:")
  print("  :Core             -- detect language from filetype and insert boilerplate")
  print("  :Core <language>  -- force boilerplate for a specific language, ignoring filetype (also updates buffer filetype so LSP attaches correctly)")
  print("  :Core help        -- show this help")
  print("")
  print("Available languages:")
  local names = {}
  for key, _ in pairs(templates) do
    table.insert(names, key)
  end
  table.sort(names)
  for _, name in ipairs(names) do
    print("  " .. name)
  end
end

local function core_command(opts)
  local arg = opts.args

  if arg == "help" then
    print_help()
    return
  end

  if arg ~= "" then
    insert_template(arg)
    return
  end

  local ft = vim.bo.filetype
  local key = filetype_map[ft]

  if not key then
    print("No :Core template for filetype '" .. ft .. "'. Use ':Core help' to list available ones.")
    return
  end

  insert_template(key)
end

vim.api.nvim_create_user_command("Core", core_command, { nargs = "?" })
