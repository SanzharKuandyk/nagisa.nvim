local M = {}

---@param theme Theme
---@return table highlights
function M.setup(theme, opts)
    opts = opts or require("nagisa.config").opts
    return {
        Comment = { fg = theme.syn.comment, bg = "NONE", italic = opts.italic_comments },
        Identifier = { fg = theme.syn.identifier },
        Function = { fg = theme.syn.func },
        Constant = { fg = theme.syn.constant },
        String = { fg = theme.syn.string },
        Character = { link = "String" },
        Number = { fg = theme.syn.number },
        Float = { link = "Number" },
        Boolean = { link = "Constant" },

        Keyword = { fg = theme.syn.keyword },
        Statement = { link = "Keyword" },
        Conditional = { link = "Keyword" },
        Repeat = { link = "Keyword" },
        Label = { fg = theme.syn.variable },
        Operator = { fg = theme.syn.operator },
        Exception = { link = "Keyword" },
        PreProc = { link = "Keyword" },
        Include = { link = "Keyword" },
        Define = { link = "Keyword" },
        Macro = { link = "Identifier" },
        PreCondit = { link = "Conditional" },

        Type = { fg = theme.syn.special1 },
        StorageClass = { link = "Keyword" },
        Structure = { link = "Identifier" },
        Typedef = { link = "Type" },

        Tag = { link = "Number" },
        Delimiter = { fg = theme.ui.fg },
        SpecialComment = { link = "Comment" },
        Debug = { link = "Keyword" },
        Underlined = { fg = theme.syn.special1, underline = true },
        Ignore = { fg = theme.ui.fg_dim, bg = "NONE" },
        Error = { fg = theme.diag.error, bg = "NONE" },

        vimFunctionName = { link = "Function" },
        vimUserFunc = { link = "Function" },
        vimFuncName = { link = "Function" },
        vimFuncKey = { link = "Keyword" },
        vimFunctionMod = { link = "Keyword" },
        vimVar = { fg = theme.syn.variable },
        vimVarScope = { link = "Identifier" },
        vimFunctionParam = { fg = theme.ui.fg },
        vimFuncVar = { fg = theme.ui.fg },
        vimBang = { link = "Delimiter" },

        luaFunction = { link = "Keyword" },
        luaFunc = { link = "Function" },
        luaTable = { link = "Delimiter" },

        rustModPath = { link = "Identifier" },
        rustSuper = { link = "Identifier" },
        rustSelf = { fg = theme.syn.variable },
        rustSigil = { link = "Operator" },
        rustMacro = { link = "Function" },
        rustAssert = { link = "Function" },
        rustPanic = { link = "Function" },
        rustMacroVariable = { link = "Function" },
    }
end

return M
