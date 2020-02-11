FROM circleci/android:api-29-node

USER root

RUN curl -L https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.12.13+hotfix.7-stable.tar.xz --output /tmp/flutter.tar.xz

RUN mkdir -p /opt

RUN tar -C /opt -xf /tmp/flutter.tar.xz && rm /tmp/flutter.tar.xz

RUN curl -L https://services.gradle.org/distributions/gradle-6.1.1-bin.zip --output /tmp/gradle-6.1.1-bin.zip

RUN unzip /tmp/gradle-6.1.1-bin.zip -d /opt && rm /tmp/gradle-6.1.1-bin.zip

RUN chmod -R a+rw /opt

RUN curl -LO https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.78.0/pact-1.78.0-linux-x86_64.tar.gz --output /tmp/pact-1.78.0-linux-x86_64.tar.gz

RUN tar -C /opt -xf /tmp/pact-1.78.0-linux-x86_64.tar.gz && rm /tmp/pact-1.78.0-linux-x86_64.tar.gz

ENV PACT /opt/pact

ENV FLUTTER_HOME /opt/flutter

ENV GRADLE_HOME /opt/gradle-6.1.1

ENV PATH $PATH:$FLUTTER_HOME/bin:$GRADLE_HOME/bin:$PACT/bin

RUN flutter precache

RUN flutter doctor

RUN gradle --version

RUN pact-mock-service --help start
