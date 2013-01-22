workstation_package "Google Voice And Video" do
  dmg_name "GoogleVoiceAndVideoSetup"
  volumes_dir "GoogleVoiceAndVideoAccelSetup_3.3.3.8675"
  source "https://dl.google.com/googletalk/googletalkplugin/GoogleVoiceAndVideoSetup.dmg"
  action :install
  type "pkg"
  checksum "e20d318b17c51a7c7d21cc50de9b05033332a56e35cbc6d3aedcd3d965947586"
  user WS_USER
end
