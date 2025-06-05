local M = {}

-- ╭─────────────────────────────────────────────────────────╮
-- │ opts 说明：                                             │
-- │ • path  : im-select 可执行文件路径（仅文件名或完整路径）│
-- │ • silent: 是否在前面加 "silent "（默认 true）           │
-- │ • codes : 四个事件对应的语言码（可自定义）              │
-- │ • 事件开关同原来：VimEnter / InsertEnter / …            │
-- ╰─────────────────────────────────────────────────────────╯
-- function M.setup(opts)
--   opts = opts or {}

--   -- 1) 路径：优先 opts.path，其次环境变量 IM_SELECT_EXE，最后默认
--   local exe = opts.path
--             -- or os.getenv("IM_SELECT_EXE")
--             -- or "C:/Users/ThinkPad/AppData/Local/nvim-data/Maxl/im-select.exe"

--   -- 2) 是否 silent
--   local silent_prefix = (opts.silent == false) and "!" or "silent !"

--   -- 3) 四个事件对应的语言码（可按需改）
--   local codes = vim.tbl_extend("force", {
--     VimEnter    = "1033",
--     InsertEnter = "2052",
--     InsertLeave = "1033",
--     VimLeave    = "1033",
--   }, opts.codes or {})

--   -- 4) 四个事件开关（默认全开）
--   local enable = vim.tbl_extend("force", {
--     VimEnter    = true,
--     InsertEnter = true,
--     InsertLeave = true,
--     VimLeave    = true,
--   }, opts)

--   -- ⇣ 组装 autocmd 列表
--   local defs = {}
--   local function add(evt)
--     if enable[evt] then
--       table.insert(defs, { evt, "*",
--         string.format('%s"%s" %s', silent_prefix, exe, codes[evt])
--       })
--     end
--   end
--   add("VimEnter"); add("InsertEnter"); add("InsertLeave"); add("VimLeave")

--   -- ⇣ 创建自动命令
--   vim.api.nvim_create_augroup("input_switching", { clear = true })
--   for _, d in ipairs(defs) do
--     vim.api.nvim_create_autocmd(d[1], { pattern = d[2], command = d[3], group="input_switching" })
--   end
-- end

function M.setup(opts)
  opts = opts or {}

  -- 获取当前插件所在目录，自动拼接 im-select.exe 路径
  local plugin_dir = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
  local default_path = plugin_dir .. "im-select.exe"

  -- 优先使用 opts.path，否则用默认路径
  local exe = opts.path or default_path

  local silent_prefix = (opts.silent == false) and "!" or "silent !"

  local codes = vim.tbl_extend("force", {
    VimEnter    = "1033",
    InsertEnter = "2052",
    InsertLeave = "1033",
    VimLeave    = "1033",
  }, opts.codes or {})

  local enable = vim.tbl_extend("force", {
    VimEnter    = true,
    InsertEnter = true,
    InsertLeave = true,
    VimLeave    = true,
  }, opts)

  local defs = {}
  local function add(evt)
    if enable[evt] then
      table.insert(defs, { evt, "*",
        string.format('%s"%s" %s', silent_prefix, exe, codes[evt])
      })
    end
  end

  add("VimEnter")
  add("InsertEnter")
  add("InsertLeave")
  add("VimLeave")

  vim.api.nvim_create_augroup("input_switching", { clear = true })
  for _, d in ipairs(defs) do
    vim.api.nvim_create_autocmd(d[1], {
      pattern = d[2],
      command = d[3],
      group = "input_switching",
    })
  end
end


return M


