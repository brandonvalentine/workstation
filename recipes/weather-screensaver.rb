city = node['workstation']['weather_city']

unless File.exists?("/Applications/theweather-#{city}.app")
  remote_file "#{Chef::Config[:file_cache_path]}/theweather-#{city}.zip" do
    source "http://www.stefantrifan.com/theweather/macosx/theweather-#{city}.zip"
    mode "0644"
  end

  execute "unzip the weather screensaver" do
    command "unzip #{Chef::Config[:file_cache_path]}/theweather-#{city}.zip theweather-#{city}.app/* -d /Applications/"
    user WS_USER
  end
end
