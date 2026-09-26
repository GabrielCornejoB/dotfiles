-- check if jdtls exists 
local ok, jdtls = pcall(require, 'jdtls')
if not ok then
    vim.notify('[jdtls] nvim-jdtls plugin not found')
    return
end

-- root detection
local root_markers = { 'settings.gradle', '.git' }
local root_dir = vim.fs.root(0, root_markers)
if not root_dir or root_dir == '' then
    vim.notify('[jdtls] no project root found (looked for ' .. table.concat(root_markers, ', ') .. ')', vim.log.levels.WARN)
    return
end

-- Paths / cache dirs
local home = os.getenv 'HOME'
local jdtls_install = home .. '/.local/share/nvim/mason/packages/jdtls'
local eclipse_launcher = vim.fin.glob(jdtls_install .. '/plugins/org.eclipse.equinox.launcher_*.jar')
local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
local workspace_dir = home .. '/.local/share_nvim/jdtls-workspace/' .. project_name

-- blink.cmp compat
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_blink, blink = pcall(require, 'blink.cmp')
if ok_blink then
    capabilities = vim.tbl_deep_extend('force', capabilities, blink.get_lsp_capabilities())
end

local config = {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=WARN',
        '-Xmx6g', '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. jdtls_install .. '/lombok.jar',
        '-jar', eclipse_launcher,
        '-configuration', jdtls_install .. '/config_mac',
        '-data', workspace_dir,
    },
    root_dir = root_dir,
    capabilities = capabilities,
    settings = {
        java = {
            import = {
                gradle = { enabled = true },
                maven = { enabled = false },
                gradleWrapper = { enabled = true },
            },
            maven = { downloadSources = true },
            inlayHints = {
                parameterNames = { enabled = 'all' }
            },
        }
    },
    init_options = {
        bundles = {},
    },
    handlers = {
        ['textDocument/publishDiagnostics'] = function(err, result, ctx, config)
            if result and result.diagnostics then
                result.diagnostics = vim.tbl_filter(function(diagnostic)
                    return tostring(diagnostic.code) ~= '536871362'
                end, result.diagnostics)
            end
            vim.lsp.handlers['textDocument/publishDiagnostics'](err, result, ctx, config)
        end,
    },
    on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map('n', '<leader>jo', jdtls.organize_imports, '[J]ava [O]rganize imports')
        map('n', '<leader>jv', jdtls.organize_imports, '[J]ava extract [V]ariable')
    end,
}

jdtls.start_or_attach(config)

