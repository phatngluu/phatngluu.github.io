# Install Java JDK 11

```
apt install default-jdk
```

Open Settings [Command + ,] > Open Remote [SSH: VMCloud] > Edit in settings.json > Add:

```
"java.home" : "/usr/lib/jvm/java-11-openjdk-amd64"
```

```
nano /etc/environment
JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
source /etc/environment
```

# Embedded databases

Prepare `schema.sql` and `data.sql`

Add to `pom.xml`:

```
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-data-jpa</artifactId>
</dependency>
<dependency>
	<groupId>com.h2database</groupId>
	<artifactId>h2</artifactId>
</dependency>
```

When you run the project, two sql files are run then the database will be embedded to the program. When the program is terminated, all changes will lost.

# Postgres

https://linuxize.com/post/how-to-install-postgresql-on-ubuntu-18-04/

```
sudo apt update
sudo apt install postgresql postgresql-contrib
```

```
sudo -u postgres psql # enter interactive mode with user postgres
\q # quit
```

```
sudo su - postgres -c "createuser john"
sudo su - postgres -c "createdb johndb"
sudo -u postgres psql # enter interactive mode
\password john # Change password
grant all privileges on database johndb to john; # Grant privileges
```



```
sudo nano /etc/postgresql/10/main/postgresql.conf
```
```
/etc/postgresql/10/main/postgresql.conf
#------------------------------------------------------------------------------
# CONNECTIONS AND AUTHENTICATION
#------------------------------------------------------------------------------
# - Connection Settings -
listen_addresses = '*'     # what IP address(es) to listen on;
```


```
sudo service postgresql restart
ss -nlt | grep 5432 # Verify the changes with the ss utility:
```



```
sudo nano /etc/postgresql/10/main/pg_hba.conf
```
```

​```conf
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# The user jane will be able to access all databases from all locations using a md5 password
host    all             jane            0.0.0.0/0                md5
```

### Connect with Datagrip

![Screen Shot 2020-08-31 at 12.14.17](Java.assets/Screen%20Shot%202020-08-31%20at%2012.14.17.png)

![Screen Shot 2020-08-31 at 13.57.16](Java.assets/Screen%20Shot%202020-08-31%20at%2013.57.16.png)

![Screen Shot 2020-08-31 at 13.57.06](Java.assets/Screen%20Shot%202020-08-31%20at%2013.57.06.png)

​	