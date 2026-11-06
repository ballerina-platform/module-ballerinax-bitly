// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/data.jsondata;
import ballerina/http;

listener http:Listener ep0 = new (9090);

@http:ServiceConfig {treatNilableAsOptional: true}
service / on ep0 {
    # Delete a Bitlink
    #
    # + bitlink - A Bitlink made of the domain and hash
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:BadRequest (BAD_REQUEST)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function delete bitlinks/[string bitlink]() returns LinkDeletionResponse|BadRequestBadRequest|DeleteForbiddenForbidden|NotFoundNotFound|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return {linksDeleted: [{id: bitlink}]};
    }

    # Retrieve a Bitlink
    #
    # + bitlink - A Bitlink made of the domain and hash
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:Gone (GONE)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function get bitlinks/[string bitlink]() returns BitlinkBody|GetForbiddenForbidden|NotFoundNotFound|GoneGone|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <BitlinkBody>{id: "bit.ly/3xYz12A", link: "https://bit.ly/3xYz12A", longUrl: "https://example.com/products/summer-sale", title: "Summer Sale", createdAt: "2026-03-01T10:15:30+0000", archived: false, tags: ["sale", "summer"], customBitlinks: [], deeplinks: [], createdBy: "o_1a2b3c4d5e", clientId: "d5e6f7a8b9c0", launchpadIds: [], qrCodeIds: [], campaignIds: [], isDeleted: false, references: {"group": "https://api-ssl.bitly.com/v4/groups/Bo1a2B3c4D5"}};
    }

    # Get Clicks for a Bitlink
    #
    # + bitlink - A Bitlink made of the domain and hash
    # + unit - A unit of time
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. Timestamp values should be url encoded (i.e. replace '+' with '%2B' and ':' with '%3A'; 2022-02-02T15:53:02+0000 becomes 2022-02-02T15%3A53%3A02%2B0000)
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function get bitlinks/[string bitlink]/clicks(@http:Query {name: "unit_reference"} string? unitReference, TimeUnit unit = "day", int units = -1) returns Clicks|string|GetForbiddenForbidden|NotFoundNotFound|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <Clicks>{unit: "day", units: 3, unitReference: "2026-03-03T00:00:00+0000", linkClicks: [{date: "2026-03-01T00:00:00+0000", clicks: 12}, {date: "2026-03-02T00:00:00+0000", clicks: 20}, {date: "2026-03-03T00:00:00+0000", clicks: 8}]};
    }

    # Get a Clicks Summary for a Bitlink
    #
    # + bitlink - A Bitlink made of the domain and hash
    # + unit - A unit of time
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. Timestamp values should be url encoded (i.e. replace '+' with '%2B' and ':' with '%3A'; 2022-02-02T15:53:02+0000 becomes 2022-02-02T15%3A53%3A02%2B0000)
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function get bitlinks/[string bitlink]/clicks/summary(@http:Query {name: "unit_reference"} string? unitReference, TimeUnit unit = "day", int units = -1) returns ClicksSummary|GetForbiddenForbidden|NotFoundNotFound|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <ClicksSummary>{unit: "day", units: 30, unitReference: "2026-03-03T00:00:00+0000", totalClicks: 40};
    }

    # Get Metrics for a Bitlink by Country
    #
    # + bitlink - A Bitlink made of the domain and hash
    # + unit - A unit of time
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time
    # + size - The quantity of items to be be returned
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. Timestamp values should be url encoded (i.e. replace '+' with '%2B' and ':' with '%3A'; 2022-02-02T15:53:02+0000 becomes 2022-02-02T15%3A53%3A02%2B0000)
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:BadRequest (BAD_REQUEST)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:Gone (GONE)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function get bitlinks/[string bitlink]/countries(@http:Query {name: "unit_reference"} string? unitReference, TimeUnit unit = "day", int units = -1, int size = 50) returns ClickMetrics|string|BadRequestBadRequest|GetForbiddenForbidden|NotFoundNotFound|GoneGone|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <ClickMetrics>{unit: "day", units: 30, facet: "countries", unitReference: "2026-03-03T00:00:00+0000", metrics: [{value: "US", clicks: 25}, {value: "DE", clicks: 9}, {value: "LK", clicks: 6}]};
    }

    # Retrieve Campaigns
    #
    # + groupGuid - A GUID for a Bitly group
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:BadRequest (BAD_REQUEST)
    # http:PaymentRequired (UPGRADE_REQUIRED)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:BadGateway (BAD_GATEWAY)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function get campaigns(@http:Query {name: "group_guid"} string? groupGuid) returns Campaigns|BadRequestBadRequest|UpgradeRequiredPaymentRequired|GetForbiddenForbidden|NotFoundNotFound|InternalErrorInternalServerError|BadGatewayBadGateway|TemporarilyUnavailableServiceUnavailable {
        return <Campaigns>{campaigns: [{guid: "Co1a2B3c4D5", name: "Spring Launch", description: "Spring product launch campaign", groupGuid: "Bo1a2B3c4D5", created: "2026-03-01T10:00:00+0000", modified: "2026-03-02T10:00:00+0000", createdBy: "jane.doe", references: {}}]};
    }

    # Retrieve Channels
    #
    # + groupGuid - A GUID for a Bitly group
    # + campaignGuid - A GUID for a Bitly campaign
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:PaymentRequired (UPGRADE_REQUIRED)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function get channels(@http:Query {name: "group_guid"} string? groupGuid, @http:Query {name: "campaign_guid"} string? campaignGuid) returns Channels|UpgradeRequiredPaymentRequired|GetForbiddenForbidden|NotFoundNotFound|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <Channels>{channels: [{guid: "Ho1a2B3c4D5", name: "Newsletter", groupGuid: "Bo1a2B3c4D5", created: "2026-03-01T10:00:00+0000", modified: "2026-03-02T10:00:00+0000", references: {}}]};
    }

    # Retrieve Custom Bitlink
    #
    # + customBitlink - A Custom Bitlink made of the domain and keyword
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:PaymentRequired (UPGRADE_REQUIRED)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:Gone (GONE)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function get custom_bitlinks/[string customBitlink]() returns CustomBitlink|UpgradeRequiredPaymentRequired|GetForbiddenForbidden|NotFoundNotFound|GoneGone|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <CustomBitlink>{customBitlink: "go.example.com/summer", bitlink: {id: "bit.ly/3xYz12A", link: "https://bit.ly/3xYz12A", longUrl: "https://example.com/products/summer-sale", title: "Summer Sale", createdAt: "2026-03-01T10:15:30+0000", archived: false, tags: ["sale", "summer"], customBitlinks: [], deeplinks: [], createdBy: "o_1a2b3c4d5e", clientId: "d5e6f7a8b9c0", launchpadIds: [], qrCodeIds: [], campaignIds: [], isDeleted: false, references: {"group": "https://api-ssl.bitly.com/v4/groups/Bo1a2B3c4D5"}}, bitlinkHistory: []};
    }

    # Retrieve Groups
    #
    # + organizationGuid - A GUID for a Bitly organization
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:BadRequest (BAD_REQUEST)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:UnprocessableEntity (UNPROCESSABLE_ENTITY)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function get groups(@http:Query {name: "organization_guid"} string? organizationGuid) returns Groups|BadRequestBadRequest|GetForbiddenForbidden|NotFoundNotFound|UnprocessableEntityUnprocessableEntity|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <Groups>{groups: [{guid: "Bo1a2B3c4D5", name: "Marketing", role: "org-admin", isActive: true, created: "2026-01-10T09:00:00+0000", modified: "2026-02-15T12:30:00+0000", organizationGuid: "Oo1a2B3c4D5", bsds: ["bit.ly"], references: {"organization": "https://api-ssl.bitly.com/v4/organizations/Oo1a2B3c4D5"}}]};
    }

    # Retrieve a Group
    #
    # + groupGuid - A GUID for a Bitly group
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function get groups/[string groupGuid]() returns Group|GetForbiddenForbidden|NotFoundNotFound|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <Group>{guid: "Bo1a2B3c4D5", name: "Marketing", role: "org-admin", isActive: true, created: "2026-01-10T09:00:00+0000", modified: "2026-02-15T12:30:00+0000", organizationGuid: "Oo1a2B3c4D5", bsds: ["bit.ly"], references: {"organization": "https://api-ssl.bitly.com/v4/organizations/Oo1a2B3c4D5"}};
    }

    # Retrieve Bitlinks by Group
    #
    # + groupGuid - A GUID for a Bitly group
    # + size - The quantity of items to be be returned
    # + searchAfter - Token used to search next batch, only use response from API as input value
    # + query - The value that you would like to search
    # + hostnamePathQuery - The hostname and/or path you would like to search (case-insensitive). Subdomains included; query params and fragment ignored
    # + createdBefore - Timestamp as an integer unix epoch (seconds only)
    # + createdAfter - Timestamp as an integer unix epoch (seconds only)
    # + archived - Whether or not to include archived resources
    # + deeplinks - Filter to only Bitlinks that contain deeplinks
    # + domainDeeplinks - Filter to only Bitlinks that contain deeplinks configured with a custom domain
    # + campaignGuid - Filter to return only links for the given campaign GUID, can be provided
    # + channelGuid - Filter to return only links for the given channel GUID, can be provided, overrides all other parameters
    # + hasQrCodes - a filter value if the resource has any QR codes
    # + isExpired - filter bitlinks by expiration status
    # + hasExpiration - filter bitlinks by presence of expiration
    # + hasDynamicRouting - filter bitlinks by presence of dynamic routing rules
    # + tags - Filter by given tags
    # + launchpadIds - Filter by launchpad id
    # + encodingLogin - Filter by the login of the authenticated user that created the Bitlink
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function get groups/[string groupGuid]/bitlinks(@http:Query {name: "search_after"} string? searchAfter, string? query, @http:Query {name: "hostname_path_query"} string? hostnamePathQuery, @http:Query {name: "created_before"} int? createdBefore, @http:Query {name: "created_after"} int? createdAfter, @http:Query {name: "campaign_guid"} string? campaignGuid, @http:Query {name: "channel_guid"} string? channelGuid, string[]? tags, @http:Query {name: "launchpad_ids"} string[]? launchpadIds, @http:Query {name: "encoding_login"} string[]? encodingLogin, int size = 50, "on"|"off"|"both" archived = "off", "on"|"off"|"both" deeplinks = "both", @http:Query {name: "domain_deeplinks"} "on"|"off"|"both" domainDeeplinks = "both", @http:Query {name: "custom_bitlink"} "on"|"off"|"both" customBitlink = "both", @http:Query {name: "has_qr_codes"} "on"|"off"|"both" hasQrCodes = "both", @http:Query {name: "is_expired"} "on"|"off"|"both" isExpired = "both", @http:Query {name: "has_expiration"} "on"|"off"|"both" hasExpiration = "both", @http:Query {name: "has_dynamic_routing"} "on"|"off"|"both" hasDynamicRouting = "both") returns Bitlinks|GetForbiddenForbidden|NotFoundNotFound|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <Bitlinks>{pagination: {size: 50, searchAfter: "abc123", next: ""}, links: [<BitlinkBody>{id: "bit.ly/3xYz12A", link: "https://bit.ly/3xYz12A", longUrl: "https://example.com/products/summer-sale", title: "Summer Sale", createdAt: "2026-03-01T10:15:30+0000", archived: false, tags: ["sale", "summer"], customBitlinks: [], deeplinks: [], createdBy: "o_1a2b3c4d5e", clientId: "d5e6f7a8b9c0", launchpadIds: [], qrCodeIds: [], campaignIds: [], isDeleted: false, references: {"group": "https://api-ssl.bitly.com/v4/groups/Bo1a2B3c4D5"}}]};
    }

    # Retrieve Tags by Group
    #
    # + groupGuid - A GUID for a Bitly group
    # + 'type - Tag set to return; defaults to bitlink
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:BadRequest (BAD_REQUEST)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function get groups/[string groupGuid]/tags("bitlink"|"qr_code" 'type = "bitlink") returns Tags|BadRequestBadRequest|GetForbiddenForbidden|NotFoundNotFound|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <Tags>{tags: ["sale", "summer", "newsletter"]};
    }

    # Retrieve Organizations
    #
    # + includeAll - When set to true, returns all of the user's organizations regardless of the token's allowed_orgs restrictions
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function get organizations(@http:Query {name: "include_all"} boolean? includeAll) returns Organizations|GetForbiddenForbidden|NotFoundNotFound|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <Organizations>{organizations: [{guid: "Oo1a2B3c4D5", name: "Acme Corp", role: "org-admin", isActive: true, tier: "enterprise", tierFamily: "premium", tierDisplayName: "Enterprise", created: "2025-12-01T08:00:00+0000", modified: "2026-02-01T08:00:00+0000", bsds: ["bit.ly"], references: {}}]};
    }

    # Retrieve an Organization
    #
    # + organizationGuid - A GUID for a Bitly organization
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function get organizations/[string organizationGuid]() returns Organization|GetForbiddenForbidden|NotFoundNotFound|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <Organization>{guid: "Oo1a2B3c4D5", name: "Acme Corp", role: "org-admin", isActive: true, tier: "enterprise", tierFamily: "premium", tierDisplayName: "Enterprise", created: "2025-12-01T08:00:00+0000", modified: "2026-02-01T08:00:00+0000", bsds: ["bit.ly"], references: {}};
    }

    # Retrieve a User
    #
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function get user() returns User|GetForbiddenForbidden|NotFoundNotFound|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <User>{login: "jane.doe", name: "Jane Doe", isActive: true, isSsoUser: false, is2faEnabled: true, created: "2025-06-01T10:00:00+0000", modified: "2026-01-20T10:00:00+0000", defaultGroupGuid: "Bo1a2B3c4D5", emails: [{email: "jane.doe@example.com", isPrimary: true, isVerified: true}]};
    }

    # Update a Bitlink
    #
    # + bitlink - A Bitlink made of the domain and hash
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:BadRequest (BAD_REQUEST)
    # http:PaymentRequired (UPGRADE_REQUIRED)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:Conflict (CONFLICT)
    # http:Gone (GONE)
    # http:UnprocessableEntity (UNPROCESSABLE_ENTITY)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function patch bitlinks/[string bitlink](@http:Payload BitlinkUpdateBody payload) returns BitlinkBody|BadRequestBadRequest|UpgradeRequiredPaymentRequired|PatchForbiddenForbidden|NotFoundNotFound|ConflictConflict|GoneGone|UnprocessableEntityUnprocessableEntity|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <BitlinkBody>{id: "bit.ly/3xYz12A", link: "https://bit.ly/3xYz12A", longUrl: "https://example.com/products/summer-sale", title: "Summer Sale", createdAt: "2026-03-01T10:15:30+0000", archived: false, tags: ["sale", "summer"], customBitlinks: [], deeplinks: [], createdBy: "o_1a2b3c4d5e", clientId: "d5e6f7a8b9c0", launchpadIds: [], qrCodeIds: [], campaignIds: [], isDeleted: false, references: {"group": "https://api-ssl.bitly.com/v4/groups/Bo1a2B3c4D5"}};
    }

    # Update a Group
    #
    # + groupGuid - A GUID for a Bitly group
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:BadRequest (BAD_REQUEST)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:UnprocessableEntity (UNPROCESSABLE_ENTITY)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function patch groups/[string groupGuid](@http:Payload GroupUpdate payload) returns Group|BadRequestBadRequest|PatchForbiddenForbidden|NotFoundNotFound|UnprocessableEntityUnprocessableEntity|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <Group>{guid: "Bo1a2B3c4D5", name: "Marketing", role: "org-admin", isActive: true, created: "2026-01-10T09:00:00+0000", modified: "2026-02-15T12:30:00+0000", organizationGuid: "Oo1a2B3c4D5", bsds: ["bit.ly"], references: {"organization": "https://api-ssl.bitly.com/v4/organizations/Oo1a2B3c4D5"}};
    }

    # Update a User
    #
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:BadRequest (BAD_REQUEST)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:UnprocessableEntity (UNPROCESSABLE_ENTITY)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function patch user(@http:Payload UserUpdate payload) returns User|BadRequestBadRequest|PatchForbiddenForbidden|NotFoundNotFound|UnprocessableEntityUnprocessableEntity|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <User>{login: "jane.doe", name: "Jane Doe", isActive: true, isSsoUser: false, is2faEnabled: true, created: "2025-06-01T10:00:00+0000", modified: "2026-01-20T10:00:00+0000", defaultGroupGuid: "Bo1a2B3c4D5", emails: [{email: "jane.doe@example.com", isPrimary: true, isVerified: true}]};
    }

    # Create a Bitlink
    #
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:Created (CREATED)
    # http:BadRequest (BAD_REQUEST)
    # http:PaymentRequired (UPGRADE_REQUIRED)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:ExpectationFailed (EXPECTATION_FAILED)
    # http:UnprocessableEntity (UNPROCESSABLE_ENTITY)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function post bitlinks(@http:Payload FullShorten payload) returns BitlinkBodyOk|BitlinkBody|BadRequestBadRequest|UpgradeRequiredPaymentRequired|PostForbiddenForbidden|NotFoundNotFound|ExpectationFailedExpectationFailed|UnprocessableEntityUnprocessableEntity|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <BitlinkBodyOk>{body: {id: "bit.ly/3xYz12A", link: "https://bit.ly/3xYz12A", longUrl: "https://example.com/products/summer-sale", title: "Summer Sale", createdAt: "2026-03-01T10:15:30+0000", archived: false, tags: ["sale", "summer"], customBitlinks: [], deeplinks: [], createdBy: "o_1a2b3c4d5e", clientId: "d5e6f7a8b9c0", launchpadIds: [], qrCodeIds: [], campaignIds: [], isDeleted: false, references: {"group": "https://api-ssl.bitly.com/v4/groups/Bo1a2B3c4D5"}}};
    }

    # Create Campaign
    #
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:BadRequest (BAD_REQUEST)
    # http:PaymentRequired (UPGRADE_REQUIRED)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:UnprocessableEntity (UNPROCESSABLE_ENTITY)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function post campaigns(@http:Payload CampaignModify payload) returns CampaignOk|BadRequestBadRequest|UpgradeRequiredPaymentRequired|PostForbiddenForbidden|NotFoundNotFound|UnprocessableEntityUnprocessableEntity|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <CampaignOk>{body: {guid: "Co1a2B3c4D5", name: "Spring Launch", description: "Spring product launch campaign", groupGuid: "Bo1a2B3c4D5", created: "2026-03-01T10:00:00+0000", modified: "2026-03-02T10:00:00+0000", createdBy: "jane.doe", references: {}}};
    }

    # Create Channel
    #
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:BadRequest (BAD_REQUEST)
    # http:PaymentRequired (UPGRADE_REQUIRED)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:UnprocessableEntity (UNPROCESSABLE_ENTITY)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function post channels(@http:Payload ChannelModify payload) returns ChannelOk|BadRequestBadRequest|UpgradeRequiredPaymentRequired|PostForbiddenForbidden|NotFoundNotFound|UnprocessableEntityUnprocessableEntity|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <ChannelOk>{body: {guid: "Ho1a2B3c4D5", name: "Newsletter", groupGuid: "Bo1a2B3c4D5", created: "2026-03-01T10:00:00+0000", modified: "2026-03-02T10:00:00+0000", references: {}}};
    }

    # Add Custom Bitlink
    #
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:BadRequest (BAD_REQUEST)
    # http:PaymentRequired (UPGRADE_REQUIRED)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:Conflict (Conflict)
    # http:UnprocessableEntity (UNPROCESSABLE_ENTITY)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function post custom_bitlinks(@http:Payload AddCustomBitlink payload) returns CustomBitlinkOk|BadRequestBadRequest|UpgradeRequiredPaymentRequired|PostForbiddenForbidden|NotFoundNotFound|ErrorConflict|UnprocessableEntityUnprocessableEntity|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <CustomBitlinkOk>{body: {customBitlink: "go.example.com/summer", bitlink: {id: "bit.ly/3xYz12A", link: "https://bit.ly/3xYz12A", longUrl: "https://example.com/products/summer-sale", title: "Summer Sale", createdAt: "2026-03-01T10:15:30+0000", archived: false, tags: ["sale", "summer"], customBitlinks: [], deeplinks: [], createdBy: "o_1a2b3c4d5e", clientId: "d5e6f7a8b9c0", launchpadIds: [], qrCodeIds: [], campaignIds: [], isDeleted: false, references: {"group": "https://api-ssl.bitly.com/v4/groups/Bo1a2B3c4D5"}}, bitlinkHistory: []}};
    }

    # Expand a Bitlink
    #
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:BadRequest (BAD_REQUEST)
    # http:NotFound (NOT_FOUND)
    # http:Gone (GONE)
    # http:UnprocessableEntity (UNPROCESSABLE_ENTITY)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function post expand(@http:Payload ExpandBitlink payload) returns ExpandedBitlinkOk|BadRequestBadRequest|NotFoundNotFound|GoneGone|UnprocessableEntityUnprocessableEntity|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <ExpandedBitlinkOk>{body: {id: "bit.ly/3xYz12A", link: "https://bit.ly/3xYz12A", longUrl: "https://example.com/products/summer-sale", createdAt: "2026-03-01T10:15:30+0000"}};
    }

    # Shorten a Link
    #
    # + return - returns can be any of following types 
    # http:Ok (SUCCESS)
    # http:Created (CREATED)
    # http:BadRequest (BAD_REQUEST)
    # http:Forbidden (FORBIDDEN)
    # http:ExpectationFailed (EXPECTATION_FAILED)
    # http:UnprocessableEntity (UNPROCESSABLE_ENTITY)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function post shorten(@http:Payload Shorten payload) returns ShortenBitlinkBodyOk|ShortenBitlinkBody|BadRequestBadRequest|ForbiddenForbidden|ExpectationFailedExpectationFailed|UnprocessableEntityUnprocessableEntity|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <ShortenBitlinkBodyOk>{body: {id: "bit.ly/3xYz12A", link: "https://bit.ly/3xYz12A", longUrl: "https://example.com/products/summer-sale", createdAt: "2026-03-01T10:15:30+0000", archived: false, tags: [], references: {}}, headers: {}};
    }

    # Create Webhook
    #
    # + return - returns can be any of following types 
    # http:Created (CREATED)
    # http:BadRequest (BAD_REQUEST)
    # http:PaymentRequired (UPGRADE_REQUIRED)
    # http:Forbidden (FORBIDDEN)
    # http:NotFound (NOT_FOUND)
    # http:UnprocessableEntity (UNPROCESSABLE_ENTITY)
    # http:TooManyRequests (MONTHLY_LIMIT_EXCEEDED)
    # http:InternalServerError (INTERNAL_ERROR)
    # http:ServiceUnavailable (TEMPORARILY_UNAVAILABLE)
    resource function post webhooks(@http:Payload WebhookCreate payload) returns Webhook|BadRequestBadRequest|UpgradeRequiredPaymentRequired|PostForbiddenForbidden|NotFoundNotFound|UnprocessableEntityUnprocessableEntity|MonthlyLimitExceededTooManyRequests|InternalErrorInternalServerError|TemporarilyUnavailableServiceUnavailable {
        return <Webhook>{guid: "Wo1a2B3c4D5", name: "Link events", event: "click", url: "https://example.com/hooks/bitly", isActive: true, isAlert: false, fetchTags: false, organizationGuid: "Oo1a2B3c4D5", groupGuid: "Bo1a2B3c4D5", created: "2026-03-01T10:00:00+0000", modified: "2026-03-01T10:00:00+0000", deactivated: "", alerted: "", modifiedBy: "jane.doe", status: "active", references: {}};
    }
}

