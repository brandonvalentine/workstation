dbversion = "91"
dbdir = "/opt/local/var/db/postgresql#{dbversion}"
dbuser = "postgres"
dbgrp = "postgres"

run_unless_marker_file_exists("postgres") do

  plist_path = File.expand_path("org.macports.postgresql#{dbversion}-server.plist", File.join('/', 'Library', 'LaunchAgents'))
  if File.exists?(plist_path)
    log "postgres plist found at #{plist_path}"
    execute "unload the plist (shuts down the daemon)" do
      command %'launchctl unload -w #{plist_path}'
    end
  else
    log "Did not find plist at #{plist_path} don't try to unload it"
  end

  # blow away default image's data directory
  # this seems like a bad idea just because I removed the marker file
  #directory "/opt/local/var/db/postgresql#{dbversion}" do
  #  action :delete
  #  recursive true
  #end

  macports_package "postgresql#{dbversion}-server" do
    action :purge
  end

  macports_package "postgresql#{dbversion}-server" do
    action :install
  end

  macports_package "postgresql_select" do
    action :install
  end

  execute "select default postgres version" do
    command "port select postgresql postgresql#{dbversion}"
    not_if "port select --show postgresql | grep \"The currently selected version for 'postgresql' is 'postgresql#{dbversion}'.\""
  end

  execute "create the database directories" do
    command "mkdir -p #{dbdir} && chown #{dbuser}:#{dbgrp} #{dbdir}"
    not_if { File.directory? dbdir }
  end

  execute "initialize the database" do
    command "initdb --encoding=utf8 --locale=en_US #{dbdir}"
    user dbuser
    not_if { File.directory? dbdir }
  end

  execute "start the daemon" do
    command "launchctl load -w /Library/LaunchAgents/org.macports.postgresql#{dbversion}-server.plist"
  end

  ruby_block "wait four seconds for the database to start" do
    block do
      sleep 4
    end
  end

  # "initdb /tmp/junk.$$" will fail unless you modify sysctl variables
  # Michael Sofaer says that these are probably the right settings:
  #   kern.sysv.shmall=65535
  #   kern.sysv.shmmax=16777216
  #not_if File.exists?("/etc/sysctl.conf") do
  # check if the sysctl variables are big enough
  #   if not, set them
  # check if /etc/sysctl.conf exists
  #   if so, check if kern.sysv.{shmall,shmmax} are set
  #     if so, check that they're set large enough
  #       if so, go on
  #   otherwise
  #     modify /etc/sysctl.conf to make them big enough
  # otherwise
  #   create /etc/sysctl.conf & make these settings big enough
  #

end

ruby_block "test to see if postgres is running" do
block do
    require 'socket'
    postgres_port = 5432
    begin
      s = TCPSocket.open('localhost',postgres_port)
    rescue => e
      raise "postgres is not running: " << e
    end
    s.close
    `sudo -u #{WS_USER} psql -U postgres < /dev/null`
    if $?.to_i != 0
      raise "I couldn't invoke postgres!"
    end
  end
end
