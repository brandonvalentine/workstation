workstation_package "Alfred" do
  volumes_dir "Alfred.app"
  source "http://cachefly.alfredapp.com/alfred_1.3.1_261.dmg"
  action :install
  checksum "c951c4dc05ff1091359358d710142cabef2c190be41f799244669f879cff7e80"
  user WS_USER
end

# start up on login
execute "Start Alfred automatically" do
  command "defaults write loginwindow AutoLaunchedApplicationDictionary -array-add '{ \"Path\" = \"/Applications/Alfred.app\"; \"Hide\" = 0; }'"
  user WS_USER
end
