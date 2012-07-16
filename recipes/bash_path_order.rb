ruby_block "put /opt/local/bin first in path" do
  block do
    ENV['PATH']="/opt/local/bin:#{ENV['PATH']}"
    new_contents = ""
    File.open("/etc/paths", "r") do |file|
      new_contents = "/opt/local/bin\n"+file.read.gsub("/opt/local/bin\n", "")
    end
    File.open("/etc/paths", "w") do |file|
      file.write(new_contents)
    end
  end
end
