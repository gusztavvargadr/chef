FROM chef/chefworkstation:0.11.21

WORKDIR /opt/gusztavvargadr/chef

ENV CHEF_LICENSE accept-silent

ADD ./src/ ./src/
ADD ./samples/cookbooks/ ./samples/cookbooks/

ARG policy
ARG directory

ADD ./samples/policies/${directory}/Policyfile.${policy}* ./samples/policies/${directory}/

RUN chef install ./samples/policies/${directory}/Policyfile.${policy}.rb

RUN echo chef export --force ./samples/policies/${directory}/Policyfile.${policy}.rb ./.chef/policies/${directory}/${policy} >> ./entrypoint.sh

ENTRYPOINT [ "sh" ]
CMD [ "./entrypoint.sh" ]
