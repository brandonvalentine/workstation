execute "set dock to be on the bottom" do
  command "defaults write com.apple.dock orientation -string bottom"
  user WS_USER
end

execute "set dock to be pinned to the left" do
  command "defaults write com.apple.dock pinning -string start"
  user WS_USER
end

execute "set dock to not autohide" do
  command "defaults write com.apple.dock autohide -boolean false"
  user WS_USER
end

execute "set dock to have no glass" do
  command "defaults write com.apple.dock no-glass -boolean true"
  user WS_USER
end

execute "set dock to have no persistent apps" do
  command "defaults write com.apple.dock persistent-apps -array"
  user WS_USER
  # not crazy about the use of perl, but multiline matching in sed or awk is
  # damned unreadable, and it's more difficult to control the exit status
end

execute "set dock to have tile size of 32" do
  command "defaults write com.apple.dock tilesize -integer 32"
  user WS_USER
end

execute "relaunch dock" do
  command "killall Dock"
end
