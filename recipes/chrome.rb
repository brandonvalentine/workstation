workstation_package "Google Chrome" do
  dmg_name "googlechrome"
  source "https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg"
  checksum "bd0167302ca226fb79a5dc2630d6a38a0cdc26c91ce787936a3fbb832af93072"
  action :install
  user WS_USER
end
