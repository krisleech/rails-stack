MANUALLY SECURE SERVER

Login to server using root and password
Create user and add to sudo group

```shell
adduser deploy
usermod -a -G sudo deploy
```

upload ssh key to new user

```
scp ~/.ssh/identify.pub example.com:.
ssh example.com
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

AUTOMATIC INSTALL OF RAILS STACK (mySQL, Nginx/Passenger, Git, Ruby 1.9.2)

On your development machine:

```
gem install bundler
bundle install
cp config/deploy.example.rb config/deploy.rb
vim deploy.rb
sprinkle -c -s config/install.rb
```



