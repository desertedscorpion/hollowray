FROM taf7lwappqystqp4u7wjsqkdc7dquw/heavytombstone
MAINTAINER “Emory Merryman” emory.merryman+DoTDeCocXJroqaWu@gmail.com>
ENV KEY_ID="2D2D81DA" PASS_REPO="git@github.com:AFnRFCb7/lanterngold.git"
USER root
RUN dnf update --assumeyes && dnf install --assumeyes bash-completion pass git gnupg gnupg2 findutils && dnf update --assumeyes && dnf clean all && mkdir /home/${LUSER}/.ssh
COPY config /home/${LUSER}/.ssh/config
RUN chown --recursive ${LUSER}:${LUSER} /home/${LUSER}/.ssh
USER ${LUSER}
VOLUME /home/${LUSER}/private
VOLUME /home/${LUSER}/.password-store
RUN chmod 0700 /home/${LUSER}/.ssh && chmod 0600 /home/${LUSER}/.ssh/config
CMD cp /home/${LUSER}/private/id_rsa /home/${LUSER}/.ssh/id_rsa && chmod 0600 /home/${LUSER}/.ssh/id_rsa && (gpg --allow-secret-key- --import /home/${LUSER}/private/secret.key || true ) &&  (gpg2 --allow-secret-key- --import /home/${LUSER}/private/secret.key || true ) && pass init ${KEY_ID} && git config --global user.email "emory.merryman@gmail.com" && git config --global user.name "Emory Merryman" && pass git init && pass git remote add origin ${PASS_REPO} && pass git fetch origin master && pass git checkout master && pass git rebase origin/master && /usr/bin/bash
