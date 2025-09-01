return {
    "stevearc/oil.nvim",
    opts = {},
    -- Зависимости (опционально, для иконок)
    dependencies = { "nvim-tree/nvim-web-devicons" },
    
    -- Загружать при открытии директории
    lazy = false,
    
    config = function()
      require("oil").setup({
        -- Oil отобразится в буфере, когда вы войдете в директорию
        default_file_explorer = true,
        
        -- Столбцы для отображения в oil буфере
        columns = {
          "icon",
          -- "permissions",
          -- "size",
          -- "mtime",
        },
        
        -- Буферные опции для oil буферов
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        
        -- Оконные опции для oil буферов
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        
        -- Oil будет принимать контроль над netrw и обрабатывать аргументы директории
        delete_to_trash = false,
        
        -- Пропустить подтверждение для простых операций
        skip_confirm_for_simple_edits = false,
        
        -- Автоматически обновлять содержимое при изменениях
        watch_for_changes = false,
        
        -- Настройки превью
        preview = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = 0.9,
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
        
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
      })
      
      vim.keymap.set("n", "<leader>e", require("oil").toggle_float, { desc = "Открыть oil в плавающем окне" })
    end,
}
