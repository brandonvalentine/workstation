ENV['IEVMS_VERSIONS'] = "7 9"

macports_package "unrar" do
  action :install
end

macports_package "curl" do
  action :install
end

execute "install ievms" do
  command "curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | bash"
  user WS_USER
end
