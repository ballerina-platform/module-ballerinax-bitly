// Creates a Bitlink for a campaign URL, tags it, and reports its click summary.

import ballerina/io;
import ballerinax/bitly;

configurable string accessToken = ?;
configurable string groupGuid = ?;
configurable string longUrl = ?;
configurable string linkTitle = "Campaign landing page";

public function main() returns error? {
    bitly:Client bitlyClient = check new ({auth: {token: accessToken}});

    // Step 1: Create the Bitlink in the chosen group.
    bitly:BitlinkBody created = check bitlyClient->createFullBitlink({
        longUrl,
        groupGuid,
        title: linkTitle
    });
    string? bitlinkId = created?.id;
    if bitlinkId is () {
        return error("Bitly did not return an id for the new Bitlink");
    }
    io:println("Created Bitlink: ", created?.link);

    // Step 2: Tag the Bitlink so it can be found later.
    bitly:BitlinkBody updated = check bitlyClient->updateBitlink(bitlinkId, {tags: ["campaign", "example"]});
    io:println("Tags: ", updated?.tags);

    // Step 3: Read the click summary for the last 30 days.
    bitly:ClicksSummary summary = check bitlyClient->getClicksSummaryForBitlink(bitlinkId, unit = "day", units = 30);
    io:println("Total clicks in the last 30 days: ", summary?.totalClicks);
}
