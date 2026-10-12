// Lists the Bitlinks of a group and reports the top countries for each of them.

import ballerina/io;
import ballerinax/bitly;

configurable string accessToken = ?;
configurable string groupGuid = ?;
configurable int maxLinks = 5;

public function main() returns error? {
    bitly:Client bitlyClient = check new ({auth: {token: accessToken}});

    // Step 1: Confirm the group is reachable with this token.
    bitly:Group group = check bitlyClient->getGroup(groupGuid);
    io:println("Group: ", group.name);

    // Step 2: Fetch the most recent Bitlinks of the group.
    bitly:Bitlinks links = check bitlyClient->getBitlinksByGroup(groupGuid, size = maxLinks);
    bitly:BitlinkBody[] items = links?.links ?: [];
    if items.length() == 0 {
        io:println("The group has no Bitlinks yet");
        return;
    }

    // Step 3: Report the countries that drive the most clicks for each Bitlink.
    foreach bitly:BitlinkBody item in items {
        string? id = item?.id;
        if id is () {
            continue;
        }
        bitly:ClickMetrics metrics = check bitlyClient->getMetricsForBitlinkByCountries(id, unit = "day", units = 30);
        io:println(id, ": ", metrics?.metrics);
    }
}
