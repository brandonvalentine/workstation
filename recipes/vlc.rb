workstation_package "VLC" do
  volumes_dir "vlc-2.0.3"
  source "http://downloads.sourceforge.net/project/vlc/2.0.3/macosx/vlc-2.0.3.dmg?r=http%3A%2F%2Fwww.videolan.org%2Fvlc%2Findex.html&ts=1346771852&use_mirror=hivelocity"
  action :install
  checksum "d0ee6c536835c837c1043dde585fe9f36aa36661fe24b3e0662bcc468f9cf143"
end
