local M = {}

---@param theme Theme
---@return table highlights
function M.setup(theme, opts)
    opts = opts or require("nagisa.config").opts

    return {
        -- Lazy
        ["LazyNormal"] = { fg = theme.ui.fg, bg = opts.transparent and "NONE" or theme.ui.bg },
        ["LazyCommit"] = { fg = theme.syn.special1, bg = theme.ui.bg },
        ["LazyCommitType"] = { fg = theme.syn.constant, bg = theme.ui.bg },
        ["LazyButton"] = { fg = theme.ui.fg, bg = theme.ui.bg },
        ["LazyButtonActive"] = { fg = theme.ui.fg, bg = theme.ui.search },
        ["LazyH1"] = { fg = theme.syn.operator, bg = theme.ui.bg },
        ["LazyProgressDone"] = { fg = theme.syn.string, bg = theme.ui.bg },
        ["LazyProgressTodo"] = { fg = theme.syn.constant, bg = theme.ui.bg },
        ["LazySpecial"] = { fg = theme.ui.dir, bg = "NONE" },
        ["LazyReasonCommand"] = { fg = theme.diag.info, bg = theme.ui.bg },
        ["LazyReasonEvent"] = { fg = theme.ui.fg, bg = theme.ui.bg },
        ["LazyReasonFt"] = { fg = theme.ui.fg, bg = theme.ui.bg },
        ["LazyReasonImport"] = { fg = theme.ui.fg, bg = theme.ui.bg },
        ["LazyReasonKeys"] = { fg = theme.ui.fg, bg = theme.ui.bg },
        ["LazyReasonPlugin"] = { fg = theme.ui.fg, bg = theme.ui.bg },
        ["LazyReasonRuntime"] = { fg = theme.ui.fg, bg = theme.ui.bg },
        ["LazyTaskError"] = { fg = theme.diag.error, bg = theme.ui.bg },

        -- GitGutter
        ["GitGutterAdd"] = { fg = theme.vcs.added, bg = "NONE" },
        ["GitGutterChange"] = { fg = theme.vcs.changed, bg = "NONE" },
        ["GitGutterDelete"] = { fg = theme.vcs.deleted, bg = "NONE" },

        -- GitSigns
        ["GitSignsAdd"] = { fg = theme.vcs.added, bg = "NONE" },
        ["GitSignsChange"] = { fg = theme.vcs.changed, bg = "NONE" },
        ["GitSignsDelete"] = { fg = theme.vcs.deleted, bg = "NONE" },
        ["GitSignsAddLn"] = { fg = "NONE", bg = theme.vcs.addedLn },
        ["GitSignsChangeLn"] = { fg = "NONE", bg = theme.vcs.changedLn },
        ["GitSignsDeleteLn"] = { fg = "NONE", bg = theme.vcs.deletedLn },

        -- Harpoon
        ["HarpoonCurrentFile"] = { fg = "NONE", bg = theme.ui.fg },

        -- BufferLine
        ["BufferLineIndicatorSelected"] = { fg = theme.ui.statusline, bg = "NONE" },
        ["BufferLineSeparator"] = { fg = theme.ui.bg_dim, bg = theme.ui.bg },
        ["BufferLineFill"] = { fg = "NONE", bg = opts.transparent and "NONE" or theme.ui.bg },
        ["BufferCurrent"] = { fg = theme.ui.fg, bg = theme.ui.statusline },
        ["BufferCurrentIndex"] = { fg = theme.ui.fg, bg = theme.ui.statusline },
        ["BufferCurrentMod"] = { fg = theme.syn.special2, bg = theme.ui.statusline },
        ["BufferCurrentSign"] = { fg = theme.ui.bg, bg = theme.ui.statusline },
        ["BufferCurrentTarget"] = { fg = theme.syn.func, bg = theme.ui.statusline },
        ["BufferVisible"] = { fg = theme.ui.fg_dim, bg = theme.ui.statusline },
        ["BufferVisibleIndex"] = { fg = theme.ui.fg_dim, bg = theme.ui.statusline },
        ["BufferVisibleMod"] = { fg = theme.syn.special2, bg = theme.ui.statusline },
        ["BufferVisibleSign"] = { fg = theme.ui.fg_dim, bg = theme.ui.statusline },
        ["BufferVisibleTarget"] = { fg = theme.syn.func, bg = theme.ui.statusline },
        ["BufferInactive"] = { fg = theme.ui.fg_dim, bg = theme.ui.bg_dim },
        ["BufferInactiveIndex"] = { fg = theme.ui.fg_dim, bg = theme.ui.bg_dim },
        ["BufferInactiveMod"] = { fg = theme.syn.special2, bg = theme.ui.bg_dim },
        ["BufferInactiveSign"] = { fg = theme.ui.fg_dim, bg = theme.ui.bg_dim },
        ["BufferInactiveTarget"] = { fg = theme.syn.func, bg = theme.ui.bg_dim },
        ["BufferTabpage"] = { fg = theme.ui.fg, bg = theme.ui.fg_dim },
        ["BufferTabpageFill"] = { fg = theme.ui.fg, bg = theme.ui.fg_dim },
        ["BufferTabpages"] = { fg = theme.ui.fg, bg = theme.ui.fg_dim },
        ["BufferTabpagesFill"] = { fg = theme.ui.fg, bg = theme.ui.fg_dim },

        -- Eyeliner
        ["EyelinerPrimary"] = { fg = theme.ui.selection, bold = true, underline = true },
        ["EyelinerSecondary"] = { fg = theme.syn.special2, underline = true },

        -- Showkeys
        ["SkInactive"] = { link = "Pmenu" },
        ["SkActive"] = { link = "Statusline" },

        -- LSP
        ["DiagnosticOk"] = { fg = theme.diag.info, bg = "NONE" },
        ["DiagnosticError"] = { fg = theme.diag.error, bg = "NONE" },
        ["DiagnosticWarn"] = { fg = theme.diag.warning, bg = "NONE" },
        ["DiagnosticInfo"] = { fg = theme.diag.info, bg = "NONE" },
        ["DiagnosticHint"] = { fg = theme.diag.info, bg = "NONE" },
        ["DiagnosticUnnecessary"] = { fg = theme.diag.warning, bg = "NONE" },
        ["DiagnosticUnderlineError"] = {
            fg = "NONE",
            bg = "NONE",
            undercurl = true,
            sp = theme.diag.error,
        },
        ["DiagnosticUnderlineWarn"] = {
            fg = "NONE",
            bg = "NONE",
            undercurl = true,
            sp = theme.diag.warning,
        },
        ["DiagnosticUnderlineInfo"] = {
            fg = "NONE",
            bg = "NONE",
            undercurl = true,
            sp = theme.diag.info,
        },
        ["DiagnosticUnderlineHint"] = {
            fg = "NONE",
            bg = "NONE",
            undercurl = true,
            sp = theme.diag.info,
        },
        ["LspReferenceText"] = { fg = "NONE", bg = theme.ui.bg_dim },
        ["LspReferenceRead"] = { fg = "NONE", bg = theme.ui.bg_dim },
        ["LspReferenceWrite"] = { fg = "NONE", bg = theme.ui.bg_dim },

        -- coc.nvim
        ["CocHighlightText"] = { fg = "NONE", bg = theme.ui.bg_dim },
        ["CocHighlightRead"] = { fg = "NONE", bg = theme.ui.bg_dim },
        ["CocHighlightWrite"] = { fg = "NONE", bg = theme.ui.bg_dim },

        -- nvim-cope
        ["CmpItemKindVariable"] = { fg = theme.syn.variable, bg = "NONE" },
        ["CmpItemKindInterface"] = { fg = theme.syn.variable, bg = "NONE" },
        ["CmpItemKindText"] = { fg = theme.syn.variable, bg = "NONE" },
        ["CmpItemKindFunction"] = { fg = theme.syn.func, bg = "NONE" },
        ["CmpItemKindMethod"] = { fg = theme.syn.func, bg = "NONE" },
        ["CmpItemKindKeyword"] = { fg = theme.syn.keyword, bg = "NONE" },
        ["CmpItemKindProperty"] = { fg = theme.syn.variable, bg = "NONE" },
        ["CmpItemKindUnit"] = { fg = theme.syn.identifier, bg = "NONE" },
        ["CmpItemKindConstructor"] = { fg = theme.syn.func, bg = "NONE" },
        ["CmpItemMenu"] = { fg = theme.ui.fg_dim, bg = "NONE" },
        ["CmpItemAbbr"] = { fg = theme.ui.fg, bg = "NONE" },
        ["CmpItemAbbrDeprecated"] = {
            fg = theme.ui.fg_dim,
            bg = theme.ui.bg_dim,
            strikethrough = true,
        },
        ["CmpItemAbbrMatch"] = { fg = theme.syn.func, bg = "NONE", bold = true },
        ["CmpItemAbbrMatchFuzzy"] = {
            fg = theme.syn.special1,
            bg = "NONE",
            bold = true,
        },

        -- Dashboard
        ["DashboardHeader"] = { fg = theme.ui.statusline, bg = "NONE" },
        ["DashboardDesc"] = { fg = theme.syn.special2, bg = "NONE" },
        ["DashboardIcon"] = { fg = theme.syn.special2, bg = "NONE" },
        ["DashboardShortCut"] = { fg = theme.syn.keyword, bg = "NONE" },
        ["DashboardKey"] = { fg = theme.ui.fg, bg = "NONE" },
        ["DashboardFooter"] = { fg = theme.ui.statusline, bg = "NONE", italic = true },

        -- NeogitOrg/neogit
        ["NeogitDiffAdd"] = { fg = theme.diff.add, bg = "NONE" },
        ["NeogitDiffAddHighlight"] = { fg = "NONE", bg = theme.vcs.addedLn },
        ["NeogitDiffDelete"] = { fg = theme.diff.delete, bg = "NONE" },
        ["NeogitDiffDeleteHighlight"] = { fg = "NONE", bg = theme.vcs.deletedLn },
        ["NeogitDiffContext"] = { fg = theme.ui.pmenu.main, bg = theme.diff.text },
        ["NeogitDiffContextHighlight"] = { fg = "NONE", bg = theme.diff.text },
        ["NeogitDiffHeader"] = { fg = theme.ui.pmenu.main, bg = theme.ui.bg },
        ["NeogitDiffHeaderHighlight"] = { fg = theme.ui.pmenu.main, bg = theme.ui.bg },
        ["NeogitHunkHeader"] = { fg = theme.diag.warning, bg = theme.diff.delete },
        ["NeogitHunkHeaderHighlight"] = { fg = theme.diag.warning, bg = theme.ui.statusline },

        ["LspFloatWinNormal"] = { fg = theme.ui.fg, bg = "NONE" },
        ["LspFloatWinBorder"] = { fg = theme.ui.fg_dim, bg = "NONE" },
        ["LspInfoBorder"] = { fg = theme.ui.fg_dim, bg = "NONE" },
        ["LspSagaHoverBorder"] = { fg = theme.ui.fg_dim, bg = "NONE" },
        ["LspSagaSignatureHelpBorder"] = { fg = theme.ui.fg_dim, bg = "NONE" },
        ["LspSagaCodeActionBorder"] = { fg = theme.ui.fg_dim, bg = "NONE" },
        ["LspSagaDefPreviewBorder"] = { fg = theme.ui.fg_dim, bg = "NONE" },
        ["LspLinesDiagBorder"] = { fg = theme.ui.border, bg = "NONE" },
        ["LspSagaBorderTitle"] = { fg = theme.ui.cursor, bg = "NONE" },
        ["LSPSagaDiagnosticTruncateLine"] = { fg = theme.ui.cursor, bg = "NONE" },
        ["LspSagaDiagnosticBorder"] = { fg = theme.ui.border, bg = "NONE" },
        ["LspSagaShTruncateLine"] = { fg = theme.ui.cursor, bg = "NONE" },
        ["LspSagaDocTruncateLine"] = { fg = theme.ui.cursor, bg = "NONE" },
        ["LspSagaRenameBorder"] = { fg = theme.ui.cursor, bg = "NONE" },
        ["LspSagaLspFinderBorder"] = { fg = theme.ui.cursor, bg = "NONE" },

        ["TelescopeNormal"] = { fg = theme.ui.fg, bg = "NONE" },
        ["TelescopePromptBorder"] = { fg = theme.ui.selection, bg = "NONE" },
        ["TelescopeResultsBorder"] = { fg = theme.ui.border, bg = "NONE" },
        ["TelescopePreviewBorder"] = { fg = theme.ui.cursor, bg = "NONE" },
        ["TelescopeSelection"] = { fg = theme.ui.selection, bg = "NONE" },
        ["TelescopeMultiSelection"] = { fg = theme.ui.search, bg = "NONE" },
        ["TelescopeMatching"] = { fg = theme.syn.operator, bg = "NONE", bold = true },
        ["TelescopePromptPrefix"] = { fg = theme.ui.fg, bg = "NONE" },

        -- symbols-outline
        ["FocusedSymbol"] = { fg = theme.ui.fg, bg = theme.ui.search },
        ["SymbolsOutlineConnector"] = { fg = theme.ui.cursor, bg = "NONE" },
    }
end

return M
