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

  execute "unload postgres via launchd" do
    command "port unload postgresql#{dbversion}-server"
    only_if "launchctl list org.macports.postgresql#{dbversion}-server"
  end

  # blow away default image's data directory
  # this seems like a bad idea just because I removed the marker file
  # but it's here if you want to uncomment it
  #directory dbdir do
  #  action :delete
  #  recursive true
  #end

  macports_package "postgresql#{dbversion}-server" do
    action :purge
    options "-f"
  end

  macports_package "postgresql#{dbversion}" do
    action :purge
    options "-f"
  end

  macports_package "postgresql_select" do
    action :purge
    options "-f"
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
    command "mkdir -p #{dbdir}/defaultdb && chown -R #{dbuser}:#{dbgrp} #{dbdir}"
    not_if { File.directory? "#{dbdir}/defaultdb" }
  end

  workstation_sysctl "kern.sysv.shmall" do
    name "kern.sysv.shmall"
    value 65535
    save false
  end

  workstation_sysctl "kern.sysv.shmmax" do
    name "kern.sysv.shmmax"
    value 16777216
    save false
  end

  execute "initialize the database" do
    command "initdb --encoding=utf8 --locale=en_US #{dbdir}/defaultdb"
    user dbuser
    not_if { Dir.entries("#{dbdir}/defaultdb").count > 2 }
  end

  execute "start the daemon" do
    command "port load postgresql#{dbversion}-server"
  end

  ruby_block "wait four seconds for the database to start" do
    block do
      sleep 4
    end
  end
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

macports_package "p5-pgtop" do
  action :install
end
