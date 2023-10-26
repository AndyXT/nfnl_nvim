-- ~/.config/nvim/plugin/0-tangerine.lua or ~/.config/nvim/init.lua
vim.cmd("set exrc")	
vim.o.shellcmdflag = "-c"

local pack = "lazy"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require'lua.init'

-- Make some modules easier to access.
local execute = vim.api.nvim_command
local fn = vim.fn
local fmt = string.format

-- function ensure (user, repo)
--   -- Ensures a given github.com/USER/REPO is cloned in the pack/packer/start directory.
--   -- local install_path = fmt("%s/packer/start/%s", pack_path, repo, repo)
--   local install_path = vim.fn.stdpath("data") .. "/lazy/" .. repo
--   if fn.empty(fn.glob(install_path)) > 0 then
--     execute(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
--   end
-- end

-- ensure("Olical", "nfnl")

-- require("lazy").setup({
--   { "Olical/nfnl", ft = "fennel" },
-- })

local function bootstrap(url, ref)
    local name = url:gsub(".*/", "")
    local path

    if pack == "lazy" then
        path = vim.fn.stdpath("data") .. "/lazy/" .. name
        vim.opt.rtp:prepend(path)
    else
        path = vim.fn.stdpath("data") .. "/site/pack/".. pack .. "/start/" .. name
    end

    if vim.fn.isdirectory(path) == 0 then
        print(name .. ": installing in data dir...")

        vim.fn.system {"git", "clone", url, path}
        if ref then
            vim.fn.system {"git", "-C", path, "checkout", ref}
        end

        vim.cmd "redraw"
        print(name .. ": finished installing")
    end
end
-- for stable version [recommended]
-- bootstrap("https://github.com/udayvir-singh/tangerine.nvim")
-- bootstrap("https://github.com/udayvir-singh/hibiscus.nvim")
-- bootstrap("https://github.com/folke/lazy.nvim")
bootstrap("https://github.com/Olical/nfnl")
require('nfnl')['compile-all-files']()
