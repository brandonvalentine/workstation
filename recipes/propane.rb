unless File.exists?("/Applications/Propane.app")

  remote_file "#{Chef::Config[:file_cache_path]}/Propane.zip" do
    source "http://propaneapp.com/appcast/Propane.zip"
    checksum "a354ba9db476bc759f2b71322597bfcbc98e1f510c1053c5a68513dc71115cca"
    mode 0644
  end
  
  # unzip
  execute "Unzip Propane" do
    command "unzip #{Chef::Config[:file_cache_path]}/Propane.zip Propane.app/* -d /Applications/"
    user WS_USER
  end

end
