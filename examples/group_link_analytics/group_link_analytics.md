# Group link analytics

This example fetches up to `maxLinks` Bitlinks of a group and reports the countries that drive the most clicks for each of them. It shows how to list a group's links and call a metrics operation per link.

## Prerequisites

- Ballerina Swan Lake 2201.12.0 or later
- A Bitly access token (see the Setup guide in the connector README)
- Create a `Config.toml` in this directory:
  ```toml
  accessToken = "<access token>"
  groupGuid = "<group GUID>"
  maxLinks = 5
  ```

## Run the example

```bash
bal run
```
