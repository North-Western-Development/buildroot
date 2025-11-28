if [ -z "$LUA_PATH" ]; then
    export LUA_PATH="/usr/share/lua/5.4/?.lua;/mnt/builtin/lib/lua/?.lua;/mnt/builtin/lib/lua/?/init.lua"
else
    export LUA_PATH="$LUA_PATH;/usr/share/lua/5.4/?.lua;/mnt/builtin/lib/lua/?.lua;/mnt/builtin/lib/lua/?/init.lua"
fi