// Service-mode response types. `bal openapi --mode client` collapses 4XX/5XX
// to `error` and never emits these, so they are defined here for the mock only.
public type BadGatewayBadGateway record {|
    *http:BadGateway;
    BadGateway body;
|};

public type BadRequestBadRequest record {|
    *http:BadRequest;
    BadRequest body;
|};

public type BitlinkBodyOk record {|
    *http:Ok;
    BitlinkBody body;
|};

public type CampaignOk record {|
    *http:Ok;
    Campaign body;
|};

public type ChannelOk record {|
    *http:Ok;
    Channel body;
|};

public type ConflictConflict record {|
    *http:Conflict;
    Conflict body;
|};

public type CustomBitlinkOk record {|
    *http:Ok;
    CustomBitlink body;
|};

public type DeleteForbiddenForbidden record {|
    *http:Forbidden;
    Forbidden body;
|};

public type ErrorConflict record {|
    *http:Conflict;
    Error body;
|};

public type ExpandedBitlinkOk record {|
    *http:Ok;
    ExpandedBitlink body;
|};

public type ExpectationFailedExpectationFailed record {|
    *http:ExpectationFailed;
    ExpectationFailed body;
|};

public type ForbiddenForbidden record {|
    *http:Forbidden;
    Forbidden body;
    record {|string X\-Ratelimit\-Reason?;|} headers;
|};

