# Ballerina Bitly connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-bitly/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-bitly/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-bitly.svg)](https://github.com/ballerina-platform/module-ballerinax-bitly/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/bitly.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fbitly)

## Overview

[Bitly](https://bitly.com/) is a link management platform that shortens URLs, manages branded links and QR codes, and reports on how people engage with them.

The Bitly connector gives Ballerina programs typed access to version 4 of the Bitly API, so you can create and manage Bitlinks, custom Bitlinks, groups, campaigns, channels, webhooks, QR codes and Bitly Pages, and read click, scan and engagement analytics.

## Setup guide

To use the connector you need a Bitly account and an access token.

1. Sign up or log in at [bitly.com](https://bitly.com/).

2. Open your account settings and go to the **API** page under the developer settings.

3. Enter your password and generate a generic access token, then copy it.

4. Note the GUID of the group you want to work with. You can read it from the `getGroups` operation or from the group page in your account.

> **Note:** Keep the access token out of client-side code and version control.

## Quickstart

To use the `bitly` connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

```ballerina
import ballerinax/bitly;
```

### Step 2: Instantiate a new connector

Create a `Config.toml` file with your access token:

```toml
accessToken = "<access token>"
```

Then create the client in your `.bal` file:

```ballerina
configurable string accessToken = ?;

bitly:Client bitlyClient = check new ({auth: {token: accessToken}});
```

### Step 3: Invoke the connector operation

```ballerina
public function main() returns error? {
    bitly:Groups _ = check bitlyClient->getGroups();
}
```

### Step 4: Run the Ballerina application

```bash
bal run
```


## Examples

The `Bitly` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-bitly/tree/main/examples/), covering the following use cases:

- [short_link_lifecycle](examples/short_link_lifecycle/short_link_lifecycle.md) - Create a Bitlink, tag it and read its click summary.
- [group_link_analytics](examples/group_link_analytics/group_link_analytics.md) - List the Bitlinks of a group and report the top countries for each.

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`bitly` package](https://central.ballerina.io/ballerinax/bitly/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
