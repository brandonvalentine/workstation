if File.exists?("/Applications/Take Five.app")

  # start up on login
  execute "Start Take Five automatically" do
    command "defaults write loginwindow AutoLaunchedApplicationDictionary -array-add '{ \"Path\" = \"/Applications/Take Five.app\"; \"Hide\" = 0; }'"
    user WS_USER
  end

end
