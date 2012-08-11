macports_package "npm" do
  action :install
end

execute "install n version manager for node.js" do
  command "npm install -g n"
  not_if "npm list -g | grep ' n@'"
end

workstation_bash_profile_include "node_js"
