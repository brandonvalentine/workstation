unless File.exists?("/Applications/Induction.app")

  remote_file "#{Chef::Config[:file_cache_path]}/induction.zip" do
    source "https://mesmerize.s3.amazonaws.com/Induction/Induction-28.zip"
    mode "0644"
    checksum "b209e4ca234749435c8e014ec79b2bc0bdcfe626ff4cbbeb6b3ee51cd1f2e68c"
  end

  execute "unzip induction" do
    command "unzip #{Chef::Config[:file_cache_path]}/induction.zip Induction.app/* -d /Applications/"
    user WS_USER
  end
end
