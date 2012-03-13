Assuming you have a secured server you can provision your server with an entire
Rails stack in just a few commands using this recipie for Sprinkle.

This stack includes Zsh, MySQL, Nginx/Passenger, Git and Ruby 1.9.2

Note: You should secure your server *before* provisioning it.

AUTOMATIC INSTALL OF RAILS STACK 
================================

On your development machine:

```
git clone git://github.com/krisleech/rails-stack.git
cd rails-stack
bundle install
cp config/deploy.example.rb config/deploy.rb
vim deploy.rb
sprinkle -c -s config/install.rb
```

MANUALLY SECURE SERVER
======================

Create user and add to sudo group

```shell
ssh root@example.com
sudo adduser deploy
sudo usermod -a -G sudo deploy
```

upload ssh key to new user

```
scp ~/.ssh/identify.pub deploy@example.com:.
ssh deploy@example.com
mkdir ~/.ssh
mv identity.pub ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

Prevent password and root logins:

```
vim /etc/ssh/sshd_config
```

```
  PermitRootLogin no 
  PasswordAuthentication no
```

```
sudo service ssh restart
```

```
sudo apt-get install denyhosts 
```
