#import "t.h"

#import "NSDate+ISO8601Parsing.h"
#import "NSDate+ISO8601Unparsing.h"
#import "xsd.h"

#import <libxml/xmlstring.h>
#if TARGET_OS_IPHONE
#import <CFNetwork/CFNetwork.h>
#endif

#ifndef ADVANCED_AUTHENTICATION
#define ADVANCED_AUTHENTICATION 0
#endif

#if ADVANCED_AUTHENTICATION && TARGET_OS_IPHONE
#import <Security/Security.h>
#endif

static Class classForElement(xmlNodePtr cur) {
    NSString *instanceType = [NSString stringWithXmlString:xmlGetNsProp(cur, (const xmlChar *)"type", (const xmlChar *)"http://www.w3.org/2001/XMLSchema-instance")
                                                     free:YES];
    if (!instanceType) return nil;

    NSArray *elementTypeArray = [instanceType componentsSeparatedByString:@":"];
    if ([elementTypeArray count] > 1) {
        NSString *prefix = elementTypeArray[0];
        NSString *localName = elementTypeArray[1];
        xmlNsPtr elementNamespace = xmlSearchNs(cur->doc, cur, [prefix xmlString]);
        NSString *standardPrefix = USGlobals.sharedInstance.wsdlStandardNamespaces[[NSString stringWithXmlString:(xmlChar*)elementNamespace->href free:NO]];

        return NSClassFromString([NSString stringWithFormat:@"%@_%@", standardPrefix, localName]);
    }

    return NSClassFromString([instanceType stringByReplacingOccurrencesOfString:@":" withString:@"_"]);
}
@implementation t_AttributeName
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
static NSString *t_BodyTypeType_enumValues[] = {
    @"",
    @"HTML",
    @"Text",
};

@implementation t_BodyTypeType
+ (t_BodyTypeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_BodyTypeType_enumValues) / sizeof(t_BodyTypeType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_BodyTypeType_enumValues[i]])
            return (t_BodyTypeTypeEnum)i;
    }

    return t_BodyTypeType_none;
}

+ (NSString *)stringFromValue:(t_BodyTypeTypeEnum)value {
    return t_BodyTypeType_enumValues[(int)value];
}

+ (t_BodyTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_BodyTypeType_none;
}

+ (t_BodyTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BodyTypeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_BodyTypeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_BodyType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BodyType *)value {
    [xsd_string serializeToChildOf:node withName:childName value:value._content];
    xmlNodePtr child = node->last;

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_BodyTypeType serializeToProperty:"BodyType" onNode:node value:_BodyType];
}

+ (t_BodyType *)deserializeNode:(xmlNodePtr)cur {
    t_BodyType *newObject = [self new];
    newObject._content = [xsd_string deserializeNode:cur];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.BodyType = [t_BodyTypeType deserializeAttribute:"BodyType" ofNode:cur];
}
@end
static NSString *t_FlagStatusType_enumValues[] = {
    @"",
    @"Complete",
    @"Flagged",
    @"NotFlagged",
};

@implementation t_FlagStatusType
+ (t_FlagStatusTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_FlagStatusType_enumValues) / sizeof(t_FlagStatusType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_FlagStatusType_enumValues[i]])
            return (t_FlagStatusTypeEnum)i;
    }

    return t_FlagStatusType_none;
}

+ (NSString *)stringFromValue:(t_FlagStatusTypeEnum)value {
    return t_FlagStatusType_enumValues[(int)value];
}

+ (t_FlagStatusTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_FlagStatusType_none;
}

+ (t_FlagStatusTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FlagStatusTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_FlagStatusTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ArrayOfEncryptedSharedFolderDataType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"EncryptedSharedFolderData")) {
            Class elementClass = classForElement(child) ?: [t_EncryptedSharedFolderDataType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_EncryptedSharedFolderDataType * item in value)
        [t_EncryptedSharedFolderDataType serializeToChildOf:child withName:"t:EncryptedSharedFolderData" value:item];
}
@end
@implementation t_ArrayOfGroupedItemsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"GroupedItems")) {
            Class elementClass = classForElement(child) ?: [t_GroupedItemsType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_GroupedItemsType * item in value)
        [t_GroupedItemsType serializeToChildOf:child withName:"t:GroupedItems" value:item];
}
@end
@implementation t_RecurrenceType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RecurrenceType *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (t_RecurrenceType *)deserializeNode:(xmlNodePtr)cur {
    t_RecurrenceType *newObject = [self new];


    return newObject;
}
@end
static NSString *t_DistinguishedFolderIdNameType_enumValues[] = {
    @"",
    @"archivedeleteditems",
    @"archivemsgfolderroot",
    @"archiverecoverableitemsdeletions",
    @"archiverecoverableitemspurges",
    @"archiverecoverableitemsroot",
    @"archiverecoverableitemsversions",
    @"archiveroot",
    @"calendar",
    @"contacts",
    @"deleteditems",
    @"drafts",
    @"inbox",
    @"journal",
    @"junkemail",
    @"msgfolderroot",
    @"notes",
    @"outbox",
    @"publicfoldersroot",
    @"recoverableitemsdeletions",
    @"recoverableitemspurges",
    @"recoverableitemsroot",
    @"recoverableitemsversions",
    @"root",
    @"searchfolders",
    @"sentitems",
    @"tasks",
    @"voicemail",
};

@implementation t_DistinguishedFolderIdNameType
+ (t_DistinguishedFolderIdNameTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_DistinguishedFolderIdNameType_enumValues) / sizeof(t_DistinguishedFolderIdNameType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_DistinguishedFolderIdNameType_enumValues[i]])
            return (t_DistinguishedFolderIdNameTypeEnum)i;
    }

    return t_DistinguishedFolderIdNameType_none;
}

+ (NSString *)stringFromValue:(t_DistinguishedFolderIdNameTypeEnum)value {
    return t_DistinguishedFolderIdNameType_enumValues[(int)value];
}

+ (t_DistinguishedFolderIdNameTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_DistinguishedFolderIdNameType_none;
}

+ (t_DistinguishedFolderIdNameTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DistinguishedFolderIdNameTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DistinguishedFolderIdNameTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_MailboxStatisticsSearchResultType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MailboxStatisticsSearchResultType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_UserMailbox)
        [t_UserMailboxType serializeToChildOf:node withName:"t:UserMailbox" value:_UserMailbox];

    if (_KeywordStatisticsSearchResult)
        [t_KeywordStatisticsSearchResultType serializeToChildOf:node withName:"t:KeywordStatisticsSearchResult" value:_KeywordStatisticsSearchResult];

}


- (t_UserMailboxType *)UserMailbox {
    if (!_UserMailbox) _UserMailbox = [t_UserMailboxType new];
    return _UserMailbox;
}

- (t_KeywordStatisticsSearchResultType *)KeywordStatisticsSearchResult {
    if (!_KeywordStatisticsSearchResult) _KeywordStatisticsSearchResult = [t_KeywordStatisticsSearchResultType new];
    return _KeywordStatisticsSearchResult;
}
+ (t_MailboxStatisticsSearchResultType *)deserializeNode:(xmlNodePtr)cur {
    t_MailboxStatisticsSearchResultType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"UserMailbox")) {
            Class elementClass = classForElement(cur) ?: [t_UserMailboxType class];
            self.UserMailbox = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"KeywordStatisticsSearchResult")) {
            Class elementClass = classForElement(cur) ?: [t_KeywordStatisticsSearchResultType class];
            self.KeywordStatisticsSearchResult = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_AvailabilityProxyRequestType_enumValues[] = {
    @"",
    @"CrossForest",
    @"CrossSite",
};

@implementation t_AvailabilityProxyRequestType
+ (t_AvailabilityProxyRequestTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_AvailabilityProxyRequestType_enumValues) / sizeof(t_AvailabilityProxyRequestType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_AvailabilityProxyRequestType_enumValues[i]])
            return (t_AvailabilityProxyRequestTypeEnum)i;
    }

    return t_AvailabilityProxyRequestType_none;
}

+ (NSString *)stringFromValue:(t_AvailabilityProxyRequestTypeEnum)value {
    return t_AvailabilityProxyRequestType_enumValues[(int)value];
}

+ (t_AvailabilityProxyRequestTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_AvailabilityProxyRequestType_none;
}

+ (t_AvailabilityProxyRequestTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AvailabilityProxyRequestTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_AvailabilityProxyRequestTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ServiceConfigurationType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
static NSString *t_DeliverMeetingRequestsType_enumValues[] = {
    @"",
    @"DelegatesAndMe",
    @"DelegatesAndSendInformationToMe",
    @"DelegatesOnly",
    @"NoForward",
};

@implementation t_DeliverMeetingRequestsType
+ (t_DeliverMeetingRequestsTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_DeliverMeetingRequestsType_enumValues) / sizeof(t_DeliverMeetingRequestsType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_DeliverMeetingRequestsType_enumValues[i]])
            return (t_DeliverMeetingRequestsTypeEnum)i;
    }

    return t_DeliverMeetingRequestsType_none;
}

+ (NSString *)stringFromValue:(t_DeliverMeetingRequestsTypeEnum)value {
    return t_DeliverMeetingRequestsType_enumValues[(int)value];
}

+ (t_DeliverMeetingRequestsTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_DeliverMeetingRequestsType_none;
}

+ (t_DeliverMeetingRequestsTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DeliverMeetingRequestsTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DeliverMeetingRequestsTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_StreamingSubscriptionConnectionTimeoutType
+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return @([str doubleValue]);
}

+ (NSNumber *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return @([attrString doubleValue]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSNumber *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSNumber *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
static NSString *t_SearchItemKindType_enumValues[] = {
    @"",
    @"Contacts",
    @"Docs",
    @"Email",
    @"Faxes",
    @"Im",
    @"Journals",
    @"Meetings",
    @"Notes",
    @"Posts",
    @"Rssfeeds",
    @"Tasks",
    @"Voicemail",
};

@implementation t_SearchItemKindType
+ (t_SearchItemKindTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_SearchItemKindType_enumValues) / sizeof(t_SearchItemKindType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_SearchItemKindType_enumValues[i]])
            return (t_SearchItemKindTypeEnum)i;
    }

    return t_SearchItemKindType_none;
}

+ (NSString *)stringFromValue:(t_SearchItemKindTypeEnum)value {
    return t_SearchItemKindType_enumValues[(int)value];
}

+ (t_SearchItemKindTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_SearchItemKindType_none;
}

+ (t_SearchItemKindTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SearchItemKindTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SearchItemKindTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_OutOfOfficeMailTip
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_OutOfOfficeMailTip *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ReplyBody)
        [t_ReplyBody serializeToChildOf:node withName:"t:ReplyBody" value:_ReplyBody];

    if (_Duration)
        [t_Duration serializeToChildOf:node withName:"t:Duration" value:_Duration];

}


- (t_ReplyBody *)ReplyBody {
    if (!_ReplyBody) _ReplyBody = [t_ReplyBody new];
    return _ReplyBody;
}

- (t_Duration *)Duration {
    if (!_Duration) _Duration = [t_Duration new];
    return _Duration;
}
+ (t_OutOfOfficeMailTip *)deserializeNode:(xmlNodePtr)cur {
    t_OutOfOfficeMailTip *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ReplyBody")) {
            Class elementClass = classForElement(cur) ?: [t_ReplyBody class];
            self.ReplyBody = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Duration")) {
            Class elementClass = classForElement(cur) ?: [t_Duration class];
            self.Duration = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_MeetingAttendeeType_enumValues[] = {
    @"",
    @"Optional",
    @"Organizer",
    @"Required",
    @"Resource",
    @"Room",
};

@implementation t_MeetingAttendeeType
+ (t_MeetingAttendeeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_MeetingAttendeeType_enumValues) / sizeof(t_MeetingAttendeeType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_MeetingAttendeeType_enumValues[i]])
            return (t_MeetingAttendeeTypeEnum)i;
    }

    return t_MeetingAttendeeType_none;
}

+ (NSString *)stringFromValue:(t_MeetingAttendeeTypeEnum)value {
    return t_MeetingAttendeeType_enumValues[(int)value];
}

+ (t_MeetingAttendeeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_MeetingAttendeeType_none;
}

+ (t_MeetingAttendeeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MeetingAttendeeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MeetingAttendeeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ChangeDescriptionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ChangeDescriptionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Path)
        [t_BasePathToElementType serializeToChildOf:node withName:"t:Path" value:_Path];

    if (_FieldURI)
        [t_PathToUnindexedFieldType serializeToChildOf:node withName:"t:FieldURI" value:_FieldURI];

    if (_IndexedFieldURI)
        [t_PathToIndexedFieldType serializeToChildOf:node withName:"t:IndexedFieldURI" value:_IndexedFieldURI];

    if (_ExtendedFieldURI)
        [t_PathToExtendedFieldType serializeToChildOf:node withName:"t:ExtendedFieldURI" value:_ExtendedFieldURI];

}


- (t_BasePathToElementType *)Path {
    if (!_Path) _Path = [t_BasePathToElementType new];
    return _Path;
}

- (t_PathToUnindexedFieldType *)FieldURI {
    if (!_FieldURI) _FieldURI = [t_PathToUnindexedFieldType new];
    return _FieldURI;
}

- (t_PathToIndexedFieldType *)IndexedFieldURI {
    if (!_IndexedFieldURI) _IndexedFieldURI = [t_PathToIndexedFieldType new];
    return _IndexedFieldURI;
}

- (t_PathToExtendedFieldType *)ExtendedFieldURI {
    if (!_ExtendedFieldURI) _ExtendedFieldURI = [t_PathToExtendedFieldType new];
    return _ExtendedFieldURI;
}
+ (t_ChangeDescriptionType *)deserializeNode:(xmlNodePtr)cur {
    t_ChangeDescriptionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Path")) {
            Class elementClass = classForElement(cur) ?: [t_BasePathToElementType class];
            self.Path = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToUnindexedFieldType class];
            self.FieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IndexedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToIndexedFieldType class];
            self.IndexedFieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExtendedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToExtendedFieldType class];
            self.ExtendedFieldURI = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_FolderChangeDescriptionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FolderChangeDescriptionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_FolderChangeDescriptionType *)deserializeNode:(xmlNodePtr)cur {
    t_FolderChangeDescriptionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_AttributeRefreshInterval
+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return @([str doubleValue]);
}

+ (NSNumber *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return @([attrString doubleValue]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSNumber *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSNumber *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_SearchExpressionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SearchExpressionType *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (t_SearchExpressionType *)deserializeNode:(xmlNodePtr)cur {
    t_SearchExpressionType *newObject = [self new];


    return newObject;
}
@end
@implementation t_FieldURIOrConstantType
+ (id)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = nil;
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;
        else if (xmlStrEqual(child->name, (const xmlChar *)"Path")) {
            Class elementClass = classForElement(child) ?: [t_BasePathToElementType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"FieldURI")) {
            Class elementClass = classForElement(child) ?: [t_PathToUnindexedFieldType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"IndexedFieldURI")) {
            Class elementClass = classForElement(child) ?: [t_PathToIndexedFieldType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ExtendedFieldURI")) {
            Class elementClass = classForElement(child) ?: [t_PathToExtendedFieldType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"Constant")) {
            Class elementClass = classForElement(child) ?: [t_ConstantValueType class];
            return [elementClass deserializeNode:child];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(id)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    if (false);
    else if ([value isMemberOfClass:[t_BasePathToElementType class]])
        [t_BasePathToElementType serializeToChildOf:child withName:"t:Path" value:value];
    else if ([value isMemberOfClass:[t_PathToUnindexedFieldType class]])
        [t_PathToUnindexedFieldType serializeToChildOf:child withName:"t:FieldURI" value:value];
    else if ([value isMemberOfClass:[t_PathToIndexedFieldType class]])
        [t_PathToIndexedFieldType serializeToChildOf:child withName:"t:IndexedFieldURI" value:value];
    else if ([value isMemberOfClass:[t_PathToExtendedFieldType class]])
        [t_PathToExtendedFieldType serializeToChildOf:child withName:"t:ExtendedFieldURI" value:value];
    else if ([value isMemberOfClass:[t_ConstantValueType class]])
        [t_ConstantValueType serializeToChildOf:child withName:"t:Constant" value:value];
}
@end
@implementation t_TwoOperandExpressionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TwoOperandExpressionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Path)
        [t_BasePathToElementType serializeToChildOf:node withName:"t:Path" value:_Path];

    if (_FieldURI)
        [t_PathToUnindexedFieldType serializeToChildOf:node withName:"t:FieldURI" value:_FieldURI];

    if (_IndexedFieldURI)
        [t_PathToIndexedFieldType serializeToChildOf:node withName:"t:IndexedFieldURI" value:_IndexedFieldURI];

    if (_ExtendedFieldURI)
        [t_PathToExtendedFieldType serializeToChildOf:node withName:"t:ExtendedFieldURI" value:_ExtendedFieldURI];

    if (_FieldURIOrConstant)
        [t_FieldURIOrConstantType serializeToChildOf:node withName:"t:FieldURIOrConstant" value:_FieldURIOrConstant];

}


- (t_BasePathToElementType *)Path {
    if (!_Path) _Path = [t_BasePathToElementType new];
    return _Path;
}

- (t_PathToUnindexedFieldType *)FieldURI {
    if (!_FieldURI) _FieldURI = [t_PathToUnindexedFieldType new];
    return _FieldURI;
}

- (t_PathToIndexedFieldType *)IndexedFieldURI {
    if (!_IndexedFieldURI) _IndexedFieldURI = [t_PathToIndexedFieldType new];
    return _IndexedFieldURI;
}

- (t_PathToExtendedFieldType *)ExtendedFieldURI {
    if (!_ExtendedFieldURI) _ExtendedFieldURI = [t_PathToExtendedFieldType new];
    return _ExtendedFieldURI;
}
+ (t_TwoOperandExpressionType *)deserializeNode:(xmlNodePtr)cur {
    t_TwoOperandExpressionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Path")) {
            Class elementClass = classForElement(cur) ?: [t_BasePathToElementType class];
            self.Path = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToUnindexedFieldType class];
            self.FieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IndexedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToIndexedFieldType class];
            self.IndexedFieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExtendedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToExtendedFieldType class];
            self.ExtendedFieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FieldURIOrConstant")) {
            Class elementClass = classForElement(cur) ?: [t_FieldURIOrConstantType class];
            self.FieldURIOrConstant = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_IsEqualToType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_IsEqualToType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_IsEqualToType *)deserializeNode:(xmlNodePtr)cur {
    t_IsEqualToType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_EmailAddress
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_EmailAddress *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Name)
        [xsd_string serializeToChildOf:node withName:"t:Name" value:_Name];

    if (_Address)
        [xsd_string serializeToChildOf:node withName:"t:Address" value:_Address];

    if (_RoutingType)
        [xsd_string serializeToChildOf:node withName:"t:RoutingType" value:_RoutingType];

}

+ (t_EmailAddress *)deserializeNode:(xmlNodePtr)cur {
    t_EmailAddress *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Name")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Name = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Address")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Address = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RoutingType")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.RoutingType = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_NonEmptyArrayOfBaseFolderIdsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"FolderId")) {
            Class elementClass = classForElement(child) ?: [t_FolderIdType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"DistinguishedFolderId")) {
            Class elementClass = classForElement(child) ?: [t_DistinguishedFolderIdType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_FolderIdType class]])
            [t_FolderIdType serializeToChildOf:child withName:"t:FolderId" value:item];
        else if ([item isMemberOfClass:[t_DistinguishedFolderIdType class]])
            [t_DistinguishedFolderIdType serializeToChildOf:child withName:"t:DistinguishedFolderId" value:item];
    }
}
@end
static NSString *t_SearchFolderTraversalType_enumValues[] = {
    @"",
    @"Deep",
    @"Shallow",
};

@implementation t_SearchFolderTraversalType
+ (t_SearchFolderTraversalTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_SearchFolderTraversalType_enumValues) / sizeof(t_SearchFolderTraversalType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_SearchFolderTraversalType_enumValues[i]])
            return (t_SearchFolderTraversalTypeEnum)i;
    }

    return t_SearchFolderTraversalType_none;
}

+ (NSString *)stringFromValue:(t_SearchFolderTraversalTypeEnum)value {
    return t_SearchFolderTraversalType_enumValues[(int)value];
}

+ (t_SearchFolderTraversalTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_SearchFolderTraversalType_none;
}

+ (t_SearchFolderTraversalTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SearchFolderTraversalTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SearchFolderTraversalTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_SearchParametersType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SearchParametersType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_SearchFolderTraversalType serializeToProperty:"Traversal" onNode:node value:_Traversal];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Restriction)
        [t_RestrictionType serializeToChildOf:node withName:"t:Restriction" value:_Restriction];

    if (_BaseFolderIds)
        [t_NonEmptyArrayOfBaseFolderIdsType serializeToChildOf:node withName:"t:BaseFolderIds" value:_BaseFolderIds];

}


- (t_RestrictionType *)Restriction {
    if (!_Restriction) _Restriction = [t_RestrictionType new];
    return _Restriction;
}

+ (t_SearchParametersType *)deserializeNode:(xmlNodePtr)cur {
    t_SearchParametersType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Traversal = [t_SearchFolderTraversalType deserializeAttribute:"Traversal" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Restriction")) {
            Class elementClass = classForElement(cur) ?: [t_RestrictionType class];
            self.Restriction = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"BaseFolderIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseFolderIdsType class];
            self.BaseFolderIds = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ItemClassType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
static NSString *t_SensitivityChoicesType_enumValues[] = {
    @"",
    @"Confidential",
    @"Normal",
    @"Personal",
    @"Private",
};

@implementation t_SensitivityChoicesType
+ (t_SensitivityChoicesTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_SensitivityChoicesType_enumValues) / sizeof(t_SensitivityChoicesType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_SensitivityChoicesType_enumValues[i]])
            return (t_SensitivityChoicesTypeEnum)i;
    }

    return t_SensitivityChoicesType_none;
}

+ (NSString *)stringFromValue:(t_SensitivityChoicesTypeEnum)value {
    return t_SensitivityChoicesType_enumValues[(int)value];
}

+ (t_SensitivityChoicesTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_SensitivityChoicesType_none;
}

+ (t_SensitivityChoicesTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SensitivityChoicesTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SensitivityChoicesTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_NonEmptyArrayOfAttachmentsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"ItemAttachment")) {
            Class elementClass = classForElement(child) ?: [t_ItemAttachmentType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"FileAttachment")) {
            Class elementClass = classForElement(child) ?: [t_FileAttachmentType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_ItemAttachmentType class]])
            [t_ItemAttachmentType serializeToChildOf:child withName:"t:ItemAttachment" value:item];
        else if ([item isMemberOfClass:[t_FileAttachmentType class]])
            [t_FileAttachmentType serializeToChildOf:child withName:"t:FileAttachment" value:item];
    }
}
@end
@implementation t_ArrayOfStringsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"String")) {
            Class elementClass = classForElement(child) ?: [xsd_string class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (NSString * item in value)
        [xsd_string serializeToChildOf:child withName:"t:String" value:item];
}
@end
static NSString *t_ImportanceChoicesType_enumValues[] = {
    @"",
    @"High",
    @"Low",
    @"Normal",
};

@implementation t_ImportanceChoicesType
+ (t_ImportanceChoicesTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ImportanceChoicesType_enumValues) / sizeof(t_ImportanceChoicesType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ImportanceChoicesType_enumValues[i]])
            return (t_ImportanceChoicesTypeEnum)i;
    }

    return t_ImportanceChoicesType_none;
}

+ (NSString *)stringFromValue:(t_ImportanceChoicesTypeEnum)value {
    return t_ImportanceChoicesType_enumValues[(int)value];
}

+ (t_ImportanceChoicesTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ImportanceChoicesType_none;
}

+ (t_ImportanceChoicesTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ImportanceChoicesTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ImportanceChoicesTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_NonEmptyArrayOfInternetHeadersType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"InternetMessageHeader")) {
            Class elementClass = classForElement(child) ?: [t_InternetHeaderType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_InternetHeaderType * item in value)
        [t_InternetHeaderType serializeToChildOf:child withName:"t:InternetMessageHeader" value:item];
}
@end
@implementation t_NonEmptyArrayOfResponseObjectsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"AcceptItem")) {
            Class elementClass = classForElement(child) ?: [t_AcceptItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"TentativelyAcceptItem")) {
            Class elementClass = classForElement(child) ?: [t_TentativelyAcceptItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"DeclineItem")) {
            Class elementClass = classForElement(child) ?: [t_DeclineItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ReplyToItem")) {
            Class elementClass = classForElement(child) ?: [t_ReplyToItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ForwardItem")) {
            Class elementClass = classForElement(child) ?: [t_ForwardItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ReplyAllToItem")) {
            Class elementClass = classForElement(child) ?: [t_ReplyAllToItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"CancelCalendarItem")) {
            Class elementClass = classForElement(child) ?: [t_CancelCalendarItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"RemoveItem")) {
            Class elementClass = classForElement(child) ?: [t_RemoveItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SuppressReadReceipt")) {
            Class elementClass = classForElement(child) ?: [t_SuppressReadReceiptType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"PostReplyItem")) {
            Class elementClass = classForElement(child) ?: [t_PostReplyItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"AcceptSharingInvitation")) {
            Class elementClass = classForElement(child) ?: [t_AcceptSharingInvitationType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_AcceptItemType class]])
            [t_AcceptItemType serializeToChildOf:child withName:"t:AcceptItem" value:item];
        else if ([item isMemberOfClass:[t_TentativelyAcceptItemType class]])
            [t_TentativelyAcceptItemType serializeToChildOf:child withName:"t:TentativelyAcceptItem" value:item];
        else if ([item isMemberOfClass:[t_DeclineItemType class]])
            [t_DeclineItemType serializeToChildOf:child withName:"t:DeclineItem" value:item];
        else if ([item isMemberOfClass:[t_ReplyToItemType class]])
            [t_ReplyToItemType serializeToChildOf:child withName:"t:ReplyToItem" value:item];
        else if ([item isMemberOfClass:[t_ForwardItemType class]])
            [t_ForwardItemType serializeToChildOf:child withName:"t:ForwardItem" value:item];
        else if ([item isMemberOfClass:[t_ReplyAllToItemType class]])
            [t_ReplyAllToItemType serializeToChildOf:child withName:"t:ReplyAllToItem" value:item];
        else if ([item isMemberOfClass:[t_CancelCalendarItemType class]])
            [t_CancelCalendarItemType serializeToChildOf:child withName:"t:CancelCalendarItem" value:item];
        else if ([item isMemberOfClass:[t_RemoveItemType class]])
            [t_RemoveItemType serializeToChildOf:child withName:"t:RemoveItem" value:item];
        else if ([item isMemberOfClass:[t_SuppressReadReceiptType class]])
            [t_SuppressReadReceiptType serializeToChildOf:child withName:"t:SuppressReadReceipt" value:item];
        else if ([item isMemberOfClass:[t_PostReplyItemType class]])
            [t_PostReplyItemType serializeToChildOf:child withName:"t:PostReplyItem" value:item];
        else if ([item isMemberOfClass:[t_AcceptSharingInvitationType class]])
            [t_AcceptSharingInvitationType serializeToChildOf:child withName:"t:AcceptSharingInvitation" value:item];
    }
}
@end
@implementation t_ReminderMinutesBeforeStartType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_ItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_MimeContent)
        [t_MimeContentType serializeToChildOf:node withName:"t:MimeContent" value:_MimeContent];

    if (_ItemId)
        [t_ItemIdType serializeToChildOf:node withName:"t:ItemId" value:_ItemId];

    if (_ParentFolderId)
        [t_FolderIdType serializeToChildOf:node withName:"t:ParentFolderId" value:_ParentFolderId];

    if (_ItemClass)
        [t_ItemClassType serializeToChildOf:node withName:"t:ItemClass" value:_ItemClass];

    if (_Subject)
        [xsd_string serializeToChildOf:node withName:"t:Subject" value:_Subject];

    if (_Sensitivity)
        [t_SensitivityChoicesType serializeToChildOf:node withName:"t:Sensitivity" value:_Sensitivity];

    if (_Body)
        [t_BodyType serializeToChildOf:node withName:"t:Body" value:_Body];

    if (_Attachments)
        [t_NonEmptyArrayOfAttachmentsType serializeToChildOf:node withName:"t:Attachments" value:_Attachments];

    if (_DateTimeReceived)
        [xsd_dateTime serializeToChildOf:node withName:"t:DateTimeReceived" value:_DateTimeReceived];

    if (_Size)
        [xsd_int serializeToChildOf:node withName:"t:Size" value:_Size];

    if (_Categories)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:Categories" value:_Categories];

    if (_Importance)
        [t_ImportanceChoicesType serializeToChildOf:node withName:"t:Importance" value:_Importance];

    if (_InReplyTo)
        [xsd_string serializeToChildOf:node withName:"t:InReplyTo" value:_InReplyTo];

    if (_IsSubmitted)
        [xsd_boolean serializeToChildOf:node withName:"t:IsSubmitted" value:_IsSubmitted];

    if (_IsDraft)
        [xsd_boolean serializeToChildOf:node withName:"t:IsDraft" value:_IsDraft];

    if (_IsFromMe)
        [xsd_boolean serializeToChildOf:node withName:"t:IsFromMe" value:_IsFromMe];

    if (_IsResend)
        [xsd_boolean serializeToChildOf:node withName:"t:IsResend" value:_IsResend];

    if (_IsUnmodified)
        [xsd_boolean serializeToChildOf:node withName:"t:IsUnmodified" value:_IsUnmodified];

    if (_InternetMessageHeaders)
        [t_NonEmptyArrayOfInternetHeadersType serializeToChildOf:node withName:"t:InternetMessageHeaders" value:_InternetMessageHeaders];

    if (_DateTimeSent)
        [xsd_dateTime serializeToChildOf:node withName:"t:DateTimeSent" value:_DateTimeSent];

    if (_DateTimeCreated)
        [xsd_dateTime serializeToChildOf:node withName:"t:DateTimeCreated" value:_DateTimeCreated];

    if (_ResponseObjects)
        [t_NonEmptyArrayOfResponseObjectsType serializeToChildOf:node withName:"t:ResponseObjects" value:_ResponseObjects];

    if (_ReminderDueBy)
        [xsd_dateTime serializeToChildOf:node withName:"t:ReminderDueBy" value:_ReminderDueBy];

    if (_ReminderIsSet)
        [xsd_boolean serializeToChildOf:node withName:"t:ReminderIsSet" value:_ReminderIsSet];

    if (_ReminderMinutesBeforeStart)
        [t_ReminderMinutesBeforeStartType serializeToChildOf:node withName:"t:ReminderMinutesBeforeStart" value:_ReminderMinutesBeforeStart];

    if (_DisplayCc)
        [xsd_string serializeToChildOf:node withName:"t:DisplayCc" value:_DisplayCc];

    if (_DisplayTo)
        [xsd_string serializeToChildOf:node withName:"t:DisplayTo" value:_DisplayTo];

    if (_HasAttachments)
        [xsd_boolean serializeToChildOf:node withName:"t:HasAttachments" value:_HasAttachments];

    for (t_ExtendedPropertyType * item in _ExtendedProperty)
        [t_ExtendedPropertyType serializeToChildOf:node withName:"t:ExtendedProperty" value:item];

    if (_Culture)
        [xsd_language serializeToChildOf:node withName:"t:Culture" value:_Culture];

    if (_EffectiveRights)
        [t_EffectiveRightsType serializeToChildOf:node withName:"t:EffectiveRights" value:_EffectiveRights];

    if (_LastModifiedName)
        [xsd_string serializeToChildOf:node withName:"t:LastModifiedName" value:_LastModifiedName];

    if (_LastModifiedTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:LastModifiedTime" value:_LastModifiedTime];

    if (_IsAssociated)
        [xsd_boolean serializeToChildOf:node withName:"t:IsAssociated" value:_IsAssociated];

    if (_WebClientReadFormQueryString)
        [xsd_string serializeToChildOf:node withName:"t:WebClientReadFormQueryString" value:_WebClientReadFormQueryString];

    if (_WebClientEditFormQueryString)
        [xsd_string serializeToChildOf:node withName:"t:WebClientEditFormQueryString" value:_WebClientEditFormQueryString];

    if (_ConversationId)
        [t_ItemIdType serializeToChildOf:node withName:"t:ConversationId" value:_ConversationId];

    if (_UniqueBody)
        [t_BodyType serializeToChildOf:node withName:"t:UniqueBody" value:_UniqueBody];

    if (_StoreEntryId)
        [xsd_base64Binary serializeToChildOf:node withName:"t:StoreEntryId" value:_StoreEntryId];

}


- (t_MimeContentType *)MimeContent {
    if (!_MimeContent) _MimeContent = [t_MimeContentType new];
    return _MimeContent;
}

- (t_ItemIdType *)ItemId {
    if (!_ItemId) _ItemId = [t_ItemIdType new];
    return _ItemId;
}

- (t_FolderIdType *)ParentFolderId {
    if (!_ParentFolderId) _ParentFolderId = [t_FolderIdType new];
    return _ParentFolderId;
}

- (t_BodyType *)Body {
    if (!_Body) _Body = [t_BodyType new];
    return _Body;
}

- (t_EffectiveRightsType *)EffectiveRights {
    if (!_EffectiveRights) _EffectiveRights = [t_EffectiveRightsType new];
    return _EffectiveRights;
}

- (t_ItemIdType *)ConversationId {
    if (!_ConversationId) _ConversationId = [t_ItemIdType new];
    return _ConversationId;
}

- (t_BodyType *)UniqueBody {
    if (!_UniqueBody) _UniqueBody = [t_BodyType new];
    return _UniqueBody;
}
+ (t_ItemType *)deserializeNode:(xmlNodePtr)cur {
    t_ItemType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    NSMutableArray *ExtendedPropertyValues = nil;

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"MimeContent")) {
            Class elementClass = classForElement(cur) ?: [t_MimeContentType class];
            self.MimeContent = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ItemId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ParentFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_FolderIdType class];
            self.ParentFolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemClass")) {
            Class elementClass = classForElement(cur) ?: [t_ItemClassType class];
            self.ItemClass = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Subject")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Subject = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Sensitivity")) {
            self.Sensitivity = [t_SensitivityChoicesType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Body")) {
            Class elementClass = classForElement(cur) ?: [t_BodyType class];
            self.Body = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Attachments")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfAttachmentsType class];
            self.Attachments = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DateTimeReceived")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.DateTimeReceived = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Size")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.Size = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Categories")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.Categories = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Importance")) {
            self.Importance = [t_ImportanceChoicesType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"InReplyTo")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.InReplyTo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsSubmitted")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsSubmitted = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsDraft")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsDraft = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsFromMe")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsFromMe = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsResend")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsResend = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsUnmodified")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsUnmodified = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"InternetMessageHeaders")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfInternetHeadersType class];
            self.InternetMessageHeaders = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DateTimeSent")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.DateTimeSent = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DateTimeCreated")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.DateTimeCreated = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ResponseObjects")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfResponseObjectsType class];
            self.ResponseObjects = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ReminderDueBy")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.ReminderDueBy = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ReminderIsSet")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.ReminderIsSet = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ReminderMinutesBeforeStart")) {
            Class elementClass = classForElement(cur) ?: [t_ReminderMinutesBeforeStartType class];
            self.ReminderMinutesBeforeStart = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DisplayCc")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.DisplayCc = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DisplayTo")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.DisplayTo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"HasAttachments")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.HasAttachments = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExtendedProperty")) {
            Class elementClass = classForElement(cur) ?: [t_ExtendedPropertyType class];
            if (!ExtendedPropertyValues) ExtendedPropertyValues = [NSMutableArray new];
            [ExtendedPropertyValues addObject:[elementClass deserializeNode:cur]];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Culture")) {
            Class elementClass = classForElement(cur) ?: [xsd_language class];
            self.Culture = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EffectiveRights")) {
            Class elementClass = classForElement(cur) ?: [t_EffectiveRightsType class];
            self.EffectiveRights = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"LastModifiedName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.LastModifiedName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"LastModifiedTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.LastModifiedTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsAssociated")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsAssociated = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"WebClientReadFormQueryString")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.WebClientReadFormQueryString = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"WebClientEditFormQueryString")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.WebClientEditFormQueryString = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConversationId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ConversationId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"UniqueBody")) {
            Class elementClass = classForElement(cur) ?: [t_BodyType class];
            self.UniqueBody = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"StoreEntryId")) {
            Class elementClass = classForElement(cur) ?: [xsd_base64Binary class];
            self.StoreEntryId = [elementClass deserializeNode:cur];
        }
    }

    if (ExtendedPropertyValues) self.ExtendedProperty = ExtendedPropertyValues;
}
@end
@implementation t_SingleRecipientType
+ (id)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = nil;
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;
        else if (xmlStrEqual(child->name, (const xmlChar *)"Mailbox")) {
            Class elementClass = classForElement(child) ?: [t_EmailAddressType class];
            return [elementClass deserializeNode:child];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(id)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    if (false);
    else if ([value isMemberOfClass:[t_EmailAddressType class]])
        [t_EmailAddressType serializeToChildOf:child withName:"t:Mailbox" value:value];
}
@end
@implementation t_ArrayOfRecipientsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Mailbox")) {
            Class elementClass = classForElement(child) ?: [t_EmailAddressType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_EmailAddressType * item in value)
        [t_EmailAddressType serializeToChildOf:child withName:"t:Mailbox" value:item];
}
@end
@implementation t_MessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Sender)
        [t_SingleRecipientType serializeToChildOf:node withName:"t:Sender" value:_Sender];

    if (_ToRecipients)
        [t_ArrayOfRecipientsType serializeToChildOf:node withName:"t:ToRecipients" value:_ToRecipients];

    if (_CcRecipients)
        [t_ArrayOfRecipientsType serializeToChildOf:node withName:"t:CcRecipients" value:_CcRecipients];

    if (_BccRecipients)
        [t_ArrayOfRecipientsType serializeToChildOf:node withName:"t:BccRecipients" value:_BccRecipients];

    if (_IsReadReceiptRequested)
        [xsd_boolean serializeToChildOf:node withName:"t:IsReadReceiptRequested" value:_IsReadReceiptRequested];

    if (_IsDeliveryReceiptRequested)
        [xsd_boolean serializeToChildOf:node withName:"t:IsDeliveryReceiptRequested" value:_IsDeliveryReceiptRequested];

    if (_ConversationIndex)
        [xsd_base64Binary serializeToChildOf:node withName:"t:ConversationIndex" value:_ConversationIndex];

    if (_ConversationTopic)
        [xsd_string serializeToChildOf:node withName:"t:ConversationTopic" value:_ConversationTopic];

    if (_From)
        [t_SingleRecipientType serializeToChildOf:node withName:"t:From" value:_From];

    if (_InternetMessageId)
        [xsd_string serializeToChildOf:node withName:"t:InternetMessageId" value:_InternetMessageId];

    if (_IsRead)
        [xsd_boolean serializeToChildOf:node withName:"t:IsRead" value:_IsRead];

    if (_IsResponseRequested)
        [xsd_boolean serializeToChildOf:node withName:"t:IsResponseRequested" value:_IsResponseRequested];

    if (_References)
        [xsd_string serializeToChildOf:node withName:"t:References" value:_References];

    if (_ReplyTo)
        [t_ArrayOfRecipientsType serializeToChildOf:node withName:"t:ReplyTo" value:_ReplyTo];

    if (_ReceivedBy)
        [t_SingleRecipientType serializeToChildOf:node withName:"t:ReceivedBy" value:_ReceivedBy];

    if (_ReceivedRepresenting)
        [t_SingleRecipientType serializeToChildOf:node withName:"t:ReceivedRepresenting" value:_ReceivedRepresenting];

}

+ (t_MessageType *)deserializeNode:(xmlNodePtr)cur {
    t_MessageType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Sender")) {
            Class elementClass = classForElement(cur) ?: [t_SingleRecipientType class];
            self.Sender = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ToRecipients")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRecipientsType class];
            self.ToRecipients = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CcRecipients")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRecipientsType class];
            self.CcRecipients = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"BccRecipients")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRecipientsType class];
            self.BccRecipients = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsReadReceiptRequested")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsReadReceiptRequested = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsDeliveryReceiptRequested")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsDeliveryReceiptRequested = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConversationIndex")) {
            Class elementClass = classForElement(cur) ?: [xsd_base64Binary class];
            self.ConversationIndex = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConversationTopic")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.ConversationTopic = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"From")) {
            Class elementClass = classForElement(cur) ?: [t_SingleRecipientType class];
            self.From = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"InternetMessageId")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.InternetMessageId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsRead")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsRead = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsResponseRequested")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsResponseRequested = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"References")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.References = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ReplyTo")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRecipientsType class];
            self.ReplyTo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ReceivedBy")) {
            Class elementClass = classForElement(cur) ?: [t_SingleRecipientType class];
            self.ReceivedBy = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ReceivedRepresenting")) {
            Class elementClass = classForElement(cur) ?: [t_SingleRecipientType class];
            self.ReceivedRepresenting = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ResponseObjectCoreType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ResponseObjectCoreType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_ReferenceItemId)
        [t_ItemIdType serializeToChildOf:node withName:"t:ReferenceItemId" value:_ReferenceItemId];

}


- (t_ItemIdType *)ReferenceItemId {
    if (!_ReferenceItemId) _ReferenceItemId = [t_ItemIdType new];
    return _ReferenceItemId;
}
+ (t_ResponseObjectCoreType *)deserializeNode:(xmlNodePtr)cur {
    t_ResponseObjectCoreType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ReferenceItemId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ReferenceItemId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ResponseObjectType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ResponseObjectType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"ObjectName" onNode:node value:_ObjectName];
}

+ (t_ResponseObjectType *)deserializeNode:(xmlNodePtr)cur {
    t_ResponseObjectType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.ObjectName = [xsd_string deserializeAttribute:"ObjectName" ofNode:cur];
}
@end
@implementation t_WellKnownResponseObjectType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_WellKnownResponseObjectType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (t_WellKnownResponseObjectType *)deserializeNode:(xmlNodePtr)cur {
    t_WellKnownResponseObjectType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
static NSString *t_CreateActionType_enumValues[] = {
    @"",
    @"CreateNew",
    @"Update",
    @"UpdateOrCreate",
};

@implementation t_CreateActionType
+ (t_CreateActionTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_CreateActionType_enumValues) / sizeof(t_CreateActionType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_CreateActionType_enumValues[i]])
            return (t_CreateActionTypeEnum)i;
    }

    return t_CreateActionType_none;
}

+ (NSString *)stringFromValue:(t_CreateActionTypeEnum)value {
    return t_CreateActionType_enumValues[(int)value];
}

+ (t_CreateActionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_CreateActionType_none;
}

+ (t_CreateActionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CreateActionTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_CreateActionTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_SerializableTimeZone

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SerializableTimeZone *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    xmlNewProp(child, (xmlChar *) [@"xmlns" UTF8String], (xmlChar *)[@"http://schemas.microsoft.com/exchange/services/2006/types" UTF8String]);
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Bias)
        [xsd_int serializeToChildOf:node withName:"t:Bias" value:_Bias];

    if (_StandardTime)
        [t_SerializableTimeZoneTime serializeToChildOf:node withName:"t:StandardTime" value:_StandardTime];

    if (_DaylightTime)
        [t_SerializableTimeZoneTime serializeToChildOf:node withName:"t:DaylightTime" value:_DaylightTime];

}


- (t_SerializableTimeZoneTime *)StandardTime {
    if (!_StandardTime) _StandardTime = [t_SerializableTimeZoneTime new];
    return _StandardTime;
}

- (t_SerializableTimeZoneTime *)DaylightTime {
    if (!_DaylightTime) _DaylightTime = [t_SerializableTimeZoneTime new];
    return _DaylightTime;
}
+ (t_SerializableTimeZone *)deserializeNode:(xmlNodePtr)cur {
    t_SerializableTimeZone *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Bias")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.Bias = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"StandardTime")) {
            Class elementClass = classForElement(cur) ?: [t_SerializableTimeZoneTime class];
            self.StandardTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DaylightTime")) {
            Class elementClass = classForElement(cur) ?: [t_SerializableTimeZoneTime class];
            self.DaylightTime = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_BaseFolderIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BaseFolderIdType *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (t_BaseFolderIdType *)deserializeNode:(xmlNodePtr)cur {
    t_BaseFolderIdType *newObject = [self new];


    return newObject;
}
@end
static NSString *t_AggregateType_enumValues[] = {
    @"",
    @"Maximum",
    @"Minimum",
};

@implementation t_AggregateType
+ (t_AggregateTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_AggregateType_enumValues) / sizeof(t_AggregateType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_AggregateType_enumValues[i]])
            return (t_AggregateTypeEnum)i;
    }

    return t_AggregateType_none;
}

+ (NSString *)stringFromValue:(t_AggregateTypeEnum)value {
    return t_AggregateType_enumValues[(int)value];
}

+ (t_AggregateTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_AggregateType_none;
}

+ (t_AggregateTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AggregateTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_AggregateTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
static NSString *t_PhoneNumberKeyType_enumValues[] = {
    @"",
    @"AssistantPhone",
    @"BusinessFax",
    @"BusinessPhone",
    @"BusinessPhone2",
    @"Callback",
    @"CarPhone",
    @"CompanyMainPhone",
    @"HomeFax",
    @"HomePhone",
    @"HomePhone2",
    @"Isdn",
    @"MobilePhone",
    @"OtherFax",
    @"OtherTelephone",
    @"Pager",
    @"PrimaryPhone",
    @"RadioPhone",
    @"Telex",
    @"TtyTddPhone",
};

@implementation t_PhoneNumberKeyType
+ (t_PhoneNumberKeyTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_PhoneNumberKeyType_enumValues) / sizeof(t_PhoneNumberKeyType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_PhoneNumberKeyType_enumValues[i]])
            return (t_PhoneNumberKeyTypeEnum)i;
    }

    return t_PhoneNumberKeyType_none;
}

+ (NSString *)stringFromValue:(t_PhoneNumberKeyTypeEnum)value {
    return t_PhoneNumberKeyType_enumValues[(int)value];
}

+ (t_PhoneNumberKeyTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_PhoneNumberKeyType_none;
}

+ (t_PhoneNumberKeyTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhoneNumberKeyTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_PhoneNumberKeyTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
static NSString *t_UserConfigurationDictionaryObjectTypesType_enumValues[] = {
    @"",
    @"Boolean",
    @"Byte",
    @"ByteArray",
    @"DateTime",
    @"Integer32",
    @"Integer64",
    @"String",
    @"StringArray",
    @"UnsignedInteger32",
    @"UnsignedInteger64",
};

@implementation t_UserConfigurationDictionaryObjectTypesType
+ (t_UserConfigurationDictionaryObjectTypesTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_UserConfigurationDictionaryObjectTypesType_enumValues) / sizeof(t_UserConfigurationDictionaryObjectTypesType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_UserConfigurationDictionaryObjectTypesType_enumValues[i]])
            return (t_UserConfigurationDictionaryObjectTypesTypeEnum)i;
    }

    return t_UserConfigurationDictionaryObjectTypesType_none;
}

+ (NSString *)stringFromValue:(t_UserConfigurationDictionaryObjectTypesTypeEnum)value {
    return t_UserConfigurationDictionaryObjectTypesType_enumValues[(int)value];
}

+ (t_UserConfigurationDictionaryObjectTypesTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_UserConfigurationDictionaryObjectTypesType_none;
}

+ (t_UserConfigurationDictionaryObjectTypesTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserConfigurationDictionaryObjectTypesTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_UserConfigurationDictionaryObjectTypesTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_FreeBusyViewType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_ArrayOfCalendarEvent
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"CalendarEvent")) {
            Class elementClass = classForElement(child) ?: [t_CalendarEvent class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_CalendarEvent * item in value)
        [t_CalendarEvent serializeToChildOf:child withName:"t:CalendarEvent" value:item];
}
@end
@implementation t_FreeBusyView
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FreeBusyView *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FreeBusyViewType)
        [t_FreeBusyViewType serializeToChildOf:node withName:"t:FreeBusyViewType" value:_FreeBusyViewType];

    if (_MergedFreeBusy)
        [xsd_string serializeToChildOf:node withName:"t:MergedFreeBusy" value:_MergedFreeBusy];

    if (_CalendarEventArray)
        [t_ArrayOfCalendarEvent serializeToChildOf:node withName:"t:CalendarEventArray" value:_CalendarEventArray];

    if (_WorkingHours)
        [t_WorkingHours serializeToChildOf:node withName:"t:WorkingHours" value:_WorkingHours];

}


- (t_WorkingHours *)WorkingHours {
    if (!_WorkingHours) _WorkingHours = [t_WorkingHours new];
    return _WorkingHours;
}
+ (t_FreeBusyView *)deserializeNode:(xmlNodePtr)cur {
    t_FreeBusyView *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FreeBusyViewType")) {
            Class elementClass = classForElement(cur) ?: [t_FreeBusyViewType class];
            self.FreeBusyViewType = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MergedFreeBusy")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.MergedFreeBusy = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CalendarEventArray")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfCalendarEvent class];
            self.CalendarEventArray = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"WorkingHours")) {
            Class elementClass = classForElement(cur) ?: [t_WorkingHours class];
            self.WorkingHours = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ItemChangeDescriptionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ItemChangeDescriptionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_ItemChangeDescriptionType *)deserializeNode:(xmlNodePtr)cur {
    t_ItemChangeDescriptionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_AppendToItemFieldType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AppendToItemFieldType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Item)
        [t_ItemType serializeToChildOf:node withName:"t:Item" value:_Item];

    if (_Message)
        [t_MessageType serializeToChildOf:node withName:"t:Message" value:_Message];

    if (_CalendarItem)
        [t_CalendarItemType serializeToChildOf:node withName:"t:CalendarItem" value:_CalendarItem];

    if (_Contact)
        [t_ContactItemType serializeToChildOf:node withName:"t:Contact" value:_Contact];

    if (_DistributionList)
        [t_DistributionListType serializeToChildOf:node withName:"t:DistributionList" value:_DistributionList];

    if (_MeetingMessage)
        [t_MeetingMessageType serializeToChildOf:node withName:"t:MeetingMessage" value:_MeetingMessage];

    if (_MeetingRequest)
        [t_MeetingRequestMessageType serializeToChildOf:node withName:"t:MeetingRequest" value:_MeetingRequest];

    if (_MeetingResponse)
        [t_MeetingResponseMessageType serializeToChildOf:node withName:"t:MeetingResponse" value:_MeetingResponse];

    if (_MeetingCancellation)
        [t_MeetingCancellationMessageType serializeToChildOf:node withName:"t:MeetingCancellation" value:_MeetingCancellation];

    if (_Task)
        [t_TaskType serializeToChildOf:node withName:"t:Task" value:_Task];

    if (_PostItem)
        [t_PostItemType serializeToChildOf:node withName:"t:PostItem" value:_PostItem];

}


- (t_ItemType *)Item {
    if (!_Item) _Item = [t_ItemType new];
    return _Item;
}

- (t_MessageType *)Message {
    if (!_Message) _Message = [t_MessageType new];
    return _Message;
}

- (t_CalendarItemType *)CalendarItem {
    if (!_CalendarItem) _CalendarItem = [t_CalendarItemType new];
    return _CalendarItem;
}

- (t_ContactItemType *)Contact {
    if (!_Contact) _Contact = [t_ContactItemType new];
    return _Contact;
}

- (t_DistributionListType *)DistributionList {
    if (!_DistributionList) _DistributionList = [t_DistributionListType new];
    return _DistributionList;
}

- (t_MeetingMessageType *)MeetingMessage {
    if (!_MeetingMessage) _MeetingMessage = [t_MeetingMessageType new];
    return _MeetingMessage;
}

- (t_MeetingRequestMessageType *)MeetingRequest {
    if (!_MeetingRequest) _MeetingRequest = [t_MeetingRequestMessageType new];
    return _MeetingRequest;
}

- (t_MeetingResponseMessageType *)MeetingResponse {
    if (!_MeetingResponse) _MeetingResponse = [t_MeetingResponseMessageType new];
    return _MeetingResponse;
}

- (t_MeetingCancellationMessageType *)MeetingCancellation {
    if (!_MeetingCancellation) _MeetingCancellation = [t_MeetingCancellationMessageType new];
    return _MeetingCancellation;
}

- (t_TaskType *)Task {
    if (!_Task) _Task = [t_TaskType new];
    return _Task;
}

- (t_PostItemType *)PostItem {
    if (!_PostItem) _PostItem = [t_PostItemType new];
    return _PostItem;
}
+ (t_AppendToItemFieldType *)deserializeNode:(xmlNodePtr)cur {
    t_AppendToItemFieldType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Item")) {
            Class elementClass = classForElement(cur) ?: [t_ItemType class];
            self.Item = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Message")) {
            Class elementClass = classForElement(cur) ?: [t_MessageType class];
            self.Message = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CalendarItem")) {
            Class elementClass = classForElement(cur) ?: [t_CalendarItemType class];
            self.CalendarItem = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Contact")) {
            Class elementClass = classForElement(cur) ?: [t_ContactItemType class];
            self.Contact = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DistributionList")) {
            Class elementClass = classForElement(cur) ?: [t_DistributionListType class];
            self.DistributionList = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingMessage")) {
            Class elementClass = classForElement(cur) ?: [t_MeetingMessageType class];
            self.MeetingMessage = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingRequest")) {
            Class elementClass = classForElement(cur) ?: [t_MeetingRequestMessageType class];
            self.MeetingRequest = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingResponse")) {
            Class elementClass = classForElement(cur) ?: [t_MeetingResponseMessageType class];
            self.MeetingResponse = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingCancellation")) {
            Class elementClass = classForElement(cur) ?: [t_MeetingCancellationMessageType class];
            self.MeetingCancellation = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Task")) {
            Class elementClass = classForElement(cur) ?: [t_TaskType class];
            self.Task = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PostItem")) {
            Class elementClass = classForElement(cur) ?: [t_PostItemType class];
            self.PostItem = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_ProtectionRuleActionKindType_enumValues[] = {
    @"",
    @"RightsProtectMessage",
};

@implementation t_ProtectionRuleActionKindType
+ (t_ProtectionRuleActionKindTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ProtectionRuleActionKindType_enumValues) / sizeof(t_ProtectionRuleActionKindType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ProtectionRuleActionKindType_enumValues[i]])
            return (t_ProtectionRuleActionKindTypeEnum)i;
    }

    return t_ProtectionRuleActionKindType_none;
}

+ (NSString *)stringFromValue:(t_ProtectionRuleActionKindTypeEnum)value {
    return t_ProtectionRuleActionKindType_enumValues[(int)value];
}

+ (t_ProtectionRuleActionKindTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ProtectionRuleActionKindType_none;
}

+ (t_ProtectionRuleActionKindTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ProtectionRuleActionKindTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ProtectionRuleActionKindTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ArrayOfUnknownEntriesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"UnknownEntry")) {
            Class elementClass = classForElement(child) ?: [xsd_string class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (NSString * item in value)
        [xsd_string serializeToChildOf:child withName:"t:UnknownEntry" value:item];
}
@end
static NSString *t_DayOfWeekType_enumValues[] = {
    @"",
    @"Day",
    @"Friday",
    @"Monday",
    @"Saturday",
    @"Sunday",
    @"Thursday",
    @"Tuesday",
    @"Wednesday",
    @"Weekday",
    @"WeekendDay",
};

@implementation t_DayOfWeekType
+ (t_DayOfWeekTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_DayOfWeekType_enumValues) / sizeof(t_DayOfWeekType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_DayOfWeekType_enumValues[i]])
            return (t_DayOfWeekTypeEnum)i;
    }

    return t_DayOfWeekType_none;
}

+ (NSString *)stringFromValue:(t_DayOfWeekTypeEnum)value {
    return t_DayOfWeekType_enumValues[(int)value];
}

+ (t_DayOfWeekTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_DayOfWeekType_none;
}

+ (t_DayOfWeekTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DayOfWeekTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DayOfWeekTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_SerializableTimeZoneTime
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SerializableTimeZoneTime *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Bias)
        [xsd_int serializeToChildOf:node withName:"t:Bias" value:_Bias];

    if (_Time)
        [xsd_string serializeToChildOf:node withName:"t:Time" value:_Time];

    if (_DayOrder)
        [xsd_short serializeToChildOf:node withName:"t:DayOrder" value:_DayOrder];

    if (_Month)
        [xsd_short serializeToChildOf:node withName:"t:Month" value:_Month];

    if (_DayOfWeek)
        [t_DayOfWeekType serializeToChildOf:node withName:"t:DayOfWeek" value:_DayOfWeek];

    if (_Year)
        [xsd_string serializeToChildOf:node withName:"t:Year" value:_Year];

}

+ (t_SerializableTimeZoneTime *)deserializeNode:(xmlNodePtr)cur {
    t_SerializableTimeZoneTime *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Bias")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.Bias = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Time")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Time = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DayOrder")) {
            Class elementClass = classForElement(cur) ?: [xsd_short class];
            self.DayOrder = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Month")) {
            Class elementClass = classForElement(cur) ?: [xsd_short class];
            self.Month = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DayOfWeek")) {
            self.DayOfWeek = [t_DayOfWeekType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Year")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Year = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_CalendarItemUpdateOperationType_enumValues[] = {
    @"",
    @"SendOnlyToAll",
    @"SendOnlyToChanged",
    @"SendToAllAndSaveCopy",
    @"SendToChangedAndSaveCopy",
    @"SendToNone",
};

@implementation t_CalendarItemUpdateOperationType
+ (t_CalendarItemUpdateOperationTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_CalendarItemUpdateOperationType_enumValues) / sizeof(t_CalendarItemUpdateOperationType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_CalendarItemUpdateOperationType_enumValues[i]])
            return (t_CalendarItemUpdateOperationTypeEnum)i;
    }

    return t_CalendarItemUpdateOperationType_none;
}

+ (NSString *)stringFromValue:(t_CalendarItemUpdateOperationTypeEnum)value {
    return t_CalendarItemUpdateOperationType_enumValues[(int)value];
}

+ (t_CalendarItemUpdateOperationTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_CalendarItemUpdateOperationType_none;
}

+ (t_CalendarItemUpdateOperationTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarItemUpdateOperationTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_CalendarItemUpdateOperationTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_SetFolderFieldType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SetFolderFieldType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Folder)
        [t_FolderType serializeToChildOf:node withName:"t:Folder" value:_Folder];

    if (_CalendarFolder)
        [t_CalendarFolderType serializeToChildOf:node withName:"t:CalendarFolder" value:_CalendarFolder];

    if (_ContactsFolder)
        [t_ContactsFolderType serializeToChildOf:node withName:"t:ContactsFolder" value:_ContactsFolder];

    if (_SearchFolder)
        [t_SearchFolderType serializeToChildOf:node withName:"t:SearchFolder" value:_SearchFolder];

    if (_TasksFolder)
        [t_TasksFolderType serializeToChildOf:node withName:"t:TasksFolder" value:_TasksFolder];

}


- (t_FolderType *)Folder {
    if (!_Folder) _Folder = [t_FolderType new];
    return _Folder;
}

- (t_CalendarFolderType *)CalendarFolder {
    if (!_CalendarFolder) _CalendarFolder = [t_CalendarFolderType new];
    return _CalendarFolder;
}

- (t_ContactsFolderType *)ContactsFolder {
    if (!_ContactsFolder) _ContactsFolder = [t_ContactsFolderType new];
    return _ContactsFolder;
}

- (t_SearchFolderType *)SearchFolder {
    if (!_SearchFolder) _SearchFolder = [t_SearchFolderType new];
    return _SearchFolder;
}

- (t_TasksFolderType *)TasksFolder {
    if (!_TasksFolder) _TasksFolder = [t_TasksFolderType new];
    return _TasksFolder;
}
+ (t_SetFolderFieldType *)deserializeNode:(xmlNodePtr)cur {
    t_SetFolderFieldType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Folder")) {
            Class elementClass = classForElement(cur) ?: [t_FolderType class];
            self.Folder = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CalendarFolder")) {
            Class elementClass = classForElement(cur) ?: [t_CalendarFolderType class];
            self.CalendarFolder = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContactsFolder")) {
            Class elementClass = classForElement(cur) ?: [t_ContactsFolderType class];
            self.ContactsFolder = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SearchFolder")) {
            Class elementClass = classForElement(cur) ?: [t_SearchFolderType class];
            self.SearchFolder = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"TasksFolder")) {
            Class elementClass = classForElement(cur) ?: [t_TasksFolderType class];
            self.TasksFolder = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_RecurrencePatternBaseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RecurrencePatternBaseType *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (t_RecurrencePatternBaseType *)deserializeNode:(xmlNodePtr)cur {
    t_RecurrencePatternBaseType *newObject = [self new];


    return newObject;
}
@end
@implementation t_IntervalRecurrencePatternBaseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_IntervalRecurrencePatternBaseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Interval)
        [xsd_int serializeToChildOf:node withName:"t:Interval" value:_Interval];

}

+ (t_IntervalRecurrencePatternBaseType *)deserializeNode:(xmlNodePtr)cur {
    t_IntervalRecurrencePatternBaseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Interval")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.Interval = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_DayOfWeekIndexType_enumValues[] = {
    @"",
    @"First",
    @"Fourth",
    @"Last",
    @"Second",
    @"Third",
};

@implementation t_DayOfWeekIndexType
+ (t_DayOfWeekIndexTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_DayOfWeekIndexType_enumValues) / sizeof(t_DayOfWeekIndexType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_DayOfWeekIndexType_enumValues[i]])
            return (t_DayOfWeekIndexTypeEnum)i;
    }

    return t_DayOfWeekIndexType_none;
}

+ (NSString *)stringFromValue:(t_DayOfWeekIndexTypeEnum)value {
    return t_DayOfWeekIndexType_enumValues[(int)value];
}

+ (t_DayOfWeekIndexTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_DayOfWeekIndexType_none;
}

+ (t_DayOfWeekIndexTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DayOfWeekIndexTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DayOfWeekIndexTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_RelativeMonthlyRecurrencePatternType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RelativeMonthlyRecurrencePatternType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_DaysOfWeek)
        [t_DayOfWeekType serializeToChildOf:node withName:"t:DaysOfWeek" value:_DaysOfWeek];

    if (_DayOfWeekIndex)
        [t_DayOfWeekIndexType serializeToChildOf:node withName:"t:DayOfWeekIndex" value:_DayOfWeekIndex];

}

+ (t_RelativeMonthlyRecurrencePatternType *)deserializeNode:(xmlNodePtr)cur {
    t_RelativeMonthlyRecurrencePatternType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"DaysOfWeek")) {
            self.DaysOfWeek = [t_DayOfWeekType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DayOfWeekIndex")) {
            self.DayOfWeekIndex = [t_DayOfWeekIndexType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation t_DerivedItemIdType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
static NSString *t_InvalidRecipientResponseCodeType_enumValues[] = {
    @"",
    @"CannotObtainTokenFromSTS",
    @"OtherError",
    @"RecipientOrganizationFederatedWithUnknownTokenIssuer",
    @"RecipientOrganizationNotFederated",
    @"SystemPolicyBlocksSharingWithThisRecipient",
};

@implementation t_InvalidRecipientResponseCodeType
+ (t_InvalidRecipientResponseCodeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_InvalidRecipientResponseCodeType_enumValues) / sizeof(t_InvalidRecipientResponseCodeType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_InvalidRecipientResponseCodeType_enumValues[i]])
            return (t_InvalidRecipientResponseCodeTypeEnum)i;
    }

    return t_InvalidRecipientResponseCodeType_none;
}

+ (NSString *)stringFromValue:(t_InvalidRecipientResponseCodeTypeEnum)value {
    return t_InvalidRecipientResponseCodeType_enumValues[(int)value];
}

+ (t_InvalidRecipientResponseCodeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_InvalidRecipientResponseCodeType_none;
}

+ (t_InvalidRecipientResponseCodeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_InvalidRecipientResponseCodeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_InvalidRecipientResponseCodeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_WatermarkType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_BaseNotificationEventType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BaseNotificationEventType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Watermark)
        [t_WatermarkType serializeToChildOf:node withName:"t:Watermark" value:_Watermark];

}

+ (t_BaseNotificationEventType *)deserializeNode:(xmlNodePtr)cur {
    t_BaseNotificationEventType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Watermark")) {
            Class elementClass = classForElement(cur) ?: [t_WatermarkType class];
            self.Watermark = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_BaseObjectChangedEventType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BaseObjectChangedEventType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_TimeStamp)
        [xsd_dateTime serializeToChildOf:node withName:"t:TimeStamp" value:_TimeStamp];

    if (_FolderId)
        [t_FolderIdType serializeToChildOf:node withName:"t:FolderId" value:_FolderId];

    if (_ItemId)
        [t_ItemIdType serializeToChildOf:node withName:"t:ItemId" value:_ItemId];

    if (_ParentFolderId)
        [t_FolderIdType serializeToChildOf:node withName:"t:ParentFolderId" value:_ParentFolderId];

}


- (t_FolderIdType *)FolderId {
    if (!_FolderId) _FolderId = [t_FolderIdType new];
    return _FolderId;
}

- (t_ItemIdType *)ItemId {
    if (!_ItemId) _ItemId = [t_ItemIdType new];
    return _ItemId;
}

- (t_FolderIdType *)ParentFolderId {
    if (!_ParentFolderId) _ParentFolderId = [t_FolderIdType new];
    return _ParentFolderId;
}
+ (t_BaseObjectChangedEventType *)deserializeNode:(xmlNodePtr)cur {
    t_BaseObjectChangedEventType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"TimeStamp")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.TimeStamp = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderId")) {
            Class elementClass = classForElement(cur) ?: [t_FolderIdType class];
            self.FolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ItemId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ParentFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_FolderIdType class];
            self.ParentFolderId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_MovedCopiedEventType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MovedCopiedEventType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_OldFolderId)
        [t_FolderIdType serializeToChildOf:node withName:"t:OldFolderId" value:_OldFolderId];

    if (_OldItemId)
        [t_ItemIdType serializeToChildOf:node withName:"t:OldItemId" value:_OldItemId];

    if (_OldParentFolderId)
        [t_FolderIdType serializeToChildOf:node withName:"t:OldParentFolderId" value:_OldParentFolderId];

}


- (t_FolderIdType *)OldFolderId {
    if (!_OldFolderId) _OldFolderId = [t_FolderIdType new];
    return _OldFolderId;
}

- (t_ItemIdType *)OldItemId {
    if (!_OldItemId) _OldItemId = [t_ItemIdType new];
    return _OldItemId;
}

- (t_FolderIdType *)OldParentFolderId {
    if (!_OldParentFolderId) _OldParentFolderId = [t_FolderIdType new];
    return _OldParentFolderId;
}
+ (t_MovedCopiedEventType *)deserializeNode:(xmlNodePtr)cur {
    t_MovedCopiedEventType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"OldFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_FolderIdType class];
            self.OldFolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"OldItemId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.OldItemId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"OldParentFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_FolderIdType class];
            self.OldParentFolderId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_BaseFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BaseFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FolderId)
        [t_FolderIdType serializeToChildOf:node withName:"t:FolderId" value:_FolderId];

    if (_ParentFolderId)
        [t_FolderIdType serializeToChildOf:node withName:"t:ParentFolderId" value:_ParentFolderId];

    if (_FolderClass)
        [xsd_string serializeToChildOf:node withName:"t:FolderClass" value:_FolderClass];

    if (_DisplayName)
        [xsd_string serializeToChildOf:node withName:"t:DisplayName" value:_DisplayName];

    if (_TotalCount)
        [xsd_int serializeToChildOf:node withName:"t:TotalCount" value:_TotalCount];

    if (_ChildFolderCount)
        [xsd_int serializeToChildOf:node withName:"t:ChildFolderCount" value:_ChildFolderCount];

    for (t_ExtendedPropertyType * item in _ExtendedProperty)
        [t_ExtendedPropertyType serializeToChildOf:node withName:"t:ExtendedProperty" value:item];

    if (_ManagedFolderInformation)
        [t_ManagedFolderInformationType serializeToChildOf:node withName:"t:ManagedFolderInformation" value:_ManagedFolderInformation];

    if (_EffectiveRights)
        [t_EffectiveRightsType serializeToChildOf:node withName:"t:EffectiveRights" value:_EffectiveRights];

}


- (t_FolderIdType *)FolderId {
    if (!_FolderId) _FolderId = [t_FolderIdType new];
    return _FolderId;
}

- (t_FolderIdType *)ParentFolderId {
    if (!_ParentFolderId) _ParentFolderId = [t_FolderIdType new];
    return _ParentFolderId;
}

- (t_ManagedFolderInformationType *)ManagedFolderInformation {
    if (!_ManagedFolderInformation) _ManagedFolderInformation = [t_ManagedFolderInformationType new];
    return _ManagedFolderInformation;
}

- (t_EffectiveRightsType *)EffectiveRights {
    if (!_EffectiveRights) _EffectiveRights = [t_EffectiveRightsType new];
    return _EffectiveRights;
}
+ (t_BaseFolderType *)deserializeNode:(xmlNodePtr)cur {
    t_BaseFolderType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    NSMutableArray *ExtendedPropertyValues = nil;

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderId")) {
            Class elementClass = classForElement(cur) ?: [t_FolderIdType class];
            self.FolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ParentFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_FolderIdType class];
            self.ParentFolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderClass")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.FolderClass = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DisplayName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.DisplayName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"TotalCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.TotalCount = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ChildFolderCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.ChildFolderCount = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExtendedProperty")) {
            Class elementClass = classForElement(cur) ?: [t_ExtendedPropertyType class];
            if (!ExtendedPropertyValues) ExtendedPropertyValues = [NSMutableArray new];
            [ExtendedPropertyValues addObject:[elementClass deserializeNode:cur]];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ManagedFolderInformation")) {
            Class elementClass = classForElement(cur) ?: [t_ManagedFolderInformationType class];
            self.ManagedFolderInformation = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EffectiveRights")) {
            Class elementClass = classForElement(cur) ?: [t_EffectiveRightsType class];
            self.EffectiveRights = [elementClass deserializeNode:cur];
        }
    }

    if (ExtendedPropertyValues) self.ExtendedProperty = ExtendedPropertyValues;
}
@end
@implementation t_FolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_PermissionSet)
        [t_PermissionSetType serializeToChildOf:node withName:"t:PermissionSet" value:_PermissionSet];

    if (_UnreadCount)
        [xsd_int serializeToChildOf:node withName:"t:UnreadCount" value:_UnreadCount];

}


- (t_PermissionSetType *)PermissionSet {
    if (!_PermissionSet) _PermissionSet = [t_PermissionSetType new];
    return _PermissionSet;
}
+ (t_FolderType *)deserializeNode:(xmlNodePtr)cur {
    t_FolderType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"PermissionSet")) {
            Class elementClass = classForElement(cur) ?: [t_PermissionSetType class];
            self.PermissionSet = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"UnreadCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.UnreadCount = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_FileAsMappingType_enumValues[] = {
    @"",
    @"Company",
    @"CompanyLastCommaFirst",
    @"CompanyLastFirst",
    @"CompanyLastSpaceFirst",
    @"DisplayName",
    @"Empty",
    @"FirstName",
    @"FirstSpaceLast",
    @"LastCommaFirst",
    @"LastCommaFirstCompany",
    @"LastFirst",
    @"LastFirstCompany",
    @"LastFirstMiddleSuffix",
    @"LastFirstSuffix",
    @"LastName",
    @"LastSpaceFirst",
    @"LastSpaceFirstCompany",
    @"None",
};

@implementation t_FileAsMappingType
+ (t_FileAsMappingTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_FileAsMappingType_enumValues) / sizeof(t_FileAsMappingType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_FileAsMappingType_enumValues[i]])
            return (t_FileAsMappingTypeEnum)i;
    }

    return t_FileAsMappingType_none;
}

+ (NSString *)stringFromValue:(t_FileAsMappingTypeEnum)value {
    return t_FileAsMappingType_enumValues[(int)value];
}

+ (t_FileAsMappingTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_FileAsMappingType_none;
}

+ (t_FileAsMappingTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FileAsMappingTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_FileAsMappingTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_EmailAddressDictionaryType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Entry")) {
            Class elementClass = classForElement(child) ?: [t_EmailAddressDictionaryEntryType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_EmailAddressDictionaryEntryType * item in value)
        [t_EmailAddressDictionaryEntryType serializeToChildOf:child withName:"t:Entry" value:item];
}
@end
@implementation t_PhysicalAddressDictionaryType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Entry")) {
            Class elementClass = classForElement(child) ?: [t_PhysicalAddressDictionaryEntryType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_PhysicalAddressDictionaryEntryType * item in value)
        [t_PhysicalAddressDictionaryEntryType serializeToChildOf:child withName:"t:Entry" value:item];
}
@end
@implementation t_PhoneNumberDictionaryType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Entry")) {
            Class elementClass = classForElement(child) ?: [t_PhoneNumberDictionaryEntryType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_PhoneNumberDictionaryEntryType * item in value)
        [t_PhoneNumberDictionaryEntryType serializeToChildOf:child withName:"t:Entry" value:item];
}
@end
static NSString *t_ContactSourceType_enumValues[] = {
    @"",
    @"ActiveDirectory",
    @"Store",
};

@implementation t_ContactSourceType
+ (t_ContactSourceTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ContactSourceType_enumValues) / sizeof(t_ContactSourceType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ContactSourceType_enumValues[i]])
            return (t_ContactSourceTypeEnum)i;
    }

    return t_ContactSourceType_none;
}

+ (NSString *)stringFromValue:(t_ContactSourceTypeEnum)value {
    return t_ContactSourceType_enumValues[(int)value];
}

+ (t_ContactSourceTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ContactSourceType_none;
}

+ (t_ContactSourceTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ContactSourceTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ContactSourceTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ImAddressDictionaryType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Entry")) {
            Class elementClass = classForElement(child) ?: [t_ImAddressDictionaryEntryType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_ImAddressDictionaryEntryType * item in value)
        [t_ImAddressDictionaryEntryType serializeToChildOf:child withName:"t:Entry" value:item];
}
@end
static NSString *t_PhysicalAddressIndexType_enumValues[] = {
    @"",
    @"Business",
    @"Home",
    @"None",
    @"Other",
};

@implementation t_PhysicalAddressIndexType
+ (t_PhysicalAddressIndexTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_PhysicalAddressIndexType_enumValues) / sizeof(t_PhysicalAddressIndexType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_PhysicalAddressIndexType_enumValues[i]])
            return (t_PhysicalAddressIndexTypeEnum)i;
    }

    return t_PhysicalAddressIndexType_none;
}

+ (NSString *)stringFromValue:(t_PhysicalAddressIndexTypeEnum)value {
    return t_PhysicalAddressIndexType_enumValues[(int)value];
}

+ (t_PhysicalAddressIndexTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_PhysicalAddressIndexType_none;
}

+ (t_PhysicalAddressIndexTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhysicalAddressIndexTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_PhysicalAddressIndexTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ArrayOfBinaryType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Base64Binary")) {
            Class elementClass = classForElement(child) ?: [xsd_base64Binary class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (NSData * item in value)
        [xsd_base64Binary serializeToChildOf:child withName:"t:Base64Binary" value:item];
}
@end
@implementation t_ContactItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ContactItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_FileAs)
        [xsd_string serializeToChildOf:node withName:"t:FileAs" value:_FileAs];

    if (_FileAsMapping)
        [t_FileAsMappingType serializeToChildOf:node withName:"t:FileAsMapping" value:_FileAsMapping];

    if (_DisplayName)
        [xsd_string serializeToChildOf:node withName:"t:DisplayName" value:_DisplayName];

    if (_GivenName)
        [xsd_string serializeToChildOf:node withName:"t:GivenName" value:_GivenName];

    if (_Initials)
        [xsd_string serializeToChildOf:node withName:"t:Initials" value:_Initials];

    if (_MiddleName)
        [xsd_string serializeToChildOf:node withName:"t:MiddleName" value:_MiddleName];

    if (_Nickname)
        [xsd_string serializeToChildOf:node withName:"t:Nickname" value:_Nickname];

    if (_CompleteName)
        [t_CompleteNameType serializeToChildOf:node withName:"t:CompleteName" value:_CompleteName];

    if (_CompanyName)
        [xsd_string serializeToChildOf:node withName:"t:CompanyName" value:_CompanyName];

    if (_EmailAddresses)
        [t_EmailAddressDictionaryType serializeToChildOf:node withName:"t:EmailAddresses" value:_EmailAddresses];

    if (_PhysicalAddresses)
        [t_PhysicalAddressDictionaryType serializeToChildOf:node withName:"t:PhysicalAddresses" value:_PhysicalAddresses];

    if (_PhoneNumbers)
        [t_PhoneNumberDictionaryType serializeToChildOf:node withName:"t:PhoneNumbers" value:_PhoneNumbers];

    if (_AssistantName)
        [xsd_string serializeToChildOf:node withName:"t:AssistantName" value:_AssistantName];

    if (_Birthday)
        [xsd_dateTime serializeToChildOf:node withName:"t:Birthday" value:_Birthday];

    if (_BusinessHomePage)
        [xsd_anyURI serializeToChildOf:node withName:"t:BusinessHomePage" value:_BusinessHomePage];

    if (_Children)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:Children" value:_Children];

    if (_Companies)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:Companies" value:_Companies];

    if (_ContactSource)
        [t_ContactSourceType serializeToChildOf:node withName:"t:ContactSource" value:_ContactSource];

    if (_Department)
        [xsd_string serializeToChildOf:node withName:"t:Department" value:_Department];

    if (_Generation)
        [xsd_string serializeToChildOf:node withName:"t:Generation" value:_Generation];

    if (_ImAddresses)
        [t_ImAddressDictionaryType serializeToChildOf:node withName:"t:ImAddresses" value:_ImAddresses];

    if (_JobTitle)
        [xsd_string serializeToChildOf:node withName:"t:JobTitle" value:_JobTitle];

    if (_Manager)
        [xsd_string serializeToChildOf:node withName:"t:Manager" value:_Manager];

    if (_Mileage)
        [xsd_string serializeToChildOf:node withName:"t:Mileage" value:_Mileage];

    if (_OfficeLocation)
        [xsd_string serializeToChildOf:node withName:"t:OfficeLocation" value:_OfficeLocation];

    if (_PostalAddressIndex)
        [t_PhysicalAddressIndexType serializeToChildOf:node withName:"t:PostalAddressIndex" value:_PostalAddressIndex];

    if (_Profession)
        [xsd_string serializeToChildOf:node withName:"t:Profession" value:_Profession];

    if (_SpouseName)
        [xsd_string serializeToChildOf:node withName:"t:SpouseName" value:_SpouseName];

    if (_Surname)
        [xsd_string serializeToChildOf:node withName:"t:Surname" value:_Surname];

    if (_WeddingAnniversary)
        [xsd_dateTime serializeToChildOf:node withName:"t:WeddingAnniversary" value:_WeddingAnniversary];

    if (_HasPicture)
        [xsd_boolean serializeToChildOf:node withName:"t:HasPicture" value:_HasPicture];

    if (_PhoneticFullName)
        [xsd_string serializeToChildOf:node withName:"t:PhoneticFullName" value:_PhoneticFullName];

    if (_PhoneticFirstName)
        [xsd_string serializeToChildOf:node withName:"t:PhoneticFirstName" value:_PhoneticFirstName];

    if (_PhoneticLastName)
        [xsd_string serializeToChildOf:node withName:"t:PhoneticLastName" value:_PhoneticLastName];

    if (_Alias)
        [xsd_string serializeToChildOf:node withName:"t:Alias" value:_Alias];

    if (_Notes)
        [xsd_string serializeToChildOf:node withName:"t:Notes" value:_Notes];

    if (_Photo)
        [xsd_base64Binary serializeToChildOf:node withName:"t:Photo" value:_Photo];

    if (_UserSMIMECertificate)
        [t_ArrayOfBinaryType serializeToChildOf:node withName:"t:UserSMIMECertificate" value:_UserSMIMECertificate];

    if (_MSExchangeCertificate)
        [t_ArrayOfBinaryType serializeToChildOf:node withName:"t:MSExchangeCertificate" value:_MSExchangeCertificate];

    if (_DirectoryId)
        [xsd_string serializeToChildOf:node withName:"t:DirectoryId" value:_DirectoryId];

    if (_ManagerMailbox)
        [t_SingleRecipientType serializeToChildOf:node withName:"t:ManagerMailbox" value:_ManagerMailbox];

    if (_DirectReports)
        [t_ArrayOfRecipientsType serializeToChildOf:node withName:"t:DirectReports" value:_DirectReports];

}


- (t_CompleteNameType *)CompleteName {
    if (!_CompleteName) _CompleteName = [t_CompleteNameType new];
    return _CompleteName;
}
+ (t_ContactItemType *)deserializeNode:(xmlNodePtr)cur {
    t_ContactItemType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FileAs")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.FileAs = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FileAsMapping")) {
            self.FileAsMapping = [t_FileAsMappingType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DisplayName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.DisplayName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GivenName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.GivenName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Initials")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Initials = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MiddleName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.MiddleName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Nickname")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Nickname = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CompleteName")) {
            Class elementClass = classForElement(cur) ?: [t_CompleteNameType class];
            self.CompleteName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CompanyName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.CompanyName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EmailAddresses")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressDictionaryType class];
            self.EmailAddresses = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PhysicalAddresses")) {
            Class elementClass = classForElement(cur) ?: [t_PhysicalAddressDictionaryType class];
            self.PhysicalAddresses = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PhoneNumbers")) {
            Class elementClass = classForElement(cur) ?: [t_PhoneNumberDictionaryType class];
            self.PhoneNumbers = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AssistantName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.AssistantName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Birthday")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.Birthday = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"BusinessHomePage")) {
            Class elementClass = classForElement(cur) ?: [xsd_anyURI class];
            self.BusinessHomePage = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Children")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.Children = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Companies")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.Companies = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContactSource")) {
            self.ContactSource = [t_ContactSourceType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Department")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Department = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Generation")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Generation = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ImAddresses")) {
            Class elementClass = classForElement(cur) ?: [t_ImAddressDictionaryType class];
            self.ImAddresses = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"JobTitle")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.JobTitle = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Manager")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Manager = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Mileage")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Mileage = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"OfficeLocation")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.OfficeLocation = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PostalAddressIndex")) {
            self.PostalAddressIndex = [t_PhysicalAddressIndexType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Profession")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Profession = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SpouseName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.SpouseName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Surname")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Surname = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"WeddingAnniversary")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.WeddingAnniversary = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"HasPicture")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.HasPicture = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PhoneticFullName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.PhoneticFullName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PhoneticFirstName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.PhoneticFirstName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PhoneticLastName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.PhoneticLastName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Alias")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Alias = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Notes")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Notes = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Photo")) {
            Class elementClass = classForElement(cur) ?: [xsd_base64Binary class];
            self.Photo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"UserSMIMECertificate")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfBinaryType class];
            self.UserSMIMECertificate = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MSExchangeCertificate")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfBinaryType class];
            self.MSExchangeCertificate = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DirectoryId")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.DirectoryId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ManagerMailbox")) {
            Class elementClass = classForElement(cur) ?: [t_SingleRecipientType class];
            self.ManagerMailbox = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DirectReports")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRecipientsType class];
            self.DirectReports = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_SmtpDomainList
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Domain")) {
            Class elementClass = classForElement(child) ?: [t_SmtpDomain class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_SmtpDomain * item in value)
        [t_SmtpDomain serializeToChildOf:child withName:"t:Domain" value:item];
}
@end
@implementation t_DelegateUserType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DelegateUserType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_UserId)
        [t_UserIdType serializeToChildOf:node withName:"t:UserId" value:_UserId];

    if (_DelegatePermissions)
        [t_DelegatePermissionsType serializeToChildOf:node withName:"t:DelegatePermissions" value:_DelegatePermissions];

    if (_ReceiveCopiesOfMeetingMessages)
        [xsd_boolean serializeToChildOf:node withName:"t:ReceiveCopiesOfMeetingMessages" value:_ReceiveCopiesOfMeetingMessages];

    if (_ViewPrivateItems)
        [xsd_boolean serializeToChildOf:node withName:"t:ViewPrivateItems" value:_ViewPrivateItems];

}


- (t_UserIdType *)UserId {
    if (!_UserId) _UserId = [t_UserIdType new];
    return _UserId;
}

- (t_DelegatePermissionsType *)DelegatePermissions {
    if (!_DelegatePermissions) _DelegatePermissions = [t_DelegatePermissionsType new];
    return _DelegatePermissions;
}
+ (t_DelegateUserType *)deserializeNode:(xmlNodePtr)cur {
    t_DelegateUserType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"UserId")) {
            Class elementClass = classForElement(cur) ?: [t_UserIdType class];
            self.UserId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DelegatePermissions")) {
            Class elementClass = classForElement(cur) ?: [t_DelegatePermissionsType class];
            self.DelegatePermissions = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ReceiveCopiesOfMeetingMessages")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.ReceiveCopiesOfMeetingMessages = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ViewPrivateItems")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.ViewPrivateItems = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_SmartResponseBaseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SmartResponseBaseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (t_SmartResponseBaseType *)deserializeNode:(xmlNodePtr)cur {
    t_SmartResponseBaseType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_SmartResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SmartResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_NewBodyContent)
        [t_BodyType serializeToChildOf:node withName:"t:NewBodyContent" value:_NewBodyContent];

}


- (t_BodyType *)NewBodyContent {
    if (!_NewBodyContent) _NewBodyContent = [t_BodyType new];
    return _NewBodyContent;
}
+ (t_SmartResponseType *)deserializeNode:(xmlNodePtr)cur {
    t_SmartResponseType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"NewBodyContent")) {
            Class elementClass = classForElement(cur) ?: [t_BodyType class];
            self.NewBodyContent = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ReplyToItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ReplyToItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (t_ReplyToItemType *)deserializeNode:(xmlNodePtr)cur {
    t_ReplyToItemType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
static NSString *t_IndexBasePointType_enumValues[] = {
    @"",
    @"Beginning",
    @"End",
};

@implementation t_IndexBasePointType
+ (t_IndexBasePointTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_IndexBasePointType_enumValues) / sizeof(t_IndexBasePointType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_IndexBasePointType_enumValues[i]])
            return (t_IndexBasePointTypeEnum)i;
    }

    return t_IndexBasePointType_none;
}

+ (NSString *)stringFromValue:(t_IndexBasePointTypeEnum)value {
    return t_IndexBasePointType_enumValues[(int)value];
}

+ (t_IndexBasePointTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_IndexBasePointType_none;
}

+ (t_IndexBasePointTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_IndexBasePointTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_IndexBasePointTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_UserConfigurationDictionaryType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"DictionaryEntry")) {
            Class elementClass = classForElement(child) ?: [t_UserConfigurationDictionaryEntryType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_UserConfigurationDictionaryEntryType * item in value)
        [t_UserConfigurationDictionaryEntryType serializeToChildOf:child withName:"t:DictionaryEntry" value:item];
}
@end
@implementation t_BasePagingType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BasePagingType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_int serializeToProperty:"MaxEntriesReturned" onNode:node value:_MaxEntriesReturned];
}

+ (t_BasePagingType *)deserializeNode:(xmlNodePtr)cur {
    t_BasePagingType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.MaxEntriesReturned = [xsd_int deserializeAttribute:"MaxEntriesReturned" ofNode:cur];
}
@end
@implementation t_CalendarViewType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarViewType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [super addAttributesToNode:node];

    [xsd_dateTime serializeToProperty:"StartDate" onNode:node value:_StartDate];
    [xsd_dateTime serializeToProperty:"EndDate" onNode:node value:_EndDate];
}

+ (t_CalendarViewType *)deserializeNode:(xmlNodePtr)cur {
    t_CalendarViewType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    [super deserializeAttributesFromNode:cur];

    self.StartDate = [xsd_dateTime deserializeAttribute:"StartDate" ofNode:cur];
    self.EndDate = [xsd_dateTime deserializeAttribute:"EndDate" ofNode:cur];
}
@end
static NSString *t_ContainmentModeType_enumValues[] = {
    @"",
    @"ExactPhrase",
    @"FullString",
    @"PrefixOnWords",
    @"Prefixed",
    @"Substring",
};

@implementation t_ContainmentModeType
+ (t_ContainmentModeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ContainmentModeType_enumValues) / sizeof(t_ContainmentModeType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ContainmentModeType_enumValues[i]])
            return (t_ContainmentModeTypeEnum)i;
    }

    return t_ContainmentModeType_none;
}

+ (NSString *)stringFromValue:(t_ContainmentModeTypeEnum)value {
    return t_ContainmentModeType_enumValues[(int)value];
}

+ (t_ContainmentModeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ContainmentModeType_none;
}

+ (t_ContainmentModeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ContainmentModeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ContainmentModeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
static NSString *t_EmailAddressKeyType_enumValues[] = {
    @"",
    @"EmailAddress1",
    @"EmailAddress2",
    @"EmailAddress3",
};

@implementation t_EmailAddressKeyType
+ (t_EmailAddressKeyTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_EmailAddressKeyType_enumValues) / sizeof(t_EmailAddressKeyType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_EmailAddressKeyType_enumValues[i]])
            return (t_EmailAddressKeyTypeEnum)i;
    }

    return t_EmailAddressKeyType_none;
}

+ (NSString *)stringFromValue:(t_EmailAddressKeyTypeEnum)value {
    return t_EmailAddressKeyType_enumValues[(int)value];
}

+ (t_EmailAddressKeyTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_EmailAddressKeyType_none;
}

+ (t_EmailAddressKeyTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_EmailAddressKeyTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_EmailAddressKeyTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
static NSString *t_MailboxTypeType_enumValues[] = {
    @"",
    @"Contact",
    @"Mailbox",
    @"OneOff",
    @"PrivateDL",
    @"PublicDL",
    @"PublicFolder",
    @"Unknown",
};

@implementation t_MailboxTypeType
+ (t_MailboxTypeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_MailboxTypeType_enumValues) / sizeof(t_MailboxTypeType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_MailboxTypeType_enumValues[i]])
            return (t_MailboxTypeTypeEnum)i;
    }

    return t_MailboxTypeType_none;
}

+ (NSString *)stringFromValue:(t_MailboxTypeTypeEnum)value {
    return t_MailboxTypeType_enumValues[(int)value];
}

+ (t_MailboxTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_MailboxTypeType_none;
}

+ (t_MailboxTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MailboxTypeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MailboxTypeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_EmailAddressDictionaryEntryType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_EmailAddressDictionaryEntryType *)value {
    [xsd_string serializeToChildOf:node withName:childName value:value._content];
    xmlNodePtr child = node->last;

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_EmailAddressKeyType serializeToProperty:"Key" onNode:node value:_Key];
    [xsd_string serializeToProperty:"Name" onNode:node value:_Name];
    [xsd_string serializeToProperty:"RoutingType" onNode:node value:_RoutingType];
    [t_MailboxTypeType serializeToProperty:"MailboxType" onNode:node value:_MailboxType];
}

+ (t_EmailAddressDictionaryEntryType *)deserializeNode:(xmlNodePtr)cur {
    t_EmailAddressDictionaryEntryType *newObject = [self new];
    newObject._content = [xsd_string deserializeNode:cur];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Key = [t_EmailAddressKeyType deserializeAttribute:"Key" ofNode:cur];
    self.Name = [xsd_string deserializeAttribute:"Name" ofNode:cur];
    self.RoutingType = [xsd_string deserializeAttribute:"RoutingType" ofNode:cur];
    self.MailboxType = [t_MailboxTypeType deserializeAttribute:"MailboxType" ofNode:cur];
}
@end
static NSString *t_FlaggedForActionType_enumValues[] = {
    @"",
    @"Any",
    @"Call",
    @"DoNotForward",
    @"FYI",
    @"FollowUp",
    @"Forward",
    @"NoResponseNecessary",
    @"Read",
    @"Reply",
    @"ReplyToAll",
    @"Review",
};

@implementation t_FlaggedForActionType
+ (t_FlaggedForActionTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_FlaggedForActionType_enumValues) / sizeof(t_FlaggedForActionType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_FlaggedForActionType_enumValues[i]])
            return (t_FlaggedForActionTypeEnum)i;
    }

    return t_FlaggedForActionType_none;
}

+ (NSString *)stringFromValue:(t_FlaggedForActionTypeEnum)value {
    return t_FlaggedForActionType_enumValues[(int)value];
}

+ (t_FlaggedForActionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_FlaggedForActionType_none;
}

+ (t_FlaggedForActionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FlaggedForActionTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_FlaggedForActionTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ArrayOfEmailAddressesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Address")) {
            Class elementClass = classForElement(child) ?: [t_EmailAddressType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_EmailAddressType * item in value)
        [t_EmailAddressType serializeToChildOf:child withName:"t:Address" value:item];
}
@end
@implementation t_RulePredicatesType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RulePredicatesType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Categories)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:Categories" value:_Categories];

    if (_ContainsBodyStrings)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:ContainsBodyStrings" value:_ContainsBodyStrings];

    if (_ContainsHeaderStrings)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:ContainsHeaderStrings" value:_ContainsHeaderStrings];

    if (_ContainsRecipientStrings)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:ContainsRecipientStrings" value:_ContainsRecipientStrings];

    if (_ContainsSenderStrings)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:ContainsSenderStrings" value:_ContainsSenderStrings];

    if (_ContainsSubjectOrBodyStrings)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:ContainsSubjectOrBodyStrings" value:_ContainsSubjectOrBodyStrings];

    if (_ContainsSubjectStrings)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:ContainsSubjectStrings" value:_ContainsSubjectStrings];

    if (_FlaggedForAction)
        [t_FlaggedForActionType serializeToChildOf:node withName:"t:FlaggedForAction" value:_FlaggedForAction];

    if (_FromAddresses)
        [t_ArrayOfEmailAddressesType serializeToChildOf:node withName:"t:FromAddresses" value:_FromAddresses];

    if (_FromConnectedAccounts)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:FromConnectedAccounts" value:_FromConnectedAccounts];

    if (_HasAttachments)
        [xsd_boolean serializeToChildOf:node withName:"t:HasAttachments" value:_HasAttachments];

    if (_Importance)
        [t_ImportanceChoicesType serializeToChildOf:node withName:"t:Importance" value:_Importance];

    if (_IsApprovalRequest)
        [xsd_boolean serializeToChildOf:node withName:"t:IsApprovalRequest" value:_IsApprovalRequest];

    if (_IsAutomaticForward)
        [xsd_boolean serializeToChildOf:node withName:"t:IsAutomaticForward" value:_IsAutomaticForward];

    if (_IsAutomaticReply)
        [xsd_boolean serializeToChildOf:node withName:"t:IsAutomaticReply" value:_IsAutomaticReply];

    if (_IsEncrypted)
        [xsd_boolean serializeToChildOf:node withName:"t:IsEncrypted" value:_IsEncrypted];

    if (_IsMeetingRequest)
        [xsd_boolean serializeToChildOf:node withName:"t:IsMeetingRequest" value:_IsMeetingRequest];

    if (_IsMeetingResponse)
        [xsd_boolean serializeToChildOf:node withName:"t:IsMeetingResponse" value:_IsMeetingResponse];

    if (_IsNDR)
        [xsd_boolean serializeToChildOf:node withName:"t:IsNDR" value:_IsNDR];

    if (_IsPermissionControlled)
        [xsd_boolean serializeToChildOf:node withName:"t:IsPermissionControlled" value:_IsPermissionControlled];

    if (_IsReadReceipt)
        [xsd_boolean serializeToChildOf:node withName:"t:IsReadReceipt" value:_IsReadReceipt];

    if (_IsSigned)
        [xsd_boolean serializeToChildOf:node withName:"t:IsSigned" value:_IsSigned];

    if (_IsVoicemail)
        [xsd_boolean serializeToChildOf:node withName:"t:IsVoicemail" value:_IsVoicemail];

    if (_ItemClasses)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:ItemClasses" value:_ItemClasses];

    if (_MessageClassifications)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:MessageClassifications" value:_MessageClassifications];

    if (_NotSentToMe)
        [xsd_boolean serializeToChildOf:node withName:"t:NotSentToMe" value:_NotSentToMe];

    if (_SentCcMe)
        [xsd_boolean serializeToChildOf:node withName:"t:SentCcMe" value:_SentCcMe];

    if (_SentOnlyToMe)
        [xsd_boolean serializeToChildOf:node withName:"t:SentOnlyToMe" value:_SentOnlyToMe];

    if (_SentToAddresses)
        [t_ArrayOfEmailAddressesType serializeToChildOf:node withName:"t:SentToAddresses" value:_SentToAddresses];

    if (_SentToMe)
        [xsd_boolean serializeToChildOf:node withName:"t:SentToMe" value:_SentToMe];

    if (_SentToOrCcMe)
        [xsd_boolean serializeToChildOf:node withName:"t:SentToOrCcMe" value:_SentToOrCcMe];

    if (_Sensitivity)
        [t_SensitivityChoicesType serializeToChildOf:node withName:"t:Sensitivity" value:_Sensitivity];

    if (_WithinDateRange)
        [t_RulePredicateDateRangeType serializeToChildOf:node withName:"t:WithinDateRange" value:_WithinDateRange];

    if (_WithinSizeRange)
        [t_RulePredicateSizeRangeType serializeToChildOf:node withName:"t:WithinSizeRange" value:_WithinSizeRange];

}


- (t_RulePredicateDateRangeType *)WithinDateRange {
    if (!_WithinDateRange) _WithinDateRange = [t_RulePredicateDateRangeType new];
    return _WithinDateRange;
}

- (t_RulePredicateSizeRangeType *)WithinSizeRange {
    if (!_WithinSizeRange) _WithinSizeRange = [t_RulePredicateSizeRangeType new];
    return _WithinSizeRange;
}
+ (t_RulePredicatesType *)deserializeNode:(xmlNodePtr)cur {
    t_RulePredicatesType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Categories")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.Categories = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContainsBodyStrings")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.ContainsBodyStrings = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContainsHeaderStrings")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.ContainsHeaderStrings = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContainsRecipientStrings")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.ContainsRecipientStrings = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContainsSenderStrings")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.ContainsSenderStrings = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContainsSubjectOrBodyStrings")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.ContainsSubjectOrBodyStrings = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContainsSubjectStrings")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.ContainsSubjectStrings = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FlaggedForAction")) {
            self.FlaggedForAction = [t_FlaggedForActionType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FromAddresses")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfEmailAddressesType class];
            self.FromAddresses = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FromConnectedAccounts")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.FromConnectedAccounts = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"HasAttachments")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.HasAttachments = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Importance")) {
            self.Importance = [t_ImportanceChoicesType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsApprovalRequest")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsApprovalRequest = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsAutomaticForward")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsAutomaticForward = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsAutomaticReply")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsAutomaticReply = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsEncrypted")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsEncrypted = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsMeetingRequest")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsMeetingRequest = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsMeetingResponse")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsMeetingResponse = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsNDR")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsNDR = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsPermissionControlled")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsPermissionControlled = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsReadReceipt")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsReadReceipt = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsSigned")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsSigned = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsVoicemail")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsVoicemail = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemClasses")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.ItemClasses = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MessageClassifications")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.MessageClassifications = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"NotSentToMe")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.NotSentToMe = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SentCcMe")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.SentCcMe = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SentOnlyToMe")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.SentOnlyToMe = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SentToAddresses")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfEmailAddressesType class];
            self.SentToAddresses = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SentToMe")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.SentToMe = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SentToOrCcMe")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.SentToOrCcMe = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Sensitivity")) {
            self.Sensitivity = [t_SensitivityChoicesType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"WithinDateRange")) {
            Class elementClass = classForElement(cur) ?: [t_RulePredicateDateRangeType class];
            self.WithinDateRange = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"WithinSizeRange")) {
            Class elementClass = classForElement(cur) ?: [t_RulePredicateSizeRangeType class];
            self.WithinSizeRange = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_DateTimePrecisionType_enumValues[] = {
    @"",
    @"Milliseconds",
    @"Seconds",
};

@implementation t_DateTimePrecisionType
+ (t_DateTimePrecisionTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_DateTimePrecisionType_enumValues) / sizeof(t_DateTimePrecisionType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_DateTimePrecisionType_enumValues[i]])
            return (t_DateTimePrecisionTypeEnum)i;
    }

    return t_DateTimePrecisionType_none;
}

+ (NSString *)stringFromValue:(t_DateTimePrecisionTypeEnum)value {
    return t_DateTimePrecisionType_enumValues[(int)value];
}

+ (t_DateTimePrecisionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_DateTimePrecisionType_none;
}

+ (t_DateTimePrecisionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DateTimePrecisionTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DateTimePrecisionTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
static NSString *t_CalendarPermissionReadAccessType_enumValues[] = {
    @"",
    @"FullDetails",
    @"None",
    @"TimeAndSubjectAndLocation",
    @"TimeOnly",
};

@implementation t_CalendarPermissionReadAccessType
+ (t_CalendarPermissionReadAccessTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_CalendarPermissionReadAccessType_enumValues) / sizeof(t_CalendarPermissionReadAccessType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_CalendarPermissionReadAccessType_enumValues[i]])
            return (t_CalendarPermissionReadAccessTypeEnum)i;
    }

    return t_CalendarPermissionReadAccessType_none;
}

+ (NSString *)stringFromValue:(t_CalendarPermissionReadAccessTypeEnum)value {
    return t_CalendarPermissionReadAccessType_enumValues[(int)value];
}

+ (t_CalendarPermissionReadAccessTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_CalendarPermissionReadAccessType_none;
}

+ (t_CalendarPermissionReadAccessTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarPermissionReadAccessTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_CalendarPermissionReadAccessTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_CalendarFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_SharingEffectiveRights)
        [t_CalendarPermissionReadAccessType serializeToChildOf:node withName:"t:SharingEffectiveRights" value:_SharingEffectiveRights];

    if (_PermissionSet)
        [t_CalendarPermissionSetType serializeToChildOf:node withName:"t:PermissionSet" value:_PermissionSet];

}


- (t_CalendarPermissionSetType *)PermissionSet {
    if (!_PermissionSet) _PermissionSet = [t_CalendarPermissionSetType new];
    return _PermissionSet;
}
+ (t_CalendarFolderType *)deserializeNode:(xmlNodePtr)cur {
    t_CalendarFolderType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SharingEffectiveRights")) {
            self.SharingEffectiveRights = [t_CalendarPermissionReadAccessType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PermissionSet")) {
            Class elementClass = classForElement(cur) ?: [t_CalendarPermissionSetType class];
            self.PermissionSet = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_NonEmptyArrayOfFoldersType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Folder")) {
            Class elementClass = classForElement(child) ?: [t_FolderType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"CalendarFolder")) {
            Class elementClass = classForElement(child) ?: [t_CalendarFolderType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ContactsFolder")) {
            Class elementClass = classForElement(child) ?: [t_ContactsFolderType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SearchFolder")) {
            Class elementClass = classForElement(child) ?: [t_SearchFolderType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"TasksFolder")) {
            Class elementClass = classForElement(child) ?: [t_TasksFolderType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_FolderType class]])
            [t_FolderType serializeToChildOf:child withName:"t:Folder" value:item];
        else if ([item isMemberOfClass:[t_CalendarFolderType class]])
            [t_CalendarFolderType serializeToChildOf:child withName:"t:CalendarFolder" value:item];
        else if ([item isMemberOfClass:[t_ContactsFolderType class]])
            [t_ContactsFolderType serializeToChildOf:child withName:"t:ContactsFolder" value:item];
        else if ([item isMemberOfClass:[t_SearchFolderType class]])
            [t_SearchFolderType serializeToChildOf:child withName:"t:SearchFolder" value:item];
        else if ([item isMemberOfClass:[t_TasksFolderType class]])
            [t_TasksFolderType serializeToChildOf:child withName:"t:TasksFolder" value:item];
    }
}
@end
@implementation t_NonEmptyArrayOfItemIdsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"ItemId")) {
            Class elementClass = classForElement(child) ?: [t_ItemIdType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_ItemIdType * item in value)
        [t_ItemIdType serializeToChildOf:child withName:"t:ItemId" value:item];
}
@end
@implementation t_NotType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_NotType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SearchExpression)
        [t_SearchExpressionType serializeToChildOf:node withName:"t:SearchExpression" value:_SearchExpression];

    if (_Exists)
        [t_ExistsType serializeToChildOf:node withName:"t:Exists" value:_Exists];

    if (_Excludes)
        [t_ExcludesType serializeToChildOf:node withName:"t:Excludes" value:_Excludes];

    if (_IsEqualTo)
        [t_IsEqualToType serializeToChildOf:node withName:"t:IsEqualTo" value:_IsEqualTo];

    if (_IsNotEqualTo)
        [t_IsNotEqualToType serializeToChildOf:node withName:"t:IsNotEqualTo" value:_IsNotEqualTo];

    if (_IsGreaterThan)
        [t_IsGreaterThanType serializeToChildOf:node withName:"t:IsGreaterThan" value:_IsGreaterThan];

    if (_IsGreaterThanOrEqualTo)
        [t_IsGreaterThanOrEqualToType serializeToChildOf:node withName:"t:IsGreaterThanOrEqualTo" value:_IsGreaterThanOrEqualTo];

    if (_IsLessThan)
        [t_IsLessThanType serializeToChildOf:node withName:"t:IsLessThan" value:_IsLessThan];

    if (_IsLessThanOrEqualTo)
        [t_IsLessThanOrEqualToType serializeToChildOf:node withName:"t:IsLessThanOrEqualTo" value:_IsLessThanOrEqualTo];

    if (_Contains)
        [t_ContainsExpressionType serializeToChildOf:node withName:"t:Contains" value:_Contains];

    if (_Not)
        [t_NotType serializeToChildOf:node withName:"t:Not" value:_Not];

    if (_And)
        [t_AndType serializeToChildOf:node withName:"t:And" value:_And];

    if (_Or)
        [t_OrType serializeToChildOf:node withName:"t:Or" value:_Or];

}


- (t_SearchExpressionType *)SearchExpression {
    if (!_SearchExpression) _SearchExpression = [t_SearchExpressionType new];
    return _SearchExpression;
}

- (t_ExistsType *)Exists {
    if (!_Exists) _Exists = [t_ExistsType new];
    return _Exists;
}

- (t_ExcludesType *)Excludes {
    if (!_Excludes) _Excludes = [t_ExcludesType new];
    return _Excludes;
}

- (t_IsEqualToType *)IsEqualTo {
    if (!_IsEqualTo) _IsEqualTo = [t_IsEqualToType new];
    return _IsEqualTo;
}

- (t_IsNotEqualToType *)IsNotEqualTo {
    if (!_IsNotEqualTo) _IsNotEqualTo = [t_IsNotEqualToType new];
    return _IsNotEqualTo;
}

- (t_IsGreaterThanType *)IsGreaterThan {
    if (!_IsGreaterThan) _IsGreaterThan = [t_IsGreaterThanType new];
    return _IsGreaterThan;
}

- (t_IsGreaterThanOrEqualToType *)IsGreaterThanOrEqualTo {
    if (!_IsGreaterThanOrEqualTo) _IsGreaterThanOrEqualTo = [t_IsGreaterThanOrEqualToType new];
    return _IsGreaterThanOrEqualTo;
}

- (t_IsLessThanType *)IsLessThan {
    if (!_IsLessThan) _IsLessThan = [t_IsLessThanType new];
    return _IsLessThan;
}

- (t_IsLessThanOrEqualToType *)IsLessThanOrEqualTo {
    if (!_IsLessThanOrEqualTo) _IsLessThanOrEqualTo = [t_IsLessThanOrEqualToType new];
    return _IsLessThanOrEqualTo;
}

- (t_ContainsExpressionType *)Contains {
    if (!_Contains) _Contains = [t_ContainsExpressionType new];
    return _Contains;
}

- (t_NotType *)Not {
    if (!_Not) _Not = [t_NotType new];
    return _Not;
}

- (t_AndType *)And {
    if (!_And) _And = [t_AndType new];
    return _And;
}

- (t_OrType *)Or {
    if (!_Or) _Or = [t_OrType new];
    return _Or;
}
+ (t_NotType *)deserializeNode:(xmlNodePtr)cur {
    t_NotType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SearchExpression")) {
            Class elementClass = classForElement(cur) ?: [t_SearchExpressionType class];
            self.SearchExpression = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Exists")) {
            Class elementClass = classForElement(cur) ?: [t_ExistsType class];
            self.Exists = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Excludes")) {
            Class elementClass = classForElement(cur) ?: [t_ExcludesType class];
            self.Excludes = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsEqualTo")) {
            Class elementClass = classForElement(cur) ?: [t_IsEqualToType class];
            self.IsEqualTo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsNotEqualTo")) {
            Class elementClass = classForElement(cur) ?: [t_IsNotEqualToType class];
            self.IsNotEqualTo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsGreaterThan")) {
            Class elementClass = classForElement(cur) ?: [t_IsGreaterThanType class];
            self.IsGreaterThan = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsGreaterThanOrEqualTo")) {
            Class elementClass = classForElement(cur) ?: [t_IsGreaterThanOrEqualToType class];
            self.IsGreaterThanOrEqualTo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsLessThan")) {
            Class elementClass = classForElement(cur) ?: [t_IsLessThanType class];
            self.IsLessThan = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsLessThanOrEqualTo")) {
            Class elementClass = classForElement(cur) ?: [t_IsLessThanOrEqualToType class];
            self.IsLessThanOrEqualTo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Contains")) {
            Class elementClass = classForElement(cur) ?: [t_ContainsExpressionType class];
            self.Contains = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Not")) {
            Class elementClass = classForElement(cur) ?: [t_NotType class];
            self.Not = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"And")) {
            Class elementClass = classForElement(cur) ?: [t_AndType class];
            self.And = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Or")) {
            Class elementClass = classForElement(cur) ?: [t_OrType class];
            self.Or = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_MaxSyncChangesReturnedType
+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return @([str doubleValue]);
}

+ (NSNumber *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return @([attrString doubleValue]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSNumber *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSNumber *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_MailboxCultureType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MailboxCultureType *)value {
    [xsd_language serializeToChildOf:node withName:childName value:value._content];
}
+ (t_MailboxCultureType *)deserializeNode:(xmlNodePtr)cur {
    t_MailboxCultureType *newObject = [self new];
    newObject._content = [xsd_language deserializeNode:cur];


    return newObject;
}
@end
@implementation t_NonEmptyArrayOfAttendeesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Attendee")) {
            Class elementClass = classForElement(child) ?: [t_AttendeeType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_AttendeeType * item in value)
        [t_AttendeeType serializeToChildOf:child withName:"t:Attendee" value:item];
}
@end
static NSString *t_MeetingRequestTypeType_enumValues[] = {
    @"",
    @"FullUpdate",
    @"InformationalUpdate",
    @"NewMeetingRequest",
    @"None",
    @"Outdated",
    @"PrincipalWantsCopy",
    @"SilentUpdate",
};

@implementation t_MeetingRequestTypeType
+ (t_MeetingRequestTypeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_MeetingRequestTypeType_enumValues) / sizeof(t_MeetingRequestTypeType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_MeetingRequestTypeType_enumValues[i]])
            return (t_MeetingRequestTypeTypeEnum)i;
    }

    return t_MeetingRequestTypeType_none;
}

+ (NSString *)stringFromValue:(t_MeetingRequestTypeTypeEnum)value {
    return t_MeetingRequestTypeType_enumValues[(int)value];
}

+ (t_MeetingRequestTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_MeetingRequestTypeType_none;
}

+ (t_MeetingRequestTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MeetingRequestTypeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MeetingRequestTypeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ArrayOfResolutionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ArrayOfResolutionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_int serializeToProperty:"IndexedPagingOffset" onNode:node value:_IndexedPagingOffset];
    [xsd_int serializeToProperty:"NumeratorOffset" onNode:node value:_NumeratorOffset];
    [xsd_int serializeToProperty:"AbsoluteDenominator" onNode:node value:_AbsoluteDenominator];
    [xsd_boolean serializeToProperty:"IncludesLastItemInRange" onNode:node value:_IncludesLastItemInRange];
    [xsd_int serializeToProperty:"TotalItemsInView" onNode:node value:_TotalItemsInView];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    for (t_ResolutionType * item in _Resolution)
        [t_ResolutionType serializeToChildOf:node withName:"t:Resolution" value:item];

}


+ (t_ArrayOfResolutionType *)deserializeNode:(xmlNodePtr)cur {
    t_ArrayOfResolutionType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.IndexedPagingOffset = [xsd_int deserializeAttribute:"IndexedPagingOffset" ofNode:cur];
    self.NumeratorOffset = [xsd_int deserializeAttribute:"NumeratorOffset" ofNode:cur];
    self.AbsoluteDenominator = [xsd_int deserializeAttribute:"AbsoluteDenominator" ofNode:cur];
    self.IncludesLastItemInRange = [xsd_boolean deserializeAttribute:"IncludesLastItemInRange" ofNode:cur];
    self.TotalItemsInView = [xsd_int deserializeAttribute:"TotalItemsInView" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    NSMutableArray *ResolutionValues = nil;

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Resolution")) {
            Class elementClass = classForElement(cur) ?: [t_ResolutionType class];
            if (!ResolutionValues) ResolutionValues = [NSMutableArray new];
            [ResolutionValues addObject:[elementClass deserializeNode:cur]];
        }
    }

    if (ResolutionValues) self.Resolution = ResolutionValues;
}
@end
@implementation t_ArrayOfUserMailboxesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"UserMailbox")) {
            Class elementClass = classForElement(child) ?: [t_UserMailboxType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_UserMailboxType * item in value)
        [t_UserMailboxType serializeToChildOf:child withName:"t:UserMailbox" value:item];
}
@end
@implementation t_UploadItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UploadItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_CreateActionType serializeToProperty:"CreateAction" onNode:node value:_CreateAction];
    [xsd_boolean serializeToProperty:"IsAssociated" onNode:node value:_IsAssociated];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ParentFolderId)
        [t_FolderIdType serializeToChildOf:node withName:"t:ParentFolderId" value:_ParentFolderId];

    if (_ItemId)
        [t_ItemIdType serializeToChildOf:node withName:"t:ItemId" value:_ItemId];

    if (_Data)
        [xsd_base64Binary serializeToChildOf:node withName:"t:Data" value:_Data];

}


- (t_FolderIdType *)ParentFolderId {
    if (!_ParentFolderId) _ParentFolderId = [t_FolderIdType new];
    return _ParentFolderId;
}

- (t_ItemIdType *)ItemId {
    if (!_ItemId) _ItemId = [t_ItemIdType new];
    return _ItemId;
}

+ (t_UploadItemType *)deserializeNode:(xmlNodePtr)cur {
    t_UploadItemType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.CreateAction = [t_CreateActionType deserializeAttribute:"CreateAction" ofNode:cur];
    self.IsAssociated = [xsd_boolean deserializeAttribute:"IsAssociated" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ParentFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_FolderIdType class];
            self.ParentFolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ItemId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Data")) {
            Class elementClass = classForElement(cur) ?: [xsd_base64Binary class];
            self.Data = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_NonEmptyArrayOfSubscriptionIdsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"SubscriptionId")) {
            Class elementClass = classForElement(child) ?: [t_SubscriptionIdType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (NSString * item in value)
        [t_SubscriptionIdType serializeToChildOf:child withName:"t:SubscriptionId" value:item];
}
@end
@implementation t_NonEmptyArrayOfUploadItemsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Item")) {
            Class elementClass = classForElement(child) ?: [t_UploadItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_UploadItemType * item in value)
        [t_UploadItemType serializeToChildOf:child withName:"t:Item" value:item];
}
@end
static NSString *t_PermissionReadAccessType_enumValues[] = {
    @"",
    @"FullDetails",
    @"None",
};

@implementation t_PermissionReadAccessType
+ (t_PermissionReadAccessTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_PermissionReadAccessType_enumValues) / sizeof(t_PermissionReadAccessType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_PermissionReadAccessType_enumValues[i]])
            return (t_PermissionReadAccessTypeEnum)i;
    }

    return t_PermissionReadAccessType_none;
}

+ (NSString *)stringFromValue:(t_PermissionReadAccessTypeEnum)value {
    return t_PermissionReadAccessType_enumValues[(int)value];
}

+ (t_PermissionReadAccessTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_PermissionReadAccessType_none;
}

+ (t_PermissionReadAccessTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PermissionReadAccessTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_PermissionReadAccessTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ContactsFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ContactsFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_SharingEffectiveRights)
        [t_PermissionReadAccessType serializeToChildOf:node withName:"t:SharingEffectiveRights" value:_SharingEffectiveRights];

    if (_PermissionSet)
        [t_PermissionSetType serializeToChildOf:node withName:"t:PermissionSet" value:_PermissionSet];

}


- (t_PermissionSetType *)PermissionSet {
    if (!_PermissionSet) _PermissionSet = [t_PermissionSetType new];
    return _PermissionSet;
}
+ (t_ContactsFolderType *)deserializeNode:(xmlNodePtr)cur {
    t_ContactsFolderType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SharingEffectiveRights")) {
            self.SharingEffectiveRights = [t_PermissionReadAccessType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PermissionSet")) {
            Class elementClass = classForElement(cur) ?: [t_PermissionSetType class];
            self.PermissionSet = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_BasePathToElementType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BasePathToElementType *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (t_BasePathToElementType *)deserializeNode:(xmlNodePtr)cur {
    t_BasePathToElementType *newObject = [self new];


    return newObject;
}
@end
static NSString *t_DistinguishedPropertySetType_enumValues[] = {
    @"",
    @"Address",
    @"Appointment",
    @"CalendarAssistant",
    @"Common",
    @"InternetHeaders",
    @"Meeting",
    @"PublicStrings",
    @"Task",
    @"UnifiedMessaging",
};

@implementation t_DistinguishedPropertySetType
+ (t_DistinguishedPropertySetTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_DistinguishedPropertySetType_enumValues) / sizeof(t_DistinguishedPropertySetType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_DistinguishedPropertySetType_enumValues[i]])
            return (t_DistinguishedPropertySetTypeEnum)i;
    }

    return t_DistinguishedPropertySetType_none;
}

+ (NSString *)stringFromValue:(t_DistinguishedPropertySetTypeEnum)value {
    return t_DistinguishedPropertySetType_enumValues[(int)value];
}

+ (t_DistinguishedPropertySetTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_DistinguishedPropertySetType_none;
}

+ (t_DistinguishedPropertySetTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DistinguishedPropertySetTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DistinguishedPropertySetTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_GuidType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_PropertyTagType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
static NSString *t_MapiPropertyTypeType_enumValues[] = {
    @"",
    @"ApplicationTime",
    @"ApplicationTimeArray",
    @"Binary",
    @"BinaryArray",
    @"Boolean",
    @"CLSID",
    @"CLSIDArray",
    @"Currency",
    @"CurrencyArray",
    @"Double",
    @"DoubleArray",
    @"Error",
    @"Float",
    @"FloatArray",
    @"Integer",
    @"IntegerArray",
    @"Long",
    @"LongArray",
    @"Null",
    @"Object",
    @"ObjectArray",
    @"Short",
    @"ShortArray",
    @"String",
    @"StringArray",
    @"SystemTime",
    @"SystemTimeArray",
};

@implementation t_MapiPropertyTypeType
+ (t_MapiPropertyTypeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_MapiPropertyTypeType_enumValues) / sizeof(t_MapiPropertyTypeType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_MapiPropertyTypeType_enumValues[i]])
            return (t_MapiPropertyTypeTypeEnum)i;
    }

    return t_MapiPropertyTypeType_none;
}

+ (NSString *)stringFromValue:(t_MapiPropertyTypeTypeEnum)value {
    return t_MapiPropertyTypeType_enumValues[(int)value];
}

+ (t_MapiPropertyTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_MapiPropertyTypeType_none;
}

+ (t_MapiPropertyTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MapiPropertyTypeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MapiPropertyTypeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_PathToExtendedFieldType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PathToExtendedFieldType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_DistinguishedPropertySetType serializeToProperty:"DistinguishedPropertySetId" onNode:node value:_DistinguishedPropertySetId];
    [t_GuidType serializeToProperty:"PropertySetId" onNode:node value:_PropertySetId];
    [t_PropertyTagType serializeToProperty:"PropertyTag" onNode:node value:_PropertyTag];
    [xsd_string serializeToProperty:"PropertyName" onNode:node value:_PropertyName];
    [xsd_int serializeToProperty:"PropertyId" onNode:node value:_PropertyId];
    [t_MapiPropertyTypeType serializeToProperty:"PropertyType" onNode:node value:_PropertyType];
}

+ (t_PathToExtendedFieldType *)deserializeNode:(xmlNodePtr)cur {
    t_PathToExtendedFieldType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.DistinguishedPropertySetId = [t_DistinguishedPropertySetType deserializeAttribute:"DistinguishedPropertySetId" ofNode:cur];
    self.PropertySetId = [t_GuidType deserializeAttribute:"PropertySetId" ofNode:cur];
    self.PropertyTag = [t_PropertyTagType deserializeAttribute:"PropertyTag" ofNode:cur];
    self.PropertyName = [xsd_string deserializeAttribute:"PropertyName" ofNode:cur];
    self.PropertyId = [xsd_int deserializeAttribute:"PropertyId" ofNode:cur];
    self.PropertyType = [t_MapiPropertyTypeType deserializeAttribute:"PropertyType" ofNode:cur];
}
@end
@implementation t_ArrayOfItemClassType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"ItemClass")) {
            Class elementClass = classForElement(child) ?: [t_ItemClassType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (NSString * item in value)
        [t_ItemClassType serializeToChildOf:child withName:"t:ItemClass" value:item];
}
@end
@implementation t_NonEmptyArrayOfBaseItemIdsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"ItemId")) {
            Class elementClass = classForElement(child) ?: [t_ItemIdType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"OccurrenceItemId")) {
            Class elementClass = classForElement(child) ?: [t_OccurrenceItemIdType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"RecurringMasterItemId")) {
            Class elementClass = classForElement(child) ?: [t_RecurringMasterItemIdType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_ItemIdType class]])
            [t_ItemIdType serializeToChildOf:child withName:"t:ItemId" value:item];
        else if ([item isMemberOfClass:[t_OccurrenceItemIdType class]])
            [t_OccurrenceItemIdType serializeToChildOf:child withName:"t:OccurrenceItemId" value:item];
        else if ([item isMemberOfClass:[t_RecurringMasterItemIdType class]])
            [t_RecurringMasterItemIdType serializeToChildOf:child withName:"t:RecurringMasterItemId" value:item];
    }
}
@end
@implementation t_ConversationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConversationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ConversationId)
        [t_ItemIdType serializeToChildOf:node withName:"t:ConversationId" value:_ConversationId];

    if (_ConversationTopic)
        [xsd_string serializeToChildOf:node withName:"t:ConversationTopic" value:_ConversationTopic];

    if (_UniqueRecipients)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:UniqueRecipients" value:_UniqueRecipients];

    if (_GlobalUniqueRecipients)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:GlobalUniqueRecipients" value:_GlobalUniqueRecipients];

    if (_UniqueUnreadSenders)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:UniqueUnreadSenders" value:_UniqueUnreadSenders];

    if (_GlobalUniqueUnreadSenders)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:GlobalUniqueUnreadSenders" value:_GlobalUniqueUnreadSenders];

    if (_UniqueSenders)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:UniqueSenders" value:_UniqueSenders];

    if (_GlobalUniqueSenders)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:GlobalUniqueSenders" value:_GlobalUniqueSenders];

    if (_LastDeliveryTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:LastDeliveryTime" value:_LastDeliveryTime];

    if (_GlobalLastDeliveryTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:GlobalLastDeliveryTime" value:_GlobalLastDeliveryTime];

    if (_Categories)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:Categories" value:_Categories];

    if (_GlobalCategories)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:GlobalCategories" value:_GlobalCategories];

    if (_FlagStatus)
        [t_FlagStatusType serializeToChildOf:node withName:"t:FlagStatus" value:_FlagStatus];

    if (_GlobalFlagStatus)
        [t_FlagStatusType serializeToChildOf:node withName:"t:GlobalFlagStatus" value:_GlobalFlagStatus];

    if (_HasAttachments)
        [xsd_boolean serializeToChildOf:node withName:"t:HasAttachments" value:_HasAttachments];

    if (_GlobalHasAttachments)
        [xsd_boolean serializeToChildOf:node withName:"t:GlobalHasAttachments" value:_GlobalHasAttachments];

    if (_MessageCount)
        [xsd_int serializeToChildOf:node withName:"t:MessageCount" value:_MessageCount];

    if (_GlobalMessageCount)
        [xsd_int serializeToChildOf:node withName:"t:GlobalMessageCount" value:_GlobalMessageCount];

    if (_UnreadCount)
        [xsd_int serializeToChildOf:node withName:"t:UnreadCount" value:_UnreadCount];

    if (_GlobalUnreadCount)
        [xsd_int serializeToChildOf:node withName:"t:GlobalUnreadCount" value:_GlobalUnreadCount];

    if (_Size)
        [xsd_int serializeToChildOf:node withName:"t:Size" value:_Size];

    if (_GlobalSize)
        [xsd_int serializeToChildOf:node withName:"t:GlobalSize" value:_GlobalSize];

    if (_ItemClasses)
        [t_ArrayOfItemClassType serializeToChildOf:node withName:"t:ItemClasses" value:_ItemClasses];

    if (_GlobalItemClasses)
        [t_ArrayOfItemClassType serializeToChildOf:node withName:"t:GlobalItemClasses" value:_GlobalItemClasses];

    if (_Importance)
        [t_ImportanceChoicesType serializeToChildOf:node withName:"t:Importance" value:_Importance];

    if (_GlobalImportance)
        [t_ImportanceChoicesType serializeToChildOf:node withName:"t:GlobalImportance" value:_GlobalImportance];

    if (_ItemIds)
        [t_NonEmptyArrayOfBaseItemIdsType serializeToChildOf:node withName:"t:ItemIds" value:_ItemIds];

    if (_GlobalItemIds)
        [t_NonEmptyArrayOfBaseItemIdsType serializeToChildOf:node withName:"t:GlobalItemIds" value:_GlobalItemIds];

}


- (t_ItemIdType *)ConversationId {
    if (!_ConversationId) _ConversationId = [t_ItemIdType new];
    return _ConversationId;
}
+ (t_ConversationType *)deserializeNode:(xmlNodePtr)cur {
    t_ConversationType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConversationId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ConversationId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConversationTopic")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.ConversationTopic = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"UniqueRecipients")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.UniqueRecipients = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GlobalUniqueRecipients")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.GlobalUniqueRecipients = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"UniqueUnreadSenders")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.UniqueUnreadSenders = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GlobalUniqueUnreadSenders")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.GlobalUniqueUnreadSenders = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"UniqueSenders")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.UniqueSenders = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GlobalUniqueSenders")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.GlobalUniqueSenders = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"LastDeliveryTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.LastDeliveryTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GlobalLastDeliveryTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.GlobalLastDeliveryTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Categories")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.Categories = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GlobalCategories")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.GlobalCategories = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FlagStatus")) {
            self.FlagStatus = [t_FlagStatusType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GlobalFlagStatus")) {
            self.GlobalFlagStatus = [t_FlagStatusType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"HasAttachments")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.HasAttachments = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GlobalHasAttachments")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.GlobalHasAttachments = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MessageCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.MessageCount = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GlobalMessageCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.GlobalMessageCount = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"UnreadCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.UnreadCount = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GlobalUnreadCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.GlobalUnreadCount = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Size")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.Size = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GlobalSize")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.GlobalSize = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemClasses")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfItemClassType class];
            self.ItemClasses = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GlobalItemClasses")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfItemClassType class];
            self.GlobalItemClasses = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Importance")) {
            self.Importance = [t_ImportanceChoicesType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GlobalImportance")) {
            self.GlobalImportance = [t_ImportanceChoicesType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseItemIdsType class];
            self.ItemIds = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GlobalItemIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseItemIdsType class];
            self.GlobalItemIds = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_FolderQueryTraversalType_enumValues[] = {
    @"",
    @"Deep",
    @"Shallow",
    @"SoftDeleted",
};

@implementation t_FolderQueryTraversalType
+ (t_FolderQueryTraversalTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_FolderQueryTraversalType_enumValues) / sizeof(t_FolderQueryTraversalType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_FolderQueryTraversalType_enumValues[i]])
            return (t_FolderQueryTraversalTypeEnum)i;
    }

    return t_FolderQueryTraversalType_none;
}

+ (NSString *)stringFromValue:(t_FolderQueryTraversalTypeEnum)value {
    return t_FolderQueryTraversalType_enumValues[(int)value];
}

+ (t_FolderQueryTraversalTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_FolderQueryTraversalType_none;
}

+ (t_FolderQueryTraversalTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FolderQueryTraversalTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_FolderQueryTraversalTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
static NSString *t_DelegateFolderPermissionLevelType_enumValues[] = {
    @"",
    @"Author",
    @"Custom",
    @"Editor",
    @"None",
    @"Reviewer",
};

@implementation t_DelegateFolderPermissionLevelType
+ (t_DelegateFolderPermissionLevelTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_DelegateFolderPermissionLevelType_enumValues) / sizeof(t_DelegateFolderPermissionLevelType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_DelegateFolderPermissionLevelType_enumValues[i]])
            return (t_DelegateFolderPermissionLevelTypeEnum)i;
    }

    return t_DelegateFolderPermissionLevelType_none;
}

+ (NSString *)stringFromValue:(t_DelegateFolderPermissionLevelTypeEnum)value {
    return t_DelegateFolderPermissionLevelType_enumValues[(int)value];
}

+ (t_DelegateFolderPermissionLevelTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_DelegateFolderPermissionLevelType_none;
}

+ (t_DelegateFolderPermissionLevelTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DelegateFolderPermissionLevelTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DelegateFolderPermissionLevelTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
static NSString *t_SpecialLogonTypeType_enumValues[] = {
    @"",
    @"Admin",
    @"SystemService",
};

@implementation t_SpecialLogonTypeType
+ (t_SpecialLogonTypeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_SpecialLogonTypeType_enumValues) / sizeof(t_SpecialLogonTypeType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_SpecialLogonTypeType_enumValues[i]])
            return (t_SpecialLogonTypeTypeEnum)i;
    }

    return t_SpecialLogonTypeType_none;
}

+ (NSString *)stringFromValue:(t_SpecialLogonTypeTypeEnum)value {
    return t_SpecialLogonTypeType_enumValues[(int)value];
}

+ (t_SpecialLogonTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_SpecialLogonTypeType_none;
}

+ (t_SpecialLogonTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SpecialLogonTypeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SpecialLogonTypeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_MultipleOperandBooleanExpressionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MultipleOperandBooleanExpressionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    for (t_SearchExpressionType * item in _SearchExpression)
        [t_SearchExpressionType serializeToChildOf:node withName:"t:SearchExpression" value:item];

    if (_Exists)
        [t_ExistsType serializeToChildOf:node withName:"t:Exists" value:_Exists];

    if (_Excludes)
        [t_ExcludesType serializeToChildOf:node withName:"t:Excludes" value:_Excludes];

    if (_IsEqualTo)
        [t_IsEqualToType serializeToChildOf:node withName:"t:IsEqualTo" value:_IsEqualTo];

    if (_IsNotEqualTo)
        [t_IsNotEqualToType serializeToChildOf:node withName:"t:IsNotEqualTo" value:_IsNotEqualTo];

    if (_IsGreaterThan)
        [t_IsGreaterThanType serializeToChildOf:node withName:"t:IsGreaterThan" value:_IsGreaterThan];

    if (_IsGreaterThanOrEqualTo)
        [t_IsGreaterThanOrEqualToType serializeToChildOf:node withName:"t:IsGreaterThanOrEqualTo" value:_IsGreaterThanOrEqualTo];

    if (_IsLessThan)
        [t_IsLessThanType serializeToChildOf:node withName:"t:IsLessThan" value:_IsLessThan];

    if (_IsLessThanOrEqualTo)
        [t_IsLessThanOrEqualToType serializeToChildOf:node withName:"t:IsLessThanOrEqualTo" value:_IsLessThanOrEqualTo];

    if (_Contains)
        [t_ContainsExpressionType serializeToChildOf:node withName:"t:Contains" value:_Contains];

    if (_Not)
        [t_NotType serializeToChildOf:node withName:"t:Not" value:_Not];

    if (_And)
        [t_AndType serializeToChildOf:node withName:"t:And" value:_And];

    if (_Or)
        [t_OrType serializeToChildOf:node withName:"t:Or" value:_Or];

}


- (t_ExistsType *)Exists {
    if (!_Exists) _Exists = [t_ExistsType new];
    return _Exists;
}

- (t_ExcludesType *)Excludes {
    if (!_Excludes) _Excludes = [t_ExcludesType new];
    return _Excludes;
}

- (t_IsEqualToType *)IsEqualTo {
    if (!_IsEqualTo) _IsEqualTo = [t_IsEqualToType new];
    return _IsEqualTo;
}

- (t_IsNotEqualToType *)IsNotEqualTo {
    if (!_IsNotEqualTo) _IsNotEqualTo = [t_IsNotEqualToType new];
    return _IsNotEqualTo;
}

- (t_IsGreaterThanType *)IsGreaterThan {
    if (!_IsGreaterThan) _IsGreaterThan = [t_IsGreaterThanType new];
    return _IsGreaterThan;
}

- (t_IsGreaterThanOrEqualToType *)IsGreaterThanOrEqualTo {
    if (!_IsGreaterThanOrEqualTo) _IsGreaterThanOrEqualTo = [t_IsGreaterThanOrEqualToType new];
    return _IsGreaterThanOrEqualTo;
}

- (t_IsLessThanType *)IsLessThan {
    if (!_IsLessThan) _IsLessThan = [t_IsLessThanType new];
    return _IsLessThan;
}

- (t_IsLessThanOrEqualToType *)IsLessThanOrEqualTo {
    if (!_IsLessThanOrEqualTo) _IsLessThanOrEqualTo = [t_IsLessThanOrEqualToType new];
    return _IsLessThanOrEqualTo;
}

- (t_ContainsExpressionType *)Contains {
    if (!_Contains) _Contains = [t_ContainsExpressionType new];
    return _Contains;
}

- (t_NotType *)Not {
    if (!_Not) _Not = [t_NotType new];
    return _Not;
}

- (t_AndType *)And {
    if (!_And) _And = [t_AndType new];
    return _And;
}

- (t_OrType *)Or {
    if (!_Or) _Or = [t_OrType new];
    return _Or;
}
+ (t_MultipleOperandBooleanExpressionType *)deserializeNode:(xmlNodePtr)cur {
    t_MultipleOperandBooleanExpressionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    NSMutableArray *SearchExpressionValues = nil;

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SearchExpression")) {
            Class elementClass = classForElement(cur) ?: [t_SearchExpressionType class];
            if (!SearchExpressionValues) SearchExpressionValues = [NSMutableArray new];
            [SearchExpressionValues addObject:[elementClass deserializeNode:cur]];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Exists")) {
            Class elementClass = classForElement(cur) ?: [t_ExistsType class];
            self.Exists = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Excludes")) {
            Class elementClass = classForElement(cur) ?: [t_ExcludesType class];
            self.Excludes = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsEqualTo")) {
            Class elementClass = classForElement(cur) ?: [t_IsEqualToType class];
            self.IsEqualTo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsNotEqualTo")) {
            Class elementClass = classForElement(cur) ?: [t_IsNotEqualToType class];
            self.IsNotEqualTo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsGreaterThan")) {
            Class elementClass = classForElement(cur) ?: [t_IsGreaterThanType class];
            self.IsGreaterThan = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsGreaterThanOrEqualTo")) {
            Class elementClass = classForElement(cur) ?: [t_IsGreaterThanOrEqualToType class];
            self.IsGreaterThanOrEqualTo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsLessThan")) {
            Class elementClass = classForElement(cur) ?: [t_IsLessThanType class];
            self.IsLessThan = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsLessThanOrEqualTo")) {
            Class elementClass = classForElement(cur) ?: [t_IsLessThanOrEqualToType class];
            self.IsLessThanOrEqualTo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Contains")) {
            Class elementClass = classForElement(cur) ?: [t_ContainsExpressionType class];
            self.Contains = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Not")) {
            Class elementClass = classForElement(cur) ?: [t_NotType class];
            self.Not = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"And")) {
            Class elementClass = classForElement(cur) ?: [t_AndType class];
            self.And = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Or")) {
            Class elementClass = classForElement(cur) ?: [t_OrType class];
            self.Or = [elementClass deserializeNode:cur];
        }
    }

    if (SearchExpressionValues) self.SearchExpression = SearchExpressionValues;
}
@end
@implementation t_OrType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_OrType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_OrType *)deserializeNode:(xmlNodePtr)cur {
    t_OrType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_TimeChangeType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TimeChangeType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"TimeZoneName" onNode:node value:_TimeZoneName];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Offset)
        [xsd_duration serializeToChildOf:node withName:"t:Offset" value:_Offset];

    if (_Time)
        [xsd_time serializeToChildOf:node withName:"t:Time" value:_Time];

}


+ (t_TimeChangeType *)deserializeNode:(xmlNodePtr)cur {
    t_TimeChangeType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.TimeZoneName = [xsd_string deserializeAttribute:"TimeZoneName" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Offset")) {
            Class elementClass = classForElement(cur) ?: [xsd_duration class];
            self.Offset = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Time")) {
            Class elementClass = classForElement(cur) ?: [xsd_time class];
            self.Time = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_ExceptionPropertyURIType_enumValues[] = {
    @"",
    @"attachment:Content",
    @"attachment:ContentType",
    @"attachment:Name",
    @"recurrence:DayOfMonth",
    @"recurrence:DayOfWeekIndex",
    @"recurrence:DaysOfWeek",
    @"recurrence:Interval",
    @"recurrence:Month",
    @"recurrence:NumberOfOccurrences",
    @"timezone:Offset",
};

@implementation t_ExceptionPropertyURIType
+ (t_ExceptionPropertyURITypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ExceptionPropertyURIType_enumValues) / sizeof(t_ExceptionPropertyURIType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ExceptionPropertyURIType_enumValues[i]])
            return (t_ExceptionPropertyURITypeEnum)i;
    }

    return t_ExceptionPropertyURIType_none;
}

+ (NSString *)stringFromValue:(t_ExceptionPropertyURITypeEnum)value {
    return t_ExceptionPropertyURIType_enumValues[(int)value];
}

+ (t_ExceptionPropertyURITypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ExceptionPropertyURIType_none;
}

+ (t_ExceptionPropertyURITypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ExceptionPropertyURITypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ExceptionPropertyURITypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
static NSString *t_UnindexedFieldURIType_enumValues[] = {
    @"",
    @"calendar:AdjacentMeetingCount",
    @"calendar:AdjacentMeetings",
    @"calendar:AllowNewTimeProposal",
    @"calendar:AppointmentReplyTime",
    @"calendar:AppointmentSequenceNumber",
    @"calendar:AppointmentState",
    @"calendar:CalendarItemType",
    @"calendar:ConferenceType",
    @"calendar:ConflictingMeetingCount",
    @"calendar:ConflictingMeetings",
    @"calendar:DateTimeStamp",
    @"calendar:DeletedOccurrences",
    @"calendar:Duration",
    @"calendar:End",
    @"calendar:EndTimeZone",
    @"calendar:FirstOccurrence",
    @"calendar:IsAllDayEvent",
    @"calendar:IsCancelled",
    @"calendar:IsMeeting",
    @"calendar:IsOnlineMeeting",
    @"calendar:IsRecurring",
    @"calendar:IsResponseRequested",
    @"calendar:LastOccurrence",
    @"calendar:LegacyFreeBusyStatus",
    @"calendar:Location",
    @"calendar:MeetingRequestWasSent",
    @"calendar:MeetingTimeZone",
    @"calendar:MeetingWorkspaceUrl",
    @"calendar:ModifiedOccurrences",
    @"calendar:MyResponseType",
    @"calendar:NetShowUrl",
    @"calendar:OptionalAttendees",
    @"calendar:Organizer",
    @"calendar:OriginalStart",
    @"calendar:Recurrence",
    @"calendar:RecurrenceId",
    @"calendar:RequiredAttendees",
    @"calendar:Resources",
    @"calendar:Start",
    @"calendar:StartTimeZone",
    @"calendar:TimeZone",
    @"calendar:UID",
    @"calendar:When",
    @"contacts:Alias",
    @"contacts:AssistantName",
    @"contacts:Birthday",
    @"contacts:BusinessHomePage",
    @"contacts:Children",
    @"contacts:Companies",
    @"contacts:CompanyName",
    @"contacts:CompleteName",
    @"contacts:ContactSource",
    @"contacts:Culture",
    @"contacts:Department",
    @"contacts:DirectReports",
    @"contacts:DirectoryId",
    @"contacts:DisplayName",
    @"contacts:EmailAddresses",
    @"contacts:FileAs",
    @"contacts:FileAsMapping",
    @"contacts:Generation",
    @"contacts:GivenName",
    @"contacts:HasPicture",
    @"contacts:ImAddresses",
    @"contacts:Initials",
    @"contacts:JobTitle",
    @"contacts:MSExchangeCertificate",
    @"contacts:Manager",
    @"contacts:ManagerMailbox",
    @"contacts:MiddleName",
    @"contacts:Mileage",
    @"contacts:Nickname",
    @"contacts:Notes",
    @"contacts:OfficeLocation",
    @"contacts:PhoneNumbers",
    @"contacts:PhoneticFirstName",
    @"contacts:PhoneticFullName",
    @"contacts:PhoneticLastName",
    @"contacts:Photo",
    @"contacts:PhysicalAddresses",
    @"contacts:PostalAddressIndex",
    @"contacts:Profession",
    @"contacts:SpouseName",
    @"contacts:Surname",
    @"contacts:UserSMIMECertificate",
    @"contacts:WeddingAnniversary",
    @"conversation:Categories",
    @"conversation:ConversationId",
    @"conversation:ConversationTopic",
    @"conversation:FlagStatus",
    @"conversation:GlobalCategories",
    @"conversation:GlobalFlagStatus",
    @"conversation:GlobalHasAttachments",
    @"conversation:GlobalImportance",
    @"conversation:GlobalItemClasses",
    @"conversation:GlobalItemIds",
    @"conversation:GlobalLastDeliveryTime",
    @"conversation:GlobalMessageCount",
    @"conversation:GlobalSize",
    @"conversation:GlobalUniqueRecipients",
    @"conversation:GlobalUniqueSenders",
    @"conversation:GlobalUniqueUnreadSenders",
    @"conversation:GlobalUnreadCount",
    @"conversation:HasAttachments",
    @"conversation:Importance",
    @"conversation:ItemClasses",
    @"conversation:ItemIds",
    @"conversation:LastDeliveryTime",
    @"conversation:MessageCount",
    @"conversation:Size",
    @"conversation:UniqueRecipients",
    @"conversation:UniqueSenders",
    @"conversation:UniqueUnreadSenders",
    @"conversation:UnreadCount",
    @"distributionlist:Members",
    @"folder:ChildFolderCount",
    @"folder:DisplayName",
    @"folder:EffectiveRights",
    @"folder:FolderClass",
    @"folder:FolderId",
    @"folder:ManagedFolderInformation",
    @"folder:ParentFolderId",
    @"folder:PermissionSet",
    @"folder:SearchParameters",
    @"folder:SharingEffectiveRights",
    @"folder:TotalCount",
    @"folder:UnreadCount",
    @"item:Attachments",
    @"item:Body",
    @"item:Categories",
    @"item:ConversationId",
    @"item:Culture",
    @"item:DateTimeCreated",
    @"item:DateTimeReceived",
    @"item:DateTimeSent",
    @"item:DisplayCc",
    @"item:DisplayTo",
    @"item:EffectiveRights",
    @"item:HasAttachments",
    @"item:Importance",
    @"item:InReplyTo",
    @"item:InternetMessageHeaders",
    @"item:IsAssociated",
    @"item:IsDraft",
    @"item:IsFromMe",
    @"item:IsResend",
    @"item:IsSubmitted",
    @"item:IsUnmodified",
    @"item:ItemClass",
    @"item:ItemId",
    @"item:LastModifiedName",
    @"item:LastModifiedTime",
    @"item:MimeContent",
    @"item:ParentFolderId",
    @"item:ReminderDueBy",
    @"item:ReminderIsSet",
    @"item:ReminderMinutesBeforeStart",
    @"item:ResponseObjects",
    @"item:Sensitivity",
    @"item:Size",
    @"item:StoreEntryId",
    @"item:Subject",
    @"item:UniqueBody",
    @"item:WebClientEditFormQueryString",
    @"item:WebClientReadFormQueryString",
    @"meeting:AssociatedCalendarItemId",
    @"meeting:HasBeenProcessed",
    @"meeting:IsDelegated",
    @"meeting:IsOutOfDate",
    @"meeting:ResponseType",
    @"meetingRequest:IntendedFreeBusyStatus",
    @"meetingRequest:MeetingRequestType",
    @"message:BccRecipients",
    @"message:CcRecipients",
    @"message:ConversationIndex",
    @"message:ConversationTopic",
    @"message:From",
    @"message:InternetMessageId",
    @"message:IsDeliveryReceiptRequested",
    @"message:IsRead",
    @"message:IsReadReceiptRequested",
    @"message:IsResponseRequested",
    @"message:ReceivedBy",
    @"message:ReceivedRepresenting",
    @"message:References",
    @"message:ReplyTo",
    @"message:Sender",
    @"message:ToRecipients",
    @"postitem:PostedTime",
    @"task:ActualWork",
    @"task:AssignedTime",
    @"task:BillingInformation",
    @"task:ChangeCount",
    @"task:Companies",
    @"task:CompleteDate",
    @"task:Contacts",
    @"task:DelegationState",
    @"task:Delegator",
    @"task:DueDate",
    @"task:IsAssignmentEditable",
    @"task:IsComplete",
    @"task:IsRecurring",
    @"task:IsTeamTask",
    @"task:Mileage",
    @"task:Owner",
    @"task:PercentComplete",
    @"task:Recurrence",
    @"task:StartDate",
    @"task:Status",
    @"task:StatusDescription",
    @"task:TotalWork",
};

@implementation t_UnindexedFieldURIType
+ (t_UnindexedFieldURITypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_UnindexedFieldURIType_enumValues) / sizeof(t_UnindexedFieldURIType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_UnindexedFieldURIType_enumValues[i]])
            return (t_UnindexedFieldURITypeEnum)i;
    }

    return t_UnindexedFieldURIType_none;
}

+ (NSString *)stringFromValue:(t_UnindexedFieldURITypeEnum)value {
    return t_UnindexedFieldURIType_enumValues[(int)value];
}

+ (t_UnindexedFieldURITypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_UnindexedFieldURIType_none;
}

+ (t_UnindexedFieldURITypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UnindexedFieldURITypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_UnindexedFieldURITypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_PathToUnindexedFieldType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PathToUnindexedFieldType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_UnindexedFieldURIType serializeToProperty:"FieldURI" onNode:node value:_FieldURI];
}

+ (t_PathToUnindexedFieldType *)deserializeNode:(xmlNodePtr)cur {
    t_PathToUnindexedFieldType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.FieldURI = [t_UnindexedFieldURIType deserializeAttribute:"FieldURI" ofNode:cur];
}
@end
@implementation t_TransitionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TransitionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_To)
        [t_TransitionTargetType serializeToChildOf:node withName:"t:To" value:_To];

}


- (t_TransitionTargetType *)To {
    if (!_To) _To = [t_TransitionTargetType new];
    return _To;
}
+ (t_TransitionType *)deserializeNode:(xmlNodePtr)cur {
    t_TransitionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"To")) {
            Class elementClass = classForElement(cur) ?: [t_TransitionTargetType class];
            self.To = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_RecurringTimeTransitionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RecurringTimeTransitionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_TimeOffset)
        [xsd_duration serializeToChildOf:node withName:"t:TimeOffset" value:_TimeOffset];

    if (_Month)
        [xsd_int serializeToChildOf:node withName:"t:Month" value:_Month];

}

+ (t_RecurringTimeTransitionType *)deserializeNode:(xmlNodePtr)cur {
    t_RecurringTimeTransitionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"TimeOffset")) {
            Class elementClass = classForElement(cur) ?: [xsd_duration class];
            self.TimeOffset = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Month")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.Month = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_RecurringDateTransitionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RecurringDateTransitionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Day)
        [xsd_int serializeToChildOf:node withName:"t:Day" value:_Day];

}

+ (t_RecurringDateTransitionType *)deserializeNode:(xmlNodePtr)cur {
    t_RecurringDateTransitionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Day")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.Day = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ArrayOfTimeZoneDefinitionType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"TimeZoneDefinition")) {
            Class elementClass = classForElement(child) ?: [t_TimeZoneDefinitionType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_TimeZoneDefinitionType * item in value)
        [t_TimeZoneDefinitionType serializeToChildOf:child withName:"t:TimeZoneDefinition" value:item];
}
@end
@implementation t_NonEmptyArrayOfItemChangeDescriptionsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"AppendToItemField")) {
            Class elementClass = classForElement(child) ?: [t_AppendToItemFieldType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SetItemField")) {
            Class elementClass = classForElement(child) ?: [t_SetItemFieldType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"DeleteItemField")) {
            Class elementClass = classForElement(child) ?: [t_DeleteItemFieldType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_AppendToItemFieldType class]])
            [t_AppendToItemFieldType serializeToChildOf:child withName:"t:AppendToItemField" value:item];
        else if ([item isMemberOfClass:[t_SetItemFieldType class]])
            [t_SetItemFieldType serializeToChildOf:child withName:"t:SetItemField" value:item];
        else if ([item isMemberOfClass:[t_DeleteItemFieldType class]])
            [t_DeleteItemFieldType serializeToChildOf:child withName:"t:DeleteItemField" value:item];
    }
}
@end
@implementation t_NonEmptyArrayOfAlternateIdsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"AlternateId")) {
            Class elementClass = classForElement(child) ?: [t_AlternateIdType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"AlternatePublicFolderId")) {
            Class elementClass = classForElement(child) ?: [t_AlternatePublicFolderIdType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"AlternatePublicFolderItemId")) {
            Class elementClass = classForElement(child) ?: [t_AlternatePublicFolderItemIdType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_AlternateIdType class]])
            [t_AlternateIdType serializeToChildOf:child withName:"t:AlternateId" value:item];
        else if ([item isMemberOfClass:[t_AlternatePublicFolderIdType class]])
            [t_AlternatePublicFolderIdType serializeToChildOf:child withName:"t:AlternatePublicFolderId" value:item];
        else if ([item isMemberOfClass:[t_AlternatePublicFolderItemIdType class]])
            [t_AlternatePublicFolderItemIdType serializeToChildOf:child withName:"t:AlternatePublicFolderItemId" value:item];
    }
}
@end
@implementation t_ArrayOfWorkingPeriod
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"WorkingPeriod")) {
            Class elementClass = classForElement(child) ?: [t_WorkingPeriod class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_WorkingPeriod * item in value)
        [t_WorkingPeriod serializeToChildOf:child withName:"t:WorkingPeriod" value:item];
}
@end
@implementation t_NonEmptyArrayOfPeriodsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Period")) {
            Class elementClass = classForElement(child) ?: [t_PeriodType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_PeriodType * item in value)
        [t_PeriodType serializeToChildOf:child withName:"t:Period" value:item];
}
@end
@implementation t_ArrayOfTransitionsGroupsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"TransitionsGroup")) {
            Class elementClass = classForElement(child) ?: [t_ArrayOfTransitionsType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_ArrayOfTransitionsType * item in value)
        [t_ArrayOfTransitionsType serializeToChildOf:child withName:"t:TransitionsGroup" value:item];
}
@end
@implementation t_TimeZoneDefinitionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TimeZoneDefinitionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"Id" onNode:node value:_Id_];
    [xsd_string serializeToProperty:"Name" onNode:node value:_Name];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Periods)
        [t_NonEmptyArrayOfPeriodsType serializeToChildOf:node withName:"t:Periods" value:_Periods];

    if (_TransitionsGroups)
        [t_ArrayOfTransitionsGroupsType serializeToChildOf:node withName:"t:TransitionsGroups" value:_TransitionsGroups];

    if (_Transitions)
        [t_ArrayOfTransitionsType serializeToChildOf:node withName:"t:Transitions" value:_Transitions];

}


- (t_ArrayOfTransitionsType *)Transitions {
    if (!_Transitions) _Transitions = [t_ArrayOfTransitionsType new];
    return _Transitions;
}

+ (t_TimeZoneDefinitionType *)deserializeNode:(xmlNodePtr)cur {
    t_TimeZoneDefinitionType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Id_ = [xsd_string deserializeAttribute:"Id" ofNode:cur];
    self.Name = [xsd_string deserializeAttribute:"Name" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Periods")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfPeriodsType class];
            self.Periods = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"TransitionsGroups")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfTransitionsGroupsType class];
            self.TransitionsGroups = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Transitions")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfTransitionsType class];
            self.Transitions = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_AttributePriority
+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return @([str doubleValue]);
}

+ (NSNumber *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return @([attrString doubleValue]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSNumber *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSNumber *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
static NSString *t_DefaultShapeNamesType_enumValues[] = {
    @"",
    @"AllProperties",
    @"Default",
    @"IdOnly",
};

@implementation t_DefaultShapeNamesType
+ (t_DefaultShapeNamesTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_DefaultShapeNamesType_enumValues) / sizeof(t_DefaultShapeNamesType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_DefaultShapeNamesType_enumValues[i]])
            return (t_DefaultShapeNamesTypeEnum)i;
    }

    return t_DefaultShapeNamesType_none;
}

+ (NSString *)stringFromValue:(t_DefaultShapeNamesTypeEnum)value {
    return t_DefaultShapeNamesType_enumValues[(int)value];
}

+ (t_DefaultShapeNamesTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_DefaultShapeNamesType_none;
}

+ (t_DefaultShapeNamesTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DefaultShapeNamesTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DefaultShapeNamesTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_NonEmptyArrayOfPathsToElementType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Path")) {
            Class elementClass = classForElement(child) ?: [t_BasePathToElementType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"FieldURI")) {
            Class elementClass = classForElement(child) ?: [t_PathToUnindexedFieldType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"IndexedFieldURI")) {
            Class elementClass = classForElement(child) ?: [t_PathToIndexedFieldType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ExtendedFieldURI")) {
            Class elementClass = classForElement(child) ?: [t_PathToExtendedFieldType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_BasePathToElementType class]])
            [t_BasePathToElementType serializeToChildOf:child withName:"t:Path" value:item];
        else if ([item isMemberOfClass:[t_PathToUnindexedFieldType class]])
            [t_PathToUnindexedFieldType serializeToChildOf:child withName:"t:FieldURI" value:item];
        else if ([item isMemberOfClass:[t_PathToIndexedFieldType class]])
            [t_PathToIndexedFieldType serializeToChildOf:child withName:"t:IndexedFieldURI" value:item];
        else if ([item isMemberOfClass:[t_PathToExtendedFieldType class]])
            [t_PathToExtendedFieldType serializeToChildOf:child withName:"t:ExtendedFieldURI" value:item];
    }
}
@end
@implementation t_FolderResponseShapeType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FolderResponseShapeType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_BaseShape)
        [t_DefaultShapeNamesType serializeToChildOf:node withName:"t:BaseShape" value:_BaseShape];

    if (_AdditionalProperties)
        [t_NonEmptyArrayOfPathsToElementType serializeToChildOf:node withName:"t:AdditionalProperties" value:_AdditionalProperties];

}

+ (t_FolderResponseShapeType *)deserializeNode:(xmlNodePtr)cur {
    t_FolderResponseShapeType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"BaseShape")) {
            self.BaseShape = [t_DefaultShapeNamesType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AdditionalProperties")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfPathsToElementType class];
            self.AdditionalProperties = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_NotificationEventTypeType_enumValues[] = {
    @"",
    @"CopiedEvent",
    @"CreatedEvent",
    @"DeletedEvent",
    @"FreeBusyChangedEvent",
    @"ModifiedEvent",
    @"MovedEvent",
    @"NewMailEvent",
};

@implementation t_NotificationEventTypeType
+ (t_NotificationEventTypeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_NotificationEventTypeType_enumValues) / sizeof(t_NotificationEventTypeType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_NotificationEventTypeType_enumValues[i]])
            return (t_NotificationEventTypeTypeEnum)i;
    }

    return t_NotificationEventTypeType_none;
}

+ (NSString *)stringFromValue:(t_NotificationEventTypeTypeEnum)value {
    return t_NotificationEventTypeType_enumValues[(int)value];
}

+ (t_NotificationEventTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_NotificationEventTypeType_none;
}

+ (t_NotificationEventTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_NotificationEventTypeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_NotificationEventTypeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_OccurrenceInfoType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_OccurrenceInfoType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ItemId)
        [t_ItemIdType serializeToChildOf:node withName:"t:ItemId" value:_ItemId];

    if (_Start)
        [xsd_dateTime serializeToChildOf:node withName:"t:Start" value:_Start];

    if (_End)
        [xsd_dateTime serializeToChildOf:node withName:"t:End" value:_End];

    if (_OriginalStart)
        [xsd_dateTime serializeToChildOf:node withName:"t:OriginalStart" value:_OriginalStart];

}


- (t_ItemIdType *)ItemId {
    if (!_ItemId) _ItemId = [t_ItemIdType new];
    return _ItemId;
}
+ (t_OccurrenceInfoType *)deserializeNode:(xmlNodePtr)cur {
    t_OccurrenceInfoType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ItemId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Start")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.Start = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"End")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.End = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"OriginalStart")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.OriginalStart = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_MailTipTypes
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_PostReplyItemBaseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PostReplyItemBaseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (t_PostReplyItemBaseType *)deserializeNode:(xmlNodePtr)cur {
    t_PostReplyItemBaseType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
static NSString *t_ConnectionStatusType_enumValues[] = {
    @"",
    @"Closed",
    @"OK",
};

@implementation t_ConnectionStatusType
+ (t_ConnectionStatusTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ConnectionStatusType_enumValues) / sizeof(t_ConnectionStatusType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ConnectionStatusType_enumValues[i]])
            return (t_ConnectionStatusTypeEnum)i;
    }

    return t_ConnectionStatusType_none;
}

+ (NSString *)stringFromValue:(t_ConnectionStatusTypeEnum)value {
    return t_ConnectionStatusType_enumValues[(int)value];
}

+ (t_ConnectionStatusTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ConnectionStatusType_none;
}

+ (t_ConnectionStatusTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConnectionStatusTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ConnectionStatusTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_MailboxData
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MailboxData *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Email)
        [t_EmailAddress serializeToChildOf:node withName:"t:Email" value:_Email];

    if (_AttendeeType)
        [t_MeetingAttendeeType serializeToChildOf:node withName:"t:AttendeeType" value:_AttendeeType];

    if (_ExcludeConflicts)
        [xsd_boolean serializeToChildOf:node withName:"t:ExcludeConflicts" value:_ExcludeConflicts];

}


- (t_EmailAddress *)Email {
    if (!_Email) _Email = [t_EmailAddress new];
    return _Email;
}
+ (t_MailboxData *)deserializeNode:(xmlNodePtr)cur {
    t_MailboxData *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Email")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddress class];
            self.Email = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AttendeeType")) {
            self.AttendeeType = [t_MeetingAttendeeType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExcludeConflicts")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.ExcludeConflicts = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_IsNotEqualToType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_IsNotEqualToType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_IsNotEqualToType *)deserializeNode:(xmlNodePtr)cur {
    t_IsNotEqualToType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
static NSString *t_IdFormatType_enumValues[] = {
    @"",
    @"EntryId",
    @"EwsId",
    @"EwsLegacyId",
    @"HexEntryId",
    @"OwaId",
    @"StoreId",
};

@implementation t_IdFormatType
+ (t_IdFormatTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_IdFormatType_enumValues) / sizeof(t_IdFormatType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_IdFormatType_enumValues[i]])
            return (t_IdFormatTypeEnum)i;
    }

    return t_IdFormatType_none;
}

+ (NSString *)stringFromValue:(t_IdFormatTypeEnum)value {
    return t_IdFormatType_enumValues[(int)value];
}

+ (t_IdFormatTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_IdFormatType_none;
}

+ (t_IdFormatTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_IdFormatTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_IdFormatTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_AlternateIdBaseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AlternateIdBaseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_IdFormatType serializeToProperty:"Format" onNode:node value:_Format];
}

+ (t_AlternateIdBaseType *)deserializeNode:(xmlNodePtr)cur {
    t_AlternateIdBaseType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Format = [t_IdFormatType deserializeAttribute:"Format" ofNode:cur];
}
@end
@implementation t_NonEmptyStringType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_AlternateIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AlternateIdType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [super addAttributesToNode:node];

    [xsd_string serializeToProperty:"Id" onNode:node value:_Id_];
    [t_NonEmptyStringType serializeToProperty:"Mailbox" onNode:node value:_Mailbox];
    [xsd_boolean serializeToProperty:"IsArchive" onNode:node value:_IsArchive];
}

+ (t_AlternateIdType *)deserializeNode:(xmlNodePtr)cur {
    t_AlternateIdType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    [super deserializeAttributesFromNode:cur];

    self.Id_ = [xsd_string deserializeAttribute:"Id" ofNode:cur];
    self.Mailbox = [t_NonEmptyStringType deserializeAttribute:"Mailbox" ofNode:cur];
    self.IsArchive = [xsd_boolean deserializeAttribute:"IsArchive" ofNode:cur];
}
@end
static NSString *t_PhoneCallStateType_enumValues[] = {
    @"",
    @"Alerted",
    @"Connected",
    @"Connecting",
    @"Disconnected",
    @"Forwarding",
    @"Idle",
    @"Incoming",
    @"Transferring",
};

@implementation t_PhoneCallStateType
+ (t_PhoneCallStateTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_PhoneCallStateType_enumValues) / sizeof(t_PhoneCallStateType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_PhoneCallStateType_enumValues[i]])
            return (t_PhoneCallStateTypeEnum)i;
    }

    return t_PhoneCallStateType_none;
}

+ (NSString *)stringFromValue:(t_PhoneCallStateTypeEnum)value {
    return t_PhoneCallStateType_enumValues[(int)value];
}

+ (t_PhoneCallStateTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_PhoneCallStateType_none;
}

+ (t_PhoneCallStateTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhoneCallStateTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_PhoneCallStateTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_RuleType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RuleType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_RuleId)
        [xsd_string serializeToChildOf:node withName:"t:RuleId" value:_RuleId];

    if (_DisplayName)
        [xsd_string serializeToChildOf:node withName:"t:DisplayName" value:_DisplayName];

    if (_Priority)
        [xsd_int serializeToChildOf:node withName:"t:Priority" value:_Priority];

    if (_IsEnabled)
        [xsd_boolean serializeToChildOf:node withName:"t:IsEnabled" value:_IsEnabled];

    if (_IsNotSupported)
        [xsd_boolean serializeToChildOf:node withName:"t:IsNotSupported" value:_IsNotSupported];

    if (_IsInError)
        [xsd_boolean serializeToChildOf:node withName:"t:IsInError" value:_IsInError];

    if (_Conditions)
        [t_RulePredicatesType serializeToChildOf:node withName:"t:Conditions" value:_Conditions];

    if (_Exceptions)
        [t_RulePredicatesType serializeToChildOf:node withName:"t:Exceptions" value:_Exceptions];

    if (_Actions)
        [t_RuleActionsType serializeToChildOf:node withName:"t:Actions" value:_Actions];

}


- (t_RulePredicatesType *)Conditions {
    if (!_Conditions) _Conditions = [t_RulePredicatesType new];
    return _Conditions;
}

- (t_RulePredicatesType *)Exceptions {
    if (!_Exceptions) _Exceptions = [t_RulePredicatesType new];
    return _Exceptions;
}

- (t_RuleActionsType *)Actions {
    if (!_Actions) _Actions = [t_RuleActionsType new];
    return _Actions;
}
+ (t_RuleType *)deserializeNode:(xmlNodePtr)cur {
    t_RuleType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"RuleId")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.RuleId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DisplayName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.DisplayName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Priority")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.Priority = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsEnabled")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsEnabled = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsNotSupported")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsNotSupported = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsInError")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsInError = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Conditions")) {
            Class elementClass = classForElement(cur) ?: [t_RulePredicatesType class];
            self.Conditions = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Exceptions")) {
            Class elementClass = classForElement(cur) ?: [t_RulePredicatesType class];
            self.Exceptions = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Actions")) {
            Class elementClass = classForElement(cur) ?: [t_RuleActionsType class];
            self.Actions = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_AndType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AndType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_AndType *)deserializeNode:(xmlNodePtr)cur {
    t_AndType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_ServiceConfiguration
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ServiceConfiguration *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (t_ServiceConfiguration *)deserializeNode:(xmlNodePtr)cur {
    t_ServiceConfiguration *newObject = [self new];


    return newObject;
}
@end
@implementation t_MailTipsServiceConfiguration
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MailTipsServiceConfiguration *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_MailTipsEnabled)
        [xsd_boolean serializeToChildOf:node withName:"t:MailTipsEnabled" value:_MailTipsEnabled];

    if (_MaxRecipientsPerGetMailTipsRequest)
        [xsd_int serializeToChildOf:node withName:"t:MaxRecipientsPerGetMailTipsRequest" value:_MaxRecipientsPerGetMailTipsRequest];

    if (_MaxMessageSize)
        [xsd_int serializeToChildOf:node withName:"t:MaxMessageSize" value:_MaxMessageSize];

    if (_LargeAudienceThreshold)
        [xsd_int serializeToChildOf:node withName:"t:LargeAudienceThreshold" value:_LargeAudienceThreshold];

    if (_ShowExternalRecipientCount)
        [xsd_boolean serializeToChildOf:node withName:"t:ShowExternalRecipientCount" value:_ShowExternalRecipientCount];

    if (_InternalDomains)
        [t_SmtpDomainList serializeToChildOf:node withName:"t:InternalDomains" value:_InternalDomains];

}

+ (t_MailTipsServiceConfiguration *)deserializeNode:(xmlNodePtr)cur {
    t_MailTipsServiceConfiguration *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"MailTipsEnabled")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.MailTipsEnabled = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MaxRecipientsPerGetMailTipsRequest")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.MaxRecipientsPerGetMailTipsRequest = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MaxMessageSize")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.MaxMessageSize = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"LargeAudienceThreshold")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.LargeAudienceThreshold = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ShowExternalRecipientCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.ShowExternalRecipientCount = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"InternalDomains")) {
            Class elementClass = classForElement(cur) ?: [t_SmtpDomainList class];
            self.InternalDomains = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_SearchFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SearchFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_SearchParameters)
        [t_SearchParametersType serializeToChildOf:node withName:"t:SearchParameters" value:_SearchParameters];

}


- (t_SearchParametersType *)SearchParameters {
    if (!_SearchParameters) _SearchParameters = [t_SearchParametersType new];
    return _SearchParameters;
}
+ (t_SearchFolderType *)deserializeNode:(xmlNodePtr)cur {
    t_SearchFolderType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SearchParameters")) {
            Class elementClass = classForElement(cur) ?: [t_SearchParametersType class];
            self.SearchParameters = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_NonEmptyArrayOfGroupIdentifiersType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"GroupIdentifier")) {
            Class elementClass = classForElement(child) ?: [t_SidAndAttributesType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_SidAndAttributesType * item in value)
        [t_SidAndAttributesType serializeToChildOf:child withName:"t:GroupIdentifier" value:item];
}
@end
@implementation t_NonEmptyArrayOfRestrictedGroupIdentifiersType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"RestrictedGroupIdentifier")) {
            Class elementClass = classForElement(child) ?: [t_SidAndAttributesType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_SidAndAttributesType * item in value)
        [t_SidAndAttributesType serializeToChildOf:child withName:"t:RestrictedGroupIdentifier" value:item];
}
@end
@implementation t_SerializedSecurityContextType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SerializedSecurityContextType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_UserSid)
        [xsd_string serializeToChildOf:node withName:"t:UserSid" value:_UserSid];

    if (_GroupSids)
        [t_NonEmptyArrayOfGroupIdentifiersType serializeToChildOf:node withName:"t:GroupSids" value:_GroupSids];

    if (_RestrictedGroupSids)
        [t_NonEmptyArrayOfRestrictedGroupIdentifiersType serializeToChildOf:node withName:"t:RestrictedGroupSids" value:_RestrictedGroupSids];

    if (_PrimarySmtpAddress)
        [xsd_string serializeToChildOf:node withName:"t:PrimarySmtpAddress" value:_PrimarySmtpAddress];

}

+ (t_SerializedSecurityContextType *)deserializeNode:(xmlNodePtr)cur {
    t_SerializedSecurityContextType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"UserSid")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.UserSid = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GroupSids")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfGroupIdentifiersType class];
            self.GroupSids = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RestrictedGroupSids")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfRestrictedGroupIdentifiersType class];
            self.RestrictedGroupSids = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PrimarySmtpAddress")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.PrimarySmtpAddress = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_PermissionLevelType_enumValues[] = {
    @"",
    @"Author",
    @"Contributor",
    @"Custom",
    @"Editor",
    @"None",
    @"NoneditingAuthor",
    @"Owner",
    @"PublishingAuthor",
    @"PublishingEditor",
    @"Reviewer",
};

@implementation t_PermissionLevelType
+ (t_PermissionLevelTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_PermissionLevelType_enumValues) / sizeof(t_PermissionLevelType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_PermissionLevelType_enumValues[i]])
            return (t_PermissionLevelTypeEnum)i;
    }

    return t_PermissionLevelType_none;
}

+ (NSString *)stringFromValue:(t_PermissionLevelTypeEnum)value {
    return t_PermissionLevelType_enumValues[(int)value];
}

+ (t_PermissionLevelTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_PermissionLevelType_none;
}

+ (t_PermissionLevelTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PermissionLevelTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_PermissionLevelTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
static NSString *t_ResponseTypeType_enumValues[] = {
    @"",
    @"Accept",
    @"Decline",
    @"NoResponseReceived",
    @"Organizer",
    @"Tentative",
    @"Unknown",
};

@implementation t_ResponseTypeType
+ (t_ResponseTypeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ResponseTypeType_enumValues) / sizeof(t_ResponseTypeType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ResponseTypeType_enumValues[i]])
            return (t_ResponseTypeTypeEnum)i;
    }

    return t_ResponseTypeType_none;
}

+ (NSString *)stringFromValue:(t_ResponseTypeTypeEnum)value {
    return t_ResponseTypeType_enumValues[(int)value];
}

+ (t_ResponseTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ResponseTypeType_none;
}

+ (t_ResponseTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ResponseTypeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ResponseTypeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_MeetingMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MeetingMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_AssociatedCalendarItemId)
        [t_ItemIdType serializeToChildOf:node withName:"t:AssociatedCalendarItemId" value:_AssociatedCalendarItemId];

    if (_IsDelegated)
        [xsd_boolean serializeToChildOf:node withName:"t:IsDelegated" value:_IsDelegated];

    if (_IsOutOfDate)
        [xsd_boolean serializeToChildOf:node withName:"t:IsOutOfDate" value:_IsOutOfDate];

    if (_HasBeenProcessed)
        [xsd_boolean serializeToChildOf:node withName:"t:HasBeenProcessed" value:_HasBeenProcessed];

    if (_ResponseType)
        [t_ResponseTypeType serializeToChildOf:node withName:"t:ResponseType" value:_ResponseType];

    if (_UID)
        [xsd_string serializeToChildOf:node withName:"t:UID" value:_UID];

    if (_RecurrenceId)
        [xsd_dateTime serializeToChildOf:node withName:"t:RecurrenceId" value:_RecurrenceId];

    if (_DateTimeStamp)
        [xsd_dateTime serializeToChildOf:node withName:"t:DateTimeStamp" value:_DateTimeStamp];

}


- (t_ItemIdType *)AssociatedCalendarItemId {
    if (!_AssociatedCalendarItemId) _AssociatedCalendarItemId = [t_ItemIdType new];
    return _AssociatedCalendarItemId;
}
+ (t_MeetingMessageType *)deserializeNode:(xmlNodePtr)cur {
    t_MeetingMessageType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"AssociatedCalendarItemId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.AssociatedCalendarItemId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsDelegated")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsDelegated = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsOutOfDate")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsOutOfDate = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"HasBeenProcessed")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.HasBeenProcessed = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ResponseType")) {
            self.ResponseType = [t_ResponseTypeType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"UID")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.UID = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RecurrenceId")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.RecurrenceId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DateTimeStamp")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.DateTimeStamp = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_PermissionActionType_enumValues[] = {
    @"",
    @"All",
    @"None",
    @"Owned",
};

@implementation t_PermissionActionType
+ (t_PermissionActionTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_PermissionActionType_enumValues) / sizeof(t_PermissionActionType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_PermissionActionType_enumValues[i]])
            return (t_PermissionActionTypeEnum)i;
    }

    return t_PermissionActionType_none;
}

+ (NSString *)stringFromValue:(t_PermissionActionTypeEnum)value {
    return t_PermissionActionType_enumValues[(int)value];
}

+ (t_PermissionActionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_PermissionActionType_none;
}

+ (t_PermissionActionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PermissionActionTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_PermissionActionTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_AttendeeConflictData
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AttendeeConflictData *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (t_AttendeeConflictData *)deserializeNode:(xmlNodePtr)cur {
    t_AttendeeConflictData *newObject = [self new];


    return newObject;
}
@end
static NSString *t_LegacyFreeBusyType_enumValues[] = {
    @"",
    @"Busy",
    @"Free",
    @"NoData",
    @"OOF",
    @"Tentative",
};

@implementation t_LegacyFreeBusyType
+ (t_LegacyFreeBusyTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_LegacyFreeBusyType_enumValues) / sizeof(t_LegacyFreeBusyType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_LegacyFreeBusyType_enumValues[i]])
            return (t_LegacyFreeBusyTypeEnum)i;
    }

    return t_LegacyFreeBusyType_none;
}

+ (NSString *)stringFromValue:(t_LegacyFreeBusyTypeEnum)value {
    return t_LegacyFreeBusyType_enumValues[(int)value];
}

+ (t_LegacyFreeBusyTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_LegacyFreeBusyType_none;
}

+ (t_LegacyFreeBusyTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_LegacyFreeBusyTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_LegacyFreeBusyTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_IndividualAttendeeConflictData
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_IndividualAttendeeConflictData *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_BusyType)
        [t_LegacyFreeBusyType serializeToChildOf:node withName:"t:BusyType" value:_BusyType];

}

+ (t_IndividualAttendeeConflictData *)deserializeNode:(xmlNodePtr)cur {
    t_IndividualAttendeeConflictData *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"BusyType")) {
            self.BusyType = [t_LegacyFreeBusyType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation t_NonEmptyArrayOfRequestAttachmentIdsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"AttachmentId")) {
            Class elementClass = classForElement(child) ?: [t_RequestAttachmentIdType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_RequestAttachmentIdType * item in value)
        [t_RequestAttachmentIdType serializeToChildOf:child withName:"t:AttachmentId" value:item];
}
@end
@implementation t_NonEmptyArrayOfNotificationEventTypesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"EventType")) {
            Class elementClass = classForElement(child) ?: [t_NotificationEventTypeType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (NSNumber *item in value)
        [t_NotificationEventTypeType serializeToChildOf:child withName:"t:EventType" value:(t_NotificationEventTypeTypeEnum)[item intValue]];
}
@end
@implementation t_BaseSubscriptionRequestType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BaseSubscriptionRequestType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_boolean serializeToProperty:"SubscribeToAllFolders" onNode:node value:_SubscribeToAllFolders];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FolderIds)
        [t_NonEmptyArrayOfBaseFolderIdsType serializeToChildOf:node withName:"t:FolderIds" value:_FolderIds];

    if (_EventTypes)
        [t_NonEmptyArrayOfNotificationEventTypesType serializeToChildOf:node withName:"t:EventTypes" value:_EventTypes];

    if (_Watermark)
        [t_WatermarkType serializeToChildOf:node withName:"t:Watermark" value:_Watermark];

}


+ (t_BaseSubscriptionRequestType *)deserializeNode:(xmlNodePtr)cur {
    t_BaseSubscriptionRequestType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.SubscribeToAllFolders = [xsd_boolean deserializeAttribute:"SubscribeToAllFolders" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseFolderIdsType class];
            self.FolderIds = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EventTypes")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfNotificationEventTypesType class];
            self.EventTypes = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Watermark")) {
            Class elementClass = classForElement(cur) ?: [t_WatermarkType class];
            self.Watermark = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_SubscriptionStatusFrequencyType
+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return @([str doubleValue]);
}

+ (NSNumber *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return @([attrString doubleValue]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSNumber *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSNumber *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_PushSubscriptionRequestType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PushSubscriptionRequestType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_StatusFrequency)
        [t_SubscriptionStatusFrequencyType serializeToChildOf:node withName:"t:StatusFrequency" value:_StatusFrequency];

    if (_URL)
        [xsd_string serializeToChildOf:node withName:"t:URL" value:_URL];

}

+ (t_PushSubscriptionRequestType *)deserializeNode:(xmlNodePtr)cur {
    t_PushSubscriptionRequestType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"StatusFrequency")) {
            Class elementClass = classForElement(cur) ?: [t_SubscriptionStatusFrequencyType class];
            self.StatusFrequency = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"URL")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.URL = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_MessageTrackingReportTemplateType_enumValues[] = {
    @"",
    @"RecipientPath",
    @"Summary",
};

@implementation t_MessageTrackingReportTemplateType
+ (t_MessageTrackingReportTemplateTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_MessageTrackingReportTemplateType_enumValues) / sizeof(t_MessageTrackingReportTemplateType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_MessageTrackingReportTemplateType_enumValues[i]])
            return (t_MessageTrackingReportTemplateTypeEnum)i;
    }

    return t_MessageTrackingReportTemplateType_none;
}

+ (NSString *)stringFromValue:(t_MessageTrackingReportTemplateTypeEnum)value {
    return t_MessageTrackingReportTemplateType_enumValues[(int)value];
}

+ (t_MessageTrackingReportTemplateTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_MessageTrackingReportTemplateType_none;
}

+ (t_MessageTrackingReportTemplateTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MessageTrackingReportTemplateTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MessageTrackingReportTemplateTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
static NSString *t_BodyTypeResponseType_enumValues[] = {
    @"",
    @"Best",
    @"HTML",
    @"Text",
};

@implementation t_BodyTypeResponseType
+ (t_BodyTypeResponseTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_BodyTypeResponseType_enumValues) / sizeof(t_BodyTypeResponseType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_BodyTypeResponseType_enumValues[i]])
            return (t_BodyTypeResponseTypeEnum)i;
    }

    return t_BodyTypeResponseType_none;
}

+ (NSString *)stringFromValue:(t_BodyTypeResponseTypeEnum)value {
    return t_BodyTypeResponseType_enumValues[(int)value];
}

+ (t_BodyTypeResponseTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_BodyTypeResponseType_none;
}

+ (t_BodyTypeResponseTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BodyTypeResponseTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_BodyTypeResponseTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ItemResponseShapeType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ItemResponseShapeType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_BaseShape)
        [t_DefaultShapeNamesType serializeToChildOf:node withName:"t:BaseShape" value:_BaseShape];

    if (_IncludeMimeContent)
        [xsd_boolean serializeToChildOf:node withName:"t:IncludeMimeContent" value:_IncludeMimeContent];

    if (_BodyType)
        [t_BodyTypeResponseType serializeToChildOf:node withName:"t:BodyType" value:_BodyType];

    if (_FilterHtmlContent)
        [xsd_boolean serializeToChildOf:node withName:"t:FilterHtmlContent" value:_FilterHtmlContent];

    if (_ConvertHtmlCodePageToUTF8)
        [xsd_boolean serializeToChildOf:node withName:"t:ConvertHtmlCodePageToUTF8" value:_ConvertHtmlCodePageToUTF8];

    if (_AdditionalProperties)
        [t_NonEmptyArrayOfPathsToElementType serializeToChildOf:node withName:"t:AdditionalProperties" value:_AdditionalProperties];

}

+ (t_ItemResponseShapeType *)deserializeNode:(xmlNodePtr)cur {
    t_ItemResponseShapeType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"BaseShape")) {
            self.BaseShape = [t_DefaultShapeNamesType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IncludeMimeContent")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IncludeMimeContent = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"BodyType")) {
            self.BodyType = [t_BodyTypeResponseType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FilterHtmlContent")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.FilterHtmlContent = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConvertHtmlCodePageToUTF8")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.ConvertHtmlCodePageToUTF8 = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AdditionalProperties")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfPathsToElementType class];
            self.AdditionalProperties = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ArrayOfTrackingPropertiesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"TrackingPropertyType")) {
            Class elementClass = classForElement(child) ?: [t_TrackingPropertyType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_TrackingPropertyType * item in value)
        [t_TrackingPropertyType serializeToChildOf:child withName:"t:TrackingPropertyType" value:item];
}
@end
@implementation t_BaseEmailAddressType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BaseEmailAddressType *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (t_BaseEmailAddressType *)deserializeNode:(xmlNodePtr)cur {
    t_BaseEmailAddressType *newObject = [self new];


    return newObject;
}
@end
static NSString *t_MonthNamesType_enumValues[] = {
    @"",
    @"April",
    @"August",
    @"December",
    @"February",
    @"January",
    @"July",
    @"June",
    @"March",
    @"May",
    @"November",
    @"October",
    @"September",
};

@implementation t_MonthNamesType
+ (t_MonthNamesTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_MonthNamesType_enumValues) / sizeof(t_MonthNamesType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_MonthNamesType_enumValues[i]])
            return (t_MonthNamesTypeEnum)i;
    }

    return t_MonthNamesType_none;
}

+ (NSString *)stringFromValue:(t_MonthNamesTypeEnum)value {
    return t_MonthNamesType_enumValues[(int)value];
}

+ (t_MonthNamesTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_MonthNamesType_none;
}

+ (t_MonthNamesTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MonthNamesTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MonthNamesTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_RelativeYearlyRecurrencePatternType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RelativeYearlyRecurrencePatternType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_DaysOfWeek)
        [t_DayOfWeekType serializeToChildOf:node withName:"t:DaysOfWeek" value:_DaysOfWeek];

    if (_DayOfWeekIndex)
        [t_DayOfWeekIndexType serializeToChildOf:node withName:"t:DayOfWeekIndex" value:_DayOfWeekIndex];

    if (_Month)
        [t_MonthNamesType serializeToChildOf:node withName:"t:Month" value:_Month];

}

+ (t_RelativeYearlyRecurrencePatternType *)deserializeNode:(xmlNodePtr)cur {
    t_RelativeYearlyRecurrencePatternType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"DaysOfWeek")) {
            self.DaysOfWeek = [t_DayOfWeekType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DayOfWeekIndex")) {
            self.DayOfWeekIndex = [t_DayOfWeekIndexType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Month")) {
            self.Month = [t_MonthNamesType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation t_ResolutionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ResolutionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Mailbox)
        [t_EmailAddressType serializeToChildOf:node withName:"t:Mailbox" value:_Mailbox];

    if (_Contact)
        [t_ContactItemType serializeToChildOf:node withName:"t:Contact" value:_Contact];

}


- (t_EmailAddressType *)Mailbox {
    if (!_Mailbox) _Mailbox = [t_EmailAddressType new];
    return _Mailbox;
}

- (t_ContactItemType *)Contact {
    if (!_Contact) _Contact = [t_ContactItemType new];
    return _Contact;
}
+ (t_ResolutionType *)deserializeNode:(xmlNodePtr)cur {
    t_ResolutionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Mailbox")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.Mailbox = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Contact")) {
            Class elementClass = classForElement(cur) ?: [t_ContactItemType class];
            self.Contact = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_NonEmptyArrayOfAllItemsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Item")) {
            Class elementClass = classForElement(child) ?: [t_ItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"Message")) {
            Class elementClass = classForElement(child) ?: [t_MessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"CalendarItem")) {
            Class elementClass = classForElement(child) ?: [t_CalendarItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"Contact")) {
            Class elementClass = classForElement(child) ?: [t_ContactItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"DistributionList")) {
            Class elementClass = classForElement(child) ?: [t_DistributionListType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"MeetingMessage")) {
            Class elementClass = classForElement(child) ?: [t_MeetingMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"MeetingRequest")) {
            Class elementClass = classForElement(child) ?: [t_MeetingRequestMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"MeetingResponse")) {
            Class elementClass = classForElement(child) ?: [t_MeetingResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"MeetingCancellation")) {
            Class elementClass = classForElement(child) ?: [t_MeetingCancellationMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"Task")) {
            Class elementClass = classForElement(child) ?: [t_TaskType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"PostItem")) {
            Class elementClass = classForElement(child) ?: [t_PostItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ReplyToItem")) {
            Class elementClass = classForElement(child) ?: [t_ReplyToItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ForwardItem")) {
            Class elementClass = classForElement(child) ?: [t_ForwardItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ReplyAllToItem")) {
            Class elementClass = classForElement(child) ?: [t_ReplyAllToItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"AcceptItem")) {
            Class elementClass = classForElement(child) ?: [t_AcceptItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"TentativelyAcceptItem")) {
            Class elementClass = classForElement(child) ?: [t_TentativelyAcceptItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"DeclineItem")) {
            Class elementClass = classForElement(child) ?: [t_DeclineItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"CancelCalendarItem")) {
            Class elementClass = classForElement(child) ?: [t_CancelCalendarItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"RemoveItem")) {
            Class elementClass = classForElement(child) ?: [t_RemoveItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SuppressReadReceipt")) {
            Class elementClass = classForElement(child) ?: [t_SuppressReadReceiptType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"PostReplyItem")) {
            Class elementClass = classForElement(child) ?: [t_PostReplyItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"AcceptSharingInvitation")) {
            Class elementClass = classForElement(child) ?: [t_AcceptSharingInvitationType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_ItemType class]])
            [t_ItemType serializeToChildOf:child withName:"t:Item" value:item];
        else if ([item isMemberOfClass:[t_MessageType class]])
            [t_MessageType serializeToChildOf:child withName:"t:Message" value:item];
        else if ([item isMemberOfClass:[t_CalendarItemType class]])
            [t_CalendarItemType serializeToChildOf:child withName:"t:CalendarItem" value:item];
        else if ([item isMemberOfClass:[t_ContactItemType class]])
            [t_ContactItemType serializeToChildOf:child withName:"t:Contact" value:item];
        else if ([item isMemberOfClass:[t_DistributionListType class]])
            [t_DistributionListType serializeToChildOf:child withName:"t:DistributionList" value:item];
        else if ([item isMemberOfClass:[t_MeetingMessageType class]])
            [t_MeetingMessageType serializeToChildOf:child withName:"t:MeetingMessage" value:item];
        else if ([item isMemberOfClass:[t_MeetingRequestMessageType class]])
            [t_MeetingRequestMessageType serializeToChildOf:child withName:"t:MeetingRequest" value:item];
        else if ([item isMemberOfClass:[t_MeetingResponseMessageType class]])
            [t_MeetingResponseMessageType serializeToChildOf:child withName:"t:MeetingResponse" value:item];
        else if ([item isMemberOfClass:[t_MeetingCancellationMessageType class]])
            [t_MeetingCancellationMessageType serializeToChildOf:child withName:"t:MeetingCancellation" value:item];
        else if ([item isMemberOfClass:[t_TaskType class]])
            [t_TaskType serializeToChildOf:child withName:"t:Task" value:item];
        else if ([item isMemberOfClass:[t_PostItemType class]])
            [t_PostItemType serializeToChildOf:child withName:"t:PostItem" value:item];
        else if ([item isMemberOfClass:[t_ReplyToItemType class]])
            [t_ReplyToItemType serializeToChildOf:child withName:"t:ReplyToItem" value:item];
        else if ([item isMemberOfClass:[t_ForwardItemType class]])
            [t_ForwardItemType serializeToChildOf:child withName:"t:ForwardItem" value:item];
        else if ([item isMemberOfClass:[t_ReplyAllToItemType class]])
            [t_ReplyAllToItemType serializeToChildOf:child withName:"t:ReplyAllToItem" value:item];
        else if ([item isMemberOfClass:[t_AcceptItemType class]])
            [t_AcceptItemType serializeToChildOf:child withName:"t:AcceptItem" value:item];
        else if ([item isMemberOfClass:[t_TentativelyAcceptItemType class]])
            [t_TentativelyAcceptItemType serializeToChildOf:child withName:"t:TentativelyAcceptItem" value:item];
        else if ([item isMemberOfClass:[t_DeclineItemType class]])
            [t_DeclineItemType serializeToChildOf:child withName:"t:DeclineItem" value:item];
        else if ([item isMemberOfClass:[t_CancelCalendarItemType class]])
            [t_CancelCalendarItemType serializeToChildOf:child withName:"t:CancelCalendarItem" value:item];
        else if ([item isMemberOfClass:[t_RemoveItemType class]])
            [t_RemoveItemType serializeToChildOf:child withName:"t:RemoveItem" value:item];
        else if ([item isMemberOfClass:[t_SuppressReadReceiptType class]])
            [t_SuppressReadReceiptType serializeToChildOf:child withName:"t:SuppressReadReceipt" value:item];
        else if ([item isMemberOfClass:[t_PostReplyItemType class]])
            [t_PostReplyItemType serializeToChildOf:child withName:"t:PostReplyItem" value:item];
        else if ([item isMemberOfClass:[t_AcceptSharingInvitationType class]])
            [t_AcceptSharingInvitationType serializeToChildOf:child withName:"t:AcceptSharingInvitation" value:item];
    }
}
@end
@implementation t_BaseItemIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BaseItemIdType *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (t_BaseItemIdType *)deserializeNode:(xmlNodePtr)cur {
    t_BaseItemIdType *newObject = [self new];


    return newObject;
}
@end
@implementation t_OccurrenceItemIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_OccurrenceItemIdType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_DerivedItemIdType serializeToProperty:"RecurringMasterId" onNode:node value:_RecurringMasterId];
    [xsd_string serializeToProperty:"ChangeKey" onNode:node value:_ChangeKey];
    [xsd_int serializeToProperty:"InstanceIndex" onNode:node value:_InstanceIndex];
}

+ (t_OccurrenceItemIdType *)deserializeNode:(xmlNodePtr)cur {
    t_OccurrenceItemIdType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.RecurringMasterId = [t_DerivedItemIdType deserializeAttribute:"RecurringMasterId" ofNode:cur];
    self.ChangeKey = [xsd_string deserializeAttribute:"ChangeKey" ofNode:cur];
    self.InstanceIndex = [xsd_int deserializeAttribute:"InstanceIndex" ofNode:cur];
}
@end
@implementation t_UnknownAttendeeConflictData
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UnknownAttendeeConflictData *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (t_UnknownAttendeeConflictData *)deserializeNode:(xmlNodePtr)cur {
    t_UnknownAttendeeConflictData *newObject = [self new];


    return newObject;
}
@end
static NSString *t_ConversationActionTypeType_enumValues[] = {
    @"",
    @"AlwaysCategorize",
    @"AlwaysDelete",
    @"AlwaysMove",
    @"Copy",
    @"Delete",
    @"Move",
    @"SetReadState",
};

@implementation t_ConversationActionTypeType
+ (t_ConversationActionTypeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ConversationActionTypeType_enumValues) / sizeof(t_ConversationActionTypeType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ConversationActionTypeType_enumValues[i]])
            return (t_ConversationActionTypeTypeEnum)i;
    }

    return t_ConversationActionTypeType_none;
}

+ (NSString *)stringFromValue:(t_ConversationActionTypeTypeEnum)value {
    return t_ConversationActionTypeType_enumValues[(int)value];
}

+ (t_ConversationActionTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ConversationActionTypeType_none;
}

+ (t_ConversationActionTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConversationActionTypeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ConversationActionTypeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_TargetFolderIdType
+ (id)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = nil;
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;
        else if (xmlStrEqual(child->name, (const xmlChar *)"FolderId")) {
            Class elementClass = classForElement(child) ?: [t_FolderIdType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"DistinguishedFolderId")) {
            Class elementClass = classForElement(child) ?: [t_DistinguishedFolderIdType class];
            return [elementClass deserializeNode:child];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(id)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    if (false);
    else if ([value isMemberOfClass:[t_FolderIdType class]])
        [t_FolderIdType serializeToChildOf:child withName:"t:FolderId" value:value];
    else if ([value isMemberOfClass:[t_DistinguishedFolderIdType class]])
        [t_DistinguishedFolderIdType serializeToChildOf:child withName:"t:DistinguishedFolderId" value:value];
}
@end
static NSString *t_DisposalType_enumValues[] = {
    @"",
    @"HardDelete",
    @"MoveToDeletedItems",
    @"SoftDelete",
};

@implementation t_DisposalType
+ (t_DisposalTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_DisposalType_enumValues) / sizeof(t_DisposalType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_DisposalType_enumValues[i]])
            return (t_DisposalTypeEnum)i;
    }

    return t_DisposalType_none;
}

+ (NSString *)stringFromValue:(t_DisposalTypeEnum)value {
    return t_DisposalType_enumValues[(int)value];
}

+ (t_DisposalTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_DisposalType_none;
}

+ (t_DisposalTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DisposalTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DisposalTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ConversationActionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConversationActionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Action)
        [t_ConversationActionTypeType serializeToChildOf:node withName:"t:Action" value:_Action];

    if (_ConversationId)
        [t_ItemIdType serializeToChildOf:node withName:"t:ConversationId" value:_ConversationId];

    if (_ContextFolderId)
        [t_TargetFolderIdType serializeToChildOf:node withName:"t:ContextFolderId" value:_ContextFolderId];

    if (_ConversationLastSyncTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:ConversationLastSyncTime" value:_ConversationLastSyncTime];

    if (_ProcessRightAway)
        [xsd_boolean serializeToChildOf:node withName:"t:ProcessRightAway" value:_ProcessRightAway];

    if (_DestinationFolderId)
        [t_TargetFolderIdType serializeToChildOf:node withName:"t:DestinationFolderId" value:_DestinationFolderId];

    if (_Categories)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:Categories" value:_Categories];

    if (_EnableAlwaysDelete)
        [xsd_boolean serializeToChildOf:node withName:"t:EnableAlwaysDelete" value:_EnableAlwaysDelete];

    if (_IsRead)
        [xsd_boolean serializeToChildOf:node withName:"t:IsRead" value:_IsRead];

    if (_DeleteType)
        [t_DisposalType serializeToChildOf:node withName:"t:DeleteType" value:_DeleteType];

}


- (t_ItemIdType *)ConversationId {
    if (!_ConversationId) _ConversationId = [t_ItemIdType new];
    return _ConversationId;
}
+ (t_ConversationActionType *)deserializeNode:(xmlNodePtr)cur {
    t_ConversationActionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Action")) {
            self.Action = [t_ConversationActionTypeType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConversationId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ConversationId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContextFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_TargetFolderIdType class];
            self.ContextFolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConversationLastSyncTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.ConversationLastSyncTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ProcessRightAway")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.ProcessRightAway = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DestinationFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_TargetFolderIdType class];
            self.DestinationFolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Categories")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.Categories = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EnableAlwaysDelete")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.EnableAlwaysDelete = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsRead")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsRead = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DeleteType")) {
            self.DeleteType = [t_DisposalType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation t_EncryptedSharedFolderDataType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_EncryptedSharedFolderDataType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Token)
        [t_EncryptedDataContainerType serializeToChildOf:node withName:"t:Token" value:_Token];

    if (_Data)
        [t_EncryptedDataContainerType serializeToChildOf:node withName:"t:Data" value:_Data];

}


- (t_EncryptedDataContainerType *)Token {
    if (!_Token) _Token = [t_EncryptedDataContainerType new];
    return _Token;
}

- (t_EncryptedDataContainerType *)Data {
    if (!_Data) _Data = [t_EncryptedDataContainerType new];
    return _Data;
}
+ (t_EncryptedSharedFolderDataType *)deserializeNode:(xmlNodePtr)cur {
    t_EncryptedSharedFolderDataType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Token")) {
            Class elementClass = classForElement(cur) ?: [t_EncryptedDataContainerType class];
            self.Token = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Data")) {
            Class elementClass = classForElement(cur) ?: [t_EncryptedDataContainerType class];
            self.Data = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_UserConfigurationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserConfigurationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_UserConfigurationName)
        [t_UserConfigurationNameType serializeToChildOf:node withName:"t:UserConfigurationName" value:_UserConfigurationName];

    if (_ItemId)
        [t_ItemIdType serializeToChildOf:node withName:"t:ItemId" value:_ItemId];

    if (_Dictionary)
        [t_UserConfigurationDictionaryType serializeToChildOf:node withName:"t:Dictionary" value:_Dictionary];

    if (_XmlData)
        [xsd_base64Binary serializeToChildOf:node withName:"t:XmlData" value:_XmlData];

    if (_BinaryData)
        [xsd_base64Binary serializeToChildOf:node withName:"t:BinaryData" value:_BinaryData];

}


- (t_UserConfigurationNameType *)UserConfigurationName {
    if (!_UserConfigurationName) _UserConfigurationName = [t_UserConfigurationNameType new];
    return _UserConfigurationName;
}

- (t_ItemIdType *)ItemId {
    if (!_ItemId) _ItemId = [t_ItemIdType new];
    return _ItemId;
}
+ (t_UserConfigurationType *)deserializeNode:(xmlNodePtr)cur {
    t_UserConfigurationType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"UserConfigurationName")) {
            Class elementClass = classForElement(cur) ?: [t_UserConfigurationNameType class];
            self.UserConfigurationName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ItemId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Dictionary")) {
            Class elementClass = classForElement(cur) ?: [t_UserConfigurationDictionaryType class];
            self.Dictionary = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"XmlData")) {
            Class elementClass = classForElement(cur) ?: [xsd_base64Binary class];
            self.XmlData = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"BinaryData")) {
            Class elementClass = classForElement(cur) ?: [xsd_base64Binary class];
            self.BinaryData = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_InvalidRecipientType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_InvalidRecipientType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SmtpAddress)
        [t_NonEmptyStringType serializeToChildOf:node withName:"t:SmtpAddress" value:_SmtpAddress];

    if (_ResponseCode)
        [t_InvalidRecipientResponseCodeType serializeToChildOf:node withName:"t:ResponseCode" value:_ResponseCode];

    if (_MessageText)
        [xsd_string serializeToChildOf:node withName:"t:MessageText" value:_MessageText];

}

+ (t_InvalidRecipientType *)deserializeNode:(xmlNodePtr)cur {
    t_InvalidRecipientType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SmtpAddress")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.SmtpAddress = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ResponseCode")) {
            self.ResponseCode = [t_InvalidRecipientResponseCodeType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MessageText")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.MessageText = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_RegeneratingPatternBaseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RegeneratingPatternBaseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_RegeneratingPatternBaseType *)deserializeNode:(xmlNodePtr)cur {
    t_RegeneratingPatternBaseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_MonthlyRegeneratingPatternType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MonthlyRegeneratingPatternType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_MonthlyRegeneratingPatternType *)deserializeNode:(xmlNodePtr)cur {
    t_MonthlyRegeneratingPatternType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_SyncFolderItemsReadFlagType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SyncFolderItemsReadFlagType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ItemId)
        [t_ItemIdType serializeToChildOf:node withName:"t:ItemId" value:_ItemId];

    if (_IsRead)
        [xsd_boolean serializeToChildOf:node withName:"t:IsRead" value:_IsRead];

}


- (t_ItemIdType *)ItemId {
    if (!_ItemId) _ItemId = [t_ItemIdType new];
    return _ItemId;
}
+ (t_SyncFolderItemsReadFlagType *)deserializeNode:(xmlNodePtr)cur {
    t_SyncFolderItemsReadFlagType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ItemId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsRead")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsRead = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_ConflictResolutionType_enumValues[] = {
    @"",
    @"AlwaysOverwrite",
    @"AutoResolve",
    @"NeverOverwrite",
};

@implementation t_ConflictResolutionType
+ (t_ConflictResolutionTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ConflictResolutionType_enumValues) / sizeof(t_ConflictResolutionType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ConflictResolutionType_enumValues[i]])
            return (t_ConflictResolutionTypeEnum)i;
    }

    return t_ConflictResolutionType_none;
}

+ (NSString *)stringFromValue:(t_ConflictResolutionTypeEnum)value {
    return t_ConflictResolutionType_enumValues[(int)value];
}

+ (t_ConflictResolutionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ConflictResolutionType_none;
}

+ (t_ConflictResolutionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConflictResolutionTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ConflictResolutionTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
static NSString *t_SortDirectionType_enumValues[] = {
    @"",
    @"Ascending",
    @"Descending",
};

@implementation t_SortDirectionType
+ (t_SortDirectionTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_SortDirectionType_enumValues) / sizeof(t_SortDirectionType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_SortDirectionType_enumValues[i]])
            return (t_SortDirectionTypeEnum)i;
    }

    return t_SortDirectionType_none;
}

+ (NSString *)stringFromValue:(t_SortDirectionTypeEnum)value {
    return t_SortDirectionType_enumValues[(int)value];
}

+ (t_SortDirectionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_SortDirectionType_none;
}

+ (t_SortDirectionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SortDirectionTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SortDirectionTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_BaseGroupByType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BaseGroupByType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_SortDirectionType serializeToProperty:"Order" onNode:node value:_Order];
}

+ (t_BaseGroupByType *)deserializeNode:(xmlNodePtr)cur {
    t_BaseGroupByType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Order = [t_SortDirectionType deserializeAttribute:"Order" ofNode:cur];
}
@end
@implementation t_GroupByType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_GroupByType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FieldURI)
        [t_PathToUnindexedFieldType serializeToChildOf:node withName:"t:FieldURI" value:_FieldURI];

    if (_IndexedFieldURI)
        [t_PathToIndexedFieldType serializeToChildOf:node withName:"t:IndexedFieldURI" value:_IndexedFieldURI];

    if (_ExtendedFieldURI)
        [t_PathToExtendedFieldType serializeToChildOf:node withName:"t:ExtendedFieldURI" value:_ExtendedFieldURI];

    if (_AggregateOn)
        [t_AggregateOnType serializeToChildOf:node withName:"t:AggregateOn" value:_AggregateOn];

}


- (t_PathToUnindexedFieldType *)FieldURI {
    if (!_FieldURI) _FieldURI = [t_PathToUnindexedFieldType new];
    return _FieldURI;
}

- (t_PathToIndexedFieldType *)IndexedFieldURI {
    if (!_IndexedFieldURI) _IndexedFieldURI = [t_PathToIndexedFieldType new];
    return _IndexedFieldURI;
}

- (t_PathToExtendedFieldType *)ExtendedFieldURI {
    if (!_ExtendedFieldURI) _ExtendedFieldURI = [t_PathToExtendedFieldType new];
    return _ExtendedFieldURI;
}

- (t_AggregateOnType *)AggregateOn {
    if (!_AggregateOn) _AggregateOn = [t_AggregateOnType new];
    return _AggregateOn;
}
+ (t_GroupByType *)deserializeNode:(xmlNodePtr)cur {
    t_GroupByType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToUnindexedFieldType class];
            self.FieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IndexedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToIndexedFieldType class];
            self.IndexedFieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExtendedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToExtendedFieldType class];
            self.ExtendedFieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AggregateOn")) {
            Class elementClass = classForElement(cur) ?: [t_AggregateOnType class];
            self.AggregateOn = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_CompleteNameType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CompleteNameType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Title)
        [xsd_string serializeToChildOf:node withName:"t:Title" value:_Title];

    if (_FirstName)
        [xsd_string serializeToChildOf:node withName:"t:FirstName" value:_FirstName];

    if (_MiddleName)
        [xsd_string serializeToChildOf:node withName:"t:MiddleName" value:_MiddleName];

    if (_LastName)
        [xsd_string serializeToChildOf:node withName:"t:LastName" value:_LastName];

    if (_Suffix)
        [xsd_string serializeToChildOf:node withName:"t:Suffix" value:_Suffix];

    if (_Initials)
        [xsd_string serializeToChildOf:node withName:"t:Initials" value:_Initials];

    if (_FullName)
        [xsd_string serializeToChildOf:node withName:"t:FullName" value:_FullName];

    if (_Nickname)
        [xsd_string serializeToChildOf:node withName:"t:Nickname" value:_Nickname];

    if (_YomiFirstName)
        [xsd_string serializeToChildOf:node withName:"t:YomiFirstName" value:_YomiFirstName];

    if (_YomiLastName)
        [xsd_string serializeToChildOf:node withName:"t:YomiLastName" value:_YomiLastName];

}

+ (t_CompleteNameType *)deserializeNode:(xmlNodePtr)cur {
    t_CompleteNameType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Title")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Title = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FirstName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.FirstName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MiddleName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.MiddleName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"LastName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.LastName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Suffix")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Suffix = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Initials")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Initials = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FullName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.FullName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Nickname")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Nickname = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"YomiFirstName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.YomiFirstName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"YomiLastName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.YomiLastName = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_RuleOperationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RuleOperationType *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (t_RuleOperationType *)deserializeNode:(xmlNodePtr)cur {
    t_RuleOperationType *newObject = [self new];


    return newObject;
}
@end
@implementation t_TimeZoneContextType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TimeZoneContextType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_TimeZoneDefinition)
        [t_TimeZoneDefinitionType serializeToChildOf:node withName:"t:TimeZoneDefinition" value:_TimeZoneDefinition];

}


- (t_TimeZoneDefinitionType *)TimeZoneDefinition {
    if (!_TimeZoneDefinition) _TimeZoneDefinition = [t_TimeZoneDefinitionType new];
    return _TimeZoneDefinition;
}
+ (t_TimeZoneContextType *)deserializeNode:(xmlNodePtr)cur {
    t_TimeZoneContextType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"TimeZoneDefinition")) {
            Class elementClass = classForElement(cur) ?: [t_TimeZoneDefinitionType class];
            self.TimeZoneDefinition = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_NonEmptyArrayOfFolderChangeDescriptionsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"AppendToFolderField")) {
            Class elementClass = classForElement(child) ?: [t_AppendToFolderFieldType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SetFolderField")) {
            Class elementClass = classForElement(child) ?: [t_SetFolderFieldType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"DeleteFolderField")) {
            Class elementClass = classForElement(child) ?: [t_DeleteFolderFieldType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_AppendToFolderFieldType class]])
            [t_AppendToFolderFieldType serializeToChildOf:child withName:"t:AppendToFolderField" value:item];
        else if ([item isMemberOfClass:[t_SetFolderFieldType class]])
            [t_SetFolderFieldType serializeToChildOf:child withName:"t:SetFolderField" value:item];
        else if ([item isMemberOfClass:[t_DeleteFolderFieldType class]])
            [t_DeleteFolderFieldType serializeToChildOf:child withName:"t:DeleteFolderField" value:item];
    }
}
@end
static NSString *t_MessageDispositionType_enumValues[] = {
    @"",
    @"SaveOnly",
    @"SendAndSaveCopy",
    @"SendOnly",
};

@implementation t_MessageDispositionType
+ (t_MessageDispositionTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_MessageDispositionType_enumValues) / sizeof(t_MessageDispositionType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_MessageDispositionType_enumValues[i]])
            return (t_MessageDispositionTypeEnum)i;
    }

    return t_MessageDispositionType_none;
}

+ (NSString *)stringFromValue:(t_MessageDispositionTypeEnum)value {
    return t_MessageDispositionType_enumValues[(int)value];
}

+ (t_MessageDispositionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_MessageDispositionType_none;
}

+ (t_MessageDispositionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MessageDispositionTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MessageDispositionTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ArrayOfRuleValidationErrorsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Error")) {
            Class elementClass = classForElement(child) ?: [t_RuleValidationErrorType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_RuleValidationErrorType * item in value)
        [t_RuleValidationErrorType serializeToChildOf:child withName:"t:Error" value:item];
}
@end
@implementation t_RuleOperationErrorType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RuleOperationErrorType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_OperationIndex)
        [xsd_int serializeToChildOf:node withName:"t:OperationIndex" value:_OperationIndex];

    if (_ValidationErrors)
        [t_ArrayOfRuleValidationErrorsType serializeToChildOf:node withName:"t:ValidationErrors" value:_ValidationErrors];

}

+ (t_RuleOperationErrorType *)deserializeNode:(xmlNodePtr)cur {
    t_RuleOperationErrorType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"OperationIndex")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.OperationIndex = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ValidationErrors")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRuleValidationErrorsType class];
            self.ValidationErrors = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_RulePredicateDateRangeType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RulePredicateDateRangeType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_StartDateTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:StartDateTime" value:_StartDateTime];

    if (_EndDateTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:EndDateTime" value:_EndDateTime];

}

+ (t_RulePredicateDateRangeType *)deserializeNode:(xmlNodePtr)cur {
    t_RulePredicateDateRangeType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"StartDateTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.StartDateTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EndDateTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.EndDateTime = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_SmtpDomain
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SmtpDomain *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"Name" onNode:node value:_Name];
    [xsd_boolean serializeToProperty:"IncludeSubdomains" onNode:node value:_IncludeSubdomains];
}

+ (t_SmtpDomain *)deserializeNode:(xmlNodePtr)cur {
    t_SmtpDomain *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Name = [xsd_string deserializeAttribute:"Name" ofNode:cur];
    self.IncludeSubdomains = [xsd_boolean deserializeAttribute:"IncludeSubdomains" ofNode:cur];
}
@end
@implementation t_DelegatePermissionsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DelegatePermissionsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_CalendarFolderPermissionLevel)
        [t_DelegateFolderPermissionLevelType serializeToChildOf:node withName:"t:CalendarFolderPermissionLevel" value:_CalendarFolderPermissionLevel];

    if (_TasksFolderPermissionLevel)
        [t_DelegateFolderPermissionLevelType serializeToChildOf:node withName:"t:TasksFolderPermissionLevel" value:_TasksFolderPermissionLevel];

    if (_InboxFolderPermissionLevel)
        [t_DelegateFolderPermissionLevelType serializeToChildOf:node withName:"t:InboxFolderPermissionLevel" value:_InboxFolderPermissionLevel];

    if (_ContactsFolderPermissionLevel)
        [t_DelegateFolderPermissionLevelType serializeToChildOf:node withName:"t:ContactsFolderPermissionLevel" value:_ContactsFolderPermissionLevel];

    if (_NotesFolderPermissionLevel)
        [t_DelegateFolderPermissionLevelType serializeToChildOf:node withName:"t:NotesFolderPermissionLevel" value:_NotesFolderPermissionLevel];

    if (_JournalFolderPermissionLevel)
        [t_DelegateFolderPermissionLevelType serializeToChildOf:node withName:"t:JournalFolderPermissionLevel" value:_JournalFolderPermissionLevel];

}

+ (t_DelegatePermissionsType *)deserializeNode:(xmlNodePtr)cur {
    t_DelegatePermissionsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"CalendarFolderPermissionLevel")) {
            self.CalendarFolderPermissionLevel = [t_DelegateFolderPermissionLevelType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"TasksFolderPermissionLevel")) {
            self.TasksFolderPermissionLevel = [t_DelegateFolderPermissionLevelType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"InboxFolderPermissionLevel")) {
            self.InboxFolderPermissionLevel = [t_DelegateFolderPermissionLevelType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContactsFolderPermissionLevel")) {
            self.ContactsFolderPermissionLevel = [t_DelegateFolderPermissionLevelType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"NotesFolderPermissionLevel")) {
            self.NotesFolderPermissionLevel = [t_DelegateFolderPermissionLevelType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"JournalFolderPermissionLevel")) {
            self.JournalFolderPermissionLevel = [t_DelegateFolderPermissionLevelType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation t_EncryptedDataContainerType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_EncryptedDataContainerType *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (t_EncryptedDataContainerType *)deserializeNode:(xmlNodePtr)cur {
    t_EncryptedDataContainerType *newObject = [self new];


    return newObject;
}
@end
@implementation t_AttachmentType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AttachmentType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_AttachmentId)
        [t_AttachmentIdType serializeToChildOf:node withName:"t:AttachmentId" value:_AttachmentId];

    if (_Name)
        [xsd_string serializeToChildOf:node withName:"t:Name" value:_Name];

    if (_ContentType)
        [xsd_string serializeToChildOf:node withName:"t:ContentType" value:_ContentType];

    if (_ContentId)
        [xsd_string serializeToChildOf:node withName:"t:ContentId" value:_ContentId];

    if (_ContentLocation)
        [xsd_string serializeToChildOf:node withName:"t:ContentLocation" value:_ContentLocation];

    if (_Size)
        [xsd_int serializeToChildOf:node withName:"t:Size" value:_Size];

    if (_LastModifiedTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:LastModifiedTime" value:_LastModifiedTime];

    if (_IsInline)
        [xsd_boolean serializeToChildOf:node withName:"t:IsInline" value:_IsInline];

}


- (t_AttachmentIdType *)AttachmentId {
    if (!_AttachmentId) _AttachmentId = [t_AttachmentIdType new];
    return _AttachmentId;
}
+ (t_AttachmentType *)deserializeNode:(xmlNodePtr)cur {
    t_AttachmentType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"AttachmentId")) {
            Class elementClass = classForElement(cur) ?: [t_AttachmentIdType class];
            self.AttachmentId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Name")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Name = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContentType")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.ContentType = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContentId")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.ContentId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContentLocation")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.ContentLocation = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Size")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.Size = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"LastModifiedTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.LastModifiedTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsInline")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsInline = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_FileAttachmentType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FileAttachmentType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_IsContactPhoto)
        [xsd_boolean serializeToChildOf:node withName:"t:IsContactPhoto" value:_IsContactPhoto];

    if (_Content)
        [xsd_base64Binary serializeToChildOf:node withName:"t:Content" value:_Content];

}

+ (t_FileAttachmentType *)deserializeNode:(xmlNodePtr)cur {
    t_FileAttachmentType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsContactPhoto")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsContactPhoto = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Content")) {
            Class elementClass = classForElement(cur) ?: [xsd_base64Binary class];
            self.Content = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ProxySecurityContextType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ProxySecurityContextType *)value {
    [xsd_base64Binary serializeToChildOf:node withName:childName value:value._content];
}
+ (t_ProxySecurityContextType *)deserializeNode:(xmlNodePtr)cur {
    t_ProxySecurityContextType *newObject = [self new];
    newObject._content = [xsd_base64Binary deserializeNode:cur];


    return newObject;
}
@end
@implementation t_ArrayOfRealItemsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Item")) {
            Class elementClass = classForElement(child) ?: [t_ItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"Message")) {
            Class elementClass = classForElement(child) ?: [t_MessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"CalendarItem")) {
            Class elementClass = classForElement(child) ?: [t_CalendarItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"Contact")) {
            Class elementClass = classForElement(child) ?: [t_ContactItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"DistributionList")) {
            Class elementClass = classForElement(child) ?: [t_DistributionListType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"MeetingMessage")) {
            Class elementClass = classForElement(child) ?: [t_MeetingMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"MeetingRequest")) {
            Class elementClass = classForElement(child) ?: [t_MeetingRequestMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"MeetingResponse")) {
            Class elementClass = classForElement(child) ?: [t_MeetingResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"MeetingCancellation")) {
            Class elementClass = classForElement(child) ?: [t_MeetingCancellationMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"Task")) {
            Class elementClass = classForElement(child) ?: [t_TaskType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"PostItem")) {
            Class elementClass = classForElement(child) ?: [t_PostItemType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_ItemType class]])
            [t_ItemType serializeToChildOf:child withName:"t:Item" value:item];
        else if ([item isMemberOfClass:[t_MessageType class]])
            [t_MessageType serializeToChildOf:child withName:"t:Message" value:item];
        else if ([item isMemberOfClass:[t_CalendarItemType class]])
            [t_CalendarItemType serializeToChildOf:child withName:"t:CalendarItem" value:item];
        else if ([item isMemberOfClass:[t_ContactItemType class]])
            [t_ContactItemType serializeToChildOf:child withName:"t:Contact" value:item];
        else if ([item isMemberOfClass:[t_DistributionListType class]])
            [t_DistributionListType serializeToChildOf:child withName:"t:DistributionList" value:item];
        else if ([item isMemberOfClass:[t_MeetingMessageType class]])
            [t_MeetingMessageType serializeToChildOf:child withName:"t:MeetingMessage" value:item];
        else if ([item isMemberOfClass:[t_MeetingRequestMessageType class]])
            [t_MeetingRequestMessageType serializeToChildOf:child withName:"t:MeetingRequest" value:item];
        else if ([item isMemberOfClass:[t_MeetingResponseMessageType class]])
            [t_MeetingResponseMessageType serializeToChildOf:child withName:"t:MeetingResponse" value:item];
        else if ([item isMemberOfClass:[t_MeetingCancellationMessageType class]])
            [t_MeetingCancellationMessageType serializeToChildOf:child withName:"t:MeetingCancellation" value:item];
        else if ([item isMemberOfClass:[t_TaskType class]])
            [t_TaskType serializeToChildOf:child withName:"t:Task" value:item];
        else if ([item isMemberOfClass:[t_PostItemType class]])
            [t_PostItemType serializeToChildOf:child withName:"t:PostItem" value:item];
    }
}
@end
@implementation t_FindItemParentType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FindItemParentType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_int serializeToProperty:"IndexedPagingOffset" onNode:node value:_IndexedPagingOffset];
    [xsd_int serializeToProperty:"NumeratorOffset" onNode:node value:_NumeratorOffset];
    [xsd_int serializeToProperty:"AbsoluteDenominator" onNode:node value:_AbsoluteDenominator];
    [xsd_boolean serializeToProperty:"IncludesLastItemInRange" onNode:node value:_IncludesLastItemInRange];
    [xsd_int serializeToProperty:"TotalItemsInView" onNode:node value:_TotalItemsInView];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Items)
        [t_ArrayOfRealItemsType serializeToChildOf:node withName:"t:Items" value:_Items];

    if (_Groups)
        [t_ArrayOfGroupedItemsType serializeToChildOf:node withName:"t:Groups" value:_Groups];

}


+ (t_FindItemParentType *)deserializeNode:(xmlNodePtr)cur {
    t_FindItemParentType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.IndexedPagingOffset = [xsd_int deserializeAttribute:"IndexedPagingOffset" ofNode:cur];
    self.NumeratorOffset = [xsd_int deserializeAttribute:"NumeratorOffset" ofNode:cur];
    self.AbsoluteDenominator = [xsd_int deserializeAttribute:"AbsoluteDenominator" ofNode:cur];
    self.IncludesLastItemInRange = [xsd_boolean deserializeAttribute:"IncludesLastItemInRange" ofNode:cur];
    self.TotalItemsInView = [xsd_int deserializeAttribute:"TotalItemsInView" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Items")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRealItemsType class];
            self.Items = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Groups")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfGroupedItemsType class];
            self.Groups = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ProtectionRuleActionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ProtectionRuleActionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_ProtectionRuleActionKindType serializeToProperty:"Name" onNode:node value:_Name];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    for (t_ProtectionRuleArgumentType * item in _Argument)
        [t_ProtectionRuleArgumentType serializeToChildOf:node withName:"t:Argument" value:item];

}


+ (t_ProtectionRuleActionType *)deserializeNode:(xmlNodePtr)cur {
    t_ProtectionRuleActionType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Name = [t_ProtectionRuleActionKindType deserializeAttribute:"Name" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    NSMutableArray *ArgumentValues = nil;

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Argument")) {
            Class elementClass = classForElement(cur) ?: [t_ProtectionRuleArgumentType class];
            if (!ArgumentValues) ArgumentValues = [NSMutableArray new];
            [ArgumentValues addObject:[elementClass deserializeNode:cur]];
        }
    }

    if (ArgumentValues) self.Argument = ArgumentValues;
}
@end
@implementation t_ArrayOfRuleOperationsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"CreateRuleOperation")) {
            Class elementClass = classForElement(child) ?: [t_CreateRuleOperationType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SetRuleOperation")) {
            Class elementClass = classForElement(child) ?: [t_SetRuleOperationType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"DeleteRuleOperation")) {
            Class elementClass = classForElement(child) ?: [t_DeleteRuleOperationType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_CreateRuleOperationType class]])
            [t_CreateRuleOperationType serializeToChildOf:child withName:"t:CreateRuleOperation" value:item];
        else if ([item isMemberOfClass:[t_SetRuleOperationType class]])
            [t_SetRuleOperationType serializeToChildOf:child withName:"t:SetRuleOperation" value:item];
        else if ([item isMemberOfClass:[t_DeleteRuleOperationType class]])
            [t_DeleteRuleOperationType serializeToChildOf:child withName:"t:DeleteRuleOperation" value:item];
    }
}
@end
@implementation t_ArrayOfDelegateUserType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"DelegateUser")) {
            Class elementClass = classForElement(child) ?: [t_DelegateUserType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_DelegateUserType * item in value)
        [t_DelegateUserType serializeToChildOf:child withName:"t:DelegateUser" value:item];
}
@end
@implementation t_ArrayOfRecipientTrackingEventType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"RecipientTrackingEvent")) {
            Class elementClass = classForElement(child) ?: [t_RecipientTrackingEventType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_RecipientTrackingEventType * item in value)
        [t_RecipientTrackingEventType serializeToChildOf:child withName:"t:RecipientTrackingEvent" value:item];
}
@end
static NSString *t_SuggestionQuality_enumValues[] = {
    @"",
    @"Excellent",
    @"Fair",
    @"Good",
    @"Poor",
};

@implementation t_SuggestionQuality
+ (t_SuggestionQualityEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_SuggestionQuality_enumValues) / sizeof(t_SuggestionQuality_enumValues[0]); ++i) {
        if ([string isEqualToString:t_SuggestionQuality_enumValues[i]])
            return (t_SuggestionQualityEnum)i;
    }

    return t_SuggestionQuality_none;
}

+ (NSString *)stringFromValue:(t_SuggestionQualityEnum)value {
    return t_SuggestionQuality_enumValues[(int)value];
}

+ (t_SuggestionQualityEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_SuggestionQuality_none;
}

+ (t_SuggestionQualityEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SuggestionQualityEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SuggestionQualityEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ArrayOfAttendeeConflictData
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"UnknownAttendeeConflictData")) {
            Class elementClass = classForElement(child) ?: [t_UnknownAttendeeConflictData class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"IndividualAttendeeConflictData")) {
            Class elementClass = classForElement(child) ?: [t_IndividualAttendeeConflictData class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"TooBigGroupAttendeeConflictData")) {
            Class elementClass = classForElement(child) ?: [t_TooBigGroupAttendeeConflictData class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"GroupAttendeeConflictData")) {
            Class elementClass = classForElement(child) ?: [t_GroupAttendeeConflictData class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_UnknownAttendeeConflictData class]])
            [t_UnknownAttendeeConflictData serializeToChildOf:child withName:"t:UnknownAttendeeConflictData" value:item];
        else if ([item isMemberOfClass:[t_IndividualAttendeeConflictData class]])
            [t_IndividualAttendeeConflictData serializeToChildOf:child withName:"t:IndividualAttendeeConflictData" value:item];
        else if ([item isMemberOfClass:[t_TooBigGroupAttendeeConflictData class]])
            [t_TooBigGroupAttendeeConflictData serializeToChildOf:child withName:"t:TooBigGroupAttendeeConflictData" value:item];
        else if ([item isMemberOfClass:[t_GroupAttendeeConflictData class]])
            [t_GroupAttendeeConflictData serializeToChildOf:child withName:"t:GroupAttendeeConflictData" value:item];
    }
}
@end
@implementation t_Suggestion
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_Suggestion *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_MeetingTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:MeetingTime" value:_MeetingTime];

    if (_IsWorkTime)
        [xsd_boolean serializeToChildOf:node withName:"t:IsWorkTime" value:_IsWorkTime];

    if (_SuggestionQuality)
        [t_SuggestionQuality serializeToChildOf:node withName:"t:SuggestionQuality" value:_SuggestionQuality];

    if (_AttendeeConflictDataArray)
        [t_ArrayOfAttendeeConflictData serializeToChildOf:node withName:"t:AttendeeConflictDataArray" value:_AttendeeConflictDataArray];

}

+ (t_Suggestion *)deserializeNode:(xmlNodePtr)cur {
    t_Suggestion *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.MeetingTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsWorkTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsWorkTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SuggestionQuality")) {
            self.SuggestionQuality = [t_SuggestionQuality deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AttendeeConflictDataArray")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfAttendeeConflictData class];
            self.AttendeeConflictDataArray = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_TaskDelegateStateType_enumValues[] = {
    @"",
    @"Accepted",
    @"Declined",
    @"Max",
    @"NoMatch",
    @"OwnNew",
    @"Owned",
};

@implementation t_TaskDelegateStateType
+ (t_TaskDelegateStateTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_TaskDelegateStateType_enumValues) / sizeof(t_TaskDelegateStateType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_TaskDelegateStateType_enumValues[i]])
            return (t_TaskDelegateStateTypeEnum)i;
    }

    return t_TaskDelegateStateType_none;
}

+ (NSString *)stringFromValue:(t_TaskDelegateStateTypeEnum)value {
    return t_TaskDelegateStateType_enumValues[(int)value];
}

+ (t_TaskDelegateStateTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_TaskDelegateStateType_none;
}

+ (t_TaskDelegateStateTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TaskDelegateStateTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_TaskDelegateStateTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ExcludesAttributeType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_ExcludesValueType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ExcludesValueType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_ExcludesAttributeType serializeToProperty:"Value" onNode:node value:_Value];
}

+ (t_ExcludesValueType *)deserializeNode:(xmlNodePtr)cur {
    t_ExcludesValueType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Value = [t_ExcludesAttributeType deserializeAttribute:"Value" ofNode:cur];
}
@end
@implementation t_DailyRecurrencePatternType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DailyRecurrencePatternType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_DailyRecurrencePatternType *)deserializeNode:(xmlNodePtr)cur {
    t_DailyRecurrencePatternType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
static NSString *t_DistinguishedUserType_enumValues[] = {
    @"",
    @"Anonymous",
    @"Default",
};

@implementation t_DistinguishedUserType
+ (t_DistinguishedUserTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_DistinguishedUserType_enumValues) / sizeof(t_DistinguishedUserType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_DistinguishedUserType_enumValues[i]])
            return (t_DistinguishedUserTypeEnum)i;
    }

    return t_DistinguishedUserType_none;
}

+ (NSString *)stringFromValue:(t_DistinguishedUserTypeEnum)value {
    return t_DistinguishedUserType_enumValues[(int)value];
}

+ (t_DistinguishedUserTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_DistinguishedUserType_none;
}

+ (t_DistinguishedUserTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DistinguishedUserTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DistinguishedUserTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_UserIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserIdType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SID)
        [xsd_string serializeToChildOf:node withName:"t:SID" value:_SID];

    if (_PrimarySmtpAddress)
        [xsd_string serializeToChildOf:node withName:"t:PrimarySmtpAddress" value:_PrimarySmtpAddress];

    if (_DisplayName)
        [xsd_string serializeToChildOf:node withName:"t:DisplayName" value:_DisplayName];

    if (_DistinguishedUser)
        [t_DistinguishedUserType serializeToChildOf:node withName:"t:DistinguishedUser" value:_DistinguishedUser];

    if (_ExternalUserIdentity)
        [xsd_string serializeToChildOf:node withName:"t:ExternalUserIdentity" value:_ExternalUserIdentity];

}

+ (t_UserIdType *)deserializeNode:(xmlNodePtr)cur {
    t_UserIdType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SID")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.SID = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PrimarySmtpAddress")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.PrimarySmtpAddress = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DisplayName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.DisplayName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DistinguishedUser")) {
            self.DistinguishedUser = [t_DistinguishedUserType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExternalUserIdentity")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.ExternalUserIdentity = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_SyncFolderHierarchyChangesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Create")) {
            Class elementClass = classForElement(child) ?: [t_SyncFolderHierarchyCreateOrUpdateType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"Update")) {
            Class elementClass = classForElement(child) ?: [t_SyncFolderHierarchyCreateOrUpdateType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"Delete")) {
            Class elementClass = classForElement(child) ?: [t_SyncFolderHierarchyDeleteType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_SyncFolderHierarchyCreateOrUpdateType class]])
            [t_SyncFolderHierarchyCreateOrUpdateType serializeToChildOf:child withName:"t:Create" value:item];
        else if ([item isMemberOfClass:[t_SyncFolderHierarchyCreateOrUpdateType class]])
            [t_SyncFolderHierarchyCreateOrUpdateType serializeToChildOf:child withName:"t:Update" value:item];
        else if ([item isMemberOfClass:[t_SyncFolderHierarchyDeleteType class]])
            [t_SyncFolderHierarchyDeleteType serializeToChildOf:child withName:"t:Delete" value:item];
    }
}
@end
@implementation t_ArrayOfCalendarPermissionsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"CalendarPermission")) {
            Class elementClass = classForElement(child) ?: [t_CalendarPermissionType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_CalendarPermissionType * item in value)
        [t_CalendarPermissionType serializeToChildOf:child withName:"t:CalendarPermission" value:item];
}
@end
@implementation t_CalendarPermissionSetType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarPermissionSetType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_CalendarPermissions)
        [t_ArrayOfCalendarPermissionsType serializeToChildOf:node withName:"t:CalendarPermissions" value:_CalendarPermissions];

    if (_UnknownEntries)
        [t_ArrayOfUnknownEntriesType serializeToChildOf:node withName:"t:UnknownEntries" value:_UnknownEntries];

}

+ (t_CalendarPermissionSetType *)deserializeNode:(xmlNodePtr)cur {
    t_CalendarPermissionSetType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"CalendarPermissions")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfCalendarPermissionsType class];
            self.CalendarPermissions = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"UnknownEntries")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfUnknownEntriesType class];
            self.UnknownEntries = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ConnectingSIDType
+ (id)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = nil;
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;
        else if (xmlStrEqual(child->name, (const xmlChar *)"PrincipalName")) {
            Class elementClass = classForElement(child) ?: [t_NonEmptyStringType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SID")) {
            Class elementClass = classForElement(child) ?: [t_NonEmptyStringType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"PrimarySmtpAddress")) {
            Class elementClass = classForElement(child) ?: [t_NonEmptyStringType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SmtpAddress")) {
            Class elementClass = classForElement(child) ?: [t_NonEmptyStringType class];
            return [elementClass deserializeNode:child];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(id)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    if (false);
    else if ([value isMemberOfClass:[t_NonEmptyStringType class]])
        [t_NonEmptyStringType serializeToChildOf:child withName:"t:PrincipalName" value:value];
    else if ([value isMemberOfClass:[t_NonEmptyStringType class]])
        [t_NonEmptyStringType serializeToChildOf:child withName:"t:SID" value:value];
    else if ([value isMemberOfClass:[t_NonEmptyStringType class]])
        [t_NonEmptyStringType serializeToChildOf:child withName:"t:PrimarySmtpAddress" value:value];
    else if ([value isMemberOfClass:[t_NonEmptyStringType class]])
        [t_NonEmptyStringType serializeToChildOf:child withName:"t:SmtpAddress" value:value];
}
@end
@implementation t_ConflictResultsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConflictResultsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Count)
        [xsd_int serializeToChildOf:node withName:"t:Count" value:_Count];

}

+ (t_ConflictResultsType *)deserializeNode:(xmlNodePtr)cur {
    t_ConflictResultsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Count")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.Count = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_PathToExceptionFieldType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PathToExceptionFieldType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_ExceptionPropertyURIType serializeToProperty:"FieldURI" onNode:node value:_FieldURI];
}

+ (t_PathToExceptionFieldType *)deserializeNode:(xmlNodePtr)cur {
    t_PathToExceptionFieldType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.FieldURI = [t_ExceptionPropertyURIType deserializeAttribute:"FieldURI" ofNode:cur];
}
@end
@implementation t_ContactsViewType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ContactsViewType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [super addAttributesToNode:node];

    [xsd_string serializeToProperty:"InitialName" onNode:node value:_InitialName];
    [xsd_string serializeToProperty:"FinalName" onNode:node value:_FinalName];
}

+ (t_ContactsViewType *)deserializeNode:(xmlNodePtr)cur {
    t_ContactsViewType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    [super deserializeAttributesFromNode:cur];

    self.InitialName = [xsd_string deserializeAttribute:"InitialName" ofNode:cur];
    self.FinalName = [xsd_string deserializeAttribute:"FinalName" ofNode:cur];
}
@end
static NSString *t_SyncFolderItemsScopeType_enumValues[] = {
    @"",
    @"NormalAndAssociatedItems",
    @"NormalItems",
};

@implementation t_SyncFolderItemsScopeType
+ (t_SyncFolderItemsScopeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_SyncFolderItemsScopeType_enumValues) / sizeof(t_SyncFolderItemsScopeType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_SyncFolderItemsScopeType_enumValues[i]])
            return (t_SyncFolderItemsScopeTypeEnum)i;
    }

    return t_SyncFolderItemsScopeType_none;
}

+ (NSString *)stringFromValue:(t_SyncFolderItemsScopeTypeEnum)value {
    return t_SyncFolderItemsScopeType_enumValues[(int)value];
}

+ (t_SyncFolderItemsScopeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_SyncFolderItemsScopeType_none;
}

+ (t_SyncFolderItemsScopeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SyncFolderItemsScopeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SyncFolderItemsScopeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
static NSString *t_ItemQueryTraversalType_enumValues[] = {
    @"",
    @"Associated",
    @"Shallow",
    @"SoftDeleted",
};

@implementation t_ItemQueryTraversalType
+ (t_ItemQueryTraversalTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ItemQueryTraversalType_enumValues) / sizeof(t_ItemQueryTraversalType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ItemQueryTraversalType_enumValues[i]])
            return (t_ItemQueryTraversalTypeEnum)i;
    }

    return t_ItemQueryTraversalType_none;
}

+ (NSString *)stringFromValue:(t_ItemQueryTraversalTypeEnum)value {
    return t_ItemQueryTraversalType_enumValues[(int)value];
}

+ (t_ItemQueryTraversalTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ItemQueryTraversalType_none;
}

+ (t_ItemQueryTraversalTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ItemQueryTraversalTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ItemQueryTraversalTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
static NSString *t_ExchangeVersionType_enumValues[] = {
    @"",
    @"Exchange2007",
    @"Exchange2007_SP1",
    @"Exchange2010",
    @"Exchange2010_SP1",
    @"Exchange2010_SP2",
};

@implementation t_ExchangeVersionType
+ (t_ExchangeVersionTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ExchangeVersionType_enumValues) / sizeof(t_ExchangeVersionType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ExchangeVersionType_enumValues[i]])
            return (t_ExchangeVersionTypeEnum)i;
    }

    return t_ExchangeVersionType_none;
}

+ (NSString *)stringFromValue:(t_ExchangeVersionTypeEnum)value {
    return t_ExchangeVersionType_enumValues[(int)value];
}

+ (t_ExchangeVersionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ExchangeVersionType_none;
}

+ (t_ExchangeVersionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ExchangeVersionTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ExchangeVersionTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_GroupAttendeeConflictData
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_GroupAttendeeConflictData *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_NumberOfMembers)
        [xsd_int serializeToChildOf:node withName:"t:NumberOfMembers" value:_NumberOfMembers];

    if (_NumberOfMembersAvailable)
        [xsd_int serializeToChildOf:node withName:"t:NumberOfMembersAvailable" value:_NumberOfMembersAvailable];

    if (_NumberOfMembersWithConflict)
        [xsd_int serializeToChildOf:node withName:"t:NumberOfMembersWithConflict" value:_NumberOfMembersWithConflict];

    if (_NumberOfMembersWithNoData)
        [xsd_int serializeToChildOf:node withName:"t:NumberOfMembersWithNoData" value:_NumberOfMembersWithNoData];

}

+ (t_GroupAttendeeConflictData *)deserializeNode:(xmlNodePtr)cur {
    t_GroupAttendeeConflictData *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"NumberOfMembers")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.NumberOfMembers = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"NumberOfMembersAvailable")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.NumberOfMembersAvailable = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"NumberOfMembersWithConflict")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.NumberOfMembersWithConflict = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"NumberOfMembersWithNoData")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.NumberOfMembersWithNoData = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ExchangeImpersonationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ExchangeImpersonationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ConnectingSID)
        [t_ConnectingSIDType serializeToChildOf:node withName:"t:ConnectingSID" value:_ConnectingSID];

}

+ (t_ExchangeImpersonationType *)deserializeNode:(xmlNodePtr)cur {
    t_ExchangeImpersonationType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConnectingSID")) {
            Class elementClass = classForElement(cur) ?: [t_ConnectingSIDType class];
            self.ConnectingSID = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_FolderChangeType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FolderChangeType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FolderId)
        [t_FolderIdType serializeToChildOf:node withName:"t:FolderId" value:_FolderId];

    if (_DistinguishedFolderId)
        [t_DistinguishedFolderIdType serializeToChildOf:node withName:"t:DistinguishedFolderId" value:_DistinguishedFolderId];

    if (_Updates)
        [t_NonEmptyArrayOfFolderChangeDescriptionsType serializeToChildOf:node withName:"t:Updates" value:_Updates];

}


- (t_FolderIdType *)FolderId {
    if (!_FolderId) _FolderId = [t_FolderIdType new];
    return _FolderId;
}

- (t_DistinguishedFolderIdType *)DistinguishedFolderId {
    if (!_DistinguishedFolderId) _DistinguishedFolderId = [t_DistinguishedFolderIdType new];
    return _DistinguishedFolderId;
}
+ (t_FolderChangeType *)deserializeNode:(xmlNodePtr)cur {
    t_FolderChangeType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderId")) {
            Class elementClass = classForElement(cur) ?: [t_FolderIdType class];
            self.FolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DistinguishedFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_DistinguishedFolderIdType class];
            self.DistinguishedFolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Updates")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfFolderChangeDescriptionsType class];
            self.Updates = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_AttendeeType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AttendeeType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Mailbox)
        [t_EmailAddressType serializeToChildOf:node withName:"t:Mailbox" value:_Mailbox];

    if (_ResponseType)
        [t_ResponseTypeType serializeToChildOf:node withName:"t:ResponseType" value:_ResponseType];

    if (_LastResponseTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:LastResponseTime" value:_LastResponseTime];

}


- (t_EmailAddressType *)Mailbox {
    if (!_Mailbox) _Mailbox = [t_EmailAddressType new];
    return _Mailbox;
}
+ (t_AttendeeType *)deserializeNode:(xmlNodePtr)cur {
    t_AttendeeType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Mailbox")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.Mailbox = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ResponseType")) {
            self.ResponseType = [t_ResponseTypeType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"LastResponseTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.LastResponseTime = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_RuleFieldURIType_enumValues[] = {
    @"",
    @"Action:AssignCategories",
    @"Action:CopyToFolder",
    @"Action:Delete",
    @"Action:ForwardAsAttachmentToRecipients",
    @"Action:ForwardToRecipients",
    @"Action:MarkAsRead",
    @"Action:MarkImportance",
    @"Action:MoveToFolder",
    @"Action:PermanentDelete",
    @"Action:RedirectToRecipients",
    @"Action:SendSMSAlertToRecipients",
    @"Action:ServerReplyWithMessage",
    @"Action:StopProcessingRules",
    @"Actions",
    @"Condition:Categories",
    @"Condition:ContainsBodyStrings",
    @"Condition:ContainsHeaderStrings",
    @"Condition:ContainsRecipientStrings",
    @"Condition:ContainsSenderStrings",
    @"Condition:ContainsSubjectOrBodyStrings",
    @"Condition:ContainsSubjectStrings",
    @"Condition:FlaggedForAction",
    @"Condition:FromAddresses",
    @"Condition:FromConnectedAccounts",
    @"Condition:HasAttachments",
    @"Condition:Importance",
    @"Condition:IsApprovalRequest",
    @"Condition:IsAutomaticForward",
    @"Condition:IsAutomaticReply",
    @"Condition:IsEncrypted",
    @"Condition:IsMeetingRequest",
    @"Condition:IsMeetingResponse",
    @"Condition:IsNDR",
    @"Condition:IsPermissionControlled",
    @"Condition:IsReadReceipt",
    @"Condition:IsSigned",
    @"Condition:IsVoicemail",
    @"Condition:ItemClasses",
    @"Condition:MessageClassifications",
    @"Condition:NotSentToMe",
    @"Condition:Sensitivity",
    @"Condition:SentCcMe",
    @"Condition:SentOnlyToMe",
    @"Condition:SentToAddresses",
    @"Condition:SentToMe",
    @"Condition:SentToOrCcMe",
    @"Condition:WithinDateRange",
    @"Condition:WithinSizeRange",
    @"Conditions",
    @"DisplayName",
    @"Exception:Categories",
    @"Exception:ContainsBodyStrings",
    @"Exception:ContainsHeaderStrings",
    @"Exception:ContainsRecipientStrings",
    @"Exception:ContainsSenderStrings",
    @"Exception:ContainsSubjectOrBodyStrings",
    @"Exception:ContainsSubjectStrings",
    @"Exception:FlaggedForAction",
    @"Exception:FromAddresses",
    @"Exception:FromConnectedAccounts",
    @"Exception:HasAttachments",
    @"Exception:Importance",
    @"Exception:IsApprovalRequest",
    @"Exception:IsAutomaticForward",
    @"Exception:IsAutomaticReply",
    @"Exception:IsEncrypted",
    @"Exception:IsMeetingRequest",
    @"Exception:IsMeetingResponse",
    @"Exception:IsNDR",
    @"Exception:IsPermissionControlled",
    @"Exception:IsReadReceipt",
    @"Exception:IsSigned",
    @"Exception:IsVoicemail",
    @"Exception:ItemClasses",
    @"Exception:MessageClassifications",
    @"Exception:NotSentToMe",
    @"Exception:Sensitivity",
    @"Exception:SentCcMe",
    @"Exception:SentOnlyToMe",
    @"Exception:SentToAddresses",
    @"Exception:SentToMe",
    @"Exception:SentToOrCcMe",
    @"Exception:WithinDateRange",
    @"Exception:WithinSizeRange",
    @"Exceptions",
    @"IsEnabled",
    @"IsInError",
    @"IsNotSupported",
    @"Priority",
    @"RuleId",
};

@implementation t_RuleFieldURIType
+ (t_RuleFieldURITypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_RuleFieldURIType_enumValues) / sizeof(t_RuleFieldURIType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_RuleFieldURIType_enumValues[i]])
            return (t_RuleFieldURITypeEnum)i;
    }

    return t_RuleFieldURIType_none;
}

+ (NSString *)stringFromValue:(t_RuleFieldURITypeEnum)value {
    return t_RuleFieldURIType_enumValues[(int)value];
}

+ (t_RuleFieldURITypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_RuleFieldURIType_none;
}

+ (t_RuleFieldURITypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RuleFieldURITypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_RuleFieldURITypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
static NSString *t_RuleValidationErrorCodeType_enumValues[] = {
    @"",
    @"ADOperationFailure",
    @"ConnectedAccountNotFound",
    @"CreateWithRuleId",
    @"DuplicatedOperationOnTheSameRule",
    @"DuplicatedPriority",
    @"EmptyValueFound",
    @"FolderDoesNotExist",
    @"InvalidAddress",
    @"InvalidDateRange",
    @"InvalidFolderId",
    @"InvalidSizeRange",
    @"InvalidValue",
    @"MessageClassificationNotFound",
    @"MissingAction",
    @"MissingParameter",
    @"MissingRangeValue",
    @"NotSettable",
    @"RecipientDoesNotExist",
    @"RuleNotFound",
    @"SizeLessThanZero",
    @"StringValueTooBig",
    @"UnexpectedError",
    @"UnsupportedAddress",
    @"UnsupportedRule",
};

@implementation t_RuleValidationErrorCodeType
+ (t_RuleValidationErrorCodeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_RuleValidationErrorCodeType_enumValues) / sizeof(t_RuleValidationErrorCodeType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_RuleValidationErrorCodeType_enumValues[i]])
            return (t_RuleValidationErrorCodeTypeEnum)i;
    }

    return t_RuleValidationErrorCodeType_none;
}

+ (NSString *)stringFromValue:(t_RuleValidationErrorCodeTypeEnum)value {
    return t_RuleValidationErrorCodeType_enumValues[(int)value];
}

+ (t_RuleValidationErrorCodeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_RuleValidationErrorCodeType_none;
}

+ (t_RuleValidationErrorCodeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RuleValidationErrorCodeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_RuleValidationErrorCodeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_RuleValidationErrorType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RuleValidationErrorType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FieldURI)
        [t_RuleFieldURIType serializeToChildOf:node withName:"t:FieldURI" value:_FieldURI];

    if (_ErrorCode)
        [t_RuleValidationErrorCodeType serializeToChildOf:node withName:"t:ErrorCode" value:_ErrorCode];

    if (_ErrorMessage)
        [xsd_string serializeToChildOf:node withName:"t:ErrorMessage" value:_ErrorMessage];

    if (_FieldValue)
        [xsd_string serializeToChildOf:node withName:"t:FieldValue" value:_FieldValue];

}

+ (t_RuleValidationErrorType *)deserializeNode:(xmlNodePtr)cur {
    t_RuleValidationErrorType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FieldURI")) {
            self.FieldURI = [t_RuleFieldURIType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ErrorCode")) {
            self.ErrorCode = [t_RuleValidationErrorCodeType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ErrorMessage")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.ErrorMessage = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FieldValue")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.FieldValue = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_Value
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_Value *)value {
    [xsd_string serializeToChildOf:node withName:childName value:value._content];
    xmlNodePtr child = node->last;

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"Name" onNode:node value:_Name];
}

+ (t_Value *)deserializeNode:(xmlNodePtr)cur {
    t_Value *newObject = [self new];
    newObject._content = [xsd_string deserializeNode:cur];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Name = [xsd_string deserializeAttribute:"Name" ofNode:cur];
}
@end
@implementation t_FractionalPageViewType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FractionalPageViewType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [super addAttributesToNode:node];

    [xsd_int serializeToProperty:"Numerator" onNode:node value:_Numerator];
    [xsd_int serializeToProperty:"Denominator" onNode:node value:_Denominator];
}

+ (t_FractionalPageViewType *)deserializeNode:(xmlNodePtr)cur {
    t_FractionalPageViewType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    [super deserializeAttributesFromNode:cur];

    self.Numerator = [xsd_int deserializeAttribute:"Numerator" ofNode:cur];
    self.Denominator = [xsd_int deserializeAttribute:"Denominator" ofNode:cur];
}
@end
@implementation t_ProtectionRuleAndType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"AllInternal")) {
            Class elementClass = classForElement(child) ?: [t_ProtectionRuleAllInternalType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"And")) {
            Class elementClass = classForElement(child) ?: [t_ProtectionRuleAndType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"RecipientIs")) {
            Class elementClass = classForElement(child) ?: [t_ProtectionRuleRecipientIsType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SenderDepartments")) {
            Class elementClass = classForElement(child) ?: [t_ProtectionRuleSenderDepartmentsType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"True")) {
            Class elementClass = classForElement(child) ?: [t_ProtectionRuleTrueType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_ProtectionRuleAllInternalType class]])
            [t_ProtectionRuleAllInternalType serializeToChildOf:child withName:"t:AllInternal" value:item];
        else if ([item isMemberOfClass:[t_ProtectionRuleAndType class]])
            [t_ProtectionRuleAndType serializeToChildOf:child withName:"t:And" value:item];
        else if ([item isMemberOfClass:[t_ProtectionRuleRecipientIsType class]])
            [t_ProtectionRuleRecipientIsType serializeToChildOf:child withName:"t:RecipientIs" value:item];
        else if ([item isMemberOfClass:[t_ProtectionRuleSenderDepartmentsType class]])
            [t_ProtectionRuleSenderDepartmentsType serializeToChildOf:child withName:"t:SenderDepartments" value:item];
        else if ([item isMemberOfClass:[t_ProtectionRuleTrueType class]])
            [t_ProtectionRuleTrueType serializeToChildOf:child withName:"t:True" value:item];
    }
}
@end
@implementation t_DailyRegeneratingPatternType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DailyRegeneratingPatternType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_DailyRegeneratingPatternType *)deserializeNode:(xmlNodePtr)cur {
    t_DailyRegeneratingPatternType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_EffectiveRightsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_EffectiveRightsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_CreateAssociated)
        [xsd_boolean serializeToChildOf:node withName:"t:CreateAssociated" value:_CreateAssociated];

    if (_CreateContents)
        [xsd_boolean serializeToChildOf:node withName:"t:CreateContents" value:_CreateContents];

    if (_CreateHierarchy)
        [xsd_boolean serializeToChildOf:node withName:"t:CreateHierarchy" value:_CreateHierarchy];

    if (_Delete)
        [xsd_boolean serializeToChildOf:node withName:"t:Delete" value:_Delete];

    if (_Modify)
        [xsd_boolean serializeToChildOf:node withName:"t:Modify" value:_Modify];

    if (_Read)
        [xsd_boolean serializeToChildOf:node withName:"t:Read" value:_Read];

    if (_ViewPrivateItems)
        [xsd_boolean serializeToChildOf:node withName:"t:ViewPrivateItems" value:_ViewPrivateItems];

}

+ (t_EffectiveRightsType *)deserializeNode:(xmlNodePtr)cur {
    t_EffectiveRightsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"CreateAssociated")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.CreateAssociated = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CreateContents")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.CreateContents = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CreateHierarchy")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.CreateHierarchy = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Delete")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.Delete = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Modify")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.Modify = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Read")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.Read = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ViewPrivateItems")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.ViewPrivateItems = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ReferenceItemResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ReferenceItemResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (t_ReferenceItemResponseType *)deserializeNode:(xmlNodePtr)cur {
    t_ReferenceItemResponseType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_RecurringDayTransitionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RecurringDayTransitionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_DayOfWeek)
        [t_DayOfWeekType serializeToChildOf:node withName:"t:DayOfWeek" value:_DayOfWeek];

    if (_Occurrence)
        [xsd_int serializeToChildOf:node withName:"t:Occurrence" value:_Occurrence];

}

+ (t_RecurringDayTransitionType *)deserializeNode:(xmlNodePtr)cur {
    t_RecurringDayTransitionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"DayOfWeek")) {
            self.DayOfWeek = [t_DayOfWeekType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Occurrence")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.Occurrence = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ReplyBody
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ReplyBody *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xml_Attributelang serializeToProperty:"lang" onNode:node value:_lang];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Message)
        [xsd_string serializeToChildOf:node withName:"t:Message" value:_Message];

}


+ (t_ReplyBody *)deserializeNode:(xmlNodePtr)cur {
    t_ReplyBody *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.lang = [xml_Attributelang deserializeAttribute:"lang" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Message")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Message = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_SidAndAttributesType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SidAndAttributesType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_unsignedInt serializeToProperty:"Attributes" onNode:node value:_Attributes];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SecurityIdentifier)
        [xsd_string serializeToChildOf:node withName:"t:SecurityIdentifier" value:_SecurityIdentifier];

}


+ (t_SidAndAttributesType *)deserializeNode:(xmlNodePtr)cur {
    t_SidAndAttributesType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Attributes = [xsd_unsignedInt deserializeAttribute:"Attributes" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SecurityIdentifier")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.SecurityIdentifier = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_NonEmptyArrayOfNotificationsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Notification")) {
            Class elementClass = classForElement(child) ?: [t_NotificationType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_NotificationType * item in value)
        [t_NotificationType serializeToChildOf:child withName:"t:Notification" value:item];
}
@end
static NSString *t_ConnectionFailureCauseType_enumValues[] = {
    @"",
    @"NoAnswer",
    @"None",
    @"Other",
    @"Unavailable",
    @"UserBusy",
};

@implementation t_ConnectionFailureCauseType
+ (t_ConnectionFailureCauseTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ConnectionFailureCauseType_enumValues) / sizeof(t_ConnectionFailureCauseType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ConnectionFailureCauseType_enumValues[i]])
            return (t_ConnectionFailureCauseTypeEnum)i;
    }

    return t_ConnectionFailureCauseType_none;
}

+ (NSString *)stringFromValue:(t_ConnectionFailureCauseTypeEnum)value {
    return t_ConnectionFailureCauseType_enumValues[(int)value];
}

+ (t_ConnectionFailureCauseTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ConnectionFailureCauseType_none;
}

+ (t_ConnectionFailureCauseTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConnectionFailureCauseTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ConnectionFailureCauseTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_PhoneCallInformationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhoneCallInformationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_PhoneCallState)
        [t_PhoneCallStateType serializeToChildOf:node withName:"t:PhoneCallState" value:_PhoneCallState];

    if (_ConnectionFailureCause)
        [t_ConnectionFailureCauseType serializeToChildOf:node withName:"t:ConnectionFailureCause" value:_ConnectionFailureCause];

    if (_SIPResponseText)
        [xsd_string serializeToChildOf:node withName:"t:SIPResponseText" value:_SIPResponseText];

    if (_SIPResponseCode)
        [xsd_int serializeToChildOf:node withName:"t:SIPResponseCode" value:_SIPResponseCode];

}

+ (t_PhoneCallInformationType *)deserializeNode:(xmlNodePtr)cur {
    t_PhoneCallInformationType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"PhoneCallState")) {
            self.PhoneCallState = [t_PhoneCallStateType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConnectionFailureCause")) {
            self.ConnectionFailureCause = [t_ConnectionFailureCauseType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SIPResponseText")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.SIPResponseText = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SIPResponseCode")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.SIPResponseCode = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_FindMessageTrackingSearchResultType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FindMessageTrackingSearchResultType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Subject)
        [xsd_string serializeToChildOf:node withName:"t:Subject" value:_Subject];

    if (_Sender)
        [t_EmailAddressType serializeToChildOf:node withName:"t:Sender" value:_Sender];

    if (_PurportedSender)
        [t_EmailAddressType serializeToChildOf:node withName:"t:PurportedSender" value:_PurportedSender];

    if (_Recipients)
        [t_ArrayOfRecipientsType serializeToChildOf:node withName:"t:Recipients" value:_Recipients];

    if (_SubmittedTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:SubmittedTime" value:_SubmittedTime];

    if (_MessageTrackingReportId)
        [t_NonEmptyStringType serializeToChildOf:node withName:"t:MessageTrackingReportId" value:_MessageTrackingReportId];

    if (_PreviousHopServer)
        [t_NonEmptyStringType serializeToChildOf:node withName:"t:PreviousHopServer" value:_PreviousHopServer];

    if (_FirstHopServer)
        [t_NonEmptyStringType serializeToChildOf:node withName:"t:FirstHopServer" value:_FirstHopServer];

    if (_Properties)
        [t_ArrayOfTrackingPropertiesType serializeToChildOf:node withName:"t:Properties" value:_Properties];

}


- (t_EmailAddressType *)Sender {
    if (!_Sender) _Sender = [t_EmailAddressType new];
    return _Sender;
}

- (t_EmailAddressType *)PurportedSender {
    if (!_PurportedSender) _PurportedSender = [t_EmailAddressType new];
    return _PurportedSender;
}
+ (t_FindMessageTrackingSearchResultType *)deserializeNode:(xmlNodePtr)cur {
    t_FindMessageTrackingSearchResultType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Subject")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Subject = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Sender")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.Sender = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PurportedSender")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.PurportedSender = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Recipients")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRecipientsType class];
            self.Recipients = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SubmittedTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.SubmittedTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MessageTrackingReportId")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.MessageTrackingReportId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PreviousHopServer")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.PreviousHopServer = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FirstHopServer")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.FirstHopServer = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Properties")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfTrackingPropertiesType class];
            self.Properties = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_SubscriptionTimeoutType
+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return @([str doubleValue]);
}

+ (NSNumber *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return @([attrString doubleValue]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSNumber *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSNumber *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_PullSubscriptionRequestType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PullSubscriptionRequestType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Timeout)
        [t_SubscriptionTimeoutType serializeToChildOf:node withName:"t:Timeout" value:_Timeout];

}

+ (t_PullSubscriptionRequestType *)deserializeNode:(xmlNodePtr)cur {
    t_PullSubscriptionRequestType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Timeout")) {
            Class elementClass = classForElement(cur) ?: [t_SubscriptionTimeoutType class];
            self.Timeout = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_RootItemIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RootItemIdType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"RootItemId" onNode:node value:_RootItemId];
    [xsd_string serializeToProperty:"RootItemChangeKey" onNode:node value:_RootItemChangeKey];
}

+ (t_RootItemIdType *)deserializeNode:(xmlNodePtr)cur {
    t_RootItemIdType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.RootItemId = [xsd_string deserializeAttribute:"RootItemId" ofNode:cur];
    self.RootItemChangeKey = [xsd_string deserializeAttribute:"RootItemChangeKey" ofNode:cur];
}
@end
@implementation t_ModifiedEventType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ModifiedEventType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_UnreadCount)
        [xsd_int serializeToChildOf:node withName:"t:UnreadCount" value:_UnreadCount];

}

+ (t_ModifiedEventType *)deserializeNode:(xmlNodePtr)cur {
    t_ModifiedEventType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"UnreadCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.UnreadCount = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_SyncFolderItemsChangesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Create")) {
            Class elementClass = classForElement(child) ?: [t_SyncFolderItemsCreateOrUpdateType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"Update")) {
            Class elementClass = classForElement(child) ?: [t_SyncFolderItemsCreateOrUpdateType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"Delete")) {
            Class elementClass = classForElement(child) ?: [t_SyncFolderItemsDeleteType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ReadFlagChange")) {
            Class elementClass = classForElement(child) ?: [t_SyncFolderItemsReadFlagType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_SyncFolderItemsCreateOrUpdateType class]])
            [t_SyncFolderItemsCreateOrUpdateType serializeToChildOf:child withName:"t:Create" value:item];
        else if ([item isMemberOfClass:[t_SyncFolderItemsCreateOrUpdateType class]])
            [t_SyncFolderItemsCreateOrUpdateType serializeToChildOf:child withName:"t:Update" value:item];
        else if ([item isMemberOfClass:[t_SyncFolderItemsDeleteType class]])
            [t_SyncFolderItemsDeleteType serializeToChildOf:child withName:"t:Delete" value:item];
        else if ([item isMemberOfClass:[t_SyncFolderItemsReadFlagType class]])
            [t_SyncFolderItemsReadFlagType serializeToChildOf:child withName:"t:ReadFlagChange" value:item];
    }
}
@end
@implementation t_AttributeValue
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_ProtectionRuleArgumentType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ProtectionRuleArgumentType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_AttributeValue serializeToProperty:"Value" onNode:node value:_Value];
}

+ (t_ProtectionRuleArgumentType *)deserializeNode:(xmlNodePtr)cur {
    t_ProtectionRuleArgumentType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Value = [t_AttributeValue deserializeAttribute:"Value" ofNode:cur];
}
@end
@implementation t_ArrayOfArraysOfTrackingPropertiesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"ArrayOfTrackingPropertiesType")) {
            Class elementClass = classForElement(child) ?: [t_ArrayOfTrackingPropertiesType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (NSArray * item in value)
        [t_ArrayOfTrackingPropertiesType serializeToChildOf:child withName:"t:ArrayOfTrackingPropertiesType" value:item];
}
@end
static NSString *t_DictionaryURIType_enumValues[] = {
    @"",
    @"contacts:EmailAddress",
    @"contacts:ImAddress",
    @"contacts:PhoneNumber",
    @"contacts:PhysicalAddress:City",
    @"contacts:PhysicalAddress:CountryOrRegion",
    @"contacts:PhysicalAddress:PostalCode",
    @"contacts:PhysicalAddress:State",
    @"contacts:PhysicalAddress:Street",
    @"distributionlist:Members:Member",
    @"item:InternetMessageHeader",
};

@implementation t_DictionaryURIType
+ (t_DictionaryURITypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_DictionaryURIType_enumValues) / sizeof(t_DictionaryURIType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_DictionaryURIType_enumValues[i]])
            return (t_DictionaryURITypeEnum)i;
    }

    return t_DictionaryURIType_none;
}

+ (NSString *)stringFromValue:(t_DictionaryURITypeEnum)value {
    return t_DictionaryURIType_enumValues[(int)value];
}

+ (t_DictionaryURITypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_DictionaryURIType_none;
}

+ (t_DictionaryURITypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DictionaryURITypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DictionaryURITypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_PathToIndexedFieldType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PathToIndexedFieldType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_DictionaryURIType serializeToProperty:"FieldURI" onNode:node value:_FieldURI];
    [xsd_string serializeToProperty:"FieldIndex" onNode:node value:_FieldIndex];
}

+ (t_PathToIndexedFieldType *)deserializeNode:(xmlNodePtr)cur {
    t_PathToIndexedFieldType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.FieldURI = [t_DictionaryURIType deserializeAttribute:"FieldURI" ofNode:cur];
    self.FieldIndex = [xsd_string deserializeAttribute:"FieldIndex" ofNode:cur];
}
@end
static NSString *t_TransitionTargetKindType_enumValues[] = {
    @"",
    @"Group",
    @"Period",
};

@implementation t_TransitionTargetKindType
+ (t_TransitionTargetKindTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_TransitionTargetKindType_enumValues) / sizeof(t_TransitionTargetKindType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_TransitionTargetKindType_enumValues[i]])
            return (t_TransitionTargetKindTypeEnum)i;
    }

    return t_TransitionTargetKindType_none;
}

+ (NSString *)stringFromValue:(t_TransitionTargetKindTypeEnum)value {
    return t_TransitionTargetKindType_enumValues[(int)value];
}

+ (t_TransitionTargetKindTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_TransitionTargetKindType_none;
}

+ (t_TransitionTargetKindTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TransitionTargetKindTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_TransitionTargetKindTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
static NSString *t_TaskStatusType_enumValues[] = {
    @"",
    @"Completed",
    @"Deferred",
    @"InProgress",
    @"NotStarted",
    @"WaitingOnOthers",
};

@implementation t_TaskStatusType
+ (t_TaskStatusTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_TaskStatusType_enumValues) / sizeof(t_TaskStatusType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_TaskStatusType_enumValues[i]])
            return (t_TaskStatusTypeEnum)i;
    }

    return t_TaskStatusType_none;
}

+ (NSString *)stringFromValue:(t_TaskStatusTypeEnum)value {
    return t_TaskStatusType_enumValues[(int)value];
}

+ (t_TaskStatusTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_TaskStatusType_none;
}

+ (t_TaskStatusTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TaskStatusTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_TaskStatusTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ProtectionRuleSenderDepartmentsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Value")) {
            Class elementClass = classForElement(child) ?: [t_ProtectionRuleValueType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (NSString * item in value)
        [t_ProtectionRuleValueType serializeToChildOf:child withName:"t:Value" value:item];
}
@end
@implementation t_RequestAttachmentIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RequestAttachmentIdType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"Id" onNode:node value:_Id_];
}

+ (t_RequestAttachmentIdType *)deserializeNode:(xmlNodePtr)cur {
    t_RequestAttachmentIdType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Id_ = [xsd_string deserializeAttribute:"Id" ofNode:cur];
}
@end
@implementation t_AttachmentIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AttachmentIdType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [super addAttributesToNode:node];

    [xsd_string serializeToProperty:"RootItemId" onNode:node value:_RootItemId];
    [xsd_string serializeToProperty:"RootItemChangeKey" onNode:node value:_RootItemChangeKey];
}

+ (t_AttachmentIdType *)deserializeNode:(xmlNodePtr)cur {
    t_AttachmentIdType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    [super deserializeAttributesFromNode:cur];

    self.RootItemId = [xsd_string deserializeAttribute:"RootItemId" ofNode:cur];
    self.RootItemChangeKey = [xsd_string deserializeAttribute:"RootItemChangeKey" ofNode:cur];
}
@end
@implementation t_AbsoluteYearlyRecurrencePatternType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AbsoluteYearlyRecurrencePatternType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_DayOfMonth)
        [xsd_int serializeToChildOf:node withName:"t:DayOfMonth" value:_DayOfMonth];

    if (_Month)
        [t_MonthNamesType serializeToChildOf:node withName:"t:Month" value:_Month];

}

+ (t_AbsoluteYearlyRecurrencePatternType *)deserializeNode:(xmlNodePtr)cur {
    t_AbsoluteYearlyRecurrencePatternType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"DayOfMonth")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.DayOfMonth = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Month")) {
            self.Month = [t_MonthNamesType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation t_RecipientTrackingEventType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RecipientTrackingEventType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Date)
        [xsd_dateTime serializeToChildOf:node withName:"t:Date" value:_Date];

    if (_Recipient)
        [t_EmailAddressType serializeToChildOf:node withName:"t:Recipient" value:_Recipient];

    if (_DeliveryStatus)
        [xsd_string serializeToChildOf:node withName:"t:DeliveryStatus" value:_DeliveryStatus];

    if (_EventDescription)
        [xsd_string serializeToChildOf:node withName:"t:EventDescription" value:_EventDescription];

    if (_EventData)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:EventData" value:_EventData];

    if (_Server)
        [t_NonEmptyStringType serializeToChildOf:node withName:"t:Server" value:_Server];

    if (_InternalId)
        [xsd_nonNegativeInteger serializeToChildOf:node withName:"t:InternalId" value:_InternalId];

    if (_BccRecipient)
        [xsd_boolean serializeToChildOf:node withName:"t:BccRecipient" value:_BccRecipient];

    if (_HiddenRecipient)
        [xsd_boolean serializeToChildOf:node withName:"t:HiddenRecipient" value:_HiddenRecipient];

    if (_UniquePathId)
        [t_NonEmptyStringType serializeToChildOf:node withName:"t:UniquePathId" value:_UniquePathId];

    if (_RootAddress)
        [t_NonEmptyStringType serializeToChildOf:node withName:"t:RootAddress" value:_RootAddress];

    if (_Properties)
        [t_ArrayOfTrackingPropertiesType serializeToChildOf:node withName:"t:Properties" value:_Properties];

}


- (t_EmailAddressType *)Recipient {
    if (!_Recipient) _Recipient = [t_EmailAddressType new];
    return _Recipient;
}
+ (t_RecipientTrackingEventType *)deserializeNode:(xmlNodePtr)cur {
    t_RecipientTrackingEventType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Date")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.Date = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Recipient")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.Recipient = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DeliveryStatus")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.DeliveryStatus = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EventDescription")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.EventDescription = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EventData")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.EventData = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Server")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.Server = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"InternalId")) {
            Class elementClass = classForElement(cur) ?: [xsd_nonNegativeInteger class];
            self.InternalId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"BccRecipient")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.BccRecipient = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"HiddenRecipient")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.HiddenRecipient = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"UniquePathId")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.UniquePathId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RootAddress")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.RootAddress = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Properties")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfTrackingPropertiesType class];
            self.Properties = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ProtectionRuleConditionType
+ (id)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = nil;
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;
        else if (xmlStrEqual(child->name, (const xmlChar *)"AllInternal")) {
            Class elementClass = classForElement(child) ?: [t_ProtectionRuleAllInternalType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"And")) {
            Class elementClass = classForElement(child) ?: [t_ProtectionRuleAndType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"RecipientIs")) {
            Class elementClass = classForElement(child) ?: [t_ProtectionRuleRecipientIsType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SenderDepartments")) {
            Class elementClass = classForElement(child) ?: [t_ProtectionRuleSenderDepartmentsType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"True")) {
            Class elementClass = classForElement(child) ?: [t_ProtectionRuleTrueType class];
            return [elementClass deserializeNode:child];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(id)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    if (false);
    else if ([value isMemberOfClass:[t_ProtectionRuleAllInternalType class]])
        [t_ProtectionRuleAllInternalType serializeToChildOf:child withName:"t:AllInternal" value:value];
    else if ([value isMemberOfClass:[t_ProtectionRuleAndType class]])
        [t_ProtectionRuleAndType serializeToChildOf:child withName:"t:And" value:value];
    else if ([value isMemberOfClass:[t_ProtectionRuleRecipientIsType class]])
        [t_ProtectionRuleRecipientIsType serializeToChildOf:child withName:"t:RecipientIs" value:value];
    else if ([value isMemberOfClass:[t_ProtectionRuleSenderDepartmentsType class]])
        [t_ProtectionRuleSenderDepartmentsType serializeToChildOf:child withName:"t:SenderDepartments" value:value];
    else if ([value isMemberOfClass:[t_ProtectionRuleTrueType class]])
        [t_ProtectionRuleTrueType serializeToChildOf:child withName:"t:True" value:value];
}
@end
@implementation t_ArrayOfSuggestion
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Suggestion")) {
            Class elementClass = classForElement(child) ?: [t_Suggestion class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_Suggestion * item in value)
        [t_Suggestion serializeToChildOf:child withName:"t:Suggestion" value:item];
}
@end
@implementation t_SuggestionDayResult
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SuggestionDayResult *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Date)
        [xsd_dateTime serializeToChildOf:node withName:"t:Date" value:_Date];

    if (_DayQuality)
        [t_SuggestionQuality serializeToChildOf:node withName:"t:DayQuality" value:_DayQuality];

    if (_SuggestionArray)
        [t_ArrayOfSuggestion serializeToChildOf:node withName:"t:SuggestionArray" value:_SuggestionArray];

}

+ (t_SuggestionDayResult *)deserializeNode:(xmlNodePtr)cur {
    t_SuggestionDayResult *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Date")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.Date = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DayQuality")) {
            self.DayQuality = [t_SuggestionQuality deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SuggestionArray")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfSuggestion class];
            self.SuggestionArray = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_TentativelyAcceptItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TentativelyAcceptItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (t_TentativelyAcceptItemType *)deserializeNode:(xmlNodePtr)cur {
    t_TentativelyAcceptItemType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_RuleActionsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RuleActionsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_AssignCategories)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:AssignCategories" value:_AssignCategories];

    if (_CopyToFolder)
        [t_TargetFolderIdType serializeToChildOf:node withName:"t:CopyToFolder" value:_CopyToFolder];

    if (_Delete)
        [xsd_boolean serializeToChildOf:node withName:"t:Delete" value:_Delete];

    if (_ForwardAsAttachmentToRecipients)
        [t_ArrayOfEmailAddressesType serializeToChildOf:node withName:"t:ForwardAsAttachmentToRecipients" value:_ForwardAsAttachmentToRecipients];

    if (_ForwardToRecipients)
        [t_ArrayOfEmailAddressesType serializeToChildOf:node withName:"t:ForwardToRecipients" value:_ForwardToRecipients];

    if (_MarkImportance)
        [t_ImportanceChoicesType serializeToChildOf:node withName:"t:MarkImportance" value:_MarkImportance];

    if (_MarkAsRead)
        [xsd_boolean serializeToChildOf:node withName:"t:MarkAsRead" value:_MarkAsRead];

    if (_MoveToFolder)
        [t_TargetFolderIdType serializeToChildOf:node withName:"t:MoveToFolder" value:_MoveToFolder];

    if (_PermanentDelete)
        [xsd_boolean serializeToChildOf:node withName:"t:PermanentDelete" value:_PermanentDelete];

    if (_RedirectToRecipients)
        [t_ArrayOfEmailAddressesType serializeToChildOf:node withName:"t:RedirectToRecipients" value:_RedirectToRecipients];

    if (_SendSMSAlertToRecipients)
        [t_ArrayOfEmailAddressesType serializeToChildOf:node withName:"t:SendSMSAlertToRecipients" value:_SendSMSAlertToRecipients];

    if (_ServerReplyWithMessage)
        [t_ItemIdType serializeToChildOf:node withName:"t:ServerReplyWithMessage" value:_ServerReplyWithMessage];

    if (_StopProcessingRules)
        [xsd_boolean serializeToChildOf:node withName:"t:StopProcessingRules" value:_StopProcessingRules];

}


- (t_ItemIdType *)ServerReplyWithMessage {
    if (!_ServerReplyWithMessage) _ServerReplyWithMessage = [t_ItemIdType new];
    return _ServerReplyWithMessage;
}
+ (t_RuleActionsType *)deserializeNode:(xmlNodePtr)cur {
    t_RuleActionsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"AssignCategories")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.AssignCategories = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CopyToFolder")) {
            Class elementClass = classForElement(cur) ?: [t_TargetFolderIdType class];
            self.CopyToFolder = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Delete")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.Delete = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ForwardAsAttachmentToRecipients")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfEmailAddressesType class];
            self.ForwardAsAttachmentToRecipients = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ForwardToRecipients")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfEmailAddressesType class];
            self.ForwardToRecipients = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MarkImportance")) {
            self.MarkImportance = [t_ImportanceChoicesType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MarkAsRead")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.MarkAsRead = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MoveToFolder")) {
            Class elementClass = classForElement(cur) ?: [t_TargetFolderIdType class];
            self.MoveToFolder = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PermanentDelete")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.PermanentDelete = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RedirectToRecipients")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfEmailAddressesType class];
            self.RedirectToRecipients = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SendSMSAlertToRecipients")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfEmailAddressesType class];
            self.SendSMSAlertToRecipients = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ServerReplyWithMessage")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ServerReplyWithMessage = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"StopProcessingRules")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.StopProcessingRules = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ArrayOfRuleOperationErrorsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"RuleOperationError")) {
            Class elementClass = classForElement(child) ?: [t_RuleOperationErrorType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_RuleOperationErrorType * item in value)
        [t_RuleOperationErrorType serializeToChildOf:child withName:"t:RuleOperationError" value:item];
}
@end
@implementation t_SuppressReadReceiptType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SuppressReadReceiptType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (t_SuppressReadReceiptType *)deserializeNode:(xmlNodePtr)cur {
    t_SuppressReadReceiptType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_RequestTypeHeader
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RequestTypeHeader *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_RequestType)
        [t_AvailabilityProxyRequestType serializeToChildOf:node withName:"t:RequestType" value:_RequestType];

}

+ (t_RequestTypeHeader *)deserializeNode:(xmlNodePtr)cur {
    t_RequestTypeHeader *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"RequestType")) {
            self.RequestType = [t_AvailabilityProxyRequestType deserializeNodeRaw:cur];
        }
    }
}
@end
static NSString *t_ImAddressKeyType_enumValues[] = {
    @"",
    @"ImAddress1",
    @"ImAddress2",
    @"ImAddress3",
};

@implementation t_ImAddressKeyType
+ (t_ImAddressKeyTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ImAddressKeyType_enumValues) / sizeof(t_ImAddressKeyType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ImAddressKeyType_enumValues[i]])
            return (t_ImAddressKeyTypeEnum)i;
    }

    return t_ImAddressKeyType_none;
}

+ (NSString *)stringFromValue:(t_ImAddressKeyTypeEnum)value {
    return t_ImAddressKeyType_enumValues[(int)value];
}

+ (t_ImAddressKeyTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ImAddressKeyType_none;
}

+ (t_ImAddressKeyTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ImAddressKeyTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ImAddressKeyTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ImAddressDictionaryEntryType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ImAddressDictionaryEntryType *)value {
    [xsd_string serializeToChildOf:node withName:childName value:value._content];
    xmlNodePtr child = node->last;

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_ImAddressKeyType serializeToProperty:"Key" onNode:node value:_Key];
}

+ (t_ImAddressDictionaryEntryType *)deserializeNode:(xmlNodePtr)cur {
    t_ImAddressDictionaryEntryType *newObject = [self new];
    newObject._content = [xsd_string deserializeNode:cur];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Key = [t_ImAddressKeyType deserializeAttribute:"Key" ofNode:cur];
}
@end
static NSString *t_OofState_enumValues[] = {
    @"",
    @"Disabled",
    @"Enabled",
    @"Scheduled",
};

@implementation t_OofState
+ (t_OofStateEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_OofState_enumValues) / sizeof(t_OofState_enumValues[0]); ++i) {
        if ([string isEqualToString:t_OofState_enumValues[i]])
            return (t_OofStateEnum)i;
    }

    return t_OofState_none;
}

+ (NSString *)stringFromValue:(t_OofStateEnum)value {
    return t_OofState_enumValues[(int)value];
}

+ (t_OofStateEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_OofState_none;
}

+ (t_OofStateEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_OofStateEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_OofStateEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_MessageTrackingReportType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MessageTrackingReportType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Sender)
        [t_EmailAddressType serializeToChildOf:node withName:"t:Sender" value:_Sender];

    if (_PurportedSender)
        [t_EmailAddressType serializeToChildOf:node withName:"t:PurportedSender" value:_PurportedSender];

    if (_Subject)
        [xsd_string serializeToChildOf:node withName:"t:Subject" value:_Subject];

    if (_SubmitTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:SubmitTime" value:_SubmitTime];

    if (_OriginalRecipients)
        [t_ArrayOfEmailAddressesType serializeToChildOf:node withName:"t:OriginalRecipients" value:_OriginalRecipients];

    if (_RecipientTrackingEvents)
        [t_ArrayOfRecipientTrackingEventType serializeToChildOf:node withName:"t:RecipientTrackingEvents" value:_RecipientTrackingEvents];

    if (_Properties)
        [t_ArrayOfTrackingPropertiesType serializeToChildOf:node withName:"t:Properties" value:_Properties];

}


- (t_EmailAddressType *)Sender {
    if (!_Sender) _Sender = [t_EmailAddressType new];
    return _Sender;
}

- (t_EmailAddressType *)PurportedSender {
    if (!_PurportedSender) _PurportedSender = [t_EmailAddressType new];
    return _PurportedSender;
}
+ (t_MessageTrackingReportType *)deserializeNode:(xmlNodePtr)cur {
    t_MessageTrackingReportType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Sender")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.Sender = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PurportedSender")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.PurportedSender = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Subject")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Subject = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SubmitTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.SubmitTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"OriginalRecipients")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfEmailAddressesType class];
            self.OriginalRecipients = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RecipientTrackingEvents")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRecipientTrackingEventType class];
            self.RecipientTrackingEvents = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Properties")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfTrackingPropertiesType class];
            self.Properties = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_IndexedPageViewType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_IndexedPageViewType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [super addAttributesToNode:node];

    [xsd_int serializeToProperty:"Offset" onNode:node value:_Offset];
    [t_IndexBasePointType serializeToProperty:"BasePoint" onNode:node value:_BasePoint];
}

+ (t_IndexedPageViewType *)deserializeNode:(xmlNodePtr)cur {
    t_IndexedPageViewType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    [super deserializeAttributesFromNode:cur];

    self.Offset = [xsd_int deserializeAttribute:"Offset" ofNode:cur];
    self.BasePoint = [t_IndexBasePointType deserializeAttribute:"BasePoint" ofNode:cur];
}
@end
@implementation t_RecurrenceRangeBaseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RecurrenceRangeBaseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_StartDate)
        [xsd_date serializeToChildOf:node withName:"t:StartDate" value:_StartDate];

}

+ (t_RecurrenceRangeBaseType *)deserializeNode:(xmlNodePtr)cur {
    t_RecurrenceRangeBaseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"StartDate")) {
            Class elementClass = classForElement(cur) ?: [xsd_date class];
            self.StartDate = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_EndDateRecurrenceRangeType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_EndDateRecurrenceRangeType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_EndDate)
        [xsd_date serializeToChildOf:node withName:"t:EndDate" value:_EndDate];

}

+ (t_EndDateRecurrenceRangeType *)deserializeNode:(xmlNodePtr)cur {
    t_EndDateRecurrenceRangeType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"EndDate")) {
            Class elementClass = classForElement(cur) ?: [xsd_date class];
            self.EndDate = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_SyncFolderHierarchyCreateOrUpdateType
+ (id)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = nil;
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;
        else if (xmlStrEqual(child->name, (const xmlChar *)"Folder")) {
            Class elementClass = classForElement(child) ?: [t_FolderType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"CalendarFolder")) {
            Class elementClass = classForElement(child) ?: [t_CalendarFolderType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ContactsFolder")) {
            Class elementClass = classForElement(child) ?: [t_ContactsFolderType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SearchFolder")) {
            Class elementClass = classForElement(child) ?: [t_SearchFolderType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"TasksFolder")) {
            Class elementClass = classForElement(child) ?: [t_TasksFolderType class];
            return [elementClass deserializeNode:child];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(id)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    if (false);
    else if ([value isMemberOfClass:[t_FolderType class]])
        [t_FolderType serializeToChildOf:child withName:"t:Folder" value:value];
    else if ([value isMemberOfClass:[t_CalendarFolderType class]])
        [t_CalendarFolderType serializeToChildOf:child withName:"t:CalendarFolder" value:value];
    else if ([value isMemberOfClass:[t_ContactsFolderType class]])
        [t_ContactsFolderType serializeToChildOf:child withName:"t:ContactsFolder" value:value];
    else if ([value isMemberOfClass:[t_SearchFolderType class]])
        [t_SearchFolderType serializeToChildOf:child withName:"t:SearchFolder" value:value];
    else if ([value isMemberOfClass:[t_TasksFolderType class]])
        [t_TasksFolderType serializeToChildOf:child withName:"t:TasksFolder" value:value];
}
@end
@implementation t_AggregateOnType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AggregateOnType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_AggregateType serializeToProperty:"Aggregate" onNode:node value:_Aggregate];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FieldURI)
        [t_PathToUnindexedFieldType serializeToChildOf:node withName:"t:FieldURI" value:_FieldURI];

    if (_IndexedFieldURI)
        [t_PathToIndexedFieldType serializeToChildOf:node withName:"t:IndexedFieldURI" value:_IndexedFieldURI];

    if (_ExtendedFieldURI)
        [t_PathToExtendedFieldType serializeToChildOf:node withName:"t:ExtendedFieldURI" value:_ExtendedFieldURI];

}


- (t_PathToUnindexedFieldType *)FieldURI {
    if (!_FieldURI) _FieldURI = [t_PathToUnindexedFieldType new];
    return _FieldURI;
}

- (t_PathToIndexedFieldType *)IndexedFieldURI {
    if (!_IndexedFieldURI) _IndexedFieldURI = [t_PathToIndexedFieldType new];
    return _IndexedFieldURI;
}

- (t_PathToExtendedFieldType *)ExtendedFieldURI {
    if (!_ExtendedFieldURI) _ExtendedFieldURI = [t_PathToExtendedFieldType new];
    return _ExtendedFieldURI;
}

+ (t_AggregateOnType *)deserializeNode:(xmlNodePtr)cur {
    t_AggregateOnType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Aggregate = [t_AggregateType deserializeAttribute:"Aggregate" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToUnindexedFieldType class];
            self.FieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IndexedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToIndexedFieldType class];
            self.IndexedFieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExtendedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToExtendedFieldType class];
            self.ExtendedFieldURI = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_CalendarItemCreateOrDeleteOperationType_enumValues[] = {
    @"",
    @"SendOnlyToAll",
    @"SendToAllAndSaveCopy",
    @"SendToNone",
};

@implementation t_CalendarItemCreateOrDeleteOperationType
+ (t_CalendarItemCreateOrDeleteOperationTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_CalendarItemCreateOrDeleteOperationType_enumValues) / sizeof(t_CalendarItemCreateOrDeleteOperationType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_CalendarItemCreateOrDeleteOperationType_enumValues[i]])
            return (t_CalendarItemCreateOrDeleteOperationTypeEnum)i;
    }

    return t_CalendarItemCreateOrDeleteOperationType_none;
}

+ (NSString *)stringFromValue:(t_CalendarItemCreateOrDeleteOperationTypeEnum)value {
    return t_CalendarItemCreateOrDeleteOperationType_enumValues[(int)value];
}

+ (t_CalendarItemCreateOrDeleteOperationTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_CalendarItemCreateOrDeleteOperationType_none;
}

+ (t_CalendarItemCreateOrDeleteOperationTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarItemCreateOrDeleteOperationTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_CalendarItemCreateOrDeleteOperationTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_ProtectionRuleAllInternalType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_ArrayOfConversationsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Conversation")) {
            Class elementClass = classForElement(child) ?: [t_ConversationType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_ConversationType * item in value)
        [t_ConversationType serializeToChildOf:child withName:"t:Conversation" value:item];
}
@end
@implementation t_NonEmptyArrayOfFieldOrdersType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"FieldOrder")) {
            Class elementClass = classForElement(child) ?: [t_FieldOrderType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_FieldOrderType * item in value)
        [t_FieldOrderType serializeToChildOf:child withName:"t:FieldOrder" value:item];
}
@end
@implementation t_AcceptItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AcceptItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (t_AcceptItemType *)deserializeNode:(xmlNodePtr)cur {
    t_AcceptItemType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_ProtectionRuleRecipientIsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Value")) {
            Class elementClass = classForElement(child) ?: [t_ProtectionRuleValueType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (NSString * item in value)
        [t_ProtectionRuleValueType serializeToChildOf:child withName:"t:Value" value:item];
}
@end
static NSString *t_MemberStatusType_enumValues[] = {
    @"",
    @"Demoted",
    @"Normal",
    @"Unrecognized",
};

@implementation t_MemberStatusType
+ (t_MemberStatusTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_MemberStatusType_enumValues) / sizeof(t_MemberStatusType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_MemberStatusType_enumValues[i]])
            return (t_MemberStatusTypeEnum)i;
    }

    return t_MemberStatusType_none;
}

+ (NSString *)stringFromValue:(t_MemberStatusTypeEnum)value {
    return t_MemberStatusType_enumValues[(int)value];
}

+ (t_MemberStatusTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_MemberStatusType_none;
}

+ (t_MemberStatusTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MemberStatusTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MemberStatusTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_MemberType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MemberType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"Key" onNode:node value:_Key];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Mailbox)
        [t_EmailAddressType serializeToChildOf:node withName:"t:Mailbox" value:_Mailbox];

    if (_Status)
        [t_MemberStatusType serializeToChildOf:node withName:"t:Status" value:_Status];

}


- (t_EmailAddressType *)Mailbox {
    if (!_Mailbox) _Mailbox = [t_EmailAddressType new];
    return _Mailbox;
}

+ (t_MemberType *)deserializeNode:(xmlNodePtr)cur {
    t_MemberType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Key = [xsd_string deserializeAttribute:"Key" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Mailbox")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.Mailbox = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Status")) {
            self.Status = [t_MemberStatusType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation t_DeleteRuleOperationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DeleteRuleOperationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_RuleId)
        [xsd_string serializeToChildOf:node withName:"t:RuleId" value:_RuleId];

}

+ (t_DeleteRuleOperationType *)deserializeNode:(xmlNodePtr)cur {
    t_DeleteRuleOperationType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"RuleId")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.RuleId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_NoEndRecurrenceRangeType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_NoEndRecurrenceRangeType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_NoEndRecurrenceRangeType *)deserializeNode:(xmlNodePtr)cur {
    t_NoEndRecurrenceRangeType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_DeleteFolderFieldType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DeleteFolderFieldType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_DeleteFolderFieldType *)deserializeNode:(xmlNodePtr)cur {
    t_DeleteFolderFieldType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_NonEmptyArrayOfTimeZoneIdType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Id")) {
            Class elementClass = classForElement(child) ?: [xsd_string class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (NSString * item in value)
        [xsd_string serializeToChildOf:child withName:"t:Id" value:item];
}
@end
@implementation t_MimeContentType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MimeContentType *)value {
    [xsd_string serializeToChildOf:node withName:childName value:value._content];
    xmlNodePtr child = node->last;

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"CharacterSet" onNode:node value:_CharacterSet];
}

+ (t_MimeContentType *)deserializeNode:(xmlNodePtr)cur {
    t_MimeContentType *newObject = [self new];
    newObject._content = [xsd_string deserializeNode:cur];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.CharacterSet = [xsd_string deserializeAttribute:"CharacterSet" ofNode:cur];
}
@end
@implementation t_ArrayOfProtectionRulesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Rule")) {
            Class elementClass = classForElement(child) ?: [t_ProtectionRuleType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_ProtectionRuleType * item in value)
        [t_ProtectionRuleType serializeToChildOf:child withName:"t:Rule" value:item];
}
@end
@implementation t_ProtectionRulesServiceConfiguration
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ProtectionRulesServiceConfiguration *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_AttributeRefreshInterval serializeToProperty:"RefreshInterval" onNode:node value:_RefreshInterval];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Rules)
        [t_ArrayOfProtectionRulesType serializeToChildOf:node withName:"t:Rules" value:_Rules];

    if (_InternalDomains)
        [t_SmtpDomainList serializeToChildOf:node withName:"t:InternalDomains" value:_InternalDomains];

}


+ (t_ProtectionRulesServiceConfiguration *)deserializeNode:(xmlNodePtr)cur {
    t_ProtectionRulesServiceConfiguration *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.RefreshInterval = [t_AttributeRefreshInterval deserializeAttribute:"RefreshInterval" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Rules")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfProtectionRulesType class];
            self.Rules = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"InternalDomains")) {
            Class elementClass = classForElement(cur) ?: [t_SmtpDomainList class];
            self.InternalDomains = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_TrackingPropertyType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TrackingPropertyType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Name)
        [xsd_string serializeToChildOf:node withName:"t:Name" value:_Name];

    if (_Value)
        [xsd_string serializeToChildOf:node withName:"t:Value" value:_Value];

}

+ (t_TrackingPropertyType *)deserializeNode:(xmlNodePtr)cur {
    t_TrackingPropertyType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Name")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Name = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Value")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Value = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ManagedFolderInformationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ManagedFolderInformationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_CanDelete)
        [xsd_boolean serializeToChildOf:node withName:"t:CanDelete" value:_CanDelete];

    if (_CanRenameOrMove)
        [xsd_boolean serializeToChildOf:node withName:"t:CanRenameOrMove" value:_CanRenameOrMove];

    if (_MustDisplayComment)
        [xsd_boolean serializeToChildOf:node withName:"t:MustDisplayComment" value:_MustDisplayComment];

    if (_HasQuota)
        [xsd_boolean serializeToChildOf:node withName:"t:HasQuota" value:_HasQuota];

    if (_IsManagedFoldersRoot)
        [xsd_boolean serializeToChildOf:node withName:"t:IsManagedFoldersRoot" value:_IsManagedFoldersRoot];

    if (_ManagedFolderId)
        [xsd_string serializeToChildOf:node withName:"t:ManagedFolderId" value:_ManagedFolderId];

    if (_Comment)
        [xsd_string serializeToChildOf:node withName:"t:Comment" value:_Comment];

    if (_StorageQuota)
        [xsd_int serializeToChildOf:node withName:"t:StorageQuota" value:_StorageQuota];

    if (_FolderSize)
        [xsd_int serializeToChildOf:node withName:"t:FolderSize" value:_FolderSize];

    if (_HomePage)
        [xsd_string serializeToChildOf:node withName:"t:HomePage" value:_HomePage];

}

+ (t_ManagedFolderInformationType *)deserializeNode:(xmlNodePtr)cur {
    t_ManagedFolderInformationType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"CanDelete")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.CanDelete = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CanRenameOrMove")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.CanRenameOrMove = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MustDisplayComment")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.MustDisplayComment = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"HasQuota")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.HasQuota = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsManagedFoldersRoot")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsManagedFoldersRoot = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ManagedFolderId")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.ManagedFolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Comment")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Comment = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"StorageQuota")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.StorageQuota = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderSize")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.FolderSize = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"HomePage")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.HomePage = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ExcludesType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ExcludesType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Path)
        [t_BasePathToElementType serializeToChildOf:node withName:"t:Path" value:_Path];

    if (_FieldURI)
        [t_PathToUnindexedFieldType serializeToChildOf:node withName:"t:FieldURI" value:_FieldURI];

    if (_IndexedFieldURI)
        [t_PathToIndexedFieldType serializeToChildOf:node withName:"t:IndexedFieldURI" value:_IndexedFieldURI];

    if (_ExtendedFieldURI)
        [t_PathToExtendedFieldType serializeToChildOf:node withName:"t:ExtendedFieldURI" value:_ExtendedFieldURI];

    if (_Bitmask)
        [t_ExcludesValueType serializeToChildOf:node withName:"t:Bitmask" value:_Bitmask];

}


- (t_BasePathToElementType *)Path {
    if (!_Path) _Path = [t_BasePathToElementType new];
    return _Path;
}

- (t_PathToUnindexedFieldType *)FieldURI {
    if (!_FieldURI) _FieldURI = [t_PathToUnindexedFieldType new];
    return _FieldURI;
}

- (t_PathToIndexedFieldType *)IndexedFieldURI {
    if (!_IndexedFieldURI) _IndexedFieldURI = [t_PathToIndexedFieldType new];
    return _IndexedFieldURI;
}

- (t_PathToExtendedFieldType *)ExtendedFieldURI {
    if (!_ExtendedFieldURI) _ExtendedFieldURI = [t_PathToExtendedFieldType new];
    return _ExtendedFieldURI;
}

- (t_ExcludesValueType *)Bitmask {
    if (!_Bitmask) _Bitmask = [t_ExcludesValueType new];
    return _Bitmask;
}
+ (t_ExcludesType *)deserializeNode:(xmlNodePtr)cur {
    t_ExcludesType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Path")) {
            Class elementClass = classForElement(cur) ?: [t_BasePathToElementType class];
            self.Path = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToUnindexedFieldType class];
            self.FieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IndexedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToIndexedFieldType class];
            self.IndexedFieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExtendedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToExtendedFieldType class];
            self.ExtendedFieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Bitmask")) {
            Class elementClass = classForElement(cur) ?: [t_ExcludesValueType class];
            self.Bitmask = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_SubscriptionStatusType_enumValues[] = {
    @"",
    @"OK",
    @"Unsubscribe",
};

@implementation t_SubscriptionStatusType
+ (t_SubscriptionStatusTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_SubscriptionStatusType_enumValues) / sizeof(t_SubscriptionStatusType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_SubscriptionStatusType_enumValues[i]])
            return (t_SubscriptionStatusTypeEnum)i;
    }

    return t_SubscriptionStatusType_none;
}

+ (NSString *)stringFromValue:(t_SubscriptionStatusTypeEnum)value {
    return t_SubscriptionStatusType_enumValues[(int)value];
}

+ (t_SubscriptionStatusTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_SubscriptionStatusType_none;
}

+ (t_SubscriptionStatusTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SubscriptionStatusTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SubscriptionStatusTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_CalendarEvent
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarEvent *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_StartTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:StartTime" value:_StartTime];

    if (_EndTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:EndTime" value:_EndTime];

    if (_BusyType)
        [t_LegacyFreeBusyType serializeToChildOf:node withName:"t:BusyType" value:_BusyType];

    if (_CalendarEventDetails)
        [t_CalendarEventDetails serializeToChildOf:node withName:"t:CalendarEventDetails" value:_CalendarEventDetails];

}


- (t_CalendarEventDetails *)CalendarEventDetails {
    if (!_CalendarEventDetails) _CalendarEventDetails = [t_CalendarEventDetails new];
    return _CalendarEventDetails;
}
+ (t_CalendarEvent *)deserializeNode:(xmlNodePtr)cur {
    t_CalendarEvent *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"StartTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.StartTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EndTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.EndTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"BusyType")) {
            self.BusyType = [t_LegacyFreeBusyType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CalendarEventDetails")) {
            Class elementClass = classForElement(cur) ?: [t_CalendarEventDetails class];
            self.CalendarEventDetails = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_TaskRecurrenceType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TaskRecurrenceType *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (t_TaskRecurrenceType *)deserializeNode:(xmlNodePtr)cur {
    t_TaskRecurrenceType *newObject = [self new];


    return newObject;
}
@end
@implementation t_ArrayOfFoldersType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Folder")) {
            Class elementClass = classForElement(child) ?: [t_FolderType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"CalendarFolder")) {
            Class elementClass = classForElement(child) ?: [t_CalendarFolderType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ContactsFolder")) {
            Class elementClass = classForElement(child) ?: [t_ContactsFolderType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SearchFolder")) {
            Class elementClass = classForElement(child) ?: [t_SearchFolderType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"TasksFolder")) {
            Class elementClass = classForElement(child) ?: [t_TasksFolderType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_FolderType class]])
            [t_FolderType serializeToChildOf:child withName:"t:Folder" value:item];
        else if ([item isMemberOfClass:[t_CalendarFolderType class]])
            [t_CalendarFolderType serializeToChildOf:child withName:"t:CalendarFolder" value:item];
        else if ([item isMemberOfClass:[t_ContactsFolderType class]])
            [t_ContactsFolderType serializeToChildOf:child withName:"t:ContactsFolder" value:item];
        else if ([item isMemberOfClass:[t_SearchFolderType class]])
            [t_SearchFolderType serializeToChildOf:child withName:"t:SearchFolder" value:item];
        else if ([item isMemberOfClass:[t_TasksFolderType class]])
            [t_TasksFolderType serializeToChildOf:child withName:"t:TasksFolder" value:item];
    }
}
@end
@implementation t_FindFolderParentType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FindFolderParentType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_int serializeToProperty:"IndexedPagingOffset" onNode:node value:_IndexedPagingOffset];
    [xsd_int serializeToProperty:"NumeratorOffset" onNode:node value:_NumeratorOffset];
    [xsd_int serializeToProperty:"AbsoluteDenominator" onNode:node value:_AbsoluteDenominator];
    [xsd_boolean serializeToProperty:"IncludesLastItemInRange" onNode:node value:_IncludesLastItemInRange];
    [xsd_int serializeToProperty:"TotalItemsInView" onNode:node value:_TotalItemsInView];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Folders)
        [t_ArrayOfFoldersType serializeToChildOf:node withName:"t:Folders" value:_Folders];

}


+ (t_FindFolderParentType *)deserializeNode:(xmlNodePtr)cur {
    t_FindFolderParentType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.IndexedPagingOffset = [xsd_int deserializeAttribute:"IndexedPagingOffset" ofNode:cur];
    self.NumeratorOffset = [xsd_int deserializeAttribute:"NumeratorOffset" ofNode:cur];
    self.AbsoluteDenominator = [xsd_int deserializeAttribute:"AbsoluteDenominator" ofNode:cur];
    self.IncludesLastItemInRange = [xsd_boolean deserializeAttribute:"IncludesLastItemInRange" ofNode:cur];
    self.TotalItemsInView = [xsd_int deserializeAttribute:"TotalItemsInView" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Folders")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfFoldersType class];
            self.Folders = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ProtectionRuleTrueType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_NonEmptyArrayOfItemChangesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"ItemChange")) {
            Class elementClass = classForElement(child) ?: [t_ItemChangeType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_ItemChangeType * item in value)
        [t_ItemChangeType serializeToChildOf:child withName:"t:ItemChange" value:item];
}
@end
@implementation t_ArrayOfTransitionsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ArrayOfTransitionsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"Id" onNode:node value:_Id_];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    for (t_TransitionType * item in _Transition)
        [t_TransitionType serializeToChildOf:node withName:"t:Transition" value:item];

    if (_AbsoluteDateTransition)
        [t_AbsoluteDateTransitionType serializeToChildOf:node withName:"t:AbsoluteDateTransition" value:_AbsoluteDateTransition];

    if (_RecurringDayTransition)
        [t_RecurringDayTransitionType serializeToChildOf:node withName:"t:RecurringDayTransition" value:_RecurringDayTransition];

    if (_RecurringDateTransition)
        [t_RecurringDateTransitionType serializeToChildOf:node withName:"t:RecurringDateTransition" value:_RecurringDateTransition];

}


- (t_AbsoluteDateTransitionType *)AbsoluteDateTransition {
    if (!_AbsoluteDateTransition) _AbsoluteDateTransition = [t_AbsoluteDateTransitionType new];
    return _AbsoluteDateTransition;
}

- (t_RecurringDayTransitionType *)RecurringDayTransition {
    if (!_RecurringDayTransition) _RecurringDayTransition = [t_RecurringDayTransitionType new];
    return _RecurringDayTransition;
}

- (t_RecurringDateTransitionType *)RecurringDateTransition {
    if (!_RecurringDateTransition) _RecurringDateTransition = [t_RecurringDateTransitionType new];
    return _RecurringDateTransition;
}

+ (t_ArrayOfTransitionsType *)deserializeNode:(xmlNodePtr)cur {
    t_ArrayOfTransitionsType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Id_ = [xsd_string deserializeAttribute:"Id" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    NSMutableArray *TransitionValues = nil;

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Transition")) {
            Class elementClass = classForElement(cur) ?: [t_TransitionType class];
            if (!TransitionValues) TransitionValues = [NSMutableArray new];
            [TransitionValues addObject:[elementClass deserializeNode:cur]];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AbsoluteDateTransition")) {
            Class elementClass = classForElement(cur) ?: [t_AbsoluteDateTransitionType class];
            self.AbsoluteDateTransition = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RecurringDayTransition")) {
            Class elementClass = classForElement(cur) ?: [t_RecurringDayTransitionType class];
            self.RecurringDayTransition = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RecurringDateTransition")) {
            Class elementClass = classForElement(cur) ?: [t_RecurringDateTransitionType class];
            self.RecurringDateTransition = [elementClass deserializeNode:cur];
        }
    }

    if (TransitionValues) self.Transition = TransitionValues;
}
@end
@implementation t_DeclineItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DeclineItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (t_DeclineItemType *)deserializeNode:(xmlNodePtr)cur {
    t_DeclineItemType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
static NSString *t_AffectedTaskOccurrencesType_enumValues[] = {
    @"",
    @"AllOccurrences",
    @"SpecifiedOccurrenceOnly",
};

@implementation t_AffectedTaskOccurrencesType
+ (t_AffectedTaskOccurrencesTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_AffectedTaskOccurrencesType_enumValues) / sizeof(t_AffectedTaskOccurrencesType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_AffectedTaskOccurrencesType_enumValues[i]])
            return (t_AffectedTaskOccurrencesTypeEnum)i;
    }

    return t_AffectedTaskOccurrencesType_none;
}

+ (NSString *)stringFromValue:(t_AffectedTaskOccurrencesTypeEnum)value {
    return t_AffectedTaskOccurrencesType_enumValues[(int)value];
}

+ (t_AffectedTaskOccurrencesTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_AffectedTaskOccurrencesType_none;
}

+ (t_AffectedTaskOccurrencesTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AffectedTaskOccurrencesTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_AffectedTaskOccurrencesTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_CancelCalendarItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CancelCalendarItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (t_CancelCalendarItemType *)deserializeNode:(xmlNodePtr)cur {
    t_CancelCalendarItemType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
static NSString *t_ResponseClassType_enumValues[] = {
    @"",
    @"Error",
    @"Success",
    @"Warning",
};

@implementation t_ResponseClassType
+ (t_ResponseClassTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ResponseClassType_enumValues) / sizeof(t_ResponseClassType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ResponseClassType_enumValues[i]])
            return (t_ResponseClassTypeEnum)i;
    }

    return t_ResponseClassType_none;
}

+ (NSString *)stringFromValue:(t_ResponseClassTypeEnum)value {
    return t_ResponseClassType_enumValues[(int)value];
}

+ (t_ResponseClassTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ResponseClassType_none;
}

+ (t_ResponseClassTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ResponseClassTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ResponseClassTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_EmailAddressType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_EmailAddressType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Name)
        [xsd_string serializeToChildOf:node withName:"t:Name" value:_Name];

    if (_EmailAddress)
        [t_NonEmptyStringType serializeToChildOf:node withName:"t:EmailAddress" value:_EmailAddress];

    if (_RoutingType)
        [t_NonEmptyStringType serializeToChildOf:node withName:"t:RoutingType" value:_RoutingType];

    if (_MailboxType)
        [t_MailboxTypeType serializeToChildOf:node withName:"t:MailboxType" value:_MailboxType];

    if (_ItemId)
        [t_ItemIdType serializeToChildOf:node withName:"t:ItemId" value:_ItemId];

}


- (t_ItemIdType *)ItemId {
    if (!_ItemId) _ItemId = [t_ItemIdType new];
    return _ItemId;
}
+ (t_EmailAddressType *)deserializeNode:(xmlNodePtr)cur {
    t_EmailAddressType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Name")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Name = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EmailAddress")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.EmailAddress = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RoutingType")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.RoutingType = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MailboxType")) {
            self.MailboxType = [t_MailboxTypeType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ItemId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_DeletedOccurrenceInfoType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DeletedOccurrenceInfoType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Start)
        [xsd_dateTime serializeToChildOf:node withName:"t:Start" value:_Start];

}

+ (t_DeletedOccurrenceInfoType *)deserializeNode:(xmlNodePtr)cur {
    t_DeletedOccurrenceInfoType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Start")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.Start = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_RulePredicateSizeRangeType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RulePredicateSizeRangeType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_MinimumSize)
        [xsd_int serializeToChildOf:node withName:"t:MinimumSize" value:_MinimumSize];

    if (_MaximumSize)
        [xsd_int serializeToChildOf:node withName:"t:MaximumSize" value:_MaximumSize];

}

+ (t_RulePredicateSizeRangeType *)deserializeNode:(xmlNodePtr)cur {
    t_RulePredicateSizeRangeType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"MinimumSize")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.MinimumSize = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MaximumSize")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.MaximumSize = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ArrayOfRulesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Rule")) {
            Class elementClass = classForElement(child) ?: [t_RuleType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_RuleType * item in value)
        [t_RuleType serializeToChildOf:child withName:"t:Rule" value:item];
}
@end
@implementation t_TransitionTargetType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TransitionTargetType *)value {
    [xsd_string serializeToChildOf:node withName:childName value:value._content];
    xmlNodePtr child = node->last;

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_TransitionTargetKindType serializeToProperty:"Kind" onNode:node value:_Kind];
}

+ (t_TransitionTargetType *)deserializeNode:(xmlNodePtr)cur {
    t_TransitionTargetType *newObject = [self new];
    newObject._content = [xsd_string deserializeNode:cur];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Kind = [t_TransitionTargetKindType deserializeAttribute:"Kind" ofNode:cur];
}
@end
@implementation t_MembersListType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Member")) {
            Class elementClass = classForElement(child) ?: [t_MemberType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_MemberType * item in value)
        [t_MemberType serializeToChildOf:child withName:"t:Member" value:item];
}
@end
@implementation t_DistributionListType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DistributionListType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_DisplayName)
        [xsd_string serializeToChildOf:node withName:"t:DisplayName" value:_DisplayName];

    if (_FileAs)
        [xsd_string serializeToChildOf:node withName:"t:FileAs" value:_FileAs];

    if (_ContactSource)
        [t_ContactSourceType serializeToChildOf:node withName:"t:ContactSource" value:_ContactSource];

    if (_Members)
        [t_MembersListType serializeToChildOf:node withName:"t:Members" value:_Members];

}

+ (t_DistributionListType *)deserializeNode:(xmlNodePtr)cur {
    t_DistributionListType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"DisplayName")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.DisplayName = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FileAs")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.FileAs = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContactSource")) {
            self.ContactSource = [t_ContactSourceType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Members")) {
            Class elementClass = classForElement(cur) ?: [t_MembersListType class];
            self.Members = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_CalendarEventDetails
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarEventDetails *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ID)
        [xsd_string serializeToChildOf:node withName:"t:ID" value:_ID];

    if (_Subject)
        [xsd_string serializeToChildOf:node withName:"t:Subject" value:_Subject];

    if (_Location)
        [xsd_string serializeToChildOf:node withName:"t:Location" value:_Location];

    if (_IsMeeting)
        [xsd_boolean serializeToChildOf:node withName:"t:IsMeeting" value:_IsMeeting];

    if (_IsRecurring)
        [xsd_boolean serializeToChildOf:node withName:"t:IsRecurring" value:_IsRecurring];

    if (_IsException)
        [xsd_boolean serializeToChildOf:node withName:"t:IsException" value:_IsException];

    if (_IsReminderSet)
        [xsd_boolean serializeToChildOf:node withName:"t:IsReminderSet" value:_IsReminderSet];

    if (_IsPrivate)
        [xsd_boolean serializeToChildOf:node withName:"t:IsPrivate" value:_IsPrivate];

}

+ (t_CalendarEventDetails *)deserializeNode:(xmlNodePtr)cur {
    t_CalendarEventDetails *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ID")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.ID = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Subject")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Subject = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Location")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Location = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsMeeting")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsMeeting = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsRecurring")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsRecurring = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsException")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsException = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsReminderSet")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsReminderSet = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsPrivate")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsPrivate = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_UserConfigurationDictionaryObjectType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserConfigurationDictionaryObjectType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Type)
        [t_UserConfigurationDictionaryObjectTypesType serializeToChildOf:node withName:"t:Type" value:_Type];

    for (NSString * item in _Value)
        [xsd_string serializeToChildOf:node withName:"t:Value" value:item];

}

+ (t_UserConfigurationDictionaryObjectType *)deserializeNode:(xmlNodePtr)cur {
    t_UserConfigurationDictionaryObjectType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    NSMutableArray *ValueValues = nil;

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Type")) {
            self.Type = [t_UserConfigurationDictionaryObjectTypesType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Value")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            if (!ValueValues) ValueValues = [NSMutableArray new];
            [ValueValues addObject:[elementClass deserializeNode:cur]];
        }
    }

    if (ValueValues) self.Value = ValueValues;
}
@end
@implementation t_WorkingHours
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_WorkingHours *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_TimeZone)
        [t_SerializableTimeZone serializeToChildOf:node withName:"t:TimeZone" value:_TimeZone];

    if (_WorkingPeriodArray)
        [t_ArrayOfWorkingPeriod serializeToChildOf:node withName:"t:WorkingPeriodArray" value:_WorkingPeriodArray];

}


- (t_SerializableTimeZone *)TimeZone {
    if (!_TimeZone) _TimeZone = [t_SerializableTimeZone new];
    return _TimeZone;
}
+ (t_WorkingHours *)deserializeNode:(xmlNodePtr)cur {
    t_WorkingHours *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"TimeZone")) {
            Class elementClass = classForElement(cur) ?: [t_SerializableTimeZone class];
            self.TimeZone = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"WorkingPeriodArray")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfWorkingPeriod class];
            self.WorkingPeriodArray = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_DirectoryEntryType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DirectoryEntryType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Id)
        [t_EmailAddressType serializeToChildOf:node withName:"t:Id" value:_Id];

}


- (t_EmailAddressType *)Id {
    if (!_Id) _Id = [t_EmailAddressType new];
    return _Id;
}
+ (t_DirectoryEntryType *)deserializeNode:(xmlNodePtr)cur {
    t_DirectoryEntryType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Id")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.Id = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_RoomType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RoomType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_RoomType *)deserializeNode:(xmlNodePtr)cur {
    t_RoomType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_IsGreaterThanType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_IsGreaterThanType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_IsGreaterThanType *)deserializeNode:(xmlNodePtr)cur {
    t_IsGreaterThanType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_IsLessThanOrEqualToType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_IsLessThanOrEqualToType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_IsLessThanOrEqualToType *)deserializeNode:(xmlNodePtr)cur {
    t_IsLessThanOrEqualToType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_OpenAsAdminOrSystemServiceType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_OpenAsAdminOrSystemServiceType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_SpecialLogonTypeType serializeToProperty:"LogonType" onNode:node value:_LogonType];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ConnectingSID)
        [t_ConnectingSIDType serializeToChildOf:node withName:"t:ConnectingSID" value:_ConnectingSID];

}


+ (t_OpenAsAdminOrSystemServiceType *)deserializeNode:(xmlNodePtr)cur {
    t_OpenAsAdminOrSystemServiceType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.LogonType = [t_SpecialLogonTypeType deserializeAttribute:"LogonType" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConnectingSID")) {
            Class elementClass = classForElement(cur) ?: [t_ConnectingSIDType class];
            self.ConnectingSID = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_RecurringMasterItemIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RecurringMasterItemIdType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_DerivedItemIdType serializeToProperty:"OccurrenceId" onNode:node value:_OccurrenceId];
    [xsd_string serializeToProperty:"ChangeKey" onNode:node value:_ChangeKey];
}

+ (t_RecurringMasterItemIdType *)deserializeNode:(xmlNodePtr)cur {
    t_RecurringMasterItemIdType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.OccurrenceId = [t_DerivedItemIdType deserializeAttribute:"OccurrenceId" ofNode:cur];
    self.ChangeKey = [xsd_string deserializeAttribute:"ChangeKey" ofNode:cur];
}
@end
@implementation t_SuggestionsViewOptionsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SuggestionsViewOptionsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_GoodThreshold)
        [xsd_int serializeToChildOf:node withName:"t:GoodThreshold" value:_GoodThreshold];

    if (_MaximumResultsByDay)
        [xsd_int serializeToChildOf:node withName:"t:MaximumResultsByDay" value:_MaximumResultsByDay];

    if (_MaximumNonWorkHourResultsByDay)
        [xsd_int serializeToChildOf:node withName:"t:MaximumNonWorkHourResultsByDay" value:_MaximumNonWorkHourResultsByDay];

    if (_MeetingDurationInMinutes)
        [xsd_int serializeToChildOf:node withName:"t:MeetingDurationInMinutes" value:_MeetingDurationInMinutes];

    if (_MinimumSuggestionQuality)
        [t_SuggestionQuality serializeToChildOf:node withName:"t:MinimumSuggestionQuality" value:_MinimumSuggestionQuality];

    if (_DetailedSuggestionsWindow)
        [t_Duration serializeToChildOf:node withName:"t:DetailedSuggestionsWindow" value:_DetailedSuggestionsWindow];

    if (_CurrentMeetingTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:CurrentMeetingTime" value:_CurrentMeetingTime];

    if (_GlobalObjectId)
        [xsd_string serializeToChildOf:node withName:"t:GlobalObjectId" value:_GlobalObjectId];

}


- (t_Duration *)DetailedSuggestionsWindow {
    if (!_DetailedSuggestionsWindow) _DetailedSuggestionsWindow = [t_Duration new];
    return _DetailedSuggestionsWindow;
}
+ (t_SuggestionsViewOptionsType *)deserializeNode:(xmlNodePtr)cur {
    t_SuggestionsViewOptionsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"GoodThreshold")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.GoodThreshold = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MaximumResultsByDay")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.MaximumResultsByDay = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MaximumNonWorkHourResultsByDay")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.MaximumNonWorkHourResultsByDay = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingDurationInMinutes")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.MeetingDurationInMinutes = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MinimumSuggestionQuality")) {
            self.MinimumSuggestionQuality = [t_SuggestionQuality deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DetailedSuggestionsWindow")) {
            Class elementClass = classForElement(cur) ?: [t_Duration class];
            self.DetailedSuggestionsWindow = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CurrentMeetingTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.CurrentMeetingTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GlobalObjectId")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.GlobalObjectId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_KeywordStatisticsSearchResultType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_KeywordStatisticsSearchResultType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Keyword)
        [xsd_string serializeToChildOf:node withName:"t:Keyword" value:_Keyword];

    if (_ItemHits)
        [xsd_int serializeToChildOf:node withName:"t:ItemHits" value:_ItemHits];

    if (_Size)
        [xsd_long serializeToChildOf:node withName:"t:Size" value:_Size];

}

+ (t_KeywordStatisticsSearchResultType *)deserializeNode:(xmlNodePtr)cur {
    t_KeywordStatisticsSearchResultType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Keyword")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Keyword = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemHits")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.ItemHits = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Size")) {
            Class elementClass = classForElement(cur) ?: [xsd_long class];
            self.Size = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_ResolveNamesSearchScopeType_enumValues[] = {
    @"",
    @"ActiveDirectory",
    @"ActiveDirectoryContacts",
    @"Contacts",
    @"ContactsActiveDirectory",
};

@implementation t_ResolveNamesSearchScopeType
+ (t_ResolveNamesSearchScopeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ResolveNamesSearchScopeType_enumValues) / sizeof(t_ResolveNamesSearchScopeType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ResolveNamesSearchScopeType_enumValues[i]])
            return (t_ResolveNamesSearchScopeTypeEnum)i;
    }

    return t_ResolveNamesSearchScopeType_none;
}

+ (NSString *)stringFromValue:(t_ResolveNamesSearchScopeTypeEnum)value {
    return t_ResolveNamesSearchScopeType_enumValues[(int)value];
}

+ (t_ResolveNamesSearchScopeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ResolveNamesSearchScopeType_none;
}

+ (t_ResolveNamesSearchScopeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ResolveNamesSearchScopeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ResolveNamesSearchScopeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_DeleteItemFieldType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DeleteItemFieldType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_DeleteItemFieldType *)deserializeNode:(xmlNodePtr)cur {
    t_DeleteItemFieldType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_ArrayOfFindMessageTrackingSearchResultType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"MessageTrackingSearchResult")) {
            Class elementClass = classForElement(child) ?: [t_FindMessageTrackingSearchResultType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_FindMessageTrackingSearchResultType * item in value)
        [t_FindMessageTrackingSearchResultType serializeToChildOf:child withName:"t:MessageTrackingSearchResult" value:item];
}
@end
@implementation t_SyncFolderItemsDeleteType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SyncFolderItemsDeleteType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ItemId)
        [t_ItemIdType serializeToChildOf:node withName:"t:ItemId" value:_ItemId];

}


- (t_ItemIdType *)ItemId {
    if (!_ItemId) _ItemId = [t_ItemIdType new];
    return _ItemId;
}
+ (t_SyncFolderItemsDeleteType *)deserializeNode:(xmlNodePtr)cur {
    t_SyncFolderItemsDeleteType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ItemId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_NonEmptyArrayOfFolderChangesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"FolderChange")) {
            Class elementClass = classForElement(child) ?: [t_FolderChangeType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_FolderChangeType * item in value)
        [t_FolderChangeType serializeToChildOf:child withName:"t:FolderChange" value:item];
}
@end
@implementation t_DaysOfWeekType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_WorkingPeriod
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_WorkingPeriod *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_DayOfWeek)
        [t_DaysOfWeekType serializeToChildOf:node withName:"t:DayOfWeek" value:_DayOfWeek];

    if (_StartTimeInMinutes)
        [xsd_int serializeToChildOf:node withName:"t:StartTimeInMinutes" value:_StartTimeInMinutes];

    if (_EndTimeInMinutes)
        [xsd_int serializeToChildOf:node withName:"t:EndTimeInMinutes" value:_EndTimeInMinutes];

}

+ (t_WorkingPeriod *)deserializeNode:(xmlNodePtr)cur {
    t_WorkingPeriod *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"DayOfWeek")) {
            Class elementClass = classForElement(cur) ?: [t_DaysOfWeekType class];
            self.DayOfWeek = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"StartTimeInMinutes")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.StartTimeInMinutes = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EndTimeInMinutes")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.EndTimeInMinutes = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ItemAttachmentType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ItemAttachmentType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Item)
        [t_ItemType serializeToChildOf:node withName:"t:Item" value:_Item];

    if (_Message)
        [t_MessageType serializeToChildOf:node withName:"t:Message" value:_Message];

    if (_CalendarItem)
        [t_CalendarItemType serializeToChildOf:node withName:"t:CalendarItem" value:_CalendarItem];

    if (_Contact)
        [t_ContactItemType serializeToChildOf:node withName:"t:Contact" value:_Contact];

    if (_MeetingMessage)
        [t_MeetingMessageType serializeToChildOf:node withName:"t:MeetingMessage" value:_MeetingMessage];

    if (_MeetingRequest)
        [t_MeetingRequestMessageType serializeToChildOf:node withName:"t:MeetingRequest" value:_MeetingRequest];

    if (_MeetingResponse)
        [t_MeetingResponseMessageType serializeToChildOf:node withName:"t:MeetingResponse" value:_MeetingResponse];

    if (_MeetingCancellation)
        [t_MeetingCancellationMessageType serializeToChildOf:node withName:"t:MeetingCancellation" value:_MeetingCancellation];

    if (_Task)
        [t_TaskType serializeToChildOf:node withName:"t:Task" value:_Task];

    if (_PostItem)
        [t_PostItemType serializeToChildOf:node withName:"t:PostItem" value:_PostItem];

}


- (t_ItemType *)Item {
    if (!_Item) _Item = [t_ItemType new];
    return _Item;
}

- (t_MessageType *)Message {
    if (!_Message) _Message = [t_MessageType new];
    return _Message;
}

- (t_CalendarItemType *)CalendarItem {
    if (!_CalendarItem) _CalendarItem = [t_CalendarItemType new];
    return _CalendarItem;
}

- (t_ContactItemType *)Contact {
    if (!_Contact) _Contact = [t_ContactItemType new];
    return _Contact;
}

- (t_MeetingMessageType *)MeetingMessage {
    if (!_MeetingMessage) _MeetingMessage = [t_MeetingMessageType new];
    return _MeetingMessage;
}

- (t_MeetingRequestMessageType *)MeetingRequest {
    if (!_MeetingRequest) _MeetingRequest = [t_MeetingRequestMessageType new];
    return _MeetingRequest;
}

- (t_MeetingResponseMessageType *)MeetingResponse {
    if (!_MeetingResponse) _MeetingResponse = [t_MeetingResponseMessageType new];
    return _MeetingResponse;
}

- (t_MeetingCancellationMessageType *)MeetingCancellation {
    if (!_MeetingCancellation) _MeetingCancellation = [t_MeetingCancellationMessageType new];
    return _MeetingCancellation;
}

- (t_TaskType *)Task {
    if (!_Task) _Task = [t_TaskType new];
    return _Task;
}

- (t_PostItemType *)PostItem {
    if (!_PostItem) _PostItem = [t_PostItemType new];
    return _PostItem;
}
+ (t_ItemAttachmentType *)deserializeNode:(xmlNodePtr)cur {
    t_ItemAttachmentType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Item")) {
            Class elementClass = classForElement(cur) ?: [t_ItemType class];
            self.Item = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Message")) {
            Class elementClass = classForElement(cur) ?: [t_MessageType class];
            self.Message = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CalendarItem")) {
            Class elementClass = classForElement(cur) ?: [t_CalendarItemType class];
            self.CalendarItem = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Contact")) {
            Class elementClass = classForElement(cur) ?: [t_ContactItemType class];
            self.Contact = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingMessage")) {
            Class elementClass = classForElement(cur) ?: [t_MeetingMessageType class];
            self.MeetingMessage = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingRequest")) {
            Class elementClass = classForElement(cur) ?: [t_MeetingRequestMessageType class];
            self.MeetingRequest = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingResponse")) {
            Class elementClass = classForElement(cur) ?: [t_MeetingResponseMessageType class];
            self.MeetingResponse = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingCancellation")) {
            Class elementClass = classForElement(cur) ?: [t_MeetingCancellationMessageType class];
            self.MeetingCancellation = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Task")) {
            Class elementClass = classForElement(cur) ?: [t_TaskType class];
            self.Task = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PostItem")) {
            Class elementClass = classForElement(cur) ?: [t_PostItemType class];
            self.PostItem = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ConstantValueType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConstantValueType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"Value" onNode:node value:_Value];
}

+ (t_ConstantValueType *)deserializeNode:(xmlNodePtr)cur {
    t_ConstantValueType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Value = [xsd_string deserializeAttribute:"Value" ofNode:cur];
}
@end
@implementation t_RemoveItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RemoveItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (t_RemoveItemType *)deserializeNode:(xmlNodePtr)cur {
    t_RemoveItemType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
static NSString *t_PhysicalAddressKeyType_enumValues[] = {
    @"",
    @"Business",
    @"Home",
    @"Other",
};

@implementation t_PhysicalAddressKeyType
+ (t_PhysicalAddressKeyTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_PhysicalAddressKeyType_enumValues) / sizeof(t_PhysicalAddressKeyType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_PhysicalAddressKeyType_enumValues[i]])
            return (t_PhysicalAddressKeyTypeEnum)i;
    }

    return t_PhysicalAddressKeyType_none;
}

+ (NSString *)stringFromValue:(t_PhysicalAddressKeyTypeEnum)value {
    return t_PhysicalAddressKeyType_enumValues[(int)value];
}

+ (t_PhysicalAddressKeyTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_PhysicalAddressKeyType_none;
}

+ (t_PhysicalAddressKeyTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhysicalAddressKeyTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_PhysicalAddressKeyTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_PhysicalAddressDictionaryEntryType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhysicalAddressDictionaryEntryType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_PhysicalAddressKeyType serializeToProperty:"Key" onNode:node value:_Key];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Street)
        [xsd_string serializeToChildOf:node withName:"t:Street" value:_Street];

    if (_City)
        [xsd_string serializeToChildOf:node withName:"t:City" value:_City];

    if (_State)
        [xsd_string serializeToChildOf:node withName:"t:State" value:_State];

    if (_CountryOrRegion)
        [xsd_string serializeToChildOf:node withName:"t:CountryOrRegion" value:_CountryOrRegion];

    if (_PostalCode)
        [xsd_string serializeToChildOf:node withName:"t:PostalCode" value:_PostalCode];

}


+ (t_PhysicalAddressDictionaryEntryType *)deserializeNode:(xmlNodePtr)cur {
    t_PhysicalAddressDictionaryEntryType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Key = [t_PhysicalAddressKeyType deserializeAttribute:"Key" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Street")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Street = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"City")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.City = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"State")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.State = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CountryOrRegion")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.CountryOrRegion = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PostalCode")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.PostalCode = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ArrayOfDLExpansionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ArrayOfDLExpansionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_int serializeToProperty:"IndexedPagingOffset" onNode:node value:_IndexedPagingOffset];
    [xsd_int serializeToProperty:"NumeratorOffset" onNode:node value:_NumeratorOffset];
    [xsd_int serializeToProperty:"AbsoluteDenominator" onNode:node value:_AbsoluteDenominator];
    [xsd_boolean serializeToProperty:"IncludesLastItemInRange" onNode:node value:_IncludesLastItemInRange];
    [xsd_int serializeToProperty:"TotalItemsInView" onNode:node value:_TotalItemsInView];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    for (t_EmailAddressType * item in _Mailbox)
        [t_EmailAddressType serializeToChildOf:node withName:"t:Mailbox" value:item];

}


+ (t_ArrayOfDLExpansionType *)deserializeNode:(xmlNodePtr)cur {
    t_ArrayOfDLExpansionType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.IndexedPagingOffset = [xsd_int deserializeAttribute:"IndexedPagingOffset" ofNode:cur];
    self.NumeratorOffset = [xsd_int deserializeAttribute:"NumeratorOffset" ofNode:cur];
    self.AbsoluteDenominator = [xsd_int deserializeAttribute:"AbsoluteDenominator" ofNode:cur];
    self.IncludesLastItemInRange = [xsd_boolean deserializeAttribute:"IncludesLastItemInRange" ofNode:cur];
    self.TotalItemsInView = [xsd_int deserializeAttribute:"TotalItemsInView" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    NSMutableArray *MailboxValues = nil;

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Mailbox")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            if (!MailboxValues) MailboxValues = [NSMutableArray new];
            [MailboxValues addObject:[elementClass deserializeNode:cur]];
        }
    }

    if (MailboxValues) self.Mailbox = MailboxValues;
}
@end
@implementation t_AbsoluteMonthlyRecurrencePatternType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AbsoluteMonthlyRecurrencePatternType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_DayOfMonth)
        [xsd_int serializeToChildOf:node withName:"t:DayOfMonth" value:_DayOfMonth];

}

+ (t_AbsoluteMonthlyRecurrencePatternType *)deserializeNode:(xmlNodePtr)cur {
    t_AbsoluteMonthlyRecurrencePatternType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"DayOfMonth")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.DayOfMonth = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_NonEmptyArrayOfFolderNamesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"FolderName")) {
            Class elementClass = classForElement(child) ?: [xsd_string class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (NSString * item in value)
        [xsd_string serializeToChildOf:child withName:"t:FolderName" value:item];
}
@end
@implementation t_SyncFolderHierarchyDeleteType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SyncFolderHierarchyDeleteType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FolderId)
        [t_FolderIdType serializeToChildOf:node withName:"t:FolderId" value:_FolderId];

}


- (t_FolderIdType *)FolderId {
    if (!_FolderId) _FolderId = [t_FolderIdType new];
    return _FolderId;
}
+ (t_SyncFolderHierarchyDeleteType *)deserializeNode:(xmlNodePtr)cur {
    t_SyncFolderHierarchyDeleteType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderId")) {
            Class elementClass = classForElement(cur) ?: [t_FolderIdType class];
            self.FolderId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ArrayOfUserIdType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"UserId")) {
            Class elementClass = classForElement(child) ?: [t_UserIdType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_UserIdType * item in value)
        [t_UserIdType serializeToChildOf:child withName:"t:UserId" value:item];
}
@end
@implementation t_ArrayOfAttachmentsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"ItemAttachment")) {
            Class elementClass = classForElement(child) ?: [t_ItemAttachmentType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"FileAttachment")) {
            Class elementClass = classForElement(child) ?: [t_FileAttachmentType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[t_ItemAttachmentType class]])
            [t_ItemAttachmentType serializeToChildOf:child withName:"t:ItemAttachment" value:item];
        else if ([item isMemberOfClass:[t_FileAttachmentType class]])
            [t_FileAttachmentType serializeToChildOf:child withName:"t:FileAttachment" value:item];
    }
}
@end
@implementation t_WeeklyRecurrencePatternType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_WeeklyRecurrencePatternType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_DaysOfWeek)
        [t_DaysOfWeekType serializeToChildOf:node withName:"t:DaysOfWeek" value:_DaysOfWeek];

    if (_FirstDayOfWeek)
        [t_DayOfWeekType serializeToChildOf:node withName:"t:FirstDayOfWeek" value:_FirstDayOfWeek];

}

+ (t_WeeklyRecurrencePatternType *)deserializeNode:(xmlNodePtr)cur {
    t_WeeklyRecurrencePatternType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"DaysOfWeek")) {
            Class elementClass = classForElement(cur) ?: [t_DaysOfWeekType class];
            self.DaysOfWeek = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FirstDayOfWeek")) {
            self.FirstDayOfWeek = [t_DayOfWeekType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation t_PeriodType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PeriodType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_duration serializeToProperty:"Bias" onNode:node value:_Bias];
    [xsd_string serializeToProperty:"Name" onNode:node value:_Name];
    [xsd_string serializeToProperty:"Id" onNode:node value:_Id_];
}

+ (t_PeriodType *)deserializeNode:(xmlNodePtr)cur {
    t_PeriodType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Bias = [xsd_duration deserializeAttribute:"Bias" ofNode:cur];
    self.Name = [xsd_string deserializeAttribute:"Name" ofNode:cur];
    self.Id_ = [xsd_string deserializeAttribute:"Id" ofNode:cur];
}
@end
@implementation t_ReplyAllToItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ReplyAllToItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (t_ReplyAllToItemType *)deserializeNode:(xmlNodePtr)cur {
    t_ReplyAllToItemType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_ArrayOfBaseItemIdsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"ItemId")) {
            Class elementClass = classForElement(child) ?: [t_ItemIdType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_ItemIdType * item in value)
        [t_ItemIdType serializeToChildOf:child withName:"t:ItemId" value:item];
}
@end
static NSString *t_SharingDataType_enumValues[] = {
    @"",
    @"Calendar",
    @"Contacts",
};

@implementation t_SharingDataType
+ (t_SharingDataTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_SharingDataType_enumValues) / sizeof(t_SharingDataType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_SharingDataType_enumValues[i]])
            return (t_SharingDataTypeEnum)i;
    }

    return t_SharingDataType_none;
}

+ (NSString *)stringFromValue:(t_SharingDataTypeEnum)value {
    return t_SharingDataType_enumValues[(int)value];
}

+ (t_SharingDataTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_SharingDataType_none;
}

+ (t_SharingDataTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SharingDataTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SharingDataTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_DistinguishedFolderIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DistinguishedFolderIdType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_DistinguishedFolderIdNameType serializeToProperty:"Id" onNode:node value:_Id_];
    [xsd_string serializeToProperty:"ChangeKey" onNode:node value:_ChangeKey];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Mailbox)
        [t_EmailAddressType serializeToChildOf:node withName:"t:Mailbox" value:_Mailbox];

}


- (t_EmailAddressType *)Mailbox {
    if (!_Mailbox) _Mailbox = [t_EmailAddressType new];
    return _Mailbox;
}

+ (t_DistinguishedFolderIdType *)deserializeNode:(xmlNodePtr)cur {
    t_DistinguishedFolderIdType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Id_ = [t_DistinguishedFolderIdNameType deserializeAttribute:"Id" ofNode:cur];
    self.ChangeKey = [xsd_string deserializeAttribute:"ChangeKey" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Mailbox")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.Mailbox = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ArrayOfPermissionsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Permission")) {
            Class elementClass = classForElement(child) ?: [t_PermissionType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_PermissionType * item in value)
        [t_PermissionType serializeToChildOf:child withName:"t:Permission" value:item];
}
@end
@implementation t_NonEmptyArrayOfPropertyValuesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Value")) {
            Class elementClass = classForElement(child) ?: [xsd_string class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (NSString * item in value)
        [xsd_string serializeToChildOf:child withName:"t:Value" value:item];
}
@end
@implementation t_ExtendedPropertyType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ExtendedPropertyType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ExtendedFieldURI)
        [t_PathToExtendedFieldType serializeToChildOf:node withName:"t:ExtendedFieldURI" value:_ExtendedFieldURI];

    if (_Value)
        [xsd_string serializeToChildOf:node withName:"t:Value" value:_Value];

    if (_Values)
        [t_NonEmptyArrayOfPropertyValuesType serializeToChildOf:node withName:"t:Values" value:_Values];

}


- (t_PathToExtendedFieldType *)ExtendedFieldURI {
    if (!_ExtendedFieldURI) _ExtendedFieldURI = [t_PathToExtendedFieldType new];
    return _ExtendedFieldURI;
}
+ (t_ExtendedPropertyType *)deserializeNode:(xmlNodePtr)cur {
    t_ExtendedPropertyType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExtendedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToExtendedFieldType class];
            self.ExtendedFieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Value")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Value = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Values")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfPropertyValuesType class];
            self.Values = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_InternetHeaderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_InternetHeaderType *)value {
    [xsd_string serializeToChildOf:node withName:childName value:value._content];
    xmlNodePtr child = node->last;

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"HeaderName" onNode:node value:_HeaderName];
}

+ (t_InternetHeaderType *)deserializeNode:(xmlNodePtr)cur {
    t_InternetHeaderType *newObject = [self new];
    newObject._content = [xsd_string deserializeNode:cur];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.HeaderName = [xsd_string deserializeAttribute:"HeaderName" ofNode:cur];
}
@end
@implementation t_ArrayOfSuggestionDayResult
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"SuggestionDayResult")) {
            Class elementClass = classForElement(child) ?: [t_SuggestionDayResult class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_SuggestionDayResult * item in value)
        [t_SuggestionDayResult serializeToChildOf:child withName:"t:SuggestionDayResult" value:item];
}
@end
@implementation t_UserConfigurationDictionaryEntryType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserConfigurationDictionaryEntryType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_DictionaryKey)
        [t_UserConfigurationDictionaryObjectType serializeToChildOf:node withName:"t:DictionaryKey" value:_DictionaryKey];

    if (_DictionaryValue)
        [t_UserConfigurationDictionaryObjectType serializeToChildOf:node withName:"t:DictionaryValue" value:_DictionaryValue];

}


- (t_UserConfigurationDictionaryObjectType *)DictionaryKey {
    if (!_DictionaryKey) _DictionaryKey = [t_UserConfigurationDictionaryObjectType new];
    return _DictionaryKey;
}

- (t_UserConfigurationDictionaryObjectType *)DictionaryValue {
    if (!_DictionaryValue) _DictionaryValue = [t_UserConfigurationDictionaryObjectType new];
    return _DictionaryValue;
}
+ (t_UserConfigurationDictionaryEntryType *)deserializeNode:(xmlNodePtr)cur {
    t_UserConfigurationDictionaryEntryType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"DictionaryKey")) {
            Class elementClass = classForElement(cur) ?: [t_UserConfigurationDictionaryObjectType class];
            self.DictionaryKey = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DictionaryValue")) {
            Class elementClass = classForElement(cur) ?: [t_UserConfigurationDictionaryObjectType class];
            self.DictionaryValue = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_MeetingResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MeetingResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_MeetingResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    t_MeetingResponseMessageType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_SubscriptionIdType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_PhoneNumberDictionaryEntryType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhoneNumberDictionaryEntryType *)value {
    [xsd_string serializeToChildOf:node withName:childName value:value._content];
    xmlNodePtr child = node->last;

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_PhoneNumberKeyType serializeToProperty:"Key" onNode:node value:_Key];
}

+ (t_PhoneNumberDictionaryEntryType *)deserializeNode:(xmlNodePtr)cur {
    t_PhoneNumberDictionaryEntryType *newObject = [self new];
    newObject._content = [xsd_string deserializeNode:cur];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Key = [t_PhoneNumberKeyType deserializeAttribute:"Key" ofNode:cur];
}
@end
@implementation t_TooBigGroupAttendeeConflictData
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TooBigGroupAttendeeConflictData *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (t_TooBigGroupAttendeeConflictData *)deserializeNode:(xmlNodePtr)cur {
    t_TooBigGroupAttendeeConflictData *newObject = [self new];


    return newObject;
}
@end
@implementation t_NotificationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_NotificationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SubscriptionId)
        [t_SubscriptionIdType serializeToChildOf:node withName:"t:SubscriptionId" value:_SubscriptionId];

    if (_PreviousWatermark)
        [t_WatermarkType serializeToChildOf:node withName:"t:PreviousWatermark" value:_PreviousWatermark];

    if (_MoreEvents)
        [xsd_boolean serializeToChildOf:node withName:"t:MoreEvents" value:_MoreEvents];

    for (t_MovedCopiedEventType * item in _CopiedEvent)
        [t_MovedCopiedEventType serializeToChildOf:node withName:"t:CopiedEvent" value:item];

    for (t_BaseObjectChangedEventType * item in _CreatedEvent)
        [t_BaseObjectChangedEventType serializeToChildOf:node withName:"t:CreatedEvent" value:item];

    for (t_BaseObjectChangedEventType * item in _DeletedEvent)
        [t_BaseObjectChangedEventType serializeToChildOf:node withName:"t:DeletedEvent" value:item];

    for (t_ModifiedEventType * item in _ModifiedEvent)
        [t_ModifiedEventType serializeToChildOf:node withName:"t:ModifiedEvent" value:item];

    for (t_MovedCopiedEventType * item in _MovedEvent)
        [t_MovedCopiedEventType serializeToChildOf:node withName:"t:MovedEvent" value:item];

    for (t_BaseObjectChangedEventType * item in _NewMailEvent)
        [t_BaseObjectChangedEventType serializeToChildOf:node withName:"t:NewMailEvent" value:item];

    for (t_BaseNotificationEventType * item in _StatusEvent)
        [t_BaseNotificationEventType serializeToChildOf:node withName:"t:StatusEvent" value:item];

    for (t_BaseObjectChangedEventType * item in _FreeBusyChangedEvent)
        [t_BaseObjectChangedEventType serializeToChildOf:node withName:"t:FreeBusyChangedEvent" value:item];

}

+ (t_NotificationType *)deserializeNode:(xmlNodePtr)cur {
    t_NotificationType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    NSMutableArray *CopiedEventValues = nil;
    NSMutableArray *CreatedEventValues = nil;
    NSMutableArray *DeletedEventValues = nil;
    NSMutableArray *ModifiedEventValues = nil;
    NSMutableArray *MovedEventValues = nil;
    NSMutableArray *NewMailEventValues = nil;
    NSMutableArray *StatusEventValues = nil;
    NSMutableArray *FreeBusyChangedEventValues = nil;

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SubscriptionId")) {
            Class elementClass = classForElement(cur) ?: [t_SubscriptionIdType class];
            self.SubscriptionId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PreviousWatermark")) {
            Class elementClass = classForElement(cur) ?: [t_WatermarkType class];
            self.PreviousWatermark = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MoreEvents")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.MoreEvents = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CopiedEvent")) {
            Class elementClass = classForElement(cur) ?: [t_MovedCopiedEventType class];
            if (!CopiedEventValues) CopiedEventValues = [NSMutableArray new];
            [CopiedEventValues addObject:[elementClass deserializeNode:cur]];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CreatedEvent")) {
            Class elementClass = classForElement(cur) ?: [t_BaseObjectChangedEventType class];
            if (!CreatedEventValues) CreatedEventValues = [NSMutableArray new];
            [CreatedEventValues addObject:[elementClass deserializeNode:cur]];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DeletedEvent")) {
            Class elementClass = classForElement(cur) ?: [t_BaseObjectChangedEventType class];
            if (!DeletedEventValues) DeletedEventValues = [NSMutableArray new];
            [DeletedEventValues addObject:[elementClass deserializeNode:cur]];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ModifiedEvent")) {
            Class elementClass = classForElement(cur) ?: [t_ModifiedEventType class];
            if (!ModifiedEventValues) ModifiedEventValues = [NSMutableArray new];
            [ModifiedEventValues addObject:[elementClass deserializeNode:cur]];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MovedEvent")) {
            Class elementClass = classForElement(cur) ?: [t_MovedCopiedEventType class];
            if (!MovedEventValues) MovedEventValues = [NSMutableArray new];
            [MovedEventValues addObject:[elementClass deserializeNode:cur]];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"NewMailEvent")) {
            Class elementClass = classForElement(cur) ?: [t_BaseObjectChangedEventType class];
            if (!NewMailEventValues) NewMailEventValues = [NSMutableArray new];
            [NewMailEventValues addObject:[elementClass deserializeNode:cur]];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"StatusEvent")) {
            Class elementClass = classForElement(cur) ?: [t_BaseNotificationEventType class];
            if (!StatusEventValues) StatusEventValues = [NSMutableArray new];
            [StatusEventValues addObject:[elementClass deserializeNode:cur]];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FreeBusyChangedEvent")) {
            Class elementClass = classForElement(cur) ?: [t_BaseObjectChangedEventType class];
            if (!FreeBusyChangedEventValues) FreeBusyChangedEventValues = [NSMutableArray new];
            [FreeBusyChangedEventValues addObject:[elementClass deserializeNode:cur]];
        }
    }

    if (CopiedEventValues) self.CopiedEvent = CopiedEventValues;
    if (CreatedEventValues) self.CreatedEvent = CreatedEventValues;
    if (DeletedEventValues) self.DeletedEvent = DeletedEventValues;
    if (ModifiedEventValues) self.ModifiedEvent = ModifiedEventValues;
    if (MovedEventValues) self.MovedEvent = MovedEventValues;
    if (NewMailEventValues) self.NewMailEvent = NewMailEventValues;
    if (StatusEventValues) self.StatusEvent = StatusEventValues;
    if (FreeBusyChangedEventValues) self.FreeBusyChangedEvent = FreeBusyChangedEventValues;
}
@end
@implementation t_IsGreaterThanOrEqualToType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_IsGreaterThanOrEqualToType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_IsGreaterThanOrEqualToType *)deserializeNode:(xmlNodePtr)cur {
    t_IsGreaterThanOrEqualToType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_ArrayOfMailboxData
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"MailboxData")) {
            Class elementClass = classForElement(child) ?: [t_MailboxData class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_MailboxData * item in value)
        [t_MailboxData serializeToChildOf:child withName:"t:MailboxData" value:item];
}
@end
@implementation t_AlternatePublicFolderIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AlternatePublicFolderIdType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [super addAttributesToNode:node];

    [xsd_string serializeToProperty:"FolderId" onNode:node value:_FolderId];
}

+ (t_AlternatePublicFolderIdType *)deserializeNode:(xmlNodePtr)cur {
    t_AlternatePublicFolderIdType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    [super deserializeAttributesFromNode:cur];

    self.FolderId = [xsd_string deserializeAttribute:"FolderId" ofNode:cur];
}
@end
@implementation t_Duration
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_Duration *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_StartTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:StartTime" value:_StartTime];

    if (_EndTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:EndTime" value:_EndTime];

}

+ (t_Duration *)deserializeNode:(xmlNodePtr)cur {
    t_Duration *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"StartTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.StartTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EndTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.EndTime = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_ExternalAudience_enumValues[] = {
    @"",
    @"All",
    @"Known",
    @"None",
};

@implementation t_ExternalAudience
+ (t_ExternalAudienceEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ExternalAudience_enumValues) / sizeof(t_ExternalAudience_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ExternalAudience_enumValues[i]])
            return (t_ExternalAudienceEnum)i;
    }

    return t_ExternalAudience_none;
}

+ (NSString *)stringFromValue:(t_ExternalAudienceEnum)value {
    return t_ExternalAudience_enumValues[(int)value];
}

+ (t_ExternalAudienceEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ExternalAudience_none;
}

+ (t_ExternalAudienceEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ExternalAudienceEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ExternalAudienceEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_UserOofSettings
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserOofSettings *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_OofState)
        [t_OofState serializeToChildOf:node withName:"t:OofState" value:_OofState];

    if (_ExternalAudience)
        [t_ExternalAudience serializeToChildOf:node withName:"t:ExternalAudience" value:_ExternalAudience];

    if (_Duration)
        [t_Duration serializeToChildOf:node withName:"t:Duration" value:_Duration];

    if (_InternalReply)
        [t_ReplyBody serializeToChildOf:node withName:"t:InternalReply" value:_InternalReply];

    if (_ExternalReply)
        [t_ReplyBody serializeToChildOf:node withName:"t:ExternalReply" value:_ExternalReply];

}


- (t_Duration *)Duration {
    if (!_Duration) _Duration = [t_Duration new];
    return _Duration;
}

- (t_ReplyBody *)InternalReply {
    if (!_InternalReply) _InternalReply = [t_ReplyBody new];
    return _InternalReply;
}

- (t_ReplyBody *)ExternalReply {
    if (!_ExternalReply) _ExternalReply = [t_ReplyBody new];
    return _ExternalReply;
}
+ (t_UserOofSettings *)deserializeNode:(xmlNodePtr)cur {
    t_UserOofSettings *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"OofState")) {
            self.OofState = [t_OofState deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExternalAudience")) {
            self.ExternalAudience = [t_ExternalAudience deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Duration")) {
            Class elementClass = classForElement(cur) ?: [t_Duration class];
            self.Duration = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"InternalReply")) {
            Class elementClass = classForElement(cur) ?: [t_ReplyBody class];
            self.InternalReply = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExternalReply")) {
            Class elementClass = classForElement(cur) ?: [t_ReplyBody class];
            self.ExternalReply = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_FreeBusyViewOptionsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FreeBusyViewOptionsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_TimeWindow)
        [t_Duration serializeToChildOf:node withName:"t:TimeWindow" value:_TimeWindow];

    if (_MergedFreeBusyIntervalInMinutes)
        [xsd_int serializeToChildOf:node withName:"t:MergedFreeBusyIntervalInMinutes" value:_MergedFreeBusyIntervalInMinutes];

    if (_RequestedView)
        [t_FreeBusyViewType serializeToChildOf:node withName:"t:RequestedView" value:_RequestedView];

}


- (t_Duration *)TimeWindow {
    if (!_TimeWindow) _TimeWindow = [t_Duration new];
    return _TimeWindow;
}
+ (t_FreeBusyViewOptionsType *)deserializeNode:(xmlNodePtr)cur {
    t_FreeBusyViewOptionsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"TimeWindow")) {
            Class elementClass = classForElement(cur) ?: [t_Duration class];
            self.TimeWindow = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MergedFreeBusyIntervalInMinutes")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.MergedFreeBusyIntervalInMinutes = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RequestedView")) {
            Class elementClass = classForElement(cur) ?: [t_FreeBusyViewType class];
            self.RequestedView = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_AcceptSharingInvitationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AcceptSharingInvitationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (t_AcceptSharingInvitationType *)deserializeNode:(xmlNodePtr)cur {
    t_AcceptSharingInvitationType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_TasksFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TasksFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_TasksFolderType *)deserializeNode:(xmlNodePtr)cur {
    t_TasksFolderType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_BasePermissionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BasePermissionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_UserId)
        [t_UserIdType serializeToChildOf:node withName:"t:UserId" value:_UserId];

    if (_CanCreateItems)
        [xsd_boolean serializeToChildOf:node withName:"t:CanCreateItems" value:_CanCreateItems];

    if (_CanCreateSubFolders)
        [xsd_boolean serializeToChildOf:node withName:"t:CanCreateSubFolders" value:_CanCreateSubFolders];

    if (_IsFolderOwner)
        [xsd_boolean serializeToChildOf:node withName:"t:IsFolderOwner" value:_IsFolderOwner];

    if (_IsFolderVisible)
        [xsd_boolean serializeToChildOf:node withName:"t:IsFolderVisible" value:_IsFolderVisible];

    if (_IsFolderContact)
        [xsd_boolean serializeToChildOf:node withName:"t:IsFolderContact" value:_IsFolderContact];

    if (_EditItems)
        [t_PermissionActionType serializeToChildOf:node withName:"t:EditItems" value:_EditItems];

    if (_DeleteItems)
        [t_PermissionActionType serializeToChildOf:node withName:"t:DeleteItems" value:_DeleteItems];

}


- (t_UserIdType *)UserId {
    if (!_UserId) _UserId = [t_UserIdType new];
    return _UserId;
}
+ (t_BasePermissionType *)deserializeNode:(xmlNodePtr)cur {
    t_BasePermissionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"UserId")) {
            Class elementClass = classForElement(cur) ?: [t_UserIdType class];
            self.UserId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CanCreateItems")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.CanCreateItems = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CanCreateSubFolders")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.CanCreateSubFolders = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsFolderOwner")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsFolderOwner = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsFolderVisible")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsFolderVisible = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsFolderContact")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsFolderContact = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EditItems")) {
            self.EditItems = [t_PermissionActionType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DeleteItems")) {
            self.DeleteItems = [t_PermissionActionType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation t_PermissionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PermissionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_ReadItems)
        [t_PermissionReadAccessType serializeToChildOf:node withName:"t:ReadItems" value:_ReadItems];

    if (_PermissionLevel)
        [t_PermissionLevelType serializeToChildOf:node withName:"t:PermissionLevel" value:_PermissionLevel];

}

+ (t_PermissionType *)deserializeNode:(xmlNodePtr)cur {
    t_PermissionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ReadItems")) {
            self.ReadItems = [t_PermissionReadAccessType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PermissionLevel")) {
            self.PermissionLevel = [t_PermissionLevelType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation t_NonEmptyArrayOfApplyConversationActionType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"ConversationAction")) {
            Class elementClass = classForElement(child) ?: [t_ConversationActionType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_ConversationActionType * item in value)
        [t_ConversationActionType serializeToChildOf:child withName:"t:ConversationAction" value:item];
}
@end
@implementation t_TimeZoneType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TimeZoneType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"TimeZoneName" onNode:node value:_TimeZoneName];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_BaseOffset)
        [xsd_duration serializeToChildOf:node withName:"t:BaseOffset" value:_BaseOffset];

}


+ (t_TimeZoneType *)deserializeNode:(xmlNodePtr)cur {
    t_TimeZoneType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.TimeZoneName = [xsd_string deserializeAttribute:"TimeZoneName" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"BaseOffset")) {
            Class elementClass = classForElement(cur) ?: [xsd_duration class];
            self.BaseOffset = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_CompleteActionType_enumValues[] = {
    @"",
    @"Abandon",
    @"Commit",
};

@implementation t_CompleteActionType
+ (t_CompleteActionTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_CompleteActionType_enumValues) / sizeof(t_CompleteActionType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_CompleteActionType_enumValues[i]])
            return (t_CompleteActionTypeEnum)i;
    }

    return t_CompleteActionType_none;
}

+ (NSString *)stringFromValue:(t_CompleteActionTypeEnum)value {
    return t_CompleteActionType_enumValues[(int)value];
}

+ (t_CompleteActionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_CompleteActionType_none;
}

+ (t_CompleteActionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CompleteActionTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_CompleteActionTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_NonEmptyArrayOfOccurrenceInfoType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Occurrence")) {
            Class elementClass = classForElement(child) ?: [t_OccurrenceInfoType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_OccurrenceInfoType * item in value)
        [t_OccurrenceInfoType serializeToChildOf:child withName:"t:Occurrence" value:item];
}
@end
@implementation t_ArrayOfSmtpAddressType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"SmtpAddress")) {
            Class elementClass = classForElement(child) ?: [t_NonEmptyStringType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (NSString * item in value)
        [t_NonEmptyStringType serializeToChildOf:child withName:"t:SmtpAddress" value:item];
}
@end
static NSString *t_ContainmentComparisonType_enumValues[] = {
    @"",
    @"Exact",
    @"IgnoreCase",
    @"IgnoreCaseAndNonSpacingCharacters",
    @"IgnoreNonSpacingCharacters",
    @"Loose",
    @"LooseAndIgnoreCase",
    @"LooseAndIgnoreCaseAndIgnoreNonSpace",
    @"LooseAndIgnoreNonSpace",
};

@implementation t_ContainmentComparisonType
+ (t_ContainmentComparisonTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_ContainmentComparisonType_enumValues) / sizeof(t_ContainmentComparisonType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_ContainmentComparisonType_enumValues[i]])
            return (t_ContainmentComparisonTypeEnum)i;
    }

    return t_ContainmentComparisonType_none;
}

+ (NSString *)stringFromValue:(t_ContainmentComparisonTypeEnum)value {
    return t_ContainmentComparisonType_enumValues[(int)value];
}

+ (t_ContainmentComparisonTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_ContainmentComparisonType_none;
}

+ (t_ContainmentComparisonTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ContainmentComparisonTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ContainmentComparisonTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_UserConfigurationPropertyType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_SyncFolderItemsCreateOrUpdateType
+ (id)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = nil;
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;
        else if (xmlStrEqual(child->name, (const xmlChar *)"Item")) {
            Class elementClass = classForElement(child) ?: [t_ItemType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"Message")) {
            Class elementClass = classForElement(child) ?: [t_MessageType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"CalendarItem")) {
            Class elementClass = classForElement(child) ?: [t_CalendarItemType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"Contact")) {
            Class elementClass = classForElement(child) ?: [t_ContactItemType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"DistributionList")) {
            Class elementClass = classForElement(child) ?: [t_DistributionListType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"MeetingMessage")) {
            Class elementClass = classForElement(child) ?: [t_MeetingMessageType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"MeetingRequest")) {
            Class elementClass = classForElement(child) ?: [t_MeetingRequestMessageType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"MeetingResponse")) {
            Class elementClass = classForElement(child) ?: [t_MeetingResponseMessageType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"MeetingCancellation")) {
            Class elementClass = classForElement(child) ?: [t_MeetingCancellationMessageType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"Task")) {
            Class elementClass = classForElement(child) ?: [t_TaskType class];
            return [elementClass deserializeNode:child];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"PostItem")) {
            Class elementClass = classForElement(child) ?: [t_PostItemType class];
            return [elementClass deserializeNode:child];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(id)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    if (false);
    else if ([value isMemberOfClass:[t_ItemType class]])
        [t_ItemType serializeToChildOf:child withName:"t:Item" value:value];
    else if ([value isMemberOfClass:[t_MessageType class]])
        [t_MessageType serializeToChildOf:child withName:"t:Message" value:value];
    else if ([value isMemberOfClass:[t_CalendarItemType class]])
        [t_CalendarItemType serializeToChildOf:child withName:"t:CalendarItem" value:value];
    else if ([value isMemberOfClass:[t_ContactItemType class]])
        [t_ContactItemType serializeToChildOf:child withName:"t:Contact" value:value];
    else if ([value isMemberOfClass:[t_DistributionListType class]])
        [t_DistributionListType serializeToChildOf:child withName:"t:DistributionList" value:value];
    else if ([value isMemberOfClass:[t_MeetingMessageType class]])
        [t_MeetingMessageType serializeToChildOf:child withName:"t:MeetingMessage" value:value];
    else if ([value isMemberOfClass:[t_MeetingRequestMessageType class]])
        [t_MeetingRequestMessageType serializeToChildOf:child withName:"t:MeetingRequest" value:value];
    else if ([value isMemberOfClass:[t_MeetingResponseMessageType class]])
        [t_MeetingResponseMessageType serializeToChildOf:child withName:"t:MeetingResponse" value:value];
    else if ([value isMemberOfClass:[t_MeetingCancellationMessageType class]])
        [t_MeetingCancellationMessageType serializeToChildOf:child withName:"t:MeetingCancellation" value:value];
    else if ([value isMemberOfClass:[t_TaskType class]])
        [t_TaskType serializeToChildOf:child withName:"t:Task" value:value];
    else if ([value isMemberOfClass:[t_PostItemType class]])
        [t_PostItemType serializeToChildOf:child withName:"t:PostItem" value:value];
}
@end
@implementation t_PhoneCallIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhoneCallIdType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"Id" onNode:node value:_Id_];
}

+ (t_PhoneCallIdType *)deserializeNode:(xmlNodePtr)cur {
    t_PhoneCallIdType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Id_ = [xsd_string deserializeAttribute:"Id" ofNode:cur];
}
@end
@implementation t_ElementRequestServerVersion
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ElementRequestServerVersion *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_ExchangeVersionType serializeToProperty:"Version" onNode:node value:_Version];
}

+ (t_ElementRequestServerVersion *)deserializeNode:(xmlNodePtr)cur {
    t_ElementRequestServerVersion *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Version = [t_ExchangeVersionType deserializeAttribute:"Version" ofNode:cur];
}
@end
@implementation t_FolderIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FolderIdType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"Id" onNode:node value:_Id_];
    [xsd_string serializeToProperty:"ChangeKey" onNode:node value:_ChangeKey];
}

+ (t_FolderIdType *)deserializeNode:(xmlNodePtr)cur {
    t_FolderIdType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Id_ = [xsd_string deserializeAttribute:"Id" ofNode:cur];
    self.ChangeKey = [xsd_string deserializeAttribute:"ChangeKey" ofNode:cur];
}
@end
@implementation t_WeeklyRegeneratingPatternType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_WeeklyRegeneratingPatternType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_WeeklyRegeneratingPatternType *)deserializeNode:(xmlNodePtr)cur {
    t_WeeklyRegeneratingPatternType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
static NSString *t_CalendarPermissionLevelType_enumValues[] = {
    @"",
    @"Author",
    @"Contributor",
    @"Custom",
    @"Editor",
    @"FreeBusyTimeAndSubjectAndLocation",
    @"FreeBusyTimeOnly",
    @"None",
    @"NoneditingAuthor",
    @"Owner",
    @"PublishingAuthor",
    @"PublishingEditor",
    @"Reviewer",
};

@implementation t_CalendarPermissionLevelType
+ (t_CalendarPermissionLevelTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_CalendarPermissionLevelType_enumValues) / sizeof(t_CalendarPermissionLevelType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_CalendarPermissionLevelType_enumValues[i]])
            return (t_CalendarPermissionLevelTypeEnum)i;
    }

    return t_CalendarPermissionLevelType_none;
}

+ (NSString *)stringFromValue:(t_CalendarPermissionLevelTypeEnum)value {
    return t_CalendarPermissionLevelType_enumValues[(int)value];
}

+ (t_CalendarPermissionLevelTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_CalendarPermissionLevelType_none;
}

+ (t_CalendarPermissionLevelTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarPermissionLevelTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_CalendarPermissionLevelTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_CalendarPermissionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarPermissionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_ReadItems)
        [t_CalendarPermissionReadAccessType serializeToChildOf:node withName:"t:ReadItems" value:_ReadItems];

    if (_CalendarPermissionLevel)
        [t_CalendarPermissionLevelType serializeToChildOf:node withName:"t:CalendarPermissionLevel" value:_CalendarPermissionLevel];

}

+ (t_CalendarPermissionType *)deserializeNode:(xmlNodePtr)cur {
    t_CalendarPermissionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ReadItems")) {
            self.ReadItems = [t_CalendarPermissionReadAccessType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CalendarPermissionLevel")) {
            self.CalendarPermissionLevel = [t_CalendarPermissionLevelType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation t_ProtectionRuleType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ProtectionRuleType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_AttributeName serializeToProperty:"Name" onNode:node value:_Name];
    [xsd_boolean serializeToProperty:"UserOverridable" onNode:node value:_UserOverridable];
    [t_AttributePriority serializeToProperty:"Priority" onNode:node value:_Priority];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Condition)
        [t_ProtectionRuleConditionType serializeToChildOf:node withName:"t:Condition" value:_Condition];

    if (_Action)
        [t_ProtectionRuleActionType serializeToChildOf:node withName:"t:Action" value:_Action];

}


- (t_ProtectionRuleActionType *)Action {
    if (!_Action) _Action = [t_ProtectionRuleActionType new];
    return _Action;
}

+ (t_ProtectionRuleType *)deserializeNode:(xmlNodePtr)cur {
    t_ProtectionRuleType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Name = [t_AttributeName deserializeAttribute:"Name" ofNode:cur];
    self.UserOverridable = [xsd_boolean deserializeAttribute:"UserOverridable" ofNode:cur];
    self.Priority = [t_AttributePriority deserializeAttribute:"Priority" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Condition")) {
            Class elementClass = classForElement(cur) ?: [t_ProtectionRuleConditionType class];
            self.Condition = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Action")) {
            Class elementClass = classForElement(cur) ?: [t_ProtectionRuleActionType class];
            self.Action = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ItemChangeType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ItemChangeType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ItemId)
        [t_ItemIdType serializeToChildOf:node withName:"t:ItemId" value:_ItemId];

    if (_OccurrenceItemId)
        [t_OccurrenceItemIdType serializeToChildOf:node withName:"t:OccurrenceItemId" value:_OccurrenceItemId];

    if (_RecurringMasterItemId)
        [t_RecurringMasterItemIdType serializeToChildOf:node withName:"t:RecurringMasterItemId" value:_RecurringMasterItemId];

    if (_Updates)
        [t_NonEmptyArrayOfItemChangeDescriptionsType serializeToChildOf:node withName:"t:Updates" value:_Updates];

}


- (t_ItemIdType *)ItemId {
    if (!_ItemId) _ItemId = [t_ItemIdType new];
    return _ItemId;
}

- (t_OccurrenceItemIdType *)OccurrenceItemId {
    if (!_OccurrenceItemId) _OccurrenceItemId = [t_OccurrenceItemIdType new];
    return _OccurrenceItemId;
}

- (t_RecurringMasterItemIdType *)RecurringMasterItemId {
    if (!_RecurringMasterItemId) _RecurringMasterItemId = [t_RecurringMasterItemIdType new];
    return _RecurringMasterItemId;
}
+ (t_ItemChangeType *)deserializeNode:(xmlNodePtr)cur {
    t_ItemChangeType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ItemId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"OccurrenceItemId")) {
            Class elementClass = classForElement(cur) ?: [t_OccurrenceItemIdType class];
            self.OccurrenceItemId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RecurringMasterItemId")) {
            Class elementClass = classForElement(cur) ?: [t_RecurringMasterItemIdType class];
            self.RecurringMasterItemId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Updates")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfItemChangeDescriptionsType class];
            self.Updates = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_AttachmentResponseShapeType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AttachmentResponseShapeType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_IncludeMimeContent)
        [xsd_boolean serializeToChildOf:node withName:"t:IncludeMimeContent" value:_IncludeMimeContent];

    if (_BodyType)
        [t_BodyTypeResponseType serializeToChildOf:node withName:"t:BodyType" value:_BodyType];

    if (_FilterHtmlContent)
        [xsd_boolean serializeToChildOf:node withName:"t:FilterHtmlContent" value:_FilterHtmlContent];

    if (_AdditionalProperties)
        [t_NonEmptyArrayOfPathsToElementType serializeToChildOf:node withName:"t:AdditionalProperties" value:_AdditionalProperties];

}

+ (t_AttachmentResponseShapeType *)deserializeNode:(xmlNodePtr)cur {
    t_AttachmentResponseShapeType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"IncludeMimeContent")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IncludeMimeContent = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"BodyType")) {
            self.BodyType = [t_BodyTypeResponseType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FilterHtmlContent")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.FilterHtmlContent = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AdditionalProperties")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfPathsToElementType class];
            self.AdditionalProperties = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_AlternatePublicFolderItemIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AlternatePublicFolderItemIdType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [super addAttributesToNode:node];

    [xsd_string serializeToProperty:"ItemId" onNode:node value:_ItemId];
}

+ (t_AlternatePublicFolderItemIdType *)deserializeNode:(xmlNodePtr)cur {
    t_AlternatePublicFolderItemIdType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    [super deserializeAttributesFromNode:cur];

    self.ItemId = [xsd_string deserializeAttribute:"ItemId" ofNode:cur];
}
@end
@implementation t_UserMailboxType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserMailboxType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"Id" onNode:node value:_Id_];
    [xsd_boolean serializeToProperty:"IsArchive" onNode:node value:_IsArchive];
}

+ (t_UserMailboxType *)deserializeNode:(xmlNodePtr)cur {
    t_UserMailboxType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Id_ = [xsd_string deserializeAttribute:"Id" ofNode:cur];
    self.IsArchive = [xsd_boolean deserializeAttribute:"IsArchive" ofNode:cur];
}
@end
@implementation t_IsLessThanType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_IsLessThanType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_IsLessThanType *)deserializeNode:(xmlNodePtr)cur {
    t_IsLessThanType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_RestrictionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RestrictionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SearchExpression)
        [t_SearchExpressionType serializeToChildOf:node withName:"t:SearchExpression" value:_SearchExpression];

    if (_Exists)
        [t_ExistsType serializeToChildOf:node withName:"t:Exists" value:_Exists];

    if (_Excludes)
        [t_ExcludesType serializeToChildOf:node withName:"t:Excludes" value:_Excludes];

    if (_IsEqualTo)
        [t_IsEqualToType serializeToChildOf:node withName:"t:IsEqualTo" value:_IsEqualTo];

    if (_IsNotEqualTo)
        [t_IsNotEqualToType serializeToChildOf:node withName:"t:IsNotEqualTo" value:_IsNotEqualTo];

    if (_IsGreaterThan)
        [t_IsGreaterThanType serializeToChildOf:node withName:"t:IsGreaterThan" value:_IsGreaterThan];

    if (_IsGreaterThanOrEqualTo)
        [t_IsGreaterThanOrEqualToType serializeToChildOf:node withName:"t:IsGreaterThanOrEqualTo" value:_IsGreaterThanOrEqualTo];

    if (_IsLessThan)
        [t_IsLessThanType serializeToChildOf:node withName:"t:IsLessThan" value:_IsLessThan];

    if (_IsLessThanOrEqualTo)
        [t_IsLessThanOrEqualToType serializeToChildOf:node withName:"t:IsLessThanOrEqualTo" value:_IsLessThanOrEqualTo];

    if (_Contains)
        [t_ContainsExpressionType serializeToChildOf:node withName:"t:Contains" value:_Contains];

    if (_Not)
        [t_NotType serializeToChildOf:node withName:"t:Not" value:_Not];

    if (_And)
        [t_AndType serializeToChildOf:node withName:"t:And" value:_And];

    if (_Or)
        [t_OrType serializeToChildOf:node withName:"t:Or" value:_Or];

}


- (t_SearchExpressionType *)SearchExpression {
    if (!_SearchExpression) _SearchExpression = [t_SearchExpressionType new];
    return _SearchExpression;
}

- (t_ExistsType *)Exists {
    if (!_Exists) _Exists = [t_ExistsType new];
    return _Exists;
}

- (t_ExcludesType *)Excludes {
    if (!_Excludes) _Excludes = [t_ExcludesType new];
    return _Excludes;
}

- (t_IsEqualToType *)IsEqualTo {
    if (!_IsEqualTo) _IsEqualTo = [t_IsEqualToType new];
    return _IsEqualTo;
}

- (t_IsNotEqualToType *)IsNotEqualTo {
    if (!_IsNotEqualTo) _IsNotEqualTo = [t_IsNotEqualToType new];
    return _IsNotEqualTo;
}

- (t_IsGreaterThanType *)IsGreaterThan {
    if (!_IsGreaterThan) _IsGreaterThan = [t_IsGreaterThanType new];
    return _IsGreaterThan;
}

- (t_IsGreaterThanOrEqualToType *)IsGreaterThanOrEqualTo {
    if (!_IsGreaterThanOrEqualTo) _IsGreaterThanOrEqualTo = [t_IsGreaterThanOrEqualToType new];
    return _IsGreaterThanOrEqualTo;
}

- (t_IsLessThanType *)IsLessThan {
    if (!_IsLessThan) _IsLessThan = [t_IsLessThanType new];
    return _IsLessThan;
}

- (t_IsLessThanOrEqualToType *)IsLessThanOrEqualTo {
    if (!_IsLessThanOrEqualTo) _IsLessThanOrEqualTo = [t_IsLessThanOrEqualToType new];
    return _IsLessThanOrEqualTo;
}

- (t_ContainsExpressionType *)Contains {
    if (!_Contains) _Contains = [t_ContainsExpressionType new];
    return _Contains;
}

- (t_NotType *)Not {
    if (!_Not) _Not = [t_NotType new];
    return _Not;
}

- (t_AndType *)And {
    if (!_And) _And = [t_AndType new];
    return _And;
}

- (t_OrType *)Or {
    if (!_Or) _Or = [t_OrType new];
    return _Or;
}
+ (t_RestrictionType *)deserializeNode:(xmlNodePtr)cur {
    t_RestrictionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SearchExpression")) {
            Class elementClass = classForElement(cur) ?: [t_SearchExpressionType class];
            self.SearchExpression = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Exists")) {
            Class elementClass = classForElement(cur) ?: [t_ExistsType class];
            self.Exists = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Excludes")) {
            Class elementClass = classForElement(cur) ?: [t_ExcludesType class];
            self.Excludes = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsEqualTo")) {
            Class elementClass = classForElement(cur) ?: [t_IsEqualToType class];
            self.IsEqualTo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsNotEqualTo")) {
            Class elementClass = classForElement(cur) ?: [t_IsNotEqualToType class];
            self.IsNotEqualTo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsGreaterThan")) {
            Class elementClass = classForElement(cur) ?: [t_IsGreaterThanType class];
            self.IsGreaterThan = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsGreaterThanOrEqualTo")) {
            Class elementClass = classForElement(cur) ?: [t_IsGreaterThanOrEqualToType class];
            self.IsGreaterThanOrEqualTo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsLessThan")) {
            Class elementClass = classForElement(cur) ?: [t_IsLessThanType class];
            self.IsLessThan = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsLessThanOrEqualTo")) {
            Class elementClass = classForElement(cur) ?: [t_IsLessThanOrEqualToType class];
            self.IsLessThanOrEqualTo = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Contains")) {
            Class elementClass = classForElement(cur) ?: [t_ContainsExpressionType class];
            self.Contains = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Not")) {
            Class elementClass = classForElement(cur) ?: [t_NotType class];
            self.Not = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"And")) {
            Class elementClass = classForElement(cur) ?: [t_AndType class];
            self.And = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Or")) {
            Class elementClass = classForElement(cur) ?: [t_OrType class];
            self.Or = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_AbsoluteDateTransitionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AbsoluteDateTransitionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_DateTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:DateTime" value:_DateTime];

}

+ (t_AbsoluteDateTransitionType *)deserializeNode:(xmlNodePtr)cur {
    t_AbsoluteDateTransitionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"DateTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.DateTime = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_PostItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PostItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_ConversationIndex)
        [xsd_base64Binary serializeToChildOf:node withName:"t:ConversationIndex" value:_ConversationIndex];

    if (_ConversationTopic)
        [xsd_string serializeToChildOf:node withName:"t:ConversationTopic" value:_ConversationTopic];

    if (_From)
        [t_SingleRecipientType serializeToChildOf:node withName:"t:From" value:_From];

    if (_InternetMessageId)
        [xsd_string serializeToChildOf:node withName:"t:InternetMessageId" value:_InternetMessageId];

    if (_IsRead)
        [xsd_boolean serializeToChildOf:node withName:"t:IsRead" value:_IsRead];

    if (_PostedTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:PostedTime" value:_PostedTime];

    if (_References)
        [xsd_string serializeToChildOf:node withName:"t:References" value:_References];

    if (_Sender)
        [t_SingleRecipientType serializeToChildOf:node withName:"t:Sender" value:_Sender];

}

+ (t_PostItemType *)deserializeNode:(xmlNodePtr)cur {
    t_PostItemType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConversationIndex")) {
            Class elementClass = classForElement(cur) ?: [xsd_base64Binary class];
            self.ConversationIndex = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConversationTopic")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.ConversationTopic = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"From")) {
            Class elementClass = classForElement(cur) ?: [t_SingleRecipientType class];
            self.From = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"InternetMessageId")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.InternetMessageId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsRead")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsRead = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PostedTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.PostedTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"References")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.References = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Sender")) {
            Class elementClass = classForElement(cur) ?: [t_SingleRecipientType class];
            self.Sender = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_FieldOrderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FieldOrderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_SortDirectionType serializeToProperty:"Order" onNode:node value:_Order];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Path)
        [t_BasePathToElementType serializeToChildOf:node withName:"t:Path" value:_Path];

    if (_FieldURI)
        [t_PathToUnindexedFieldType serializeToChildOf:node withName:"t:FieldURI" value:_FieldURI];

    if (_IndexedFieldURI)
        [t_PathToIndexedFieldType serializeToChildOf:node withName:"t:IndexedFieldURI" value:_IndexedFieldURI];

    if (_ExtendedFieldURI)
        [t_PathToExtendedFieldType serializeToChildOf:node withName:"t:ExtendedFieldURI" value:_ExtendedFieldURI];

}


- (t_BasePathToElementType *)Path {
    if (!_Path) _Path = [t_BasePathToElementType new];
    return _Path;
}

- (t_PathToUnindexedFieldType *)FieldURI {
    if (!_FieldURI) _FieldURI = [t_PathToUnindexedFieldType new];
    return _FieldURI;
}

- (t_PathToIndexedFieldType *)IndexedFieldURI {
    if (!_IndexedFieldURI) _IndexedFieldURI = [t_PathToIndexedFieldType new];
    return _IndexedFieldURI;
}

- (t_PathToExtendedFieldType *)ExtendedFieldURI {
    if (!_ExtendedFieldURI) _ExtendedFieldURI = [t_PathToExtendedFieldType new];
    return _ExtendedFieldURI;
}

+ (t_FieldOrderType *)deserializeNode:(xmlNodePtr)cur {
    t_FieldOrderType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Order = [t_SortDirectionType deserializeAttribute:"Order" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Path")) {
            Class elementClass = classForElement(cur) ?: [t_BasePathToElementType class];
            self.Path = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToUnindexedFieldType class];
            self.FieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IndexedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToIndexedFieldType class];
            self.IndexedFieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExtendedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToExtendedFieldType class];
            self.ExtendedFieldURI = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_UserConfigurationNameType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserConfigurationNameType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_NonEmptyStringType serializeToProperty:"Name" onNode:node value:_Name];
}

+ (t_UserConfigurationNameType *)deserializeNode:(xmlNodePtr)cur {
    t_UserConfigurationNameType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Name = [t_NonEmptyStringType deserializeAttribute:"Name" ofNode:cur];
}
@end
@implementation t_UnifiedMessageServiceConfiguration
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UnifiedMessageServiceConfiguration *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_UmEnabled)
        [xsd_boolean serializeToChildOf:node withName:"t:UmEnabled" value:_UmEnabled];

    if (_PlayOnPhoneDialString)
        [xsd_string serializeToChildOf:node withName:"t:PlayOnPhoneDialString" value:_PlayOnPhoneDialString];

    if (_PlayOnPhoneEnabled)
        [xsd_boolean serializeToChildOf:node withName:"t:PlayOnPhoneEnabled" value:_PlayOnPhoneEnabled];

}

+ (t_UnifiedMessageServiceConfiguration *)deserializeNode:(xmlNodePtr)cur {
    t_UnifiedMessageServiceConfiguration *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"UmEnabled")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.UmEnabled = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PlayOnPhoneDialString")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.PlayOnPhoneDialString = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PlayOnPhoneEnabled")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.PlayOnPhoneEnabled = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_FolderClassType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_YearlyRegeneratingPatternType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_YearlyRegeneratingPatternType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_YearlyRegeneratingPatternType *)deserializeNode:(xmlNodePtr)cur {
    t_YearlyRegeneratingPatternType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_GroupedItemsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_GroupedItemsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_GroupIndex)
        [xsd_string serializeToChildOf:node withName:"t:GroupIndex" value:_GroupIndex];

    if (_Items)
        [t_ArrayOfRealItemsType serializeToChildOf:node withName:"t:Items" value:_Items];

}

+ (t_GroupedItemsType *)deserializeNode:(xmlNodePtr)cur {
    t_GroupedItemsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"GroupIndex")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.GroupIndex = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Items")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRealItemsType class];
            self.Items = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_PostReplyItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PostReplyItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_NewBodyContent)
        [t_BodyType serializeToChildOf:node withName:"t:NewBodyContent" value:_NewBodyContent];

}


- (t_BodyType *)NewBodyContent {
    if (!_NewBodyContent) _NewBodyContent = [t_BodyType new];
    return _NewBodyContent;
}
+ (t_PostReplyItemType *)deserializeNode:(xmlNodePtr)cur {
    t_PostReplyItemType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"NewBodyContent")) {
            Class elementClass = classForElement(cur) ?: [t_BodyType class];
            self.NewBodyContent = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_CalendarItemTypeType_enumValues[] = {
    @"",
    @"Exception",
    @"Occurrence",
    @"RecurringMaster",
    @"Single",
};

@implementation t_CalendarItemTypeType
+ (t_CalendarItemTypeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_CalendarItemTypeType_enumValues) / sizeof(t_CalendarItemTypeType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_CalendarItemTypeType_enumValues[i]])
            return (t_CalendarItemTypeTypeEnum)i;
    }

    return t_CalendarItemTypeType_none;
}

+ (NSString *)stringFromValue:(t_CalendarItemTypeTypeEnum)value {
    return t_CalendarItemTypeType_enumValues[(int)value];
}

+ (t_CalendarItemTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_CalendarItemTypeType_none;
}

+ (t_CalendarItemTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarItemTypeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_CalendarItemTypeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_NonEmptyArrayOfDeletedOccurrencesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"DeletedOccurrence")) {
            Class elementClass = classForElement(child) ?: [t_DeletedOccurrenceInfoType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_DeletedOccurrenceInfoType * item in value)
        [t_DeletedOccurrenceInfoType serializeToChildOf:child withName:"t:DeletedOccurrence" value:item];
}
@end
@implementation t_CalendarItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_UID)
        [xsd_string serializeToChildOf:node withName:"t:UID" value:_UID];

    if (_RecurrenceId)
        [xsd_dateTime serializeToChildOf:node withName:"t:RecurrenceId" value:_RecurrenceId];

    if (_DateTimeStamp)
        [xsd_dateTime serializeToChildOf:node withName:"t:DateTimeStamp" value:_DateTimeStamp];

    if (_Start)
        [xsd_dateTime serializeToChildOf:node withName:"t:Start" value:_Start];

    if (_End)
        [xsd_dateTime serializeToChildOf:node withName:"t:End" value:_End];

    if (_OriginalStart)
        [xsd_dateTime serializeToChildOf:node withName:"t:OriginalStart" value:_OriginalStart];

    if (_IsAllDayEvent)
        [xsd_boolean serializeToChildOf:node withName:"t:IsAllDayEvent" value:_IsAllDayEvent];

    if (_LegacyFreeBusyStatus)
        [t_LegacyFreeBusyType serializeToChildOf:node withName:"t:LegacyFreeBusyStatus" value:_LegacyFreeBusyStatus];

    if (_Location)
        [xsd_string serializeToChildOf:node withName:"t:Location" value:_Location];

    if (_When)
        [xsd_string serializeToChildOf:node withName:"t:When" value:_When];

    if (_IsMeeting)
        [xsd_boolean serializeToChildOf:node withName:"t:IsMeeting" value:_IsMeeting];

    if (_IsCancelled)
        [xsd_boolean serializeToChildOf:node withName:"t:IsCancelled" value:_IsCancelled];

    if (_IsRecurring)
        [xsd_boolean serializeToChildOf:node withName:"t:IsRecurring" value:_IsRecurring];

    if (_MeetingRequestWasSent)
        [xsd_boolean serializeToChildOf:node withName:"t:MeetingRequestWasSent" value:_MeetingRequestWasSent];

    if (_IsResponseRequested)
        [xsd_boolean serializeToChildOf:node withName:"t:IsResponseRequested" value:_IsResponseRequested];

    if (_CalendarItemType)
        [t_CalendarItemTypeType serializeToChildOf:node withName:"t:CalendarItemType" value:_CalendarItemType];

    if (_MyResponseType)
        [t_ResponseTypeType serializeToChildOf:node withName:"t:MyResponseType" value:_MyResponseType];

    if (_Organizer)
        [t_SingleRecipientType serializeToChildOf:node withName:"t:Organizer" value:_Organizer];

    if (_RequiredAttendees)
        [t_NonEmptyArrayOfAttendeesType serializeToChildOf:node withName:"t:RequiredAttendees" value:_RequiredAttendees];

    if (_OptionalAttendees)
        [t_NonEmptyArrayOfAttendeesType serializeToChildOf:node withName:"t:OptionalAttendees" value:_OptionalAttendees];

    if (_Resources)
        [t_NonEmptyArrayOfAttendeesType serializeToChildOf:node withName:"t:Resources" value:_Resources];

    if (_ConflictingMeetingCount)
        [xsd_int serializeToChildOf:node withName:"t:ConflictingMeetingCount" value:_ConflictingMeetingCount];

    if (_AdjacentMeetingCount)
        [xsd_int serializeToChildOf:node withName:"t:AdjacentMeetingCount" value:_AdjacentMeetingCount];

    if (_ConflictingMeetings)
        [t_NonEmptyArrayOfAllItemsType serializeToChildOf:node withName:"t:ConflictingMeetings" value:_ConflictingMeetings];

    if (_AdjacentMeetings)
        [t_NonEmptyArrayOfAllItemsType serializeToChildOf:node withName:"t:AdjacentMeetings" value:_AdjacentMeetings];

    if (_Duration)
        [xsd_string serializeToChildOf:node withName:"t:Duration" value:_Duration];

    if (_TimeZone)
        [xsd_string serializeToChildOf:node withName:"t:TimeZone" value:_TimeZone];

    if (_AppointmentReplyTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:AppointmentReplyTime" value:_AppointmentReplyTime];

    if (_AppointmentSequenceNumber)
        [xsd_int serializeToChildOf:node withName:"t:AppointmentSequenceNumber" value:_AppointmentSequenceNumber];

    if (_AppointmentState)
        [xsd_int serializeToChildOf:node withName:"t:AppointmentState" value:_AppointmentState];

    if (_Recurrence)
        [t_RecurrenceType serializeToChildOf:node withName:"t:Recurrence" value:_Recurrence];

    if (_FirstOccurrence)
        [t_OccurrenceInfoType serializeToChildOf:node withName:"t:FirstOccurrence" value:_FirstOccurrence];

    if (_LastOccurrence)
        [t_OccurrenceInfoType serializeToChildOf:node withName:"t:LastOccurrence" value:_LastOccurrence];

    if (_ModifiedOccurrences)
        [t_NonEmptyArrayOfOccurrenceInfoType serializeToChildOf:node withName:"t:ModifiedOccurrences" value:_ModifiedOccurrences];

    if (_DeletedOccurrences)
        [t_NonEmptyArrayOfDeletedOccurrencesType serializeToChildOf:node withName:"t:DeletedOccurrences" value:_DeletedOccurrences];

    if (_MeetingTimeZone)
        [t_TimeZoneType serializeToChildOf:node withName:"t:MeetingTimeZone" value:_MeetingTimeZone];

    if (_StartTimeZone)
        [t_TimeZoneDefinitionType serializeToChildOf:node withName:"t:StartTimeZone" value:_StartTimeZone];

    if (_EndTimeZone)
        [t_TimeZoneDefinitionType serializeToChildOf:node withName:"t:EndTimeZone" value:_EndTimeZone];

    if (_ConferenceType)
        [xsd_int serializeToChildOf:node withName:"t:ConferenceType" value:_ConferenceType];

    if (_AllowNewTimeProposal)
        [xsd_boolean serializeToChildOf:node withName:"t:AllowNewTimeProposal" value:_AllowNewTimeProposal];

    if (_IsOnlineMeeting)
        [xsd_boolean serializeToChildOf:node withName:"t:IsOnlineMeeting" value:_IsOnlineMeeting];

    if (_MeetingWorkspaceUrl)
        [xsd_string serializeToChildOf:node withName:"t:MeetingWorkspaceUrl" value:_MeetingWorkspaceUrl];

    if (_NetShowUrl)
        [xsd_string serializeToChildOf:node withName:"t:NetShowUrl" value:_NetShowUrl];

}


- (t_RecurrenceType *)Recurrence {
    if (!_Recurrence) _Recurrence = [t_RecurrenceType new];
    return _Recurrence;
}

- (t_OccurrenceInfoType *)FirstOccurrence {
    if (!_FirstOccurrence) _FirstOccurrence = [t_OccurrenceInfoType new];
    return _FirstOccurrence;
}

- (t_OccurrenceInfoType *)LastOccurrence {
    if (!_LastOccurrence) _LastOccurrence = [t_OccurrenceInfoType new];
    return _LastOccurrence;
}

- (t_TimeZoneType *)MeetingTimeZone {
    if (!_MeetingTimeZone) _MeetingTimeZone = [t_TimeZoneType new];
    return _MeetingTimeZone;
}

- (t_TimeZoneDefinitionType *)StartTimeZone {
    if (!_StartTimeZone) _StartTimeZone = [t_TimeZoneDefinitionType new];
    return _StartTimeZone;
}

- (t_TimeZoneDefinitionType *)EndTimeZone {
    if (!_EndTimeZone) _EndTimeZone = [t_TimeZoneDefinitionType new];
    return _EndTimeZone;
}
+ (t_CalendarItemType *)deserializeNode:(xmlNodePtr)cur {
    t_CalendarItemType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"UID")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.UID = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RecurrenceId")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.RecurrenceId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DateTimeStamp")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.DateTimeStamp = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Start")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.Start = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"End")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.End = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"OriginalStart")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.OriginalStart = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsAllDayEvent")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsAllDayEvent = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"LegacyFreeBusyStatus")) {
            self.LegacyFreeBusyStatus = [t_LegacyFreeBusyType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Location")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Location = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"When")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.When = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsMeeting")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsMeeting = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsCancelled")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsCancelled = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsRecurring")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsRecurring = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingRequestWasSent")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.MeetingRequestWasSent = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsResponseRequested")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsResponseRequested = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CalendarItemType")) {
            self.CalendarItemType = [t_CalendarItemTypeType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MyResponseType")) {
            self.MyResponseType = [t_ResponseTypeType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Organizer")) {
            Class elementClass = classForElement(cur) ?: [t_SingleRecipientType class];
            self.Organizer = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RequiredAttendees")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfAttendeesType class];
            self.RequiredAttendees = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"OptionalAttendees")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfAttendeesType class];
            self.OptionalAttendees = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Resources")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfAttendeesType class];
            self.Resources = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConflictingMeetingCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.ConflictingMeetingCount = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AdjacentMeetingCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.AdjacentMeetingCount = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConflictingMeetings")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfAllItemsType class];
            self.ConflictingMeetings = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AdjacentMeetings")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfAllItemsType class];
            self.AdjacentMeetings = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Duration")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Duration = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"TimeZone")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.TimeZone = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AppointmentReplyTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.AppointmentReplyTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AppointmentSequenceNumber")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.AppointmentSequenceNumber = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AppointmentState")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.AppointmentState = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Recurrence")) {
            Class elementClass = classForElement(cur) ?: [t_RecurrenceType class];
            self.Recurrence = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FirstOccurrence")) {
            Class elementClass = classForElement(cur) ?: [t_OccurrenceInfoType class];
            self.FirstOccurrence = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"LastOccurrence")) {
            Class elementClass = classForElement(cur) ?: [t_OccurrenceInfoType class];
            self.LastOccurrence = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ModifiedOccurrences")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfOccurrenceInfoType class];
            self.ModifiedOccurrences = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DeletedOccurrences")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfDeletedOccurrencesType class];
            self.DeletedOccurrences = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingTimeZone")) {
            Class elementClass = classForElement(cur) ?: [t_TimeZoneType class];
            self.MeetingTimeZone = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"StartTimeZone")) {
            Class elementClass = classForElement(cur) ?: [t_TimeZoneDefinitionType class];
            self.StartTimeZone = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EndTimeZone")) {
            Class elementClass = classForElement(cur) ?: [t_TimeZoneDefinitionType class];
            self.EndTimeZone = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConferenceType")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.ConferenceType = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AllowNewTimeProposal")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.AllowNewTimeProposal = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsOnlineMeeting")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsOnlineMeeting = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingWorkspaceUrl")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.MeetingWorkspaceUrl = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"NetShowUrl")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.NetShowUrl = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_TaskType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TaskType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_ActualWork)
        [xsd_int serializeToChildOf:node withName:"t:ActualWork" value:_ActualWork];

    if (_AssignedTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:AssignedTime" value:_AssignedTime];

    if (_BillingInformation)
        [xsd_string serializeToChildOf:node withName:"t:BillingInformation" value:_BillingInformation];

    if (_ChangeCount)
        [xsd_int serializeToChildOf:node withName:"t:ChangeCount" value:_ChangeCount];

    if (_Companies)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:Companies" value:_Companies];

    if (_CompleteDate)
        [xsd_dateTime serializeToChildOf:node withName:"t:CompleteDate" value:_CompleteDate];

    if (_Contacts)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"t:Contacts" value:_Contacts];

    if (_DelegationState)
        [t_TaskDelegateStateType serializeToChildOf:node withName:"t:DelegationState" value:_DelegationState];

    if (_Delegator)
        [xsd_string serializeToChildOf:node withName:"t:Delegator" value:_Delegator];

    if (_DueDate)
        [xsd_dateTime serializeToChildOf:node withName:"t:DueDate" value:_DueDate];

    if (_IsAssignmentEditable)
        [xsd_int serializeToChildOf:node withName:"t:IsAssignmentEditable" value:_IsAssignmentEditable];

    if (_IsComplete)
        [xsd_boolean serializeToChildOf:node withName:"t:IsComplete" value:_IsComplete];

    if (_IsRecurring)
        [xsd_boolean serializeToChildOf:node withName:"t:IsRecurring" value:_IsRecurring];

    if (_IsTeamTask)
        [xsd_boolean serializeToChildOf:node withName:"t:IsTeamTask" value:_IsTeamTask];

    if (_Mileage)
        [xsd_string serializeToChildOf:node withName:"t:Mileage" value:_Mileage];

    if (_Owner)
        [xsd_string serializeToChildOf:node withName:"t:Owner" value:_Owner];

    if (_PercentComplete)
        [xsd_double serializeToChildOf:node withName:"t:PercentComplete" value:_PercentComplete];

    if (_Recurrence)
        [t_TaskRecurrenceType serializeToChildOf:node withName:"t:Recurrence" value:_Recurrence];

    if (_StartDate)
        [xsd_dateTime serializeToChildOf:node withName:"t:StartDate" value:_StartDate];

    if (_Status)
        [t_TaskStatusType serializeToChildOf:node withName:"t:Status" value:_Status];

    if (_StatusDescription)
        [xsd_string serializeToChildOf:node withName:"t:StatusDescription" value:_StatusDescription];

    if (_TotalWork)
        [xsd_int serializeToChildOf:node withName:"t:TotalWork" value:_TotalWork];

}


- (t_TaskRecurrenceType *)Recurrence {
    if (!_Recurrence) _Recurrence = [t_TaskRecurrenceType new];
    return _Recurrence;
}
+ (t_TaskType *)deserializeNode:(xmlNodePtr)cur {
    t_TaskType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ActualWork")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.ActualWork = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AssignedTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.AssignedTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"BillingInformation")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.BillingInformation = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ChangeCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.ChangeCount = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Companies")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.Companies = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CompleteDate")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.CompleteDate = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Contacts")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.Contacts = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DelegationState")) {
            self.DelegationState = [t_TaskDelegateStateType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Delegator")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Delegator = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DueDate")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.DueDate = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsAssignmentEditable")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.IsAssignmentEditable = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsComplete")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsComplete = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsRecurring")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsRecurring = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsTeamTask")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsTeamTask = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Mileage")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Mileage = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Owner")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Owner = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PercentComplete")) {
            Class elementClass = classForElement(cur) ?: [xsd_double class];
            self.PercentComplete = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Recurrence")) {
            Class elementClass = classForElement(cur) ?: [t_TaskRecurrenceType class];
            self.Recurrence = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"StartDate")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.StartDate = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Status")) {
            self.Status = [t_TaskStatusType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"StatusDescription")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.StatusDescription = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"TotalWork")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.TotalWork = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *t_StandardGroupByType_enumValues[] = {
    @"",
    @"ConversationTopic",
};

@implementation t_StandardGroupByType
+ (t_StandardGroupByTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(t_StandardGroupByType_enumValues) / sizeof(t_StandardGroupByType_enumValues[0]); ++i) {
        if ([string isEqualToString:t_StandardGroupByType_enumValues[i]])
            return (t_StandardGroupByTypeEnum)i;
    }

    return t_StandardGroupByType_none;
}

+ (NSString *)stringFromValue:(t_StandardGroupByTypeEnum)value {
    return t_StandardGroupByType_enumValues[(int)value];
}

+ (t_StandardGroupByTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : t_StandardGroupByType_none;
}

+ (t_StandardGroupByTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_StandardGroupByTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_StandardGroupByTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation t_DistinguishedGroupByType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DistinguishedGroupByType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_StandardGroupBy)
        [t_StandardGroupByType serializeToChildOf:node withName:"t:StandardGroupBy" value:_StandardGroupBy];

}

+ (t_DistinguishedGroupByType *)deserializeNode:(xmlNodePtr)cur {
    t_DistinguishedGroupByType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"StandardGroupBy")) {
            self.StandardGroupBy = [t_StandardGroupByType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation t_ArrayOfRoomsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"Room")) {
            Class elementClass = classForElement(child) ?: [t_RoomType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_RoomType * item in value)
        [t_RoomType serializeToChildOf:child withName:"t:Room" value:item];
}
@end
@implementation t_AppendToFolderFieldType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AppendToFolderFieldType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Folder)
        [t_FolderType serializeToChildOf:node withName:"t:Folder" value:_Folder];

    if (_CalendarFolder)
        [t_CalendarFolderType serializeToChildOf:node withName:"t:CalendarFolder" value:_CalendarFolder];

    if (_ContactsFolder)
        [t_ContactsFolderType serializeToChildOf:node withName:"t:ContactsFolder" value:_ContactsFolder];

    if (_SearchFolder)
        [t_SearchFolderType serializeToChildOf:node withName:"t:SearchFolder" value:_SearchFolder];

    if (_TasksFolder)
        [t_TasksFolderType serializeToChildOf:node withName:"t:TasksFolder" value:_TasksFolder];

}


- (t_FolderType *)Folder {
    if (!_Folder) _Folder = [t_FolderType new];
    return _Folder;
}

- (t_CalendarFolderType *)CalendarFolder {
    if (!_CalendarFolder) _CalendarFolder = [t_CalendarFolderType new];
    return _CalendarFolder;
}

- (t_ContactsFolderType *)ContactsFolder {
    if (!_ContactsFolder) _ContactsFolder = [t_ContactsFolderType new];
    return _ContactsFolder;
}

- (t_SearchFolderType *)SearchFolder {
    if (!_SearchFolder) _SearchFolder = [t_SearchFolderType new];
    return _SearchFolder;
}

- (t_TasksFolderType *)TasksFolder {
    if (!_TasksFolder) _TasksFolder = [t_TasksFolderType new];
    return _TasksFolder;
}
+ (t_AppendToFolderFieldType *)deserializeNode:(xmlNodePtr)cur {
    t_AppendToFolderFieldType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Folder")) {
            Class elementClass = classForElement(cur) ?: [t_FolderType class];
            self.Folder = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CalendarFolder")) {
            Class elementClass = classForElement(cur) ?: [t_CalendarFolderType class];
            self.CalendarFolder = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContactsFolder")) {
            Class elementClass = classForElement(cur) ?: [t_ContactsFolderType class];
            self.ContactsFolder = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SearchFolder")) {
            Class elementClass = classForElement(cur) ?: [t_SearchFolderType class];
            self.SearchFolder = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"TasksFolder")) {
            Class elementClass = classForElement(cur) ?: [t_TasksFolderType class];
            self.TasksFolder = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_StreamingSubscriptionRequestType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_StreamingSubscriptionRequestType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_boolean serializeToProperty:"SubscribeToAllFolders" onNode:node value:_SubscribeToAllFolders];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FolderIds)
        [t_NonEmptyArrayOfBaseFolderIdsType serializeToChildOf:node withName:"t:FolderIds" value:_FolderIds];

    if (_EventTypes)
        [t_NonEmptyArrayOfNotificationEventTypesType serializeToChildOf:node withName:"t:EventTypes" value:_EventTypes];

}


+ (t_StreamingSubscriptionRequestType *)deserializeNode:(xmlNodePtr)cur {
    t_StreamingSubscriptionRequestType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.SubscribeToAllFolders = [xsd_boolean deserializeAttribute:"SubscribeToAllFolders" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseFolderIdsType class];
            self.FolderIds = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EventTypes")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfNotificationEventTypesType class];
            self.EventTypes = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_CreateRuleOperationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CreateRuleOperationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Rule)
        [t_RuleType serializeToChildOf:node withName:"t:Rule" value:_Rule];

}


- (t_RuleType *)Rule {
    if (!_Rule) _Rule = [t_RuleType new];
    return _Rule;
}
+ (t_CreateRuleOperationType *)deserializeNode:(xmlNodePtr)cur {
    t_CreateRuleOperationType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Rule")) {
            Class elementClass = classForElement(cur) ?: [t_RuleType class];
            self.Rule = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ProtectionRuleValueType
+ (NSString *)deserializeNode:(xmlNodePtr)node {
    NSString *str = [NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES];
    return str;
}

+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    if (!attrString) return nil;
    return attrString;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value {
    if (value)
        xmlNewChild(node, NULL, (const xmlChar *)childName, [[value description] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[value description] xmlString]);
}
@end
@implementation t_SetRuleOperationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SetRuleOperationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Rule)
        [t_RuleType serializeToChildOf:node withName:"t:Rule" value:_Rule];

}


- (t_RuleType *)Rule {
    if (!_Rule) _Rule = [t_RuleType new];
    return _Rule;
}
+ (t_SetRuleOperationType *)deserializeNode:(xmlNodePtr)cur {
    t_SetRuleOperationType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Rule")) {
            Class elementClass = classForElement(cur) ?: [t_RuleType class];
            self.Rule = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ContainsExpressionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ContainsExpressionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_ContainmentModeType serializeToProperty:"ContainmentMode" onNode:node value:_ContainmentMode];
    [t_ContainmentComparisonType serializeToProperty:"ContainmentComparison" onNode:node value:_ContainmentComparison];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Path)
        [t_BasePathToElementType serializeToChildOf:node withName:"t:Path" value:_Path];

    if (_FieldURI)
        [t_PathToUnindexedFieldType serializeToChildOf:node withName:"t:FieldURI" value:_FieldURI];

    if (_IndexedFieldURI)
        [t_PathToIndexedFieldType serializeToChildOf:node withName:"t:IndexedFieldURI" value:_IndexedFieldURI];

    if (_ExtendedFieldURI)
        [t_PathToExtendedFieldType serializeToChildOf:node withName:"t:ExtendedFieldURI" value:_ExtendedFieldURI];

    if (_Constant)
        [t_ConstantValueType serializeToChildOf:node withName:"t:Constant" value:_Constant];

}


- (t_BasePathToElementType *)Path {
    if (!_Path) _Path = [t_BasePathToElementType new];
    return _Path;
}

- (t_PathToUnindexedFieldType *)FieldURI {
    if (!_FieldURI) _FieldURI = [t_PathToUnindexedFieldType new];
    return _FieldURI;
}

- (t_PathToIndexedFieldType *)IndexedFieldURI {
    if (!_IndexedFieldURI) _IndexedFieldURI = [t_PathToIndexedFieldType new];
    return _IndexedFieldURI;
}

- (t_PathToExtendedFieldType *)ExtendedFieldURI {
    if (!_ExtendedFieldURI) _ExtendedFieldURI = [t_PathToExtendedFieldType new];
    return _ExtendedFieldURI;
}

- (t_ConstantValueType *)Constant {
    if (!_Constant) _Constant = [t_ConstantValueType new];
    return _Constant;
}

+ (t_ContainsExpressionType *)deserializeNode:(xmlNodePtr)cur {
    t_ContainsExpressionType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.ContainmentMode = [t_ContainmentModeType deserializeAttribute:"ContainmentMode" ofNode:cur];
    self.ContainmentComparison = [t_ContainmentComparisonType deserializeAttribute:"ContainmentComparison" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Path")) {
            Class elementClass = classForElement(cur) ?: [t_BasePathToElementType class];
            self.Path = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToUnindexedFieldType class];
            self.FieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IndexedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToIndexedFieldType class];
            self.IndexedFieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExtendedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToExtendedFieldType class];
            self.ExtendedFieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Constant")) {
            Class elementClass = classForElement(cur) ?: [t_ConstantValueType class];
            self.Constant = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ItemIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ItemIdType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_string serializeToProperty:"Id" onNode:node value:_Id_];
    [xsd_string serializeToProperty:"ChangeKey" onNode:node value:_ChangeKey];
}

+ (t_ItemIdType *)deserializeNode:(xmlNodePtr)cur {
    t_ItemIdType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Id_ = [xsd_string deserializeAttribute:"Id" ofNode:cur];
    self.ChangeKey = [xsd_string deserializeAttribute:"ChangeKey" ofNode:cur];
}
@end
@implementation t_ElementServerVersionInfo
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ElementServerVersionInfo *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_int serializeToProperty:"MajorVersion" onNode:node value:_MajorVersion];
    [xsd_int serializeToProperty:"MinorVersion" onNode:node value:_MinorVersion];
    [xsd_int serializeToProperty:"MajorBuildNumber" onNode:node value:_MajorBuildNumber];
    [xsd_int serializeToProperty:"MinorBuildNumber" onNode:node value:_MinorBuildNumber];
    [xsd_string serializeToProperty:"Version" onNode:node value:_Version];
}

+ (t_ElementServerVersionInfo *)deserializeNode:(xmlNodePtr)cur {
    t_ElementServerVersionInfo *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.MajorVersion = [xsd_int deserializeAttribute:"MajorVersion" ofNode:cur];
    self.MinorVersion = [xsd_int deserializeAttribute:"MinorVersion" ofNode:cur];
    self.MajorBuildNumber = [xsd_int deserializeAttribute:"MajorBuildNumber" ofNode:cur];
    self.MinorBuildNumber = [xsd_int deserializeAttribute:"MinorBuildNumber" ofNode:cur];
    self.Version = [xsd_string deserializeAttribute:"Version" ofNode:cur];
}
@end
@implementation t_MailTips
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MailTips *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_RecipientAddress)
        [t_EmailAddressType serializeToChildOf:node withName:"t:RecipientAddress" value:_RecipientAddress];

    if (_PendingMailTips)
        [t_MailTipTypes serializeToChildOf:node withName:"t:PendingMailTips" value:_PendingMailTips];

    if (_OutOfOffice)
        [t_OutOfOfficeMailTip serializeToChildOf:node withName:"t:OutOfOffice" value:_OutOfOffice];

    if (_MailboxFull)
        [xsd_boolean serializeToChildOf:node withName:"t:MailboxFull" value:_MailboxFull];

    if (_CustomMailTip)
        [xsd_string serializeToChildOf:node withName:"t:CustomMailTip" value:_CustomMailTip];

    if (_TotalMemberCount)
        [xsd_int serializeToChildOf:node withName:"t:TotalMemberCount" value:_TotalMemberCount];

    if (_ExternalMemberCount)
        [xsd_int serializeToChildOf:node withName:"t:ExternalMemberCount" value:_ExternalMemberCount];

    if (_MaxMessageSize)
        [xsd_int serializeToChildOf:node withName:"t:MaxMessageSize" value:_MaxMessageSize];

    if (_DeliveryRestricted)
        [xsd_boolean serializeToChildOf:node withName:"t:DeliveryRestricted" value:_DeliveryRestricted];

    if (_IsModerated)
        [xsd_boolean serializeToChildOf:node withName:"t:IsModerated" value:_IsModerated];

    if (_InvalidRecipient)
        [xsd_boolean serializeToChildOf:node withName:"t:InvalidRecipient" value:_InvalidRecipient];

}


- (t_EmailAddressType *)RecipientAddress {
    if (!_RecipientAddress) _RecipientAddress = [t_EmailAddressType new];
    return _RecipientAddress;
}

- (t_OutOfOfficeMailTip *)OutOfOffice {
    if (!_OutOfOffice) _OutOfOffice = [t_OutOfOfficeMailTip new];
    return _OutOfOffice;
}
+ (t_MailTips *)deserializeNode:(xmlNodePtr)cur {
    t_MailTips *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"RecipientAddress")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.RecipientAddress = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PendingMailTips")) {
            Class elementClass = classForElement(cur) ?: [t_MailTipTypes class];
            self.PendingMailTips = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"OutOfOffice")) {
            Class elementClass = classForElement(cur) ?: [t_OutOfOfficeMailTip class];
            self.OutOfOffice = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MailboxFull")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.MailboxFull = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CustomMailTip")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.CustomMailTip = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"TotalMemberCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.TotalMemberCount = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExternalMemberCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.ExternalMemberCount = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MaxMessageSize")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.MaxMessageSize = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DeliveryRestricted")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.DeliveryRestricted = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsModerated")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsModerated = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"InvalidRecipient")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.InvalidRecipient = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ArrayOfSearchItemKindsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"SearchItemKind")) {
            Class elementClass = classForElement(child) ?: [t_SearchItemKindType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (NSNumber *item in value)
        [t_SearchItemKindType serializeToChildOf:child withName:"t:SearchItemKind" value:(t_SearchItemKindTypeEnum)[item intValue]];
}
@end
@implementation t_ForwardItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ForwardItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (t_ForwardItemType *)deserializeNode:(xmlNodePtr)cur {
    t_ForwardItemType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_PermissionSetType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PermissionSetType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Permissions)
        [t_ArrayOfPermissionsType serializeToChildOf:node withName:"t:Permissions" value:_Permissions];

    if (_UnknownEntries)
        [t_ArrayOfUnknownEntriesType serializeToChildOf:node withName:"t:UnknownEntries" value:_UnknownEntries];

}

+ (t_PermissionSetType *)deserializeNode:(xmlNodePtr)cur {
    t_PermissionSetType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Permissions")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfPermissionsType class];
            self.Permissions = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"UnknownEntries")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfUnknownEntriesType class];
            self.UnknownEntries = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_MeetingRequestMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MeetingRequestMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_MeetingRequestType)
        [t_MeetingRequestTypeType serializeToChildOf:node withName:"t:MeetingRequestType" value:_MeetingRequestType];

    if (_IntendedFreeBusyStatus)
        [t_LegacyFreeBusyType serializeToChildOf:node withName:"t:IntendedFreeBusyStatus" value:_IntendedFreeBusyStatus];

    if (_Start)
        [xsd_dateTime serializeToChildOf:node withName:"t:Start" value:_Start];

    if (_End)
        [xsd_dateTime serializeToChildOf:node withName:"t:End" value:_End];

    if (_OriginalStart)
        [xsd_dateTime serializeToChildOf:node withName:"t:OriginalStart" value:_OriginalStart];

    if (_IsAllDayEvent)
        [xsd_boolean serializeToChildOf:node withName:"t:IsAllDayEvent" value:_IsAllDayEvent];

    if (_LegacyFreeBusyStatus)
        [t_LegacyFreeBusyType serializeToChildOf:node withName:"t:LegacyFreeBusyStatus" value:_LegacyFreeBusyStatus];

    if (_Location)
        [xsd_string serializeToChildOf:node withName:"t:Location" value:_Location];

    if (_When)
        [xsd_string serializeToChildOf:node withName:"t:When" value:_When];

    if (_IsMeeting)
        [xsd_boolean serializeToChildOf:node withName:"t:IsMeeting" value:_IsMeeting];

    if (_IsCancelled)
        [xsd_boolean serializeToChildOf:node withName:"t:IsCancelled" value:_IsCancelled];

    if (_IsRecurring)
        [xsd_boolean serializeToChildOf:node withName:"t:IsRecurring" value:_IsRecurring];

    if (_MeetingRequestWasSent)
        [xsd_boolean serializeToChildOf:node withName:"t:MeetingRequestWasSent" value:_MeetingRequestWasSent];

    if (_CalendarItemType)
        [t_CalendarItemTypeType serializeToChildOf:node withName:"t:CalendarItemType" value:_CalendarItemType];

    if (_MyResponseType)
        [t_ResponseTypeType serializeToChildOf:node withName:"t:MyResponseType" value:_MyResponseType];

    if (_Organizer)
        [t_SingleRecipientType serializeToChildOf:node withName:"t:Organizer" value:_Organizer];

    if (_RequiredAttendees)
        [t_NonEmptyArrayOfAttendeesType serializeToChildOf:node withName:"t:RequiredAttendees" value:_RequiredAttendees];

    if (_OptionalAttendees)
        [t_NonEmptyArrayOfAttendeesType serializeToChildOf:node withName:"t:OptionalAttendees" value:_OptionalAttendees];

    if (_Resources)
        [t_NonEmptyArrayOfAttendeesType serializeToChildOf:node withName:"t:Resources" value:_Resources];

    if (_ConflictingMeetingCount)
        [xsd_int serializeToChildOf:node withName:"t:ConflictingMeetingCount" value:_ConflictingMeetingCount];

    if (_AdjacentMeetingCount)
        [xsd_int serializeToChildOf:node withName:"t:AdjacentMeetingCount" value:_AdjacentMeetingCount];

    if (_ConflictingMeetings)
        [t_NonEmptyArrayOfAllItemsType serializeToChildOf:node withName:"t:ConflictingMeetings" value:_ConflictingMeetings];

    if (_AdjacentMeetings)
        [t_NonEmptyArrayOfAllItemsType serializeToChildOf:node withName:"t:AdjacentMeetings" value:_AdjacentMeetings];

    if (_Duration)
        [xsd_string serializeToChildOf:node withName:"t:Duration" value:_Duration];

    if (_TimeZone)
        [xsd_string serializeToChildOf:node withName:"t:TimeZone" value:_TimeZone];

    if (_AppointmentReplyTime)
        [xsd_dateTime serializeToChildOf:node withName:"t:AppointmentReplyTime" value:_AppointmentReplyTime];

    if (_AppointmentSequenceNumber)
        [xsd_int serializeToChildOf:node withName:"t:AppointmentSequenceNumber" value:_AppointmentSequenceNumber];

    if (_AppointmentState)
        [xsd_int serializeToChildOf:node withName:"t:AppointmentState" value:_AppointmentState];

    if (_Recurrence)
        [t_RecurrenceType serializeToChildOf:node withName:"t:Recurrence" value:_Recurrence];

    if (_FirstOccurrence)
        [t_OccurrenceInfoType serializeToChildOf:node withName:"t:FirstOccurrence" value:_FirstOccurrence];

    if (_LastOccurrence)
        [t_OccurrenceInfoType serializeToChildOf:node withName:"t:LastOccurrence" value:_LastOccurrence];

    if (_ModifiedOccurrences)
        [t_NonEmptyArrayOfOccurrenceInfoType serializeToChildOf:node withName:"t:ModifiedOccurrences" value:_ModifiedOccurrences];

    if (_DeletedOccurrences)
        [t_NonEmptyArrayOfDeletedOccurrencesType serializeToChildOf:node withName:"t:DeletedOccurrences" value:_DeletedOccurrences];

    if (_MeetingTimeZone)
        [t_TimeZoneType serializeToChildOf:node withName:"t:MeetingTimeZone" value:_MeetingTimeZone];

    if (_StartTimeZone)
        [t_TimeZoneDefinitionType serializeToChildOf:node withName:"t:StartTimeZone" value:_StartTimeZone];

    if (_EndTimeZone)
        [t_TimeZoneDefinitionType serializeToChildOf:node withName:"t:EndTimeZone" value:_EndTimeZone];

    if (_ConferenceType)
        [xsd_int serializeToChildOf:node withName:"t:ConferenceType" value:_ConferenceType];

    if (_AllowNewTimeProposal)
        [xsd_boolean serializeToChildOf:node withName:"t:AllowNewTimeProposal" value:_AllowNewTimeProposal];

    if (_IsOnlineMeeting)
        [xsd_boolean serializeToChildOf:node withName:"t:IsOnlineMeeting" value:_IsOnlineMeeting];

    if (_MeetingWorkspaceUrl)
        [xsd_string serializeToChildOf:node withName:"t:MeetingWorkspaceUrl" value:_MeetingWorkspaceUrl];

    if (_NetShowUrl)
        [xsd_string serializeToChildOf:node withName:"t:NetShowUrl" value:_NetShowUrl];

}


- (t_RecurrenceType *)Recurrence {
    if (!_Recurrence) _Recurrence = [t_RecurrenceType new];
    return _Recurrence;
}

- (t_OccurrenceInfoType *)FirstOccurrence {
    if (!_FirstOccurrence) _FirstOccurrence = [t_OccurrenceInfoType new];
    return _FirstOccurrence;
}

- (t_OccurrenceInfoType *)LastOccurrence {
    if (!_LastOccurrence) _LastOccurrence = [t_OccurrenceInfoType new];
    return _LastOccurrence;
}

- (t_TimeZoneType *)MeetingTimeZone {
    if (!_MeetingTimeZone) _MeetingTimeZone = [t_TimeZoneType new];
    return _MeetingTimeZone;
}

- (t_TimeZoneDefinitionType *)StartTimeZone {
    if (!_StartTimeZone) _StartTimeZone = [t_TimeZoneDefinitionType new];
    return _StartTimeZone;
}

- (t_TimeZoneDefinitionType *)EndTimeZone {
    if (!_EndTimeZone) _EndTimeZone = [t_TimeZoneDefinitionType new];
    return _EndTimeZone;
}
+ (t_MeetingRequestMessageType *)deserializeNode:(xmlNodePtr)cur {
    t_MeetingRequestMessageType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingRequestType")) {
            self.MeetingRequestType = [t_MeetingRequestTypeType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IntendedFreeBusyStatus")) {
            self.IntendedFreeBusyStatus = [t_LegacyFreeBusyType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Start")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.Start = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"End")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.End = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"OriginalStart")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.OriginalStart = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsAllDayEvent")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsAllDayEvent = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"LegacyFreeBusyStatus")) {
            self.LegacyFreeBusyStatus = [t_LegacyFreeBusyType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Location")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Location = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"When")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.When = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsMeeting")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsMeeting = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsCancelled")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsCancelled = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsRecurring")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsRecurring = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingRequestWasSent")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.MeetingRequestWasSent = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CalendarItemType")) {
            self.CalendarItemType = [t_CalendarItemTypeType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MyResponseType")) {
            self.MyResponseType = [t_ResponseTypeType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Organizer")) {
            Class elementClass = classForElement(cur) ?: [t_SingleRecipientType class];
            self.Organizer = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RequiredAttendees")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfAttendeesType class];
            self.RequiredAttendees = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"OptionalAttendees")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfAttendeesType class];
            self.OptionalAttendees = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Resources")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfAttendeesType class];
            self.Resources = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConflictingMeetingCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.ConflictingMeetingCount = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AdjacentMeetingCount")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.AdjacentMeetingCount = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConflictingMeetings")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfAllItemsType class];
            self.ConflictingMeetings = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AdjacentMeetings")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfAllItemsType class];
            self.AdjacentMeetings = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Duration")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Duration = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"TimeZone")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.TimeZone = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AppointmentReplyTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.AppointmentReplyTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AppointmentSequenceNumber")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.AppointmentSequenceNumber = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AppointmentState")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.AppointmentState = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Recurrence")) {
            Class elementClass = classForElement(cur) ?: [t_RecurrenceType class];
            self.Recurrence = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FirstOccurrence")) {
            Class elementClass = classForElement(cur) ?: [t_OccurrenceInfoType class];
            self.FirstOccurrence = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"LastOccurrence")) {
            Class elementClass = classForElement(cur) ?: [t_OccurrenceInfoType class];
            self.LastOccurrence = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ModifiedOccurrences")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfOccurrenceInfoType class];
            self.ModifiedOccurrences = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DeletedOccurrences")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfDeletedOccurrencesType class];
            self.DeletedOccurrences = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingTimeZone")) {
            Class elementClass = classForElement(cur) ?: [t_TimeZoneType class];
            self.MeetingTimeZone = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"StartTimeZone")) {
            Class elementClass = classForElement(cur) ?: [t_TimeZoneDefinitionType class];
            self.StartTimeZone = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EndTimeZone")) {
            Class elementClass = classForElement(cur) ?: [t_TimeZoneDefinitionType class];
            self.EndTimeZone = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConferenceType")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.ConferenceType = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AllowNewTimeProposal")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.AllowNewTimeProposal = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IsOnlineMeeting")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IsOnlineMeeting = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingWorkspaceUrl")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.MeetingWorkspaceUrl = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"NetShowUrl")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.NetShowUrl = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_NumberedRecurrenceRangeType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_NumberedRecurrenceRangeType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_NumberOfOccurrences)
        [xsd_int serializeToChildOf:node withName:"t:NumberOfOccurrences" value:_NumberOfOccurrences];

}

+ (t_NumberedRecurrenceRangeType *)deserializeNode:(xmlNodePtr)cur {
    t_NumberedRecurrenceRangeType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"NumberOfOccurrences")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.NumberOfOccurrences = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ExistsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ExistsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Path)
        [t_BasePathToElementType serializeToChildOf:node withName:"t:Path" value:_Path];

    if (_FieldURI)
        [t_PathToUnindexedFieldType serializeToChildOf:node withName:"t:FieldURI" value:_FieldURI];

    if (_IndexedFieldURI)
        [t_PathToIndexedFieldType serializeToChildOf:node withName:"t:IndexedFieldURI" value:_IndexedFieldURI];

    if (_ExtendedFieldURI)
        [t_PathToExtendedFieldType serializeToChildOf:node withName:"t:ExtendedFieldURI" value:_ExtendedFieldURI];

}


- (t_BasePathToElementType *)Path {
    if (!_Path) _Path = [t_BasePathToElementType new];
    return _Path;
}

- (t_PathToUnindexedFieldType *)FieldURI {
    if (!_FieldURI) _FieldURI = [t_PathToUnindexedFieldType new];
    return _FieldURI;
}

- (t_PathToIndexedFieldType *)IndexedFieldURI {
    if (!_IndexedFieldURI) _IndexedFieldURI = [t_PathToIndexedFieldType new];
    return _IndexedFieldURI;
}

- (t_PathToExtendedFieldType *)ExtendedFieldURI {
    if (!_ExtendedFieldURI) _ExtendedFieldURI = [t_PathToExtendedFieldType new];
    return _ExtendedFieldURI;
}
+ (t_ExistsType *)deserializeNode:(xmlNodePtr)cur {
    t_ExistsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Path")) {
            Class elementClass = classForElement(cur) ?: [t_BasePathToElementType class];
            self.Path = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToUnindexedFieldType class];
            self.FieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IndexedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToIndexedFieldType class];
            self.IndexedFieldURI = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExtendedFieldURI")) {
            Class elementClass = classForElement(cur) ?: [t_PathToExtendedFieldType class];
            self.ExtendedFieldURI = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_MeetingCancellationMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MeetingCancellationMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (t_MeetingCancellationMessageType *)deserializeNode:(xmlNodePtr)cur {
    t_MeetingCancellationMessageType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation t_SetItemFieldType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SetItemFieldType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Item)
        [t_ItemType serializeToChildOf:node withName:"t:Item" value:_Item];

    if (_Message)
        [t_MessageType serializeToChildOf:node withName:"t:Message" value:_Message];

    if (_CalendarItem)
        [t_CalendarItemType serializeToChildOf:node withName:"t:CalendarItem" value:_CalendarItem];

    if (_Contact)
        [t_ContactItemType serializeToChildOf:node withName:"t:Contact" value:_Contact];

    if (_DistributionList)
        [t_DistributionListType serializeToChildOf:node withName:"t:DistributionList" value:_DistributionList];

    if (_MeetingMessage)
        [t_MeetingMessageType serializeToChildOf:node withName:"t:MeetingMessage" value:_MeetingMessage];

    if (_MeetingRequest)
        [t_MeetingRequestMessageType serializeToChildOf:node withName:"t:MeetingRequest" value:_MeetingRequest];

    if (_MeetingResponse)
        [t_MeetingResponseMessageType serializeToChildOf:node withName:"t:MeetingResponse" value:_MeetingResponse];

    if (_MeetingCancellation)
        [t_MeetingCancellationMessageType serializeToChildOf:node withName:"t:MeetingCancellation" value:_MeetingCancellation];

    if (_Task)
        [t_TaskType serializeToChildOf:node withName:"t:Task" value:_Task];

    if (_PostItem)
        [t_PostItemType serializeToChildOf:node withName:"t:PostItem" value:_PostItem];

}


- (t_ItemType *)Item {
    if (!_Item) _Item = [t_ItemType new];
    return _Item;
}

- (t_MessageType *)Message {
    if (!_Message) _Message = [t_MessageType new];
    return _Message;
}

- (t_CalendarItemType *)CalendarItem {
    if (!_CalendarItem) _CalendarItem = [t_CalendarItemType new];
    return _CalendarItem;
}

- (t_ContactItemType *)Contact {
    if (!_Contact) _Contact = [t_ContactItemType new];
    return _Contact;
}

- (t_DistributionListType *)DistributionList {
    if (!_DistributionList) _DistributionList = [t_DistributionListType new];
    return _DistributionList;
}

- (t_MeetingMessageType *)MeetingMessage {
    if (!_MeetingMessage) _MeetingMessage = [t_MeetingMessageType new];
    return _MeetingMessage;
}

- (t_MeetingRequestMessageType *)MeetingRequest {
    if (!_MeetingRequest) _MeetingRequest = [t_MeetingRequestMessageType new];
    return _MeetingRequest;
}

- (t_MeetingResponseMessageType *)MeetingResponse {
    if (!_MeetingResponse) _MeetingResponse = [t_MeetingResponseMessageType new];
    return _MeetingResponse;
}

- (t_MeetingCancellationMessageType *)MeetingCancellation {
    if (!_MeetingCancellation) _MeetingCancellation = [t_MeetingCancellationMessageType new];
    return _MeetingCancellation;
}

- (t_TaskType *)Task {
    if (!_Task) _Task = [t_TaskType new];
    return _Task;
}

- (t_PostItemType *)PostItem {
    if (!_PostItem) _PostItem = [t_PostItemType new];
    return _PostItem;
}
+ (t_SetItemFieldType *)deserializeNode:(xmlNodePtr)cur {
    t_SetItemFieldType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Item")) {
            Class elementClass = classForElement(cur) ?: [t_ItemType class];
            self.Item = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Message")) {
            Class elementClass = classForElement(cur) ?: [t_MessageType class];
            self.Message = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CalendarItem")) {
            Class elementClass = classForElement(cur) ?: [t_CalendarItemType class];
            self.CalendarItem = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Contact")) {
            Class elementClass = classForElement(cur) ?: [t_ContactItemType class];
            self.Contact = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DistributionList")) {
            Class elementClass = classForElement(cur) ?: [t_DistributionListType class];
            self.DistributionList = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingMessage")) {
            Class elementClass = classForElement(cur) ?: [t_MeetingMessageType class];
            self.MeetingMessage = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingRequest")) {
            Class elementClass = classForElement(cur) ?: [t_MeetingRequestMessageType class];
            self.MeetingRequest = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingResponse")) {
            Class elementClass = classForElement(cur) ?: [t_MeetingResponseMessageType class];
            self.MeetingResponse = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MeetingCancellation")) {
            Class elementClass = classForElement(cur) ?: [t_MeetingCancellationMessageType class];
            self.MeetingCancellation = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Task")) {
            Class elementClass = classForElement(cur) ?: [t_TaskType class];
            self.Task = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PostItem")) {
            Class elementClass = classForElement(cur) ?: [t_PostItemType class];
            self.PostItem = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation t_ArrayOfInvalidRecipientsType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"InvalidRecipient")) {
            Class elementClass = classForElement(child) ?: [t_InvalidRecipientType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (t_InvalidRecipientType * item in value)
        [t_InvalidRecipientType serializeToChildOf:child withName:"t:InvalidRecipient" value:item];
}
@end
