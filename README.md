# This Repositories for configuration of neovim

## Setup
1. [Install Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
2. Install lua 
3. If previously ~/.config/nvim exists, then backup it.Then run the following command.
```bash
git clone https://github.com/Debraj-Das/nvim.git ~/.config/nvim
```
4. Only run nvim and start installing all nessary plugins itself. It will take some time for first time.

**Enjoy your new neovim setup.**

## Some useful information about neovim setup
1. Debraj Das setting present in lua/debraj/ directory.
2. plugins are present in lua/plugins/ directory.

## Some details about neovim setup
1. leader key is space key. if you want to change it, then change it in init.lua file.
2. clipboard is enabled according to wsl clipboard. if you want to change it in lua/debraj/clipboard.lua file.
3. keymappings are present in lua/debraj/remap.lua file.
4. basic settings are present in lua/debraj/setup.lua file.

## Some tutorials for using neovim
1. [master in vim](https://www.youtube.com/watch?v=wlR5gYd6um0)
2. [marks and fold](https://www.youtube.com/watch?v=ovRqGybIg1Q&t=8s)
3. [spcial characters](https://www.youtube.com/watch?v=Za5GRXP1ycM)
4. [vim tutorial](https://www.youtube.com/playlist?list=PL13bz4SHGmRxlZVmWQ9DvXo1fEg4UdGkr)

## Documentation
1. [Snippets](https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md)


Here’s a comprehensive list of directories and files typically used in a well-structured Neovim configuration. This structure is modular and scalable, enabling you to organize settings, plugins, and custom scripts effectively.

---

### **1. Core Configuration Files**
These are the main files/directories in Neovim's configuration:

#### **init.lua**
- The primary entry point for Neovim configurations.
- Can source other Lua modules or configure plugins.

Example:
```lua
-- Load settings
require("settings")

-- Load plugins
require("plugins")

-- Key mappings
require("keymaps")
```

---

### **2. `lua/` Directory**
This is where you can organize Lua modules for better modularity.

#### **Structure**
```
lua/
├── settings.lua        -- General settings and options
├── plugins/            -- Plugin configurations
│   ├── init.lua        -- Plugin manager setup (e.g., lazy.nvim, packer.nvim)
│   ├── lsp.lua         -- LSP configuration
│   ├── treesitter.lua  -- Treesitter configuration
│   ├── telescope.lua   -- Telescope plugin configuration
│   └── ui.lua          -- UI-related plugins (themes, statusline, etc.)
├── keymaps.lua         -- Key mappings
├── autocommands.lua    -- Custom autocommands
└── utils.lua           -- Utility functions
```

---

### **3. `plugin/` Directory**
- Automatically loaded on startup.
- Typically used by Vim/Neovim plugins or user-defined startup scripts.

#### **Structure**
```
plugin/
├── plugin1.vim         -- Plugin-specific configuration
├── plugin2.vim
└── custom.vim          -- Custom startup scripts
```

#### Example:
File: `plugin/myplugin.vim`
```vim
" Plugin-specific configuration
set number
```

---

### **4. `after/` Directory**
- Overrides configurations defined earlier.
- Useful for customizing plugin behavior or adding settings that must load after everything else.

#### **Structure**
```
after/
├── plugin/             -- Overrides for plugins
│   ├── treesitter.lua
│   └── telescope.lua
├── ftplugin/           -- Filetype-specific settings loaded after `ftplugin/`
│   ├── python.lua
│   └── markdown.lua
└── colors/             -- Overrides for color schemes
    └── mytheme.vim
```

#### Example:
File: `after/plugin/treesitter.lua`
```lua
require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
  ensure_installed = "all",
})
```

---

### **5. `ftplugin/` Directory**
- Filetype-specific settings are loaded automatically for certain file types.
- Useful for setting unique options for specific languages.

#### **Structure**
```
ftplugin/
├── python.lua          -- Python-specific settings
├── javascript.lua      -- JavaScript-specific settings
└── markdown.lua        -- Markdown-specific settings
```

#### Example:
File: `ftplugin/python.lua`
```lua
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
```

---

### **6. `autoload/` Directory**
- Contains reusable utility functions or scripts.
- Lua files are loaded on demand using `require`.

#### **Structure**
```
autoload/
├── utils.vim           -- Utility Vim functions
└── utils.lua           -- Utility Lua functions
```

#### Example:
File: `autoload/utils.lua`
```lua
local M = {}

function M.hello()
  print("Hello, World!")
end

return M
```

---

### **7. `colors/` Directory**
- Contains custom color schemes.

#### **Structure**
```
colors/
└── mytheme.vim
```

#### Example:
File: `colors/mytheme.vim`
```vim
highlight Normal ctermbg=none
highlight Comment ctermfg=DarkGray
```

---

### **8. `snippets/` Directory**
- Contains snippet files for use with snippet engines like `luasnip` or `ultisnips`.

#### **Structure**
```
snippets/
├── lua.snippets        -- Lua snippets
├── python.snippets     -- Python snippets
└── javascript.snippets -- JavaScript snippets
```

---

### **9. `spell/` Directory**
- Contains spell files for custom spell checking.

#### **Structure**
```
spell/
├── en.utf-8.add        -- Custom English words
└── en.utf-8.add.spl    -- Compiled spell file
```

---

### **10. `session/` Directory**
- Used to store session files for restoring workspace layouts.

#### **Structure**
```
session/
└── my_session.vim
```

---

### **11. `undodir/` Directory**
- Stores undo history files when `set undofile` is enabled.

#### **Structure**
```
undodir/
└── 1A2B3C4D.undo
```

---

### **12. `swap/` Directory**
- Stores swap files for unsaved buffers.

#### **Structure**
```
swap/
└── myfile.swp
```

---

### **13. `backup/` Directory**
- Stores backup files when `set backup` is enabled.

#### **Structure**
```
backup/
└── myfile~
```

---

### **14. `templates/` Directory**
- Contains templates for creating new files with specific content.

#### **Structure**
```
templates/
└── skeleton.py
```

#### Example:
File: `templates/skeleton.py`
```python
#!/usr/bin/env python3

"""
Author: Your Name
Date: YYYY-MM-DD
Description: ...
"""

def main():
    pass

if __name__ == "__main__":
    main()
```

---

### **Full Example Structure**
```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── settings.lua
│   ├── plugins/
│   │   ├── init.lua
│   │   ├── lsp.lua
│   │   ├── treesitter.lua
│   │   └── telescope.lua
│   ├── keymaps.lua
│   ├── autocommands.lua
│   └── utils.lua
├── after/
│   ├── plugin/
│   │   ├── treesitter.lua
│   │   └── telescope.lua
│   └── ftplugin/
│       ├── python.lua
│       └── markdown.lua
├── ftplugin/
│   ├── python.lua
│   └── javascript.lua
├── colors/
│   └── mytheme.vim
├── snippets/
│   ├── lua.snippets
│   ├── python.snippets
│   └── javascript.snippets
├── autoload/
│   ├── utils.vim
│   └── utils.lua
├── spell/
│   ├── en.utf-8.add
│   └── en.utf-8.add.spl
├── session/
│   └── my_session.vim
├── swap/
│   └── myfile.swp
└── backup/
    └── myfile~
```

---

