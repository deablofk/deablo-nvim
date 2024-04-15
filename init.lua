local bootstrap = require 'bootstrap'

-- check dependencies in the system
local function checkDependency(command, name)
    if not os.execute(command) then
        vim.fn.system('echo "' .. name .. 'not installed." && exit 1')
    end
end

local dependencies = {
    { 'git --version',  'GIT' },
    { 'gcc --version',  'GCC ou CLANG' },
    { 'make --version', 'MAKE' },
}

if not bootstrap.is_packer_installed() then
    for _, dep in ipairs(dependencies) do
        checkDependency(dep[1], dep[2])
    end
end

local firstInstall = bootstrap.bootstrap_packer()

local packer = require 'packer'
packer.init({
    display = {
        open_fn = function()
            local result, win, buf = require('packer.util').float {
                border = {
                    { '╭', 'FloatBorder' },
                    { '─', 'FloatBorder' },
                    { '╮', 'FloatBorder' },
                    { '│', 'FloatBorder' },
                    { '╯', 'FloatBorder' },
                    { '─', 'FloatBorder' },
                    { '╰', 'FloatBorder' },
                    { '│', 'FloatBorder' },
                },
            }
            vim.api.nvim_win_set_option(win, 'winhighlight', 'NormalFloat:Normal')
            return result, win, buf
        end,
    },
})

packer.startup(function(use)
    for _, x in pairs(require 'plugins'.plugins) do
        use(x)
    end
    if firstInstall then
        require 'packer'.sync()
    end
end)

local modules = {
    'dadbodcfg',
    'tree',
    'completion',
    'formatting',
    'lspserverconfig',
    'options',
    'signature',
    'keymaps',
    'highlight',
    'discord',
    'finder',
    'neovide',
}

if not firstInstall then
    for _, module in ipairs(modules) do
        require(module)
    end
end
