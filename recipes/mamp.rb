unless File.exists?("/Applications/MAMP.app")

  remote_file "#{Chef::Config[:file_cache_path]}/MAMP_PRO.zip" do
    source "http://www.mamp.info/downloads/releases/MAMP_PRO.zip"
    checksum "577f3a49e13b993629add79a20b2e31e347bfcc52c9c5c3fb45136f9b92ae109"
    mode "0644"
  end
  
  execute "Unzip MAMP" do
    command "unzip -o #{Chef::Config[:file_cache_path]}/MAMP_PRO.zip MAMP_2.1.1.pkg -d #{Chef::Config[:file_cache_path]}/"
  end

  execute "Install MAMP" do
    command "installer -pkg #{Chef::Config[:file_cache_path]}/MAMP_2.1.1.pkg -target /"
  end

end
