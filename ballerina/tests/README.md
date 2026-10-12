# Running Tests

## Prerequisites

The tests run against a local mock of the Bitly API by default, so no credentials are needed.

To run them against the live Bitly API, set these environment variables:

| Variable | Purpose |
|---|---|
| `IS_LIVE_SERVER` | Set to `true` to call `https://api-ssl.bitly.com/v4` |
| `BITLY_ACCESS_TOKEN` | Bitly generic access token |
| `BITLY_GROUP_GUID` | GUID of the group to read from |
| `BITLY_ORGANIZATION_GUID` | GUID of the organization to read from |

When `IS_LIVE_SERVER` is `true`, `testCreateBitlink`, `testCreateFullBitlink`, `testGetBitlink` and `testUpdateBitlink` run against the live account and create or change Bitlinks in the configured group. `testExpandBitlink`, `testGetClicksForBitlink`, `testGetClicksSummaryForBitlink` and `testGetMetricsForBitlinkByCountries` also shorten the test URL in that group to get a Bitlink to read from. The suite does not delete the Bitlinks it creates, so remove them from your account afterwards if needed. The other mutating tests are skipped on the live server.

## Running the tests

```bash
./gradlew clean test
```

or, from the `ballerina` directory:

```bash
bal test
```

The suite covers link creation, update, deletion and expansion, click and country metrics, custom Bitlinks, groups, organizations, the user profile, campaigns, channels and webhooks.
