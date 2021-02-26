Vagrant.configure("2") do |config|
  config.vm.box = "berchev/bionic64"
  # Adding .terraformrc file from Host to Guest for authentication to TF Cloud
  config.vm.provision :file, source: "~/.terraformrc", destination: "/home/vagrant/.terraformrc"
  config.vm.provision :shell, path: "scripts/terraform-sentinel.sh"
end
