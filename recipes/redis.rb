macports_package "redis" do
  action :install
end

execute "start redis on boot" do
  command "port load redis"
end
