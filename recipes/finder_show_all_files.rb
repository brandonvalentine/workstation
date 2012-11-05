execute "show all files in finder" do
  command "defaults write com.apple.Finder AppleShowAllFiles TRUE"
  user WS_USER
end
