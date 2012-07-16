macports_package "npm" do
  action :install
end

execute "install n version manager for node.js" do
  command "npm install -g n"
  not_if "npm list -g | grep 'n@'"
end
