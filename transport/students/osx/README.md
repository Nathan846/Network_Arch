## 🛠 Installation & Set Up

1. Docker installation
  - [Mac](https://docs.docker.com/desktop/install/mac-install/)
  - If you face compatibility issues while installing Docker, make sure you update your macOS to at least Ventura 13.5.2

2. Vagrant installation
- Mac
  ```sh
  brew install vagrant
  ```

3. To start next steps you should have downloaded and installed Vagrant and Docker

## 🚀 Building and setting up for environment
Install Vagrant virtual box plugin
  ```sh
  vagrant plugin install docker
  ```
`Goto your hostos folder with vagrant file` Make sure that you have Vagrantfile and Dockerfile in this directory
  ```sh
  vagrant up
  vagrant ssh
  ```
  After this step, whenever you want to ssh to your docker goto this folder and execute `vagrant ssh` or `vagrant up && vagrant ssh`
## Other Vagrant commands
- vagrant halt
- vagrant destroy

## Common issues
- Unzip the given folder in the machine where you plan to run vagrant up. Do not unzip it in linux/windows and copy it to mac. It might cause some formatting issues.

## References
- [M1 mac docker with vagrant](https://dev.to/taybenlor/running-vagrant-on-an-m1-apple-silicon-using-docker-3fh4)
- [Vagrant docker docs](https://www.vagrantup.com/docs/providers/docker)
