package = "awesome-basl"
version = "1"
source = {
   url = "https://github.com/drewby/basl",
   tag = "v1`"
}
description = {
   summary = "Big Ass Screen Layout for Awesome WM",
   homepage = "https://github.com/drewby/basl",
   license = "MIT"
}
dependencies = {
   "lua >= 5.3",
   "awesome >= 4.0"
}
supported_platforms = { "linux" }
build = {
   type = "builtin",
   modules = { basl = "init.lua" }
}
