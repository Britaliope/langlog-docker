FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install opam vim python3 default-jdk m4 sudo
RUN useradd --create-home --shell /bin/bash user && echo 'user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER user
WORKDIR /home/user

RUN opam init --disable-sandboxing -y
RUN eval $(opam config env) && opam switch create -y 4.10.0 && opam install -y utop dune merlin menhir ocp-indent conf-vim

RUN echo 'eval $(opam config env)' >> .bashrc

CMD tail -f /dev/null
