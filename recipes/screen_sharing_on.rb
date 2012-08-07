execute "Enabling Screen Sharing for All Users" do
  command "launchctl load -w /System/Library/LaunchDaemons/com.apple.screensharing"
  not_if "launchctl list com.apple.screensharing"
end

ruby_block "test to see if screen-sharing is enabled" do
  block do
    require 'socket'
    vnc_port = 5900
    begin
      s = TCPSocket.open('localhost',vnc_port)
    rescue => e
      raise "Couldn't connect to screen-sharing: " << e
    end
    s.close
  end
end
