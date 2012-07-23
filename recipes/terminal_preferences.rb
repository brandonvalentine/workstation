gem_package("osx-plist")

terminal_plist_file = "#{ENV['HOME']}/Library/Preferences/com.apple.Terminal.plist"
color_scheme_plist_file = "#{File.dirname(__FILE__)}/../files/default/4Dwm.terminal"

require 'osx/plist'

plist = OSX::PropertyList.load_file(terminal_plist_file)
color_scheme = OSX::PropertyList.load_file(color_scheme_plist_file)

plist["Window Settings"]["4Dwm"] = color_scheme
OSX::PropertyList.dump_file(terminal_plist_file, plist, :binary1)

execute "set startup terminal color scheme" do
  command "defaults write com.apple.Terminal 'Startup Window Settings' -string 4Dwm"
  user WS_USER
end

execute "set default terminal color scheme" do
  command "defaults write com.apple.Terminal 'Default Window Settings' -string 4Dwm"
  user WS_USER
end
