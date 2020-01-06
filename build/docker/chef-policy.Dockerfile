FROM chef/chefworkstation:0.12.20

WORKDIR /opt/docker/

ENV CHEF_LICENSE accept-silent

ADD ./src/ ./src/
ADD ./samples/cookbooks/ ./samples/cookbooks/

ARG directory
ARG policy

ADD ./samples/policies/${directory}/${policy}/ ./samples/policies/${directory}/${policy}/

ENV CHEF_INSTALL_DIR /opt/docker/samples/policies/${directory}/${policy}/
ENV CHEF_EXPORT_DIR /opt/docker/.chef/policies/${directory}/${policy}/

RUN chef install $CHEF_INSTALL_DIR/Policyfile.rb

ADD ./build/docker/chef-policy.entrypoint.sh ./entrypoint.sh

ENTRYPOINT [ "sh", "/opt/docker/entrypoint.sh" ]
