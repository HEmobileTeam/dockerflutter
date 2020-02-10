FROM circleci/android:api-29-node

USER root

RUN curl -L https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.12.13+hotfix.7-stable.tar.xz --output /tmp/flutter.tar.xz

RUN mkdir -p /opt

RUN tar -C /opt -xf /tmp/flutter.tar.xz && rm /tmp/flutter.tar.xz

RUN curl -L https://services.gradle.org/distributions/gradle-6.1.1-bin.zip --output /tmp/gradle-6.1.1-bin.zip

RUN unzip /tmp/gradle-6.1.1-bin.zip -d /opt && rm /tmp/gradle-6.1.1-bin.zip

RUN chmod -R a+rw /opt

ENV FLUTTER_HOME /opt/flutter

ENV GRADLE_HOME /opt/gradle-6.1.1

ENV PATH $PATH:$FLUTTER_HOME/bin:$GRADLE_HOME/bin

RUN flutter precache

RUN flutter doctor

RUN gradle --version
