include_recipe "workstation::git"

macports_package "gitx" do
  action :install
end
