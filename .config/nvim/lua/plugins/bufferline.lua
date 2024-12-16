vim.cmd[[
hi BufferLineBackground guibg=NONE
hi BufferLineBuffer guibg=NONE
hi BufferLineBufferSelected guibg=NONE
hi BufferLineBufferVisible guibg=NONE
hi BufferLineCloseButton guibg=NONE
hi BufferLineCloseButtonSelected guibg=NONE
hi BufferLineCloseButtonVisible guibg=NONE
hi BufferLineDevIconDefault guibg=NONE
hi BufferLineDevIconLuaSelected guibg=NONE
hi BufferLineDiagnostic guibg=NONE
hi BufferLineDiagnosticSelected guibg=NONE
hi BufferLineDiagnosticVisible guibg=NONE
hi BufferLineDuplicate guibg=NONE
hi BufferLineDuplicateSelected guibg=NONE
hi BufferLineDuplicateVisible guibg=NONE
hi BufferLineError guibg=NONE
hi BufferLineErrorDiagnostic guibg=NONE
hi BufferLineErrorDiagnosticSelected guibg=NONE
hi BufferLineErrorDiagnosticVisible guibg=NONE
hi BufferLineErrorSelected guibg=NONE
hi BufferLineErrorVisible guibg=NONE
hi BufferLineFill guibg=NONE
hi BufferLineGroupLabel guibg=NONE
hi BufferLineGroupSeparator guibg=NONE
hi BufferLineHint guibg=NONE
hi BufferLineHintDiagnostic guibg=NONE
hi BufferLineHintDiagnosticSelected guibg=NONE
hi BufferLineHintDiagnosticVisible guibg=NONE
hi BufferLineHintSelected guibg=NONE
hi BufferLineHintVisible guibg=NONE
hi BufferLineIndicatorSelected guibg=NONE
hi BufferLineIndicatorVisible guibg=NONE
hi BufferLineInfo guibg=NONE
hi BufferLineInfoDiagnostic guibg=NONE
hi BufferLineInfoDiagnosticSelected guibg=NONE
hi BufferLineInfoDiagnosticVisible guibg=NONE
hi BufferLineInfoSelected guibg=NONE
hi BufferLineInfoVisible guibg=NONE
hi BufferLineModified guibg=NONE
hi BufferLineModifiedSelected guibg=NONE
hi BufferLineModifiedVisible guibg=NONE
hi BufferLineNumbers guibg=NONE
hi BufferLineNumbersSelected guibg=NONE
hi BufferLineNumbersVisible guibg=NONE
hi BufferLineOffsetSeparator guibg=NONE
hi BufferLinePick guibg=NONE
hi BufferLinePickSelected guibg=NONE
hi BufferLinePickVisible guibg=NONE
hi BufferLineSeparator guibg=NONE
hi BufferLineSeparatorSelected guibg=NONE
hi BufferLineSeparatorVisible guibg=NONE
hi BufferLineTab guibg=NONE
hi BufferLineTabClose guibg=NONE

hi BufferLineTabSelected guibg=NONE
hi BufferLineTabSeparator guibg=NONE
hi BufferLineTabSeparator guifg=NONE

hi BufferLineTabSeparatorSelected guibg=NONE
hi BufferLineTruncMarker guibg=NONE
hi BufferLineWarning guibg=NONE
hi BufferLineWarningDiagnostic guibg=NONE
hi BufferLineWarningDiagnosticSelected guibg=NONE
hi BufferLineWarningDiagnosticVisible guibg=NONE
hi BufferLineWarningSelected guibg=NONE
hi BufferLineWarningVisible guibg=NONE
hi BufferLineHint guibg=NONE
]]
return {
	'akinsho/bufferline.nvim',
	config = function()
		require("bufferline").setup({
			options = {
				indicator = { style = "icon", icon = ""},
				indicator_icon = nil,
			}
		})
	end
}
