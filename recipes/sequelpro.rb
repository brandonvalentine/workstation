workstation_package "Sequel Pro" do
  volumes_dir "Sequel Pro 0.9.9.1"
  source "http://sequel-pro.googlecode.com/files/Sequel_Pro_0.9.9.1.dmg"
  action :install
  checksum "24754d2ea749248c01ca0155d437c2900dda47f8126fe093e7cc4590cf92fe4c"
  user WS_USER
end
