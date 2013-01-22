workstation_package "calibre" do
  dmg_name "calibre-0.9.12"
  volumes_dir "calibre-0.9.12"
  source "http://calibre-ebook.googlecode.com/files/calibre-0.9.12.dmg"
  checksum "92eb3956565e8c1de74f1ba4f3fcb1138ffcfe573c0ae4600dd19b4eede853c8"
  action :install
  user WS_USER
end
