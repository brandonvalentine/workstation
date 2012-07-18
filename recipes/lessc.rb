include_recipe "workstation::node_js"

execute "install less compiler" do
  command "npm -g install less"
end