public type GetForbiddenForbidden record {|
    *http:Forbidden;
    Forbidden body;
|};

public type GoneGone record {|
    *http:Gone;
    Gone body;
|};

public type InternalErrorInternalServerError record {|
    *http:InternalServerError;
    InternalError body;
|};

public type MonthlyLimitExceededTooManyRequests record {|
    *http:TooManyRequests;
    MonthlyLimitExceeded body;
|};

public type NotFoundNotFound record {|
    *http:NotFound;
    NotFound body;
|};

public type PatchForbiddenForbidden record {|
    *http:Forbidden;
    Forbidden body;
|};

public type PostForbiddenForbidden record {|
    *http:Forbidden;
    Forbidden body;
|};

public type ShortenBitlinkBodyOk record {|
    *http:Ok;
    ShortenBitlinkBody body;
    record {|string X\-Bsd\-Error?;|} headers;
|};

public type TemporarilyUnavailableServiceUnavailable record {|
    *http:ServiceUnavailable;
    TemporarilyUnavailable body;
|};

public type UnprocessableEntityUnprocessableEntity record {|
    *http:UnprocessableEntity;
    UnprocessableEntity body;
|};

public type UpgradeRequiredPaymentRequired record {|
    *http:PaymentRequired;
    UpgradeRequired body;
|};

# BAD_GATEWAY
public type BadGateway Error;

# BAD_REQUEST
public type BadRequest Error;

# CONFLICT
public type Conflict Error;

# FORBIDDEN
public type Forbidden Error;

public type Error record {
    string 'resource?;
    string description?;
    string message?;
    FieldError[] errors?;
};

# EXPECTATION_FAILED
public type ExpectationFailed Error;

# GONE
public type Gone Error;

# INTERNAL_ERROR
public type InternalError Error;

# MONTHLY_LIMIT_EXCEEDED
public type MonthlyLimitExceeded SimplifiedError;

# NOT_FOUND
public type NotFound Error;

# TEMPORARILY_UNAVAILABLE
public type TemporarilyUnavailable Error;

# UNPROCESSABLE_ENTITY
public type UnprocessableEntity Error;

# UPGRADE_REQUIRED
public type UpgradeRequired Error;

public type FieldError record {
    string 'field?;
    @jsondata:Name {value: "error_code"}
    string errorCode?;
    string message?;
};

public type SimplifiedError record {
    string 'resource?;
    string description?;
    string message?;
};
