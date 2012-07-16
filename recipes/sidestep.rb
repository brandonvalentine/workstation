unless File.exists?("/Applications/Sidestep.app")

  remote_file "#{Chef::Config[:file_cache_path]}/Sidestep.zip" do
    source "https://github.com/downloads/chetan51/sidestep/Sidestep.zip"
    checksum "db77b0a5e58de86d797c2a3e12836a16976a92bbb3d7d356d0b93e361779c26a"
    mode 0644
  end
  
  # start up on login
  execute "Start Sidestep automatically" do
    command "defaults write loginwindow AutoLaunchedApplicationDictionary -array-add '{ \"Path\" = \"/Applications/Sidestep.app\"; \"Hide\" = 0; }'"
    user WS_USER
  end
  
  # unzip
  execute "Unzip Sidestep" do
    command "unzip #{Chef::Config[:file_cache_path]}/Sidestep.zip Sidestep.app/* -d /Applications/"
    user WS_USER
  end

end
