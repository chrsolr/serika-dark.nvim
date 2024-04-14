--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

local bg = hsl(216, 4.76, 20.59)
local bg_sub = hsl(216, 5.38, 18.24)

local fg = hsl(55, 11.54, 79.61)
local fg_sub = hsl(216, 2.44, 40.2)

-- Soft colors
local accent = hsl(35, 70, 80)
local pink = hsl(2, 70, 80)
local purple = hsl(270, 70, 80)
local blue = hsl(200, 70, 80)
local green = hsl(150, 70, 80)
local red = hsl(0, 70, 80)

-- local accent = hsl(47.48, 83.74, 48.24)
-- local accent = hsl(34.96, 87.59, 71.57)
-- local pink = hsl(2.45, 55.06, 82.55)
-- local pink_sub = hsl(343.06, 75.61, 67.84)
-- local purple = hsl(267.19, 57.14, 78.04)

-- local error = hsl(354.05, 55.27, 53.53)
-- local error_sub = hsl(353.57, 50, 32.94)

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		ColorColumn({ fg = fg }), -- Columns set with 'colorcolumn'

		Conceal({ fg = fg }), -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor({ fg = bg, bg = accent }), -- Character under the cursor
		CurSearch({ fg = bg, bg = accent }), -- Highlighting a search pattern under the cursor (see 'hlsearch')
		lCursor({ fg = fg }), -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM({ fg = fg }), -- Like Cursor, but used when in IME mode |CursorIM|
		CursorColumn({ bg = bg_sub }), -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine({ bg = bg_sub }), -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.

		TermCursor({ fg = bg, bg = fg_sub }), -- Cursor in a focused terminal
		TermCursorNC({ fg = bg, bg = fg_sub }), -- Cursor in an unfocused terminal

		Directory({ fg = accent }), -- Directory names (and other special names in listings)
		DiffAdd({ fg = fg }), -- Diff mode: Added line |diff.txt|
		DiffChange({ fg = fg }), -- Diff mode: Changed line |diff.txt|
		DiffDelete({ fg = fg }), -- Diff mode: Deleted line |diff.txt|
		DiffText({ fg = fg }), -- Diff mode: Changed text within a changed line |diff.txt|

		EndOfBuffer({ fg = fg }), -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.

		ErrorMsg({ fg = red }), -- Error messages on the command line
		VertSplit({ fg = fg }), -- Column separating vertically split windows

		Folded({ fg = fg_sub }), -- Line used for closed folds
		FoldColumn({ fg = fg_sub }), -- 'foldcolumn'
		SignColumn({ fg = fg_sub }), -- Column where |signs| are displayed

		IncSearch({ fg = bg, bg = accent }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute({ fg = bg, bg = accent }), -- |:substitute| replacement text highlighting

		LineNr({ fg = fg_sub }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove({ fg = fg_sub }), -- Line number for when the 'relativenumber' option is set, above the cursor line
		LineNrBelow({ fg = fg_sub }), -- Line number for when the 'relativenumber' option is set, below the cursor line

		CursorLineNr({ fg = accent }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		CursorLineFold({ fg = accent }), -- Like FoldColumn when 'cursorline' is set for the cursor line
		CursorLineSign({ fg = accent }), -- Like SignColumn when 'cursorline' is set for the cursor line

		MatchParen({ fg = bg, bg = accent }), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

		ModeMsg({ fg = fg_sub }), -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea({ fg = accent }), -- Area for messages and cmdline
		MsgSeparator({ fg = fg_sub }), -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg({ fg = fg_sub }), -- |more-prompt|

		NonText({ fg = fg_sub }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal({ fg = fg, bg = bg }), -- Normal text

		FloatBorder({ fg = bg_sub, bg = bg_sub }), -- Border of floating windows.
		FloatTitle({ fg = accent }), -- Title of floating windows.
		NormalFloat({ fg = fg, bg = bg_sub }), -- Normal text in floating windows.
		NormalNC({ fg = fg_sub, bg = bg }), -- normal text in non-current windows

		Pmenu({ fg = fg_sub, bg = bg_sub }), -- Popup menu: Normal item.
		PmenuSel({ fg = accent }), -- Popup menu: Selected item.
		PmenuKind({ fg = fg_sub }), -- Popup menu: Normal item "kind"
		PmenuKindSel({ fg = accent }), -- Popup menu: Selected item "kind"
		PmenuExtra({ fg = fg_sub }), -- Popup menu: Normal item "extra text"
		PmenuExtraSel({ fg = pink }), -- Popup menu: Selected item "extra text"
		PmenuSbar({ bg = bg }), -- Popup menu: Scrollbar.
		PmenuThumb({ bg = accent }), -- Popup menu: Thumb of the scrollbar.

		Question({ fg = accent }), -- |hit-enter| prompt and yes/no questions
		QuickFixLine({ fg = accent, bg = bg }), -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

		Search({ fg = bg, bg = accent }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		SpecialKey({ fg = fg_sub }), -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|

		SpellBad({ fg = accent, gui = "underline" }), -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap({ fg = accent, gui = "underline" }), -- word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal({ fg = accent, gui = "underline" }), -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare({ fg = accent, gui = "underline" }), -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.

		StatusLine({ fg = accent, bg = bg_sub }), -- Status line of current window
		StatusLineNC({ fg = fg_sub, bg = bg_sub }), -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

		TabLine({ fg = fg, bg = bg }), -- Tab pages line, not active tab page label
		TabLineFill({ fg = fg, bg = red }), -- Tab pages line, where there are no labels
		TabLineSel({ fg = fg, bg = bg }), -- Tab pages line, active tab page label

		Title({ fg = accent }), -- Titles for output from ":set all", ":autocmd" etc.

		Visual({ fg = bg, bg = fg_sub }), -- Visual mode selection
		VisualNOS({ fg = fg, bg = bg }), -- Visual mode selection when vim is "Not Owning the Selection".

		WarningMsg({ fg = accent }), -- Warning messages
		Whitespace({ fg = fg_sub }), -- "nbsp", "space", "tab" and "trail" in 'listchars'
		Winseparator({ fg = accent }), -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		WildMenu({ fg = bg, bg = accent }), -- Current match in 'wildmenu' completion

		WinBar({ fg = fg }), -- Window bar of current window
		WinBarNC({ fg = fg_sub }), -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment({ fg = fg_sub }), -- Any comment
		Constant({ fg = pink }), -- (*) Any constant
		String({ fg = green }), --   A string constant: "this is a string"
		Character({ fg = fg }), --   A character constant: 'c', '\n'
		Number({ fg = pink }), --   A number constant: 234, 0xff
		Boolean({ fg = pink }), --   A boolean constant: TRUE, false
		Float({ fg = pink }), --   A floating point constant: 2.3e10

		Identifier({ fg = fg }), -- (*) Any variable name
		Function({ fg = accent }), --   Function name (also: methods for classes)

		Statement({ fg = pink }), -- (*) Any statement
		Conditional({ fg = pink }), --   if, then, else, endif, switch, etc.
		Repeat({ fg = pink }), --   for, do, while, etc.
		Label({ fg = pink }), --   case, default, etc.
		Operator({ fg = fg_sub }), --   "sizeof", "+", "*", etc.
		Keyword({ fg = fg_sub }), --   any other keyword
		Exception({ fg = pink }), --   try, catch, throw

		PreProc({ fg = fg_sub }), -- (*) Generic Preprocessor
		Include({ fg = fg_sub }), --   Preprocessor #include
		Define({ fg = fg_sub }), --   Preprocessor #define
		Macro({ fg = fg_sub }), --   Same as Define
		precondit({ fg = fg_sub }), --   preprocessor #if, #else, #endif, etc.

		Type({ fg = pink }), -- (*) int, long, char, etc.
		StorageClass({ fg = fg_sub }), --   static, register, volatile, etc.
		Structure({ fg = accent }), --   struct, union, enum, etc.
		Typedef({ fg = fg_sub }), --   A typedef

		Special({ fg = fg_sub }), -- (*) Any special symbol
		SpecialChar({ fg = pink }), --   Special character in a constant
		Tag({ fg = fg_sub }), --   You can use CTRL-] on this

		Delimiter({ fg = fg_sub }), --   Character that needs attention
		SpecialComment({ fg = fg_sub }), --   Special things inside a comment (e.g. '\n')
		Debug({ fg = fg, bg = red }), --   Debugging statements

		Underlined({ fg = blue, gui = "underline" }), -- Text that stands out, HTML links
		Ignore({ fg = fg_sub }), -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error({ fg = red }), -- Any erroneous construct
		Todo({ fg = blue }), -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { fg = fg, bg = bg } , -- Used for highlighting "text" references
		-- LspReferenceRead            { fg = fg, bg = bg } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { fg = fg, bg = bg } , -- Used for highlighting "write" references
		-- LspCodeLens                 { fg = fg, bg = bg } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { fg = fg, bg = bg } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { fg = fg, bg = bg } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- DiagnosticError            { fg = fg, bg = bg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticWarn             { fg = fg, bg = bg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticInfo             { fg = fg, bg = bg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticHint             { fg = fg, bg = bg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticOk               { fg = fg, bg = bg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError { fg = fg, bg = bg } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { fg = fg, bg = bg } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { fg = fg, bg = bg } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { fg = fg, bg = bg } , -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticVirtualTextOk    { fg = fg, bg = bg } , -- Used for "Ok" diagnostic virtual text.
		-- DiagnosticUnderlineError   { fg = fg, bg = bg } , -- Used to underline "Error" diagnostics.
		-- DiagnosticUnderlineWarn    { fg = fg, bg = bg } , -- Used to underline "Warn" diagnostics.
		-- DiagnosticUnderlineInfo    { fg = fg, bg = bg } , -- Used to underline "Info" diagnostics.
		-- DiagnosticUnderlineHint    { fg = fg, bg = bg } , -- Used to underline "Hint" diagnostics.
		-- DiagnosticUnderlineOk      { fg = fg, bg = bg } , -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { fg = fg, bg = bg } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { fg = fg, bg = bg } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { fg = fg, bg = bg } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { fg = fg, bg = bg } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { fg = fg, bg = bg } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { fg = fg, bg = bg } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { fg = fg, bg = bg } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { fg = fg, bg = bg } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { fg = fg, bg = bg } , -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk           { fg = fg, bg = bg } , -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- sym("@text.literal")({ fg = green }), -- Comment
		-- sym("@text.reference")({ fg = green }), -- Identifier
		-- sym("@text.title")({ fg = green }), -- Title
		-- sym("@text.uri")({ fg = green }), -- Underlined
		-- sym("@text.underline")({ fg = green }), -- Underlined
		-- sym("@text.todo")({ fg = green }), -- Todo
		--
		-- sym("@comment")({ fg = fg_sub }), -- Comment
		-- sym("@punctuation")({ fg = fg }), -- Delimiter
		--
		-- sym("@constant")({ fg = green }), -- Constant
		-- sym("@constant.builtin")({ fg = green }), -- Special
		-- sym("@constant.macro")({ fg = green }), -- Define
		--
		-- sym("@define")({ fg = blue }), -- Define
		-- sym("@macro")({ fg = blue }), -- Macro
		--
		-- sym("@string")({ fg = green }), -- String
		-- sym("@string.escape")({ fg = green }), -- SpecialChar
		-- sym("@string.special")({ fg = green }), -- SpecialChar
		--
		-- sym("@character")({ fg = fg }), -- Character
		-- sym("@character.special")({ fg = fg }), -- SpecialChar
		--
		-- sym("@number")({ fg = pink }), -- Number
		-- sym("@boolean")({ fg = pink }), -- Boolean
		-- sym("@float")({ fg = pink }), -- Float
		--
		-- sym("@function")({ fg = accent }), -- Function
		-- sym("@function.builtin")({ fg = accent }), -- Special
		-- sym("@function.macro")({ fg = accent }), -- Macro
		--
		-- sym("@parameter")({ fg = fg, bg = red }), -- Identifier
		-- sym("@method")({ fg = accent }), -- Function
		-- sym("@field")({ fg = fg, bg = red }), -- Identifier
		-- sym("@property")({ fg = accent }), -- Identifier
		-- sym("@constructor")({ fg = accent }), -- Special
		-- sym("@conditional")({ fg = pink }), -- Conditional
		-- sym("@repeat")({ fg = pink }), -- Repeat
		-- sym("@label")({ fg = fg_sub }), -- Label
		-- sym("@operator")({ fg = fg_sub }), -- Operator
		-- sym("@keyword")({ fg = fg_sub }), -- Keyword
		-- sym("@exception")({ fg = red }), -- Exception
		-- sym("@variable")({ fg = fg }), -- Identifier

		-- sym("@type")({ fg = fg }), -- Type
		-- sym("@type.definition")({ fg = fg, bg = red }), -- Typedef
		-- sym("@storageclass")({ fg = fg, bg = red }), -- StorageClass
		-- sym("@structure")({ fg = fg, bg = red }), -- Structure
		-- sym("@namespace")({ fg = fg, bg = red }), -- Identifier
		-- sym("@include")({ fg = fg, bg = red }), -- Include
		-- sym("@preproc")({ fg = fg, bg = red }), -- PreProc
		-- sym("@debug")({ fg = fg, bg = red }), -- Debug
		-- sym("@tag")({ fg = fg_sub }), -- Tag
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
