return {
    'barrett-ruth/live-server.nvim',
    build = 'pnpm add live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    -- config = function()
    --     require('live-server').setup{}
    -- end,
    config = true
}
