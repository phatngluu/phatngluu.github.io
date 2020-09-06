# Amazon

## Create Instance

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html#ec2-launch-instance

## Connect

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstancesLinux.html

EC2

```
ssh -i MyKeyPair.pem ec2-user@13.212.25.226
```

Ubuntu

```
ssh -i MyKeyPair.pem ubuntu@54.169.249.248
```



NOTE:

SSH config

```
Host Vultr
  HostName 207.148.122.57
  User root

Host AWS_Ubuntu
  HostName 13.229.183.189
  IdentityFile /Users/steven/.ssh/MyKeyPair.pem
  User ubuntu
```

## Change password

```
sudo su - # switch user to root
passwd ubuntu
su ubuntu # switch user ubuntu
```

