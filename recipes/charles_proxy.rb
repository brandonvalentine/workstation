unless File.exists?("/Applications/Charles.app")

  remote_file "#{Chef::Config[:file_cache_path]}/Charles.zip" do
    source "https://d13itkw33a7sus.cloudfront.net/dist/1P/mac/Charles-3.8.19.zip"
    checksum "2d9360ac63b826f6f190af8bb6ff9493bbc5e3e28ff45345ffc267ee72e5f335"
    mode 0644
  end
  
  # unzip
  execute "Unzip Charles" do
    command "unzip #{Chef::Config[:file_cache_path]}/Charles.zip Charles.app/* -d /Applications/"
    user WS_USER
  end

end
