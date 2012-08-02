macports_package "mongodb" do
  action :install
end

macports_package "MongoExplorer" do
  action :install
end

execute "load mongodb via launchd" do
  command "port load mongodb"
end
