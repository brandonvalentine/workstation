workstation_package "JavaForOSX" do
  source "http://support.apple.com/downloads/DL1572/en_US/"
  volumes_dir "Java for OS X 2012-005"
  action :install
  type "pkg"
  package_id "com.apple.pkg.JavaForMacOSX107"
  checksum "7c878d0830d9c51385bf87642fca641b624f3eb5e5b41e039bc1bf86cb50c1e4"
  user WS_USER
end
