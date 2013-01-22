workstation_package "Mailplane" do
  source "http://mailplaneapp.com/downloads/MailplaneSL_1685.dmg"
  action :install
  checksum "a9c384163f23ced7a1d0174bcb0f8f4249feb017eae1852c4aa48c6ed98c8da5"
  accept_eula true
  user WS_USER
end
