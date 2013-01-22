unless File.exists?("/Library/Fonts/Microsoft")
  workstation_package "OpenXML_all_fonts" do
    dmg_name "OpenXMLConverter121"
    app "Open XML File Format Converter for Mac 1.2.1.mpkg/Contents/Packages/OpenXML_all_fonts"
    volumes_dir "Open XML File Format Converter for Mac 1.2.1"
    source "http://download.microsoft.com/download/9/A/6/9A6FE8C2-84DF-4582-A6C2-32483F7DC988/OpenXMLConverter121.dmg"
    action :install
    type "pkg"
    checksum "aba028cf152ca31d01e12f327a2fd9935e9159093873d7880364f1e383308d52"
    user WS_USER
  end
end
