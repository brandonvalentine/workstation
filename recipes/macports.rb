if `uname -r`.chop == "12.1.0"
  macports_uri = "https://distfiles.macports.org/MacPorts/MacPorts-2.1.2-10.8-MountainLion.pkg"
  macports_checksum = "a3c389696524997c1802c9232a1472046efdbd02a3031bb3125d104dc514f9ad"
else
  macports_uri = "https://distfiles.macports.org/MacPorts/MacPorts-2.1.1-10.7-Lion.pkg"
  macports_checksum = "859b1cc1c4da488a8a367efa04992a8f8974528614e9ccfd54a4f40c68ba6d43"
end

unless File.exists?("/opt/local/bin/port")

  remote_file "#{Chef::Config[:file_cache_path]}/MacPorts.pkg" do
    source macports_uri
    checksum macports_checksum
  end
  
  execute "install MacPorts" do
    command "installer -pkg #{Chef::Config[:file_cache_path]}/MacPorts.pkg -target /"
  end

end
