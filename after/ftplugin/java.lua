vim.keymap.set({"n", "v"}, "<F9>", ":w <cr> :!java %<cr>", {buffer = true})

local jdtls = require('jdtls')

-- 1. Identify the project root
-- This looks for your .git folder or build files to define the project base
local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = jdtls.setup.find_root(root_markers)

-- 2. Workspace Setup
-- Each project needs its own unique data directory to store cache/index
local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
local workspace_dir = vim.fn.stdpath('cache') .. '/jdtls-workspace/' .. project_name

-- 3. The Main Configuration
local config = {
  -- The command that starts the language server
  cmd = {
    'jdtls',
    '-data', workspace_dir, -- Critical for project-specific settings
  },

  root_dir = root_dir,

  settings = {
    java = {
      -- This helps jdtls understand your specific 'out/productions' preference
      -- if you are using an Eclipse-style .classpath file
      import = {
        gradle = { enabled = true },
        maven = { enabled = true },
        exclusions = {
          "**/node_modules/**",
          "**/.metadata/**",
          "**/archived/**"
        }
      },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      -- Ensure you have a JDK 17+ for the server itself
      project = {
        referencedLibraries = {
          "lib/**/*.jar",
        },
      },
    },
  },

  -- Capabilities for snippet support and completion
  capabilities = require('cmp_nvim_lsp').default_capabilities(),

  -- Keybindings to trigger once the server attaches
  on_attach = function(client, bufnr)
    local opts = { silent = true, buffer = bufnr }
    vim.keymap.set('n', '<leader>co', jdtls.organize_imports, opts)
    vim.keymap.set('n', '<leader>ct', jdtls.test_class, opts)
    vim.keymap.set('n', '<leader>cn', jdtls.test_nearest_method, opts)
    vim.keymap.set('n', 'crv', jdtls.extract_variable, opts)
    vim.keymap.set('v', 'crm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], opts)
  end,
}

-- 4. Start the server
jdtls.start_or_attach(config)
