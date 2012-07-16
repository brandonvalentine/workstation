workstation_package "Plex Media Server" do
  volumes_dir "PlexMediaServer"
  source "http://plex-downloads.s3.amazonaws.com/0.9.6.3/Releases/MacOSX-SL/PlexMediaServer-0.9.6.3.140-9c9f5ce-OSX.dmg"
  action :install
  checksum "c8188ba97636dbc92f695b3efb8c5a8df97c0b76d27bc96c5cdb45c4811d08cb"
end

unless File.exists?("/Applications/Plex.app")

  remote_file "#{Chef::Config[:file_cache_path]}/Plex.zip" do
    source "http://plex-downloads.s3.amazonaws.com/plex-laika/0.9.5.3/Plex-0.9.5.3-b642caac-signed.zip"
    checksum "3f93672001fa357cc35ddce7e116511f299303308b1a74633ecfbbb82865e35e"
    mode 0644
  end
  
  # unzip
  execute "Unzip Plex" do
    command "unzip #{Chef::Config[:file_cache_path]}/Plex.zip Plex.app/* -d /Applications/"
    user WS_USER
  end

end
