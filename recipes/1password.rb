unless File.exists?("/Applications/1Password.app")

  remote_file "#{Chef::Config[:file_cache_path]}/1Password.zip" do
    source "https://d13itkw33a7sus.cloudfront.net/dist/1P/mac/1Password-3.8.19.zip"
    checksum "7db597ad90f2b2a9be678575942424773d6c5f7c2589bcd0d874ab6639073698"
    mode 0644
  end
  
  # unzip
  execute "Unzip 1Password" do
    command "unzip #{Chef::Config[:file_cache_path]}/1Password.zip 1Password.app/* -d /Applications/"
    user WS_USER
  end

end
