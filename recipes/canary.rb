workstation_package "Google Chrome Canary" do
  dmg_name "GoogleChromeCanary"
  source "https://commondatastorage.googleapis.com/chrome-canary/GoogleChromeCanary.dmg"
  checksum "2ef24475ebec327000777e644e7e9aa32fc7c67e9398f6b9ce3cb20c82d787ed"
  action :install
  user WS_USER
end
