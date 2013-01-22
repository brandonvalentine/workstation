unless File.exists?("/Applications/Remote Desktop Connection.app")
  workstation_package "RDC" do
    dmg_name "RDC_2.1.1_ALL"
    app "RDC Installer"
    volumes_dir "RDC"
    source "http://download.microsoft.com/download/C/F/0/CF0AE39A-3307-4D39-9D50-58E699C91B2F/RDC_2.1.1_ALL.dmg"
    action :install
    type "mpkg"
    checksum "4ebe551c9ee0e2da6b8f746be13c2df342c6f14cd3fbedbf2ab490f09b44616f"
    user WS_USER
  end
end
