remote_file "#{Chef::Config[:file_cache_path]}/SNX_64_bit_addition_R75_10.tgz" do
  source "http://dl3.checkpoint.com/paid/c5/SNX_64_bit_addition_R75_10.tgz?HashKey=1350004076_3d9745e85efc21eff55dead41574849c&xtn=.tgz"
  checksum "4beae8642238c849be604b9f8460d00175adefc2d4370c1b49d278beea33945f"
end

execute "extract SNX VPN client" do
  command "tar xzf #{Chef::Config[:file_cache_path]}/SNX_64_bit_addition_R75_10.tgz -C #{Chef::Config[:file_cache_path]}"
end

execute "install SNX VPN client" do
  command "#{Chef::Config[:file_cache_path]}/SNX_64_bit_addition/FWDIR_CSHELL/snx_install_osx.sh"
end
