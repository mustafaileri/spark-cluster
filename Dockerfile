FROM ubuntu:16.04


WORKDIR /opt

RUN export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
RUN export HADOOP_HOME="/opt/hadoop-2.7.7"
RUN export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native:$LD_LIBRARY_PATH

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y openjdk-8-jdk \
    locales \
    curl \
    unzip

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

RUN  curl -O https://www-us.apache.org/dist/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz \
    && tar -xzvf spark-2.3.1-bin-hadoop2.7.tgz \
    && rm -rf spark-2.3.1-bin-hadoop2.7.tgz

RUN  curl -O https://www-us.apache.org/dist/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz \
    && tar -xzvf hadoop-2.7.7.tar.gz \
    && rm -rf hadoop-2.7.7.tar.gz

