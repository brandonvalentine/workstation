unless File.exists?("/Applications/Bartender.app")

  remote_file "#{Chef::Config[:file_cache_path]}/Bartender.zip" do
    source "http://www.macbartender.com/Demo/Bartender.zip"
    mode "0644"
  end

  execute "unzip bartender" do
    command "unzip #{Chef::Config[:file_cache_path]}/Bartender.zip Bartender.app/* -d /Applications/"
    user WS_USER
  end

  execute "start bartender automatically" do
    command "defaults write loginwindow AutoLaunchedApplicationDictionary -array-add '{ \"Path\" = \"/Applications/Bartender.app\"; \"Hide\" = 0; }'"
    user WS_USER
  end
end
