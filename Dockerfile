ARG NODE_VERSION="lts"
FROM node:$NODE_VERSION

LABEL name="Expo for Docker"
LABEL repository="https://github.com/bycedric/expo-cli-images"
LABEL homepage="https://github.com/bycedric/expo-cli-images"
LABEL maintainer="Cedric van Putten <me@bycedric.com>"

ARG EXPO_VERSION="latest"

RUN npm install --global --unsafe-perm sharp-cli expo-cli@$EXPO_VERSION && npm cache clean --force

COPY entrypoint.sh LICENSE.md README.md /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
