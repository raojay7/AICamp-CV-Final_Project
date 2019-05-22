# AICamp CV Final Project - Face Recognition System

## Prework

Download the [model](https://drive.google.com/open?id=1EXPBSXwTaqrSC0OhUdXNmKSh9qJUQ55-) of facenet, and put all the files into `recognize/facenet_model`.

```
cp /path/to/unzip/dir/* recognize/facenet_model
```



## Run

### For Docker users

First, build the docker container.

```
docker build -t face .
```

Then, run the docker.

```
docker run -it -p 5000:5000 face python3 app.py
```
### cpu version

you can start the notebook server and access localhost:8888 (in case of Docker Toolbox, access 192.168.99.100:8888).
```
# start
# Mac + GNU/Linux
docker run --rm -d --name ann -p 8888:8888 -v "$(pwd):/jupyter" face
# Windows (Command Prompt)
docker run --rm -d --name ann -p 8888:8888 -v "%cd%:/jupyter" face
# Windows (PowerShell)
docker run --rm -d --name ann -p 8888:8888 -v "${PWD}:/jupyter" face 

# stop (do not forget)
docker stop ann
```
### For other users

First, install the python dependencies.

```
pip install -r requirements.txt
```

Then, run the webserver.

```
python app.py
```
