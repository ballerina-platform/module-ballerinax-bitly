## Overview

[Bitly](https://bitly.com/) is a link management platform that shortens URLs, manages branded links and QR codes, and reports on how people engage with them.

The Bitly connector gives Ballerina programs typed access to version 4 of the Bitly API, so you can create and manage Bitlinks, custom Bitlinks, groups, campaigns, channels, webhooks, QR codes and Bitly Pages, and read click, scan and engagement analytics.

### Key features

- Shorten and manage Bitlinks, including custom back-halves and link updates
- Read click and engagement metrics by country, city, device and referrer
- Organise links with groups, campaigns, channels and tags
- Create and manage QR codes and Bitly Pages
- Register webhooks to receive link events

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

- [short_link_lifecycle](../examples/short_link_lifecycle/short_link_lifecycle.md) - Create a Bitlink, tag it and read its click summary.
- [group_link_analytics](../examples/group_link_analytics/group_link_analytics.md) - List the Bitlinks of a group and report the top countries for each.
