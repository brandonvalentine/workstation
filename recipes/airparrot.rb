workstation_package "Airparrot" do
  source "http://airparrot.com/download/Mac/AirParrot.dmg"
  action :install
  checksum "346b60f525689081379ead622a28296be3d5c3795abffb972fc3ee0c79240936"
  user WS_USER
end

# start up on login
execute "Start AirParrot automatically" do
  command "defaults write loginwindow AutoLaunchedApplicationDictionary -array-add '{ \"Path\" = \"/Applications/AirParrot.app\"; \"Hide\" = 0; }'"
  user WS_USER
end
