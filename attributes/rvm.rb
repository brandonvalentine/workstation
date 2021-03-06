node.default["rvm"]= {
  "rubies" => {
    # gcc-4.2 is available from the osx-gcc project on github. We dont install it
    # as it overwrites later versions of files provided by xcode.
    "ruby-1.8.7-p358" => { :env => "CC=/opt/local/bin/gcc-apple-4.2", :command_line_options => "--with-gcc=/opt/local/bin/gcc-apple-4.2 --with-openssl-dir=/opt/local/" },
    "ruby-1.9.3-p194" => { :env => "CC=/opt/local/bin/gcc-apple-4.2", :command_line_options => "--with-gcc=/opt/local/bin/gcc-apple-4.2 --with-opt-dir=/opt/local" },
  },
  "default_ruby" => "ruby-1.9.3-p194"
}
