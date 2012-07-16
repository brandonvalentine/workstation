require 'pathname'

DEFAULT_MYSQL_PASSWORD = "password"

macports_package "mysql51-server" do
  action :install
end

macports_package "mysql_select" do
  action :install
end

execute "make mysql51 the default mysql" do
  command "port select mysql mysql51"
end

# need to make this more robust later to accomodate post 10.8.0, but it'll do for now
unless system("uname -r") == "10.8.0"
  MYSQL_USER = "mysql"
else
  MYSQL_USER = "_mysql"
end

execute "initialize the database" do
  command "sudo -u #{MYSQL_USER} mysql_install_db"
  not_if { File.exists?("/opt/local/var/db/mysql51/mysql/user.MYD")}
end

ruby_block "Checking that mysql is running" do
  block do
    Timeout::timeout(60) do
      until system("ls /opt/local/var/run/mysql51/mysqld.sock")
        sleep 1
      end
    end
  end
end

execute "set the root password to the default" do
  command "mysqladmin -uroot password #{DEFAULT_MYSQL_PASSWORD}"
  not_if "mysql -uroot -p#{DEFAULT_MYSQL_PASSWORD} -e 'show databases'"
end

execute "insert time zone info" do
  command "mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -uroot -p#{DEFAULT_MYSQL_PASSWORD} mysql"
  not_if "mysql -uroot -p#{DEFAULT_MYSQL_PASSWORD} mysql -e 'select * from time_zone_name' | grep -q UTC"
end
