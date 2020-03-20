target ("Base")
  set_kind ("shared")
  add_files ("*.cpp")
  add_deps ("ModLoader")
  add_links ("bedrock_server_mod")
  on_load (function (target)
    local version = os.iorun("git describe --tags --always")
    version = string.trim(version)
    print ("-DEZVERSION=\"" .. version ..  "\"")
    target:add ("defines", "EZVERSION=\"" .. version ..  "\"")
  end)
  add_packages ("boost", "sqlite3", "sqlite_cpp", "yaml-cpp", "jsoncpp")