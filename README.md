# nvim-input-switch

**Seamless IME switching for Neovim on Windows**  
Automatically switches to **Chinese IME** when entering Insert mode, and back to **English IME** when leaving it—no manual switching required.

---

## ✨ Features

- 🔄 **Automatic IME toggling**
  - `InsertEnter` → switches to Chinese (default: `2052`)
  - `InsertLeave`, `Normal`, `Visual`, `Command` → switches to English (default: `1033`)
- ⚙️ **Fully configurable**
  - Enable or disable switching for each event
  - Customize IME language codes per event
  - Specify your own path to `im-select.exe`
- 🔍 **Zero-configuration path detection**
  - If `im-select.exe` is placed in the plugin directory, no path setup is needed
- 💤 **Supports lazy-loading**
  - Designed to load on first `InsertEnter` for performance
- 🪟 **Windows only**
  - This plugin targets Windows users exclusively

---

## 📦 Requirements

| Platform | Requirement                              |
| -------- | ---------------------------------------- |
| Windows  | [`im-select`](https://github.com/daipeihust/im-select) executable |
| Neovim   | 0.9 or newer (Lua API for `vim.fn` & `vim.api`) |

> **Tip:** `im-select.exe` is bundled inside the plugin if you use the default Lazy.nvim installation path.

---

## 🚀 Installation (Lazy.nvim)

```lua
{
  "396458015/nvim-input-switch",
  event = "InsertEnter",   -- load on first insert
  opts = {
    -- path = "D:/tools/im-select.exe",  -- absolute path if you keep it elsewhere
    VimEnter    = false,   -- IME on Neovim start
    InsertEnter = true,    -- IME on insert
    InsertLeave = true,    -- switch back on leaving insert
    VimLeave    = false,   -- switch back on exit
  },
}
```

If you use your own 'im-select.exe'

```lua
opts = {
  path = "C:/my-tools/im-select.exe",
  -- …other flags
}
```

