FROM circleci/android:api-29-node

USER root

RUN curl -L https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.12.13+hotfix.7-stable.tar.xz --output /tmp/flutter.tar.xz

RUN mkdir -p /opt

RUN tar -C /opt -xf /tmp/flutter.tar.xz 

RUN rm /tmp/flutter.tar.xz

RUN chmod -R a+rw /opt

ENV FLUTTER_HOME /opt/flutter

ENV PATH $PATH:$FLUTTER_HOME/bin

RUN flutter precache

RUN flutter doctor
