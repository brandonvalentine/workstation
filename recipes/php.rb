macports_package "php54" do
  action :install
end

execute "make php54 the default php interpreter" do
  command "port select php php54"
end

macports_package "php54-curl" do
  action :install
end

macports_package "php54-gd" do
  action :install
end

macports_package "php54-iconv" do
  action :install
end

macports_package "php54-mbstring" do
  action :install
end

macports_package "php54-mcrypt" do
  action :install
end

macports_package "php54-mysql" do
  action :install
end

macports_package "php54-openssl" do
  action :install
end

macports_package "php54-pear" do
  action :install
end

macports_package "php54-postgresql" do
  action :install
end

macports_package "php54-soap" do
  action :install
end

macports_package "php54-solr" do
  action :install
end

macports_package "php54-sqlite" do
  action :install
end

macports_package "php54-uploadprogress" do
  action :install
end

macports_package "php54-xmlrpc" do
  action :install
end

macports_package "php54-yaml" do
  action :install
end

macports_package "php54-zip" do
  action :install
end
