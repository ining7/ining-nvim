local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("没有找到 nvim-tree")
  return
end

local list_keys = require('keybindings').nvimTreeList

local function setup_nvim_tree_bindings(bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_del_keymap(...) vim.api.nvim_buf_del_keymap(bufnr, ...) end

    -- 绑定新的快捷键
    for _, key in ipairs(list_keys) do
        buf_set_keymap('n', key.key, key.cmd, {noremap = true, silent = true})
    end
end

require('nvim-tree').setup({
    -- 你的其他 nvim-tree 配置...
    on_attach = function(bufnr)
        setup_nvim_tree_bindings(bufnr)
    end,
})

nvim_tree.setup({
    -- 不显示 git 状态图标
    git = {
        enable = false,
    },
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        -- 宽度
        width = 40,
        -- 也可以 'right'
        side = 'left',
        -- 隐藏根目录
        -- hide_root_folder = false,
        -- 自定义列表中快捷键
        -- mappings = {
            -- custom_only = false,
            -- list = list_keys,
        --},
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            -- quit_on_open = false,
        },
    },
    -- wsl install -g wsl-open
    -- https://github.com/4U6U57/wsl-open/
    system_open = {
        cmd = 'wsl-open', -- mac 直接设置为 open
    },
})



-- vim.cmd([[
--   autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
-- ]])


