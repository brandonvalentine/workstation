wmj_uri = "http://air.workamajig.com/Workamajig.air"
wmj_file = "#{Chef::Config[:file_cache_path]}/Workamajig.air"

unless File.exists?("/Applications/Workamajig.app")
  remote_file wmj_file do
    source wmj_uri
    mode "0644"
    action :create_if_missing
    checksum "bc2be281c5453d7e13573212e587f9d3aa925e7d0748810aebb46bbdadee366c"
  end

  execute "install workamajig app" do
    command '/Applications/Adobe/Flash\ Player/AddIns/airappinstaller/airappinstaller -silent ' + wmj_file
  end
end
