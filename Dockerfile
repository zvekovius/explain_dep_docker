FROM ubuntu:16.04

WORKDIR /explain

# Copy the current directory contents into the container at /app
COPY ./postgres/ /postgres
RUN chmod u+x /postgres/database_init.sh
RUN apt-get update
RUN apt-get install postgresql-9.5 --yes
RUN apt-get install perl libmojolicious-perl libmail-sender-perl libemail-valid-perl libxml-simple-perl libdbd-pg-perl libmodule-build-perl libtest-deep-perl libtest-exception-perl libtest-yaml-perl libclone-perl libconfig-json-perl libdate-simple-perl --yes
RUN apt-get install git --yes
RUN git clone https://gitlab.com/depesz/explain.depesz.com.git .

# Install Pg::Explain for perl
RUN cpan -i Pg::Explain

RUN cp /postgres/pg_hba /etc/postgresql/9.5/main/pg_hba.conf
ENTRYPOINT ["/postgres/database_init.sh"]
# Expose the mojolicious port
EXPOSE 3000
