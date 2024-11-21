FROM registry.access.redhat.com/ubi9/ubi:latest

RUN dnf upgrade -y && dnf clean all
RUN dnf install -y openssh-server openssh-clients

RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

RUN ssh-keygen -A

CMD ["/usr/sbin/sshd", "-D"]
