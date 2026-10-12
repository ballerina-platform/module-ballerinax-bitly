# Short link lifecycle

This example creates a Bitlink for a campaign landing page, tags it, and then reads its click summary for the last 30 days. It shows how to combine link creation, update and analytics calls in one workflow.

## Prerequisites

- Ballerina Swan Lake 2201.12.0 or later
- A Bitly access token (see the Setup guide in the connector README)
- Create a `Config.toml` in this directory:
  ```toml
  accessToken = "<access token>"
  groupGuid = "<group GUID>"
  longUrl = "<URL to shorten>"
  linkTitle = "<optional link title>"
  ```

## Run the example

```bash
bal run
```
