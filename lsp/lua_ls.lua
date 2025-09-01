return {
  cmd = { "lua-language-server" },

  filetypes = { "lua" },

  rootmarkers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },

  settings = {
    Lua = {
      version = "LuaJIT",
    }
  }
}
