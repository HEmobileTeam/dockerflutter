FROM circleci/android:api-29-node

RUN curl -L https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.12.13+hotfix.7-stable.tar.xz --output /tmp/flutter.tar.xz

RUN tar xf /tmp/flutter.tar.xz -C /opt/flutter
