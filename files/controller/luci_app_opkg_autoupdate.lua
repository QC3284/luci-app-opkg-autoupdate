local http = require "luci.http"
local sys = require "luci.sys"

function index()
    if http.formvalue("refresh") then
        sys.call("opkg update")
        luci.http.redirect(luci.dispatcher.build_url("admin", "system", "opkg_autoupdate"))
    end
    return node("admin", "system", "opkg_autoupdate")
end
