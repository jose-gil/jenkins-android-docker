##
#
# jenkins-android-docker - Docker container
#
##

FROM jenkins:lastet
MAINTAINER Jose Gil "jose.gil@uji.es"

ENV ANDROID_SDK_VER  24.4.1

USER root
WORKDIR /usr/share

# Install the sdk
RUN cd /usr/local/ && curl -L -O http://dl.google.com/android/android-sdk_r${ANDROID_SDK_VER}-linux.tgz && tar xf android-sdk_r${ANDROID_SDK_VER}-linux.tgz

#RUN mkdir /tmp/android-sdk_r24
#COPY COPY ./android-sdk_r24.4.1-linux.tgz /tmp/android-sdk_r24

RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y --force-yes expect git wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 python curl

# Update the tools 
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter tools --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter platform-tools --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter android-21,android-20,build-tools-23.0.2,build-tools-22.0.1,build-tools-21.1.2,build-tools-20.0.0 --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter extra-android-m2repository --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter extra-google-m2repository --no-ui --force -a

#google play services
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter extra-google-google_play_services --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter extra-google-gcm --no-ui --force -a

RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter extra-google-analytics_sdk_v2 --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter extra-android-support --no-ui --force -a

ENV ANDROID_HOME /usr/local/android-sdk-linux

ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools

RUN rm -rf /usr/local/android-sdk_r${ANDROID_SDK_VER}.3-linux.tgz
