unless File.exists?("/Applications/CommandQ.app")

  remote_file "#{Chef::Config[:file_cache_path]}/commandq.zip" do
    source "http://dl.clickontyler.com/commandq/commandq_1.0.4.zip"
    checksum "1183a2baf3775bd47851c94636ebe41356e4b53fce1dd35b4b70b9298294a107"
    mode 0644
  end
  
  # start up on login
  execute "Start CommandQ automatically" do
    command "defaults write loginwindow AutoLaunchedApplicationDictionary -array-add '{ \"Path\" = \"/Applications/CommandQ.app\"; \"Hide\" = 0; }'"
    user WS_USER
  end
  
  # unzip
  execute "Unzip CommandQ" do
    command "unzip #{Chef::Config[:file_cache_path]}/commandq.zip CommandQ.app/* -d /Applications/"
    user WS_USER
  end

end
