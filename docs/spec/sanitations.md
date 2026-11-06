_Author_:  @DimuthuMadushan \
_Created_: 2026/10/12 \
_Updated_: 2026/10/12 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from Bitly. 
The OpenAPI specification is obtained from [wso2/api-specs](https://github.com/wso2/api-specs/blob/main/openapi/bitly/bitly/4.0.0/openapi.json).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. Renamed six `operationId`s in the original `docs/spec/openapi.json` so that every method name is camelCase, at most 37 characters and free of HTTP-verb prefixes. The flatten and align steps otherwise carry them through unchanged.

   | Path | Method | Original `operationId` | Updated `operationId` |
   |---|---|---|---|
   | `/bitlinks/{bitlink}/referring_domains` | GET | `getMetricsForBitlinkByReferringDomains` | `getBitlinkReferringDomains` |
   | `/bitlinks/{bitlink}/referrers_by_domains` | GET | `getMetricsForBitlinkByReferrersByDomains` | `getBitlinkReferrersByDomains` |
   | `/groups/{groupGuid}/referring_networks` | GET | `GetGroupMetricsByReferringNetworks` | `getGroupMetricsByReferringNetworks` |
   | `/groups/{groupGuid}/referrers` | GET | `GetGroupMetricsByReferrer` | `getGroupMetricsByReferrer` |
   | `/groups/{groupGuid}/exports` | POST | `postCreateGroupExport` | `createGroupExport` |
   | `/aggregate/sites/digital_business_card_downloads/over_time` | GET | `getLaunchpadDigitalBusinessCardDownloadsOverTime` | `getDigitalCardDownloadsOverTime` |

2. Renamed the four inline response schemas that flatten generates, through the stable schema-name mapping in `docs/spec/ai-mappings.json`, so no `InlineResponse*` type reaches the public API.

   | Original name | Updated name |
   |---|---|
   | `InlineResponse200` | `SitesOverview` |
   | `InlineResponse2001` | `GroupDeviceClicks` |
   | `InlineResponse2001Metrics` | `GroupDeviceClickMetric` |
   | `InlineResponse2002` | `GroupTopCodeScans` |

3. Added missing descriptions to the original `docs/spec/openapi.json` so the generated client and types carry no `undocumented parameter` or `undocumented field` warnings. They were written by hand from the API's semantics and copied into the original with `tooling/apply_descriptions.py`, then the spec was flattened and aligned again.

   * Request body descriptions on all 36 operations that take a body (`createBitlink`, `createFullBitlink`, `updateBitlink`, `expandBitlink`, `addCustomBitlink`, `updateCustomBitlink`, `updateGroup`, `updateBitlinksByGroup`, `updateGroupPreferences`, `createGroupExport`, `editCustomDomain`, `validateCustomDomain`, `updateUser`, `createCampaign`, `updateCampaign`, `createChannel`, `updateChannel`, `addChannelBitlinks`, `purchaseBsd`, `createWebhook`, `updateWebhook`, `createSite`, `applyTemplate`, `updateSite`, `updateSiteAppearance`, `cloneSite`, `createContainer`, `createSiteBlock`, `updateSiteBlock`, `prevalidateYouTubeVideoButton`, `createSiteImage`, `createQRCodePublic`, `createStaticQRCodePublic`, `updateQRCodePublic`, `updateQRCodesByGroup`, `redirectQRCodeDestination`).
   * Descriptions for the `qrcode_id` path parameter of `upgradeQRCodeToBitlink` and `redirectQRCodeDestination`.
   * Descriptions for the query parameters `report_guid` (12 aggregate Bitly Pages operations), `brand_guid` (`getSiteFilteredTopPageButtons`), `custom_bitlink` (`getBitlinksByGroup`), `qrc_type` (`listQRMinimal`) and `sites_url_param` (`getSitesForGroup`).
   * Descriptions for 75 undocumented schema properties in `EngagementSubtotal`, `FullShorten`, `MinimalDeeplinkApp`, `TopLinksAndQRCodes`, `PublicCreateQRCodeRequest`, `PublicUpdateQRCodeRequest`, `PublicCreateStaticQRCodeRequest`, `CustomDomainBody`, `PublicDeleteQRCodeResponse`, `QRCodeCustomizationsPublic`, `QRCodeCustomizationsStaticPublic`, `QRCodeCorners`, `QRCodesMinimal`, `DomainValidateBody`, `DomainValidate`, `DomainUpdate`, `PublicSSLCert`, `CreateLaunchpad`, `RedirectQRCodeRequest` and `GroupExportFilter`. A property that is a bare `$ref` was wrapped as `allOf: [{$ref}]` plus `description`, because the generator drops a description beside a bare `$ref` (it only reuses the target schema's description, which several targets lack).

4. Replaced the six `“`/`”` escapes in the description of `GET /qr-codes/{qrcode_id}/image` with the literal quotation marks. The text is unchanged. `tooling/apply_descriptions.py` refuses a JSON file that does not round-trip byte for byte, and these escapes were the only difference.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/aligned_ballerina_openapi.json -o ballerina --mode client --license docs/license.txt --client-methods remote
```

Note: The license year is hardcoded to 2024, change if necessary.
