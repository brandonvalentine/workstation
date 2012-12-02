unless File.exists?("#{WS_LIBRARY}/Widgets/Delivery Status.wdgt")

  remote_file "#{Chef::Config[:file_cache_path]}/delivery_status.zip" do
    source "http://files.junecloud.com/delivery-status-5.9.zip"
    checksum "5c9e9871b8d599f12fadfba236ce9bddef7c878b0a359885891fc7f2f9c47e41"
    mode 0644
  end

  # unzip
  execute "Unzip Delivery Status Widget" do
    command "mkdir -p #{WS_LIBRARY}/Widgets && unzip #{Chef::Config[:file_cache_path]}/delivery_status.zip Delivery\\ Status.wdgt/* -d #{WS_LIBRARY}/Widgets/"
    user WS_USER
  end

end
