# docker install
#1
sudo apt-get update && sudo apt-get install ca-certificates curl && sudo install -m 0755 -d /etc/apt/keyrings && sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && sudo chmod a+r /etc/apt/keyrings/docker.asc

#2
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
#3  
sudo apt-get update && sudo apt-get install docker-ce


# change default index.html
mkdir -p /home/test_user/
cat << EOF  > /home/test_user/index.html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Hello World</h1>
</body>
</html>
EOF

#Add the User to the docker Group, use the command: 
sudo usermod -aG docker test_user && newgrp docker

# run nginx
docker run -d --name nginx -p 8080:80 --mount type=bind,source=/home/test_user/index.html,target=/usr/share/nginx/html/index.html nginx


# сделано, и страница работает

curl http://127.0.0.1:8080
#...
#<h1>Hello World</h1>
#...

# НО нет доступа снаружи:
#tnc 217.14.200.81 -p 8080
#TcpTestSucceeded       : False

#в задании про доступ ничего не сказано, надо ли решить вопрос доступа снаружи ?...