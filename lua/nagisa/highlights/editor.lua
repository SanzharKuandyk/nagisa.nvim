local M = {}

---@param theme Theme
---@return table highlights
function M.setup(theme, opts)
    opts = opts or require("nagisa.config").opts

    return {
        Normal = { fg = theme.ui.fg, bg = opts.transparent and "NONE" or theme.ui.bg },

        -- Editor-related highlight groups
        ColorColumn = { bg = opts.transparent and "NONE" or theme.ui.col },
        Conceal = { fg = theme.ui.fg, bg = theme.ui.bg },
        Cursor = { fg = theme.ui.cursor, bg = theme.ui.fg },
        lCursor = { link = "Cursor" },
        CursorIM = { link = "Cursor" },
        CursorColumn = { link = "CursorLine" },
        CursorLine = { bg = theme.ui.col },
        Directory = { fg = theme.ui.dir },
        VertSplit = { fg = theme.ui.bg_dim, bg = theme.ui.bg },

        -- Diff highlight groups
        DiffAdd = { fg = theme.diff.add },
        DiffDelete = { fg = theme.diff.delete },
        DiffChange = { fg = theme.diff.change },
        DiffText = { fg = theme.diff.text },

        -- Diagnostic highlights
        DiagnosticError = { fg = theme.diag.error },
        DiagnosticWarn = { fg = theme.diag.warning },
        DiagnosticInfo = { fg = theme.diag.info },
        DiagnosticHint = { fg = theme.diag.info },

        -- Search and selection highlights
        Search = { fg = "NONE", bg = theme.ui.search },
        Visual = { fg = "NONE", bg = theme.ui.bg_dim },
        IncSearch = { fg = "NONE", bg = theme.ui.search },

        -- Floating window highlights
        NormalFloat = { fg = theme.ui.fg, bg = opts.transparent and "NONE" or theme.ui.float.bg },
        FloatBorder = { fg = theme.ui.float.border, bg = opts.transparent and "NONE" or theme.ui.float.bg },
        FloatTitle = { fg = theme.ui.float.title, bg = opts.transparent and "NONE" or theme.ui.float.bg, bold = true },
        FloatFooter = { fg = theme.ui.fg_dim, bg = opts.transparent and "NONE" or theme.ui.float.bg },

        -- Popup menu highlights
        Pmenu = { fg = theme.ui.pmenu.main, bg = opts.transparent and "NONE" or theme.ui.bg },
        PmenuSel = { fg = theme.ui.pmenu.sel, bg = "NONE" },
        PmenuSbar = { fg = "NONE", bg = opts.transparent and "NONE" or theme.ui.bg },
        PmenuThumb = { fg = "NONE", bg = opts.transparent and "NONE" or theme.ui.bg },

        -- Window highlights
        WinBar = { fg = theme.ui.fg, bg = theme.ui.bg, bold = true },
        WinBarNc = { fg = theme.ui.fg, bg = theme.ui.bg },
        WinSeparator = { link = "VertSplit" },

        -- Status line highlights
        StatusLine = { fg = theme.ui.fg, bg = theme.ui.statusline },
        StatusLineNC = { fg = theme.ui.fg_dim, bg = theme.ui.bg_dim },

        -- Tab line highlights
        TabLine = { fg = theme.ui.fg, bg = theme.ui.border },
        TabLineSel = { link = "StatusLine" },
        TabLineFill = { link = "StatusLineNC" },

        -- Other general highlights
        Title = { fg = "NONE", bg = "NONE", bold = true },
        ErrorMsg = { fg = theme.diag.error, bg = theme.ui.bg },
        WarningMsg = { fg = theme.diag.warning, bg = theme.ui.bg, bold = true },
        ModeMsg = { fg = theme.ui.fg, bg = theme.ui.statusline },
        MoreMsg = { link = "ModeMsg" },
        NonText = { fg = theme.ui.fg_dim, bg = "NONE" },
        SpecialKey = { fg = theme.ui.selection, bg = "NONE" },
        Question = { fg = theme.ui.fg, bg = theme.ui.statusline },
        EndOfBuffer = { fg = theme.ui.bg },
    }
end

return M
