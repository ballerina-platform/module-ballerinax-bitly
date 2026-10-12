# Examples

The `ballerinax/bitly` connector provides practical examples illustrating usage in various scenarios.

1. [short_link_lifecycle](./short_link_lifecycle/short_link_lifecycle.md) - Create a Bitlink, tag it and read its click summary.
2. [group_link_analytics](./group_link_analytics/group_link_analytics.md) - List the Bitlinks of a group and report the top countries for each.

## Prerequisites

Create a Bitly access token as described in the connector README, and add it to a `Config.toml` in the example directory.

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
