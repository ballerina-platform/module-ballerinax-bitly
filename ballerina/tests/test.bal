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

import ballerina/http;
import ballerina/os;
import ballerina/test;

final boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
final string serviceUrl = isLiveServer ? "https://api-ssl.bitly.com/v4" : "http://localhost:9090";
final string token = isLiveServer ? os:getEnv("BITLY_ACCESS_TOKEN") : "test_token";
final string groupGuid = isLiveServer ? os:getEnv("BITLY_GROUP_GUID") : "Bo1a2B3c4D5";
final string organizationGuid = isLiveServer ? os:getEnv("BITLY_ORGANIZATION_GUID") : "Oo1a2B3c4D5";

final Client bitly = check new ({auth: {token}, httpVersion: isLiveServer ? http:HTTP_2_0 : http:HTTP_1_1}, serviceUrl);

const string LONG_URL = "https://example.com/products/summer-sale";

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testCreateBitlink() returns error? {
    ShortenBitlinkBody response = check bitly->createBitlink({longUrl: LONG_URL, groupGuid});
    test:assertTrue(response?.id is string);
    test:assertTrue(response?.link is string);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testCreateFullBitlink() returns error? {
    BitlinkBody response = check bitly->createFullBitlink({longUrl: LONG_URL, groupGuid, title: "Summer Sale"});
    test:assertTrue(response?.id is string);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetBitlink() returns error? {
    BitlinkBody created = check bitly->createFullBitlink({longUrl: LONG_URL, groupGuid});
    BitlinkBody response = check bitly->getBitlink(created?.id ?: "");
    test:assertTrue(response?.longUrl is string);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testUpdateBitlink() returns error? {
    BitlinkBody created = check bitly->createFullBitlink({longUrl: LONG_URL, groupGuid});
    BitlinkBody response = check bitly->updateBitlink(created?.id ?: "", {title: "Updated title"});
    test:assertTrue(response?.id is string);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testDeleteBitlink() returns error? {
    if isLiveServer {
        return;
    }
    BitlinkBody created = check bitly->createFullBitlink({longUrl: LONG_URL, groupGuid});
    LinkDeletionResponse response = check bitly->deleteBitlink(created?.id ?: "");
    test:assertTrue(response?.linksDeleted is DeletedLink[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testExpandBitlink() returns error? {
    ShortenBitlinkBody created = check bitly->createBitlink({longUrl: LONG_URL, groupGuid});
    ExpandedBitlink response = check bitly->expandBitlink({bitlinkId: created?.id ?: ""});
    test:assertTrue(response?.longUrl is string);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetClicksForBitlink() returns error? {
    ShortenBitlinkBody created = check bitly->createBitlink({longUrl: LONG_URL, groupGuid});
    Clicks response = check bitly->getClicksForBitlink(created?.id ?: "", unit = "day");
    test:assertTrue(response?.linkClicks is LinkClicks[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetClicksSummaryForBitlink() returns error? {
    ShortenBitlinkBody created = check bitly->createBitlink({longUrl: LONG_URL, groupGuid});
    ClicksSummary response = check bitly->getClicksSummaryForBitlink(created?.id ?: "", unit = "day");
    test:assertTrue(response?.totalClicks is int);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetMetricsForBitlinkByCountries() returns error? {
    ShortenBitlinkBody created = check bitly->createBitlink({longUrl: LONG_URL, groupGuid});
    ClickMetrics response = check bitly->getMetricsForBitlinkByCountries(created?.id ?: "", unit = "day");
    test:assertTrue(response?.metrics is ClickMetric[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testAddCustomBitlink() returns error? {
    if isLiveServer {
        return;
    }
    CustomBitlink response = check bitly->addCustomBitlink({bitlinkId: "bit.ly/3xYz12A", customBitlink: "go.example.com/summer"});
    test:assertTrue(response?.customBitlink is string);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetCustomBitlink() returns error? {
    if isLiveServer {
        return;
    }
    CustomBitlink response = check bitly->getCustomBitlink("go.example.com/summer");
    test:assertTrue(response?.bitlink is BitlinkBody);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetGroups() returns error? {
    Groups response = check bitly->getGroups();
    test:assertTrue(response.groups.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetGroup() returns error? {
    Group response = check bitly->getGroup(groupGuid);
    test:assertTrue(response.guid.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testUpdateGroup() returns error? {
    if isLiveServer {
        return;
    }
    Group response = check bitly->updateGroup(groupGuid, {name: "Marketing"});
    test:assertEquals(response.name, "Marketing");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetGroupTags() returns error? {
    Tags response = check bitly->getGroupTags(groupGuid);
    test:assertTrue(response?.tags is string[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetBitlinksByGroup() returns error? {
    Bitlinks response = check bitly->getBitlinksByGroup(groupGuid);
    test:assertTrue(response?.links is BitlinkBody[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetOrganizations() returns error? {
    Organizations response = check bitly->getOrganizations();
    test:assertTrue(response.organizations.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetOrganization() returns error? {
    Organization response = check bitly->getOrganization(organizationGuid);
    test:assertTrue(response.guid.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetUser() returns error? {
    User response = check bitly->getUser();
    test:assertTrue(response.login.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testUpdateUser() returns error? {
    if isLiveServer {
        return;
    }
    User response = check bitly->updateUser({name: "Jane Doe"});
    test:assertTrue(response.name.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetCampaigns() returns error? {
    Campaigns response = check bitly->getCampaigns();
    test:assertTrue(response?.campaigns is Campaign[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testCreateCampaign() returns error? {
    if isLiveServer {
        return;
    }
    Campaign response = check bitly->createCampaign({name: "Spring Launch", groupGuid});
    test:assertTrue(response?.guid is string);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetChannels() returns error? {
    Channels response = check bitly->getChannels();
    test:assertTrue(response?.channels is Channel[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testCreateChannel() returns error? {
    if isLiveServer {
        return;
    }
    Channel response = check bitly->createChannel({name: "Newsletter", groupGuid});
    test:assertTrue(response?.guid is string);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testCreateWebhook() returns error? {
    if isLiveServer {
        return;
    }
    Webhook response = check bitly->createWebhook({name: "Link events", event: "click", url: "https://example.com/hooks/bitly", organizationGuid});
    test:assertTrue(response.guid.length() > 0);
}
