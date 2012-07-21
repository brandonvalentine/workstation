execute "install svn2git gem" do
  command "rvm default do gem install svn2git"
  user WS_USER
end
