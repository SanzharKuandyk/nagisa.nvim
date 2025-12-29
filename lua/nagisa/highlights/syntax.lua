local M = {}

---@param theme Theme
---@return table highlights
function M.setup(theme, opts)
    opts = opts or require("nagisa.config").opts
    return {
        -- Syntax
        Comment = { fg = theme.syn.comment, bg = "NONE", italic = opts.italic_comments },
        Keyword = { fg = theme.syn.keyword, bold = true },
        Identifier = { fg = theme.syn.identifier },
        Function = { fg = theme.syn.func },
        String = { fg = theme.syn.string },
        Number = { fg = theme.syn.number },
        Constant = { fg = theme.syn.constant },
        Operator = { fg = theme.syn.operator },
    }
end

return M
