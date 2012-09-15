dbversion = "51"
dbdir = "/opt/local/var/db/mysql#{dbversion}"

# need to make this more robust later to accomodate post 10.8.0, but it'll do for now
unless `uname -r`.chop == "12.1.0"
  dbuser = "mysql"
else
  dbuser = "_mysql"
end

run_unless_marker_file_exists("mysql") do
  execute "unload mysql via launchd" do
    command "port unload mysql#{dbversion}-server"
    only_if "launchctl list org.macports.postgresql#{dbversion}-server"
  end

  # blow away default image's data directory
  # this seems like a bad idea just because I removed the marker file
  directory dbdir do
    action :delete
    recursive true
  end

  macports_package "mysql#{dbversion}-server" do
    action :purge
    options "-f"
  end

  macports_package "mysql#{dbversion}" do
    action :purge
    options "-f"
  end

  macports_package "mysql_select" do
    action :purge
    options "-f"
  end

  macports_package "mysql51-server" do
    action :install
  end

  macports_package "mysql_select" do
    action :install
  end

  execute "make mysql51 the default mysql" do
    command "port select mysql mysql51"
    not_if "port select --show mysql | grep \"The currently selected version for 'mysql' is 'mysql#{dbversion}'.\""
  end

  execute "initialize the database" do
    command "sudo -u #{dbuser} mysql_install_db"
    not_if { File.exists?("/opt/local/var/db/mysql51/mysql/user.MYD") }
  end

  execute "start the mysql server" do
    command "port load mysql51-server"
    not_if system("ls /opt/local/var/run/mysql51/mysqld.sock")
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

  execute "insert time zone info" do
    command "mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -uroot mysql"
    not_if "mysql -uroot mysql -e 'select * from time_zone_name' | grep -q UTC"
  end
end
