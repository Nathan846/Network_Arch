## 🛠 Installation & Set Up

1. Virtualbox installation
  - Windows: Download from [here](https://www.virtualbox.org/wiki/Downloads)

2. Vagrant installation
  - Windows: Download from [here](https://www.vagrantup.com/downloads)

3. To start next steps you should have downloaded and installed Vagrant and Virtualbox.
4. If you are using the zip folder, extract it on the same machine you will run your VM on.
5. If you are using git for Windows, please make sure to run the following command before cloning to avoid file conversion and line ending errors. If skipped, you may encounter issues while running the init.bash file and accessing other files in the directory. 
 ```sh
 git config --global core.autocrlf input
  ```
6. Launch the Virtual Box GUI in the background.

## 🚀 Building and setting up for environment
1. Navigate to this folder containing the Vagrantfile (transport/students/win_x86)
2. While setting the environment for the first time, execute  `vagrant up` and then execute `vagrant ssh`. This should successfully launch the environment.
3. You should see the cs4254 folder upon listing the files in this directory (execute  `ls`). Navigate to cs4254 (execute  `cd cs4254`) which contains the starter code.
4. To exit the environment, execute `exit` and then execute  `vagrant suspend`
5. To restart the VM, execute `vagrant up` and then execute `vagrant ssh`. You should not lose any changes and the environment will stay intact, and you can continue your work.
   
## Other Vagrant commands and their uses
- vagrant destroy (Can be used if you run into any issues while launching the environment. It will not lead to loss of your changes to the files. Simply execute  `vagrant up` followed by  `vagrant ssh` to relaunch the environment.)
- Do NOT use `vagrant halt` on Windows. Use `vagrant suspend` suspend instead.

## Common issues
- Unzip the given folder in the machine where you plan to run vagrant up. Do not unzip it in linux and copy it to windows. It might cause some formatting issues.
- If using a git repo on windows, make sure you follow step 5 from the Installation and Set up guide. Else vagrant may not be able to the execute files during vagrant ssh, and require you manually install dos2unix (apt-get install dos2unix), convert init.bash (doc2unix cs4254/infra/init.bash) and then excute init.bash. After this you will also need to convert all the other files using dos2unix before runnig the starter code.

## References
- [vagrant virtualbox docs](https://www.vagrantup.com/docs/providers/virtualbox)
- [git line endings] (https://shzhangji.com/blog/2022/08/31/configure-git-line-endings-across-oses/)
