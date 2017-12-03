#This file is used for installing jdk, then elastic 

FROM ubuntu:14.04

ENV DEBIAN_FRONTEND=noninteractive

RUN groupadd -g 1000 elasticsearch && useradd elasticsearch -u 1000 -g 1000
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN mkdir app
WORKDIR  /app
#download java
RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz

#download curl 
RUN curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.5.0.tar.gz


RUN tar -xvf jdk-8u131-linux-x64.tar.gz 

RUN tar -xvf elasticsearch-5.5.0.tar.gz

RUN chown -R elasticsearch:elasticsearch /app

RUN ls -lrt /app/

ENV JAVA_HOME /app/jdk1.8.0_131

ENV PATH ${JAVA_HOME}/bin:${PATH}

RUN java -version

#COPY elasticsearch.yml /app/elasticsearch-5.5.0/config/

#USER elasticsearch

RUN su - elasticsearch

ENV PATH ${PATH}:/app/elasticsearch-5.5.0/bin:/app/kibana-5.5.1-linux-x86_64/bin

EXPOSE 9300
