workstation_package "Paparazzi!" do
  volumes_dir "Paparazzi! 0.6.5"
  source "http://derailer.org/paparazzi/Paparazzi!%200.6.5.dmg"
  action :install
  checksum "2362f56853d14fc02c599e3ed5091ec4f0bdd126beb9311a60fc1ca0a4d83662"
end

# start up on login
execute "Start Paparazzi! automatically" do
  command "defaults write loginwindow AutoLaunchedApplicationDictionary -array-add '{ \"Path\" = \"/Applications/Paparazzi!.app\"; \"Hide\" = 0; }'"
  user WS_USER
end
