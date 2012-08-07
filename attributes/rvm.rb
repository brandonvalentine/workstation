node.default["rvm"]= {
  "rubies" => {
    # gcc-4.2 is available from the osx-gcc project on github. We dont install it
    # as it overwrites later versions of files provided by xcode.
    "ruby-1.8.7-p358" => { :command_line_options => "--with-openssl-dir=/opt/local/" },
    "ruby-1.9.3-p194" => { :command_line_options => "--with-opt-dir=/opt/local" },
  },
  "default_ruby" => "ruby-1.9.3-p194"
}
