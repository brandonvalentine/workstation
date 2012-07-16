workstation_package "Alfred" do
  volumes_dir "Alfred.app"
  source "http://rwc.cachefly.net/alfred_1.2_220.dmg"
  action :install
  checksum "212d1d66706561776a1d480a1bbb4d05c0c09a3fa94888c720f6316c721ccee0"
end

# start up on login
execute "Start Alfred automatically" do
  command "defaults write loginwindow AutoLaunchedApplicationDictionary -array-add '{ \"Path\" = \"/Applications/Alfred.app\"; \"Hide\" = 0; }'"
  user WS_USER
end
