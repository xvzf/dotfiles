FROM alpine:latest


RUN adduser -D xvzf

COPY --chown=xvzf . /dotfiles
RUN export HOME=/home/xvzf && touch .secrets && cd /dotfiles && ./setup.sh
USER xvzf
WORKDIR /home/xvzf/
ENTRYPOINT ["/bin/zsh"]
