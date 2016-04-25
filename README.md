To build

time docker build -t taf7lwappqystqp4u7wjsqkdc7dquw/hollowray .

To run

docker run -it --volume ${PWD}/private:/home/emory/private:ro --volume ${PWD}/store:/home/emory/.password-store:rw taf7lwappqystqp4u7wjsqkdc7dquw/hollowray

## Volumes
### ${PWD}/private
(1) This volume has ${PWD}/private/id_rsa - the private ssh key used to clone content
(2) This volume has ${PWD}/private/secret.key - the gpg key pass uses for encryption