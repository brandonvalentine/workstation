unless File.exists?("/opt/local/bin/port")

  remote_file "#{Chef::Config[:file_cache_path]}/MacPorts.pkg" do
    source "https://distfiles.macports.org/MacPorts/MacPorts-2.1.1-10.7-Lion.pkg"
    checksum "859b1cc1c4da488a8a367efa04992a8f8974528614e9ccfd54a4f40c68ba6d43"
  end
  
  execute "install MacPorts" do
    command "installer -pkg #{Chef::Config[:file_cache_path]}/MacPorts.pkg -target /"
  end

end
