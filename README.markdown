# CAS Demo Docker

Files to build a docker image for [CAS Demo Web application](https://github.com/fferrere/cas-demo)

CAS Demo Web app listen to port 5000.

Uses of CAS test Server :
- URL : https://casserver.herokuapp.com/cas
- Username : casuser
- Password : Mellon

## Installation
- Clone repo : git clone https://github.com/fferrere/cas-demo-docker
- Build docker image
```
prompt> cd cas-demo-docker
prompt> docker build -t cas-demo .
```

## Configuration

The Dockerfile contains 4 vars you can change :
- [Required] CAS_URL : The cas server URL, default to "https://casserver.herokuapp.com/cas"
- [Required] APP_URL : The CAS-DEMO web app URL. Default to "http://localhost:5000"
- [Optional] APP_LOGOUT_URL : The CAS-DEMO logout URL. Default to "http://localhost:5000/logout"
- [Required] APP_EXCLUDES : List of paths of the web app excluded from CAS authentication (public pages). Default  "/ /logout"

## Start container
CAS Demo Web app listen to port 5000

Start containter with the folowing command :
```
docker run --rm -d -it --name cas-demo -p 5000:5000 cas-demo
```

## Author

* Frédéric FERRERE (frederic.ferrere@gmail.com)

## Licence

Apache-2.0 (https://www.apache.org/licenses/LICENSE-2.0)


