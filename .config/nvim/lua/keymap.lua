

-- 使わないキー
-- w (used)
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
keymap.set("n","H","^")
keymap.set("n","L","$")
keymap.set("v","H","^")
keymap.set("v","L","$")
keymap.set("n","gy","ggyG")


-- hover window
if vim.g.vscode == nil then
    -- keymap.set("n", "m", ":Files<CR>")
else
    -- vscode neovimの標準の機能で shift + k : showHoverが実装されている
end


if vim.g.vscode == nil then
else
    local vscode = require('vscode')
    keymap.set("n","gD",function() vscode.call("editor.action.goToTypeDefinition") end)
end

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
    -- なんでかわからないけどvscodeだとうまく動作しない
    keymap.set("n","w","<C-w>")
else
    local vscode = require('vscode')

    keymap.set("n","wc",function()
        vscode.call("workbench.action.closeEditorsAndGroup")
    end)
    keymap.set("n","wl",function()
        vscode.call("workbench.action.focusRightGroup")
        -- vscode.call("workbench.action.focusNextPart")
    end)
    keymap.set("n","wh",function()
        vscode.call("workbench.action.focusLeftGroup")
    end)

    keymap.set("n","wk",function()
        vscode.call("workbench.action.focusAboveGroup")
    end)
    keymap.set("n","wj",function()
        vscode.call("workbench.action.focusBelowGroup")
    end)

    keymap.set("n","wn",function()
        vscode.call("workbench.action.moveEditorToRightGroup")
    end)
    keymap.set("n","ws",function()
        vscode.call("workbench.action.splitEditorDown")
    end)
    
    keymap.set("n","wo",function()
        vscode.call("workbench.action.closeEditorsInOtherGroups")
    end)
    
    -- workbench.action.moveActiveEditorGroupRight
    keymap.set("n","wL",function()
        vscode.call("workbench.action.moveActiveEditorGroupRight")
    end)
    keymap.set("n","wH",function()
        vscode.call("workbench.action.moveActiveEditorGroupLeft")
    end)

    -- 閉じるのは別のコマンドで行う. 
    -- Explorerにフォーカスがある時のキーバインドをどうやって編集するのかわからない
    keymap.set("n","we",function()
        vscode.call("workbench.files.action.focusFilesExplorer")
    end)
end


if vim.g.vscode == nil then
else
    local vscode = require('vscode')
    keymap.set("n","==",function()
        vscode.call("editor.action.formatDocument")
    end)
end


if vim.g.vscode == nil then
else
    local vscode = require('vscode')
    keymap.set("n","gl",function()
        vscode.call("editor.action.openLink")
    end)
end
