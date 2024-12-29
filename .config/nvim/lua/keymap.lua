-- vscodeとnvimでできるだけ差がないようにする

-- 使わないキー
-- w 
-- s (used)
-- m (used)
-- z
-- b (used)

-- 共通のキーマップ
local keymap = vim.keymap
keymap.set("n","q","ql")
keymap.set("n","@","@l")
keymap.set("n","s",":HopWord<CR>") 
keymap.set("n","*","*N")
keymap.set("v","*","*N")
keymap.set("n","b","%")
keymap.set("v","b","%")

-- 試験的
keymap.set("n","H","^")
keymap.set("n","L","$")
keymap.set("v","H","^")
keymap.set("v","L","$")


if vim.g.vscode == nil then
    keymap.set("n", "m", ":Files<CR>")
    -- TODO:一番初めのファイラの画面でmが使えない
    keymap.set("n", "<C-S-o>", ":Files<CR>")
else
    local vscode = require('vscode')
    keymap.set("n", "m",function()
        vscode.call("workbench.action.quickOpen")
    end)
end

if vim.g.vscode == nil then
    keymap.set("n","ga","<Plug>(EasyAlign)")
    keymap.set("x","ga","<Plug>(EasyAlign)")
else
    local vscode = require('vscode')
    keymap.set("n","ga",function() vscode.call("codealignment.alignbyregex") end)
    keymap.set("x","ga",function() vscode.call("codealignment.alignbyregex") end)
end

if vim.g.vscode == nil then
else
    local vscode = require('vscode')
    keymap.set("n","<C-w>c",function()
        vscode.call("workbench.action.closeEditorsAndGroup")
    end)
end