local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("没有找到 nvim-treesitter")
    return
end

-- 开启 Folding 模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99

treesitter.setup({
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {
    "json", "html", "css", "lua", "javascript", "typescript", "tsx",
    "bash", 
    "cpp", "cuda", "csv", "cmake",
    "gpg",
    "llvm",
    "make", "markdown",
    "vim", "vimdoc",
    "python",
    "yaml"
  },
  -- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- 启用增量选择模块
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },

  -- 启用代码缩进模块 (=)
  indent = {
    enable = true,
  },

})

vim.api.nvim_create_autocmd("BufRead", {
  callback = function()
    -- 获取当前缓冲区的文件类型
    local filetype = vim.bo.filetype

    -- 检查文件类型是否属于Treesitter不支持的类型
    if filetype == "txt" or filetype == "markdown" then
      -- 对于不支持的文件类型，更改折叠方法
      vim.opt_local.foldmethod = "manual"
    else
      -- 对于支持的文件类型，使用Treesitter的折叠方法
      vim.opt_local.foldmethod = "expr"
      vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
    end
  end
})

