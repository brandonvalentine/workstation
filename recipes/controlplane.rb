workstation_package "ControlPlane" do
  source "http://www.controlplaneapp.com/download/1.2.3?ref=dlbutton"
  action :install
  checksum "37f93d3a3a17a6e2f24447f0bc74c7e89ec1581ca52e5970960544858c86f909"
end

# start up on login
execute "Start ControlPlane automatically" do
  command "defaults write loginwindow AutoLaunchedApplicationDictionary -array-add '{ \"Path\" = \"/Applications/ControlPlane.app\"; \"Hide\" = 0; }'"
  user WS_USER
end
