include_recipe "workstation::ack"
include_recipe "workstation::window_focus"

macports_package "watch" do
  action :install
end

macports_package "pstree" do
  action :install
end

macports_package "tree" do
  action :install
end

macports_package "wget" do
  action :install
end

macports_package "proctools" do
  action :install
end

macports_package "htop" do
  action :install
end

macports_package "mtr" do
  action :install
end

macports_package "pwgen" do
  action :install
end

macports_package "unrar" do
  action :install
end

macports_package "s3cmd" do
  action :install
end

macports_package "w3m" do
  action :install
end
