Assuming you have a secured server you can provision your server with an entire
Rails stack in just a few commands using this recipie for Sprinkle.

This stack includes Zsh, MySQL, Apache/Passenger, Git and Ruby 1.9.2

Note: You should secure your server *before* provisioning it.

AUTOMATIC INSTALL OF RAILS STACK 
================================

On your development machine:

```shell
git clone git://github.com/krisleech/rails-stack.git
cd rails-stack
bundle install
cp config/deploy.example.rb config/deploy.rb
vim deploy.rb
sprinkle -c -s config/install.rb
```

MANUALLY SECURE SERVER
======================

```shell
ssh root@example.com

# change your root pasword
passwd

# add a new user and allow them to sudo
sudo adduser deploy
sudo usermod -a -G sudo deploy

exit
```

```shell
# upload your ssh key for passwordless login
scp ~/.ssh/identity.pub deploy@example.com:.

ssh deploy@example.com

mkdir ~/.ssh
mv identity.pub ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

exit
```

```shell
# disable root and password login
ssh deploy@example.com
sudo vim /etc/ssh/sshd_config
  PermitRootLogin no 
  PasswordAuthentication no
sudo service ssh restart

# Install denyhosts
sudo apt-get update
sudo apt-get install denyhosts 
```
