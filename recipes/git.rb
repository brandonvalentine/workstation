macports_package "git-core" do
  action :install
  variants "+bash_completion +svn"
end

macports_package "git-extras" do
  action :install
end
