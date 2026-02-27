---
title: Poco Hello World
---

# Poco Hello World
In this tutorial we will create Poco Project, add it to our Poco Repo, 
for this we will use simple nginx to serve our source html. 


### Step 1: Init Git Repository 

Before we start, let's init the git repository:
```
$:~ mkdir poco-hello-world
$:~ cd poco-hello-world
$:~ git init
```


### Step 2: Add source files

When the git repository is ready, let's add some source files to our project first,
so we will be able to see that our nginx server is working correctly.
Create `index.html` file inside `/source/www` folder:
```
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Hello World!</title>
</head>
<body>
  <h1>Hello World!</h1>
</body>
</html>
```


### Step 3: Configure Docker Compose

We recommend to split docker-compose files by services (one file - one service), 
this will help to make project more flexible. 
Create `dc-nginx.yaml` file inside `/docker` folder and map our source folder:
```
version: '3'

services:
  nginx:
    image: nginx:alpine
    ports:
      - 80:80
    volumes:
      - ../source/www:/var/www
```


### Step 4: Configure Nginx server

Let's adjust a little bit our nginx server so it better suit to our needs.
Create `nginx.conf` file in `/docker/config`:
```
events {
  worker_connections  4096;  ### Default: 1024
}

http {
  server {
    root /var/www;

    location / {
    }
  }
}
```
  
  
To tell our nginx server to use our config file we need to map it in our `/docker/dc-nginx.yaml` file:
```
version: '3'

services:
  nginx:
    image: nginx:alpine
    ports:
      - 80:80
    volumes:
      - ./config/nginx.conf:/etc/nginx/nginx.conf:ro
      - ../source/www:/var/www
```


### Step 5: Configure Poco Project

When docker compose is ready we can add it to our `poco.yaml`:
```yaml
version: '2.0'

plan:
  default:
    docker-compose-file:
      - docker/dc-nginx.yaml
```


### Step 6: Check your project

Finally we can check our project:
```
$:~ poco up
```
Open "http://localhost" in your browser, if everything is ok you should see "Hello World!".

    

### Step 7: Create Poco Repo

Create remote git repository on Github, Gitlab or Bitbucket, add it to your local Poco config:
```
$:~ poco repo add default https://git-repository-url
```
If everything is ok you should see something like this:
```
Actual config
-------------
Project name: None
Working directory: /Users/username/workspace
Mode: None
Offline: False
Always update: True
Config location: /Users/username/.poco/config
Config:
-------
default:
    repositoryType: git
    server: https://git-repository-url
```


### Step 8: Add your project to your Poco Repo
Now we can add our project to Poco Repo, run this command in root folder of the project:
```
$:~ poco project add . default
```
When your project is added you can publish your Poco Repo:
```
$:~ poco repo push
```
 

#### Poco Hello World Example Project   
You can try Poco Hello World Example project. Just add Poco Repo:
```
$:~ poco repo add poco-examples git@github.com:shiwaforce/poco-examples.git
```
List out all available projects:
```
$:~ poco project ls
```

Run Poco Hello World Project:
```
$:~ poco up poco-example-hello-world
```
