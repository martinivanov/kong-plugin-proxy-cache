local BasePlugin = require "kong.plugins.base_plugin"
local access = require 'kong.plugins.proxy-cache.access'
local body_filter = require 'kong.plugins.proxy-cache.body_filter'
local header_filter = require 'kong.plugins.proxy-cache.header_filter'

local ProxyCaching = BasePlugin:extend()

ProxyCaching.PRIORITY = 1006
ProxyCaching.VERSION = '0.1.0'

function ProxyCaching:new()
    ProxyCaching.super.new(self, "proxy-cache")
end

function ProxyCaching:init_worker()
    ProxyCaching.super.init_worker(self)
end

function ProxyCaching:access(config)
    ProxyCaching.super.access(self)
    access.execute(config)
end

function ProxyCaching:header_filter(config)
    ProxyCaching.super.header_filter(self)
    header_filter.execute(config)
end

function ProxyCaching:body_filter(config)
    ProxyCaching.super.body_filter(self)
    body_filter.execute(config)
end

return ProxyCaching