adobe_air_uri = "http://airdownload.adobe.com/air/mac/download/3.4/AdobeAIR.dmg"
adobe_air_dmg = "#{Chef::Config[:file_cache_path]}/AdobeAIR.dmg"
adobe_air_mnt = '/Volumes/Adobe\ AIR'
adobe_air_installer = adobe_air_mnt + '/Adobe\ AIR\ Installer.app/Contents/MacOS/Adobe\ AIR\ Installer'

unless File.exists?("/Applications/Adobe/Flash\ Player/AddIns/airappinstaller/airappinstaller")
  remote_file adobe_air_dmg do
    source adobe_air_uri
    mode "0644"
    action :create_if_missing
    checksum "f49e87d3adfd1aaea23e1768c938499fab37f68127adf5b5295381050871793f"
  end

  execute "mount adobe air dmg" do
    command "hdiutil attach #{adobe_air_dmg}"
  end

  execute "install adobe air" do
    command adobe_air_installer + ' -silent -eulaAccepted'
    user WS_USER
  end

  execute "unmount adobe air dmg" do
    command "hdiutil detach #{adobe_air_mnt}"
  end
end
