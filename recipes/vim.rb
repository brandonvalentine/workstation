include_recipe "workstation::ack"
include_recipe "workstation::git"
include_recipe "workstation::rvm"

macports_package "MacVim" do
  action :install
  variants "+ruby +huge +perl +tcl +python27 +cscope"
end

git node["vim_home"] do
  repository node["vim_config_git"]
  branch "master"
  revision node["vim_hash"] || "HEAD"
  action :sync
  user WS_USER
  enable_submodules true
end

execute "initialize janus" do
  command "cd #{node["vim_home"]} && rake"
  user WS_USER
end

ruby_block "test to see if MacVim link worked" do
  block do
    raise "/Applications/MacPorts/MacVim install failed" unless File.exists?("/Applications/MacPorts/MacVim.app")
  end
end

workstation_bash_profile_include "vi_is_minimal_vim"
