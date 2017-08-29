FROM jekyll/jekyll
LABEL maintainer "Aaron Kelly <aaron.paul.kelly@gmail.com>"
ENV HOME /home/ec2-user
RUN adduser -u 500 -D ec2-user
WORKDIR /home/ec2-user/
# USER ec2-user
ENTRYPOINT [ "/bin/ash" ]
