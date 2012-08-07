execute "turn on afpovertcp" do
  command "launchctl load -w /System/Library/LaunchDaemons/com.apple.AppleFileServer"
  not_if "launchctl list com.apple.AppleFileServer"
end

ruby_block "test to see if afpovertcp is running" do
  block do
    require 'socket'
    afp_port = 548
    begin
      s = TCPSocket.open('localhost',afp_port)
    rescue => e
      raise "afpovertcp is not running: " << e
    end
    s.close
  end
end
