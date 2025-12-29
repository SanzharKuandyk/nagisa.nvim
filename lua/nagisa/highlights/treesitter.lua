local M = {}

---@param theme Theme
---@param opts NagisaConfig
---@return table highlights
function M.setup(theme, opts)
    -- opts is required by highlights.init but not used in treesitter
    local highlights = {
        ["@error"] = { fg = theme.diag.error, bg = "NONE" },
        ["@punctuation.bracket"] = { fg = theme.ui.fg, bg = "NONE" },
        ["@punctuation.special"] = { fg = theme.ui.fg, bg = "NONE" },
        ["@punctuation.delimiter"] = { fg = theme.ui.fg, bg = "NONE" },
        ["@comment"] = {
            link = "Comment",
        },
        ["@comment.note"] = { fg = theme.syn.identifier, bg = "NONE", bold = true },
        ["@comment.warning"] = {
            fg = theme.diag.warning,
            bg = "NONE",
            bold = true,
        },
        ["@comment.error"] = { fg = theme.diag.error, bg = "NONE", bold = true },
        ["@constant"] = { fg = theme.syn.constant, bg = "NONE" },
        ["@constant.builtin"] = { fg = theme.syn.constant, bg = "NONE" },
        ["@constant.macro"] = { fg = theme.syn.identifier, bg = "NONE" },
        ["@string.regexp"] = { fg = theme.syn.constant, bg = "NONE" },
        ["@string"] = { fg = theme.syn.string, bg = "NONE" },
        ["@character"] = { link = "@string" },
        ["@number"] = { fg = theme.syn.number, bg = "NONE" },
        ["@number.float"] = { link = "@number" },
        ["@boolean"] = { link = "@constant" },
        ["@annotation"] = { fg = theme.syn.func, bg = "NONE" },
        ["@attribute"] = { fg = theme.syn.func, bg = "NONE" },
        ["@attribute.builtin"] = { fg = theme.syn.identifier, bg = "NONE" },
        ["@module"] = { fg = theme.syn.identifier, bg = "NONE" },
        ["@function"] = { fg = theme.syn.func, bg = "NONE" },
        ["@function.builtin"] = { link = "@function" },
        ["@function.macro"] = { link = "@function" },
        ["@function.method"] = { link = "@function" },
        ["@variable"] = { fg = theme.syn.variable, bg = "NONE" },
        ["@variable.builtin"] = { link = "@variable" },
        ["@variable.parameter"] = { fg = theme.ui.fg, bg = "NONE" },
        ["@variable.parameter.reference"] = { fg = theme.ui.fg, bg = "NONE" },
        ["@variable.member"] = { fg = theme.ui.fg, bg = "NONE" },
        ["@property"] = { fg = theme.ui.fg, bg = "NONE" },
        ["@constructor"] = { fg = theme.syn.special1, bg = "NONE" },
        ["@label"] = { fg = theme.syn.variable, bg = "NONE" },
        ["@keyword"] = { fg = theme.syn.keyword, bg = "NONE" },
        ["@keyword.conditional"] = { link = "@keyword" },
        ["@keyword.repeat"] = { link = "@keyword" },
        ["@keyword.return"] = { link = "@keyword" },
        ["@keyword.exception"] = { link = "@keyword" },
        ["@keyword.import"] = { link = "@keyword" },
        ["@operator"] = { fg = theme.syn.operator, bg = "NONE" },
        ["@type"] = { fg = theme.syn.special1, bg = "NONE" },
        ["@type.qualifier"] = { link = "@type" },
        ["@structure"] = { fg = theme.syn.identifier, bg = "NONE" },
        ["@tag"] = { fg = theme.syn.number, bg = "NONE" },
        ["@tag.delimiter"] = { fg = theme.ui.fg, bg = "NONE" },
        ["@tag.attribute"] = { fg = theme.syn.constant, bg = "NONE" },
        ["@text"] = { fg = theme.ui.fg, bg = "NONE" },
        ["@markup.strong"] = { fg = theme.syn.special1, bold = true },
        ["@markup.italic"] = { fg = theme.ui.fg, bg = "NONE", italic = true },
        ["@markup.underline"] = {
            fg = theme.syn.special1,
            bg = "NONE",
            underline = true,
        },
        ["@markup.strikethrough"] = {
            fg = theme.ui.fg,
            bg = "NONE",
            strikethrough = true,
        },
        ["@markup.heading"] = { fg = theme.syn.special1, bold = true },
        ["@markup.raw"] = { fg = theme.ui.fg, bg = "NONE" },
        ["@markup.raw.markdown"] = { fg = theme.syn.constant, bg = "NONE" },
        ["@markup.raw.markdown_inline"] = { fg = theme.syn.constant, bg = "NONE" },
        ["@markup.link.label"] = {
            fg = theme.syn.variable,
            bg = "NONE",
            underline = opts.underline_links,
        },
        ["@markup.link.url"] = {
            fg = theme.ui.fg,
            bg = "NONE",
            underline = opts.underline_links,
        },
        ["@markup.list.checked"] = { link = "Todo" },
        ["@markup.list.unchecked"] = { link = "Todo" },
        ["@textReference"] = { fg = theme.syn.constant },
        ["@stringEscape"] = { fg = theme.syn.constant, bold = true },
        ["@diff.plus"] = { link = "DiffAdd" },
        ["@diff.minus"] = { link = "DiffDelete" },
        ["@diff.delta"] = { link = "DiffChange" },
    }

    return highlights
end

return M
