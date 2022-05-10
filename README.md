# Expo for Docker

A prebuilt docker image for [Expo CLI][link-cli] on Docker-based environments.
This image contains all necessary libraries to perform all commands of the CLI.
To make sure this image stays up to date, CI is scheduled to run daily builds.

## Supported versions

image                 | node  | expo  | status
---                   | ---   | ---   | ---
`bycedric/expo-cli:5` | `16`  | `5`   | **latest**
`bycedric/expo-cli:4` | `14`  | `4`   | _outdated_
`bycedric/expo-cli:3` | `14`  | `3`   | _outdated_
`bycedric/expo-cli:2` | `14`  | `2`   | _outdated_

> All major versions are daily rebuilt, but upgrading to the latest version is strongly recommended.

## What's inside?

The entry point of this image forwards to the [Expo CLI][link-cli].
It automatically authenticates when you define the `EXPO_TOKEN` environment variable.
You can also use `EXPO_CLI_USERNAME` and `EXPO_CLI_PASSWORD` to authenticate with your Expo credentials. 
When these environment variables are undefined, it skips this step and forwards the command directly to Expo.

## How to use it?

Usage of this image is relatively simple.

> This image is intended to use on Docker-based CI environments, see [the Expo CI guide][link-docs] to get started.

```bash
# run expo cli and check the cli version
$ docker run -t bycedric/expo-cli --version
$ docker run -t bycedric/expo-cli diagnostics

# or use bash to interact with the cli manually
$ docker run -ti bycedric/expo-cli bash

# perform authenticated expo commands directly
$ docker run \
    --tty \
    --env EXPO_TOKEN=accesstoken \
    bycedric/expo-cli publish

# mount your project as volume and use the cli manually
$ docker run \
    --tty \
    --interactive \
    --workdir /code \
    --volume $PWD:/code \
    --env EXPO_TOKEN=accesstoken \
    bycedric/expo-cli bash
```

## Build your version

You can use this image to build a custom version of both node and expo-cli.
It accepts both `NODE_VERSION` and `EXPO_VERSION` as build arguments.

```bash
# create a node 16-alpine and expo cli 5 image
$ docker build . \
    --build-arg NODE_VERSION=16-alpine \
    --build-arg EXPO_VERSION=5 \
    --tag awsomeorg/expo-cli
```

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.

--- ---

<p align="center">
    with&nbsp:heart:&nbsp&nbsp<strong>byCedric</strong>
</p>

[link-cli]: https://docs.expo.io/workflow/expo-cli/
[link-docs]: https://docs.expo.io/guides/setting-up-continuous-integration/
