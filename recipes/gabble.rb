unless File.exists?("/Applications/Gabble.app")

  remote_file "#{Chef::Config[:file_cache_path]}/Gabble.zip" do
    source "http://gabbleapp.com/Gabble.zip"
    checksum "1183a2baf3775bd47851c94636ebe41356e4b53fce1dd35b4b70b9298294a107"
    mode "0644"
  end
  
  execute "Unzip Gabble" do
    command "unzip #{Chef::Config[:file_cache_path]}/Gabble.zip Gabble.app/* -d /Applications/"
    user WS_USER
  end

end
