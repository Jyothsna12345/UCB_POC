#import "ExchangeWebService.h"
#import "Constant.h"
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
@implementation ExchangeWebService_ArrayOfResponseMessagesType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"CreateItemResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ItemInfoResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"DeleteItemResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"GetItemResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ItemInfoResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"UpdateItemResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_UpdateItemResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SendItemResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"DeleteFolderResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"EmptyFolderResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"CreateFolderResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_FolderInfoResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"GetFolderResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_FolderInfoResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"FindFolderResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_FindFolderResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"UpdateFolderResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_FolderInfoResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"MoveFolderResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_FolderInfoResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"CopyFolderResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_FolderInfoResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"CreateAttachmentResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_AttachmentInfoResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"DeleteAttachmentResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_DeleteAttachmentResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"GetAttachmentResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_AttachmentInfoResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"UploadItemsResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_UploadItemsResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ExportItemsResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ExportItemsResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"FindItemResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_FindItemResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"MoveItemResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ItemInfoResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"CopyItemResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ItemInfoResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ResolveNamesResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ResolveNamesResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ExpandDLResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ExpandDLResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"GetServerTimeZonesResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_GetServerTimeZonesResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"GetEventsResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_GetEventsResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"GetStreamingEventsResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_GetStreamingEventsResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SubscribeResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_SubscribeResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"UnsubscribeResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SendNotificationResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_SendNotificationResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SyncFolderHierarchyResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_SyncFolderHierarchyResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"SyncFolderItemsResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_SyncFolderItemsResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"CreateManagedFolderResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_FolderInfoResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ConvertIdResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ConvertIdResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"GetSharingMetadataResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_GetSharingMetadataResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"RefreshSharingFolderResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_RefreshSharingFolderResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"GetSharingFolderResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_GetSharingFolderResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"CreateUserConfigurationResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"DeleteUserConfigurationResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"GetUserConfigurationResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_GetUserConfigurationResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"UpdateUserConfigurationResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"GetRoomListsResponse")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_GetRoomListsResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"GetRoomsResponse")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_GetRoomsResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"ApplyConversationActionResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"FindMailboxStatisticsByKeywordsResponseMessage")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_FindMailboxStatisticsByKeywordsResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
        else if (xmlStrEqual(child->name, (const xmlChar *)"GetPasswordExpirationDateResponse")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_GetPasswordExpirationDateResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (id item in value) {
        if (false);
        else if ([item isMemberOfClass:[ExchangeWebService_ItemInfoResponseMessageType class]])
            [ExchangeWebService_ItemInfoResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:CreateItemResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ResponseMessageType class]])
            [ExchangeWebService_ResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:DeleteItemResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ItemInfoResponseMessageType class]])
            [ExchangeWebService_ItemInfoResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:GetItemResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_UpdateItemResponseMessageType class]])
            [ExchangeWebService_UpdateItemResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:UpdateItemResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ResponseMessageType class]])
            [ExchangeWebService_ResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:SendItemResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ResponseMessageType class]])
            [ExchangeWebService_ResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:DeleteFolderResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ResponseMessageType class]])
            [ExchangeWebService_ResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:EmptyFolderResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_FolderInfoResponseMessageType class]])
            [ExchangeWebService_FolderInfoResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:CreateFolderResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_FolderInfoResponseMessageType class]])
            [ExchangeWebService_FolderInfoResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:GetFolderResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_FindFolderResponseMessageType class]])
            [ExchangeWebService_FindFolderResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:FindFolderResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_FolderInfoResponseMessageType class]])
            [ExchangeWebService_FolderInfoResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:UpdateFolderResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_FolderInfoResponseMessageType class]])
            [ExchangeWebService_FolderInfoResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:MoveFolderResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_FolderInfoResponseMessageType class]])
            [ExchangeWebService_FolderInfoResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:CopyFolderResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_AttachmentInfoResponseMessageType class]])
            [ExchangeWebService_AttachmentInfoResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:CreateAttachmentResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_DeleteAttachmentResponseMessageType class]])
            [ExchangeWebService_DeleteAttachmentResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:DeleteAttachmentResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_AttachmentInfoResponseMessageType class]])
            [ExchangeWebService_AttachmentInfoResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:GetAttachmentResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_UploadItemsResponseMessageType class]])
            [ExchangeWebService_UploadItemsResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:UploadItemsResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ExportItemsResponseMessageType class]])
            [ExchangeWebService_ExportItemsResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:ExportItemsResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_FindItemResponseMessageType class]])
            [ExchangeWebService_FindItemResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:FindItemResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ItemInfoResponseMessageType class]])
            [ExchangeWebService_ItemInfoResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:MoveItemResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ItemInfoResponseMessageType class]])
            [ExchangeWebService_ItemInfoResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:CopyItemResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ResolveNamesResponseMessageType class]])
            [ExchangeWebService_ResolveNamesResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:ResolveNamesResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ExpandDLResponseMessageType class]])
            [ExchangeWebService_ExpandDLResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:ExpandDLResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_GetServerTimeZonesResponseMessageType class]])
            [ExchangeWebService_GetServerTimeZonesResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:GetServerTimeZonesResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_GetEventsResponseMessageType class]])
            [ExchangeWebService_GetEventsResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:GetEventsResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_GetStreamingEventsResponseMessageType class]])
            [ExchangeWebService_GetStreamingEventsResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:GetStreamingEventsResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_SubscribeResponseMessageType class]])
            [ExchangeWebService_SubscribeResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:SubscribeResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ResponseMessageType class]])
            [ExchangeWebService_ResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:UnsubscribeResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_SendNotificationResponseMessageType class]])
            [ExchangeWebService_SendNotificationResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:SendNotificationResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_SyncFolderHierarchyResponseMessageType class]])
            [ExchangeWebService_SyncFolderHierarchyResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:SyncFolderHierarchyResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_SyncFolderItemsResponseMessageType class]])
            [ExchangeWebService_SyncFolderItemsResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:SyncFolderItemsResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_FolderInfoResponseMessageType class]])
            [ExchangeWebService_FolderInfoResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:CreateManagedFolderResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ConvertIdResponseMessageType class]])
            [ExchangeWebService_ConvertIdResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:ConvertIdResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_GetSharingMetadataResponseMessageType class]])
            [ExchangeWebService_GetSharingMetadataResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:GetSharingMetadataResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_RefreshSharingFolderResponseMessageType class]])
            [ExchangeWebService_RefreshSharingFolderResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:RefreshSharingFolderResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_GetSharingFolderResponseMessageType class]])
            [ExchangeWebService_GetSharingFolderResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:GetSharingFolderResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ResponseMessageType class]])
            [ExchangeWebService_ResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:CreateUserConfigurationResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ResponseMessageType class]])
            [ExchangeWebService_ResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:DeleteUserConfigurationResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_GetUserConfigurationResponseMessageType class]])
            [ExchangeWebService_GetUserConfigurationResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:GetUserConfigurationResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ResponseMessageType class]])
            [ExchangeWebService_ResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:UpdateUserConfigurationResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_GetRoomListsResponseMessageType class]])
            [ExchangeWebService_GetRoomListsResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:GetRoomListsResponse" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_GetRoomsResponseMessageType class]])
            [ExchangeWebService_GetRoomsResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:GetRoomsResponse" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_ResponseMessageType class]])
            [ExchangeWebService_ResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:ApplyConversationActionResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_FindMailboxStatisticsByKeywordsResponseMessageType class]])
            [ExchangeWebService_FindMailboxStatisticsByKeywordsResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:FindMailboxStatisticsByKeywordsResponseMessage" value:item];
        else if ([item isMemberOfClass:[ExchangeWebService_GetPasswordExpirationDateResponseMessageType class]])
            [ExchangeWebService_GetPasswordExpirationDateResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:GetPasswordExpirationDateResponse" value:item];
    }
}
@end
@implementation ExchangeWebService_BaseResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_BaseResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ResponseMessages)
        [ExchangeWebService_ArrayOfResponseMessagesType serializeToChildOf:node withName:"ExchangeWebService:ResponseMessages" value:_ResponseMessages];

}

+ (ExchangeWebService_BaseResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_BaseResponseMessageType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ResponseMessages")) {
            Class elementClass = classForElement(cur) ?: [ExchangeWebService_ArrayOfResponseMessagesType class];
            self.ResponseMessages = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetStreamingEventsResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetStreamingEventsResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_GetStreamingEventsResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetStreamingEventsResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_SendItemResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SendItemResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_SendItemResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SendItemResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_BaseRequestType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_BaseRequestType *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (ExchangeWebService_BaseRequestType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_BaseRequestType *newObject = [self new];


    return newObject;
}
@end
@implementation ExchangeWebService_SubscribeType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SubscribeType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_PullSubscriptionRequest)
        [t_PullSubscriptionRequestType serializeToChildOf:node withName:"ExchangeWebService:PullSubscriptionRequest" value:_PullSubscriptionRequest];

    if (_PushSubscriptionRequest)
        [t_PushSubscriptionRequestType serializeToChildOf:node withName:"ExchangeWebService:PushSubscriptionRequest" value:_PushSubscriptionRequest];

    if (_StreamingSubscriptionRequest)
        [t_StreamingSubscriptionRequestType serializeToChildOf:node withName:"ExchangeWebService:StreamingSubscriptionRequest" value:_StreamingSubscriptionRequest];

}


- (t_PullSubscriptionRequestType *)PullSubscriptionRequest {
    if (!_PullSubscriptionRequest) _PullSubscriptionRequest = [t_PullSubscriptionRequestType new];
    return _PullSubscriptionRequest;
}

- (t_PushSubscriptionRequestType *)PushSubscriptionRequest {
    if (!_PushSubscriptionRequest) _PushSubscriptionRequest = [t_PushSubscriptionRequestType new];
    return _PushSubscriptionRequest;
}

- (t_StreamingSubscriptionRequestType *)StreamingSubscriptionRequest {
    if (!_StreamingSubscriptionRequest) _StreamingSubscriptionRequest = [t_StreamingSubscriptionRequestType new];
    return _StreamingSubscriptionRequest;
}
+ (ExchangeWebService_SubscribeType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SubscribeType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"PullSubscriptionRequest")) {
            Class elementClass = classForElement(cur) ?: [t_PullSubscriptionRequestType class];
            self.PullSubscriptionRequest = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PushSubscriptionRequest")) {
            Class elementClass = classForElement(cur) ?: [t_PushSubscriptionRequestType class];
            self.PushSubscriptionRequest = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"StreamingSubscriptionRequest")) {
            Class elementClass = classForElement(cur) ?: [t_StreamingSubscriptionRequestType class];
            self.StreamingSubscriptionRequest = [elementClass deserializeNode:cur];
        }
    }
}
@end
static NSString *ExchangeWebService_ResponseCodeType_enumValues[] = {
    @"",
    @"ErrorADOperation",
    @"ErrorADSessionFilter",
    @"ErrorADUnavailable",
    @"ErrorAccessDenied",
    @"ErrorAccessModeSpecified",
    @"ErrorAccountDisabled",
    @"ErrorAddDelegatesFailed",
    @"ErrorAddressSpaceNotFound",
    @"ErrorAffectedTaskOccurrencesRequired",
    @"ErrorApplyConversationActionFailed",
    @"ErrorAttachmentNestLevelLimitExceeded",
    @"ErrorAttachmentSizeLimitExceeded",
    @"ErrorAutoDiscoverFailed",
    @"ErrorAvailabilityConfigNotFound",
    @"ErrorBatchProcessingStopped",
    @"ErrorCalendarCannotMoveOrCopyOccurrence",
    @"ErrorCalendarCannotUpdateDeletedItem",
    @"ErrorCalendarCannotUseIdForOccurrenceId",
    @"ErrorCalendarCannotUseIdForRecurringMasterId",
    @"ErrorCalendarDurationIsTooLong",
    @"ErrorCalendarEndDateIsEarlierThanStartDate",
    @"ErrorCalendarFolderIsInvalidForCalendarView",
    @"ErrorCalendarInvalidAttributeValue",
    @"ErrorCalendarInvalidDayForTimeChangePattern",
    @"ErrorCalendarInvalidDayForWeeklyRecurrence",
    @"ErrorCalendarInvalidPropertyState",
    @"ErrorCalendarInvalidPropertyValue",
    @"ErrorCalendarInvalidRecurrence",
    @"ErrorCalendarInvalidTimeZone",
    @"ErrorCalendarIsCancelledForAccept",
    @"ErrorCalendarIsCancelledForDecline",
    @"ErrorCalendarIsCancelledForRemove",
    @"ErrorCalendarIsCancelledForTentative",
    @"ErrorCalendarIsDelegatedForAccept",
    @"ErrorCalendarIsDelegatedForDecline",
    @"ErrorCalendarIsDelegatedForRemove",
    @"ErrorCalendarIsDelegatedForTentative",
    @"ErrorCalendarIsNotOrganizer",
    @"ErrorCalendarIsOrganizerForAccept",
    @"ErrorCalendarIsOrganizerForDecline",
    @"ErrorCalendarIsOrganizerForRemove",
    @"ErrorCalendarIsOrganizerForTentative",
    @"ErrorCalendarMeetingRequestIsOutOfDate",
    @"ErrorCalendarOccurrenceIndexIsOutOfRecurrenceRange",
    @"ErrorCalendarOccurrenceIsDeletedFromRecurrence",
    @"ErrorCalendarOutOfRange",
    @"ErrorCalendarViewRangeTooBig",
    @"ErrorCallerIsInvalidADAccount",
    @"ErrorCannotCreateCalendarItemInNonCalendarFolder",
    @"ErrorCannotCreateContactInNonContactFolder",
    @"ErrorCannotCreatePostItemInNonMailFolder",
    @"ErrorCannotCreateTaskInNonTaskFolder",
    @"ErrorCannotDeleteObject",
    @"ErrorCannotDeleteTaskOccurrence",
    @"ErrorCannotEmptyFolder",
    @"ErrorCannotOpenFileAttachment",
    @"ErrorCannotSetCalendarPermissionOnNonCalendarFolder",
    @"ErrorCannotSetNonCalendarPermissionOnCalendarFolder",
    @"ErrorCannotSetPermissionUnknownEntries",
    @"ErrorCannotUseFolderIdForItemId",
    @"ErrorCannotUseItemIdForFolderId",
    @"ErrorChangeKeyRequired",
    @"ErrorChangeKeyRequiredForWriteOperations",
    @"ErrorClientDisconnected",
    @"ErrorConnectionFailed",
    @"ErrorContainsFilterWrongType",
    @"ErrorContentConversionFailed",
    @"ErrorCorruptData",
    @"ErrorCreateItemAccessDenied",
    @"ErrorCreateManagedFolderPartialCompletion",
    @"ErrorCreateSubfolderAccessDenied",
    @"ErrorCrossMailboxMoveCopy",
    @"ErrorCrossSiteRequest",
    @"ErrorDataSizeLimitExceeded",
    @"ErrorDataSourceOperation",
    @"ErrorDelegateAlreadyExists",
    @"ErrorDelegateCannotAddOwner",
    @"ErrorDelegateMissingConfiguration",
    @"ErrorDelegateNoUser",
    @"ErrorDelegateValidationFailed",
    @"ErrorDeleteDistinguishedFolder",
    @"ErrorDeleteItemsFailed",
    @"ErrorDistinguishedUserNotSupported",
    @"ErrorDistributionListMemberNotExist",
    @"ErrorDuplicateInputFolderNames",
    @"ErrorDuplicateSOAPHeader",
    @"ErrorDuplicateUserIdsSpecified",
    @"ErrorEmailAddressMismatch",
    @"ErrorEventNotFound",
    @"ErrorExceededConnectionCount",
    @"ErrorExceededFindCountLimit",
    @"ErrorExceededSubscriptionCount",
    @"ErrorExpiredSubscription",
    @"ErrorFolderCorrupt",
    @"ErrorFolderExists",
    @"ErrorFolderNotFound",
    @"ErrorFolderPropertRequestFailed",
    @"ErrorFolderSave",
    @"ErrorFolderSaveFailed",
    @"ErrorFolderSavePropertyError",
    @"ErrorFreeBusyDLLimitReached",
    @"ErrorFreeBusyGenerationFailed",
    @"ErrorGetServerSecurityDescriptorFailed",
    @"ErrorIPGatewayNotFound",
    @"ErrorImpersonateUserDenied",
    @"ErrorImpersonationDenied",
    @"ErrorImpersonationFailed",
    @"ErrorInboxRulesValidationError",
    @"ErrorIncorrectSchemaVersion",
    @"ErrorIncorrectUpdatePropertyCount",
    @"ErrorIndividualMailboxLimitReached",
    @"ErrorInsufficientResources",
    @"ErrorInternalServerError",
    @"ErrorInternalServerTransientError",
    @"ErrorInvalidAccessLevel",
    @"ErrorInvalidArgument",
    @"ErrorInvalidAttachmentId",
    @"ErrorInvalidAttachmentSubfilter",
    @"ErrorInvalidAttachmentSubfilterTextFilter",
    @"ErrorInvalidAuthorizationContext",
    @"ErrorInvalidChangeKey",
    @"ErrorInvalidClientSecurityContext",
    @"ErrorInvalidCompleteDate",
    @"ErrorInvalidContactEmailAddress",
    @"ErrorInvalidContactEmailIndex",
    @"ErrorInvalidCrossForestCredentials",
    @"ErrorInvalidDelegatePermission",
    @"ErrorInvalidDelegateUserId",
    @"ErrorInvalidExchangeImpersonationHeaderData",
    @"ErrorInvalidExcludesRestriction",
    @"ErrorInvalidExpressionTypeForSubFilter",
    @"ErrorInvalidExtendedProperty",
    @"ErrorInvalidExtendedPropertyValue",
    @"ErrorInvalidExternalSharingInitiator",
    @"ErrorInvalidExternalSharingSubscriber",
    @"ErrorInvalidFederatedOrganizationId",
    @"ErrorInvalidFolderId",
    @"ErrorInvalidFolderTypeForOperation",
    @"ErrorInvalidFractionalPagingParameters",
    @"ErrorInvalidFreeBusyViewType",
    @"ErrorInvalidGetSharingFolderRequest",
    @"ErrorInvalidId",
    @"ErrorInvalidIdEmpty",
    @"ErrorInvalidIdMalformed",
    @"ErrorInvalidIdMalformedEwsLegacyIdFormat",
    @"ErrorInvalidIdMonikerTooLong",
    @"ErrorInvalidIdNotAnItemAttachmentId",
    @"ErrorInvalidIdReturnedByResolveNames",
    @"ErrorInvalidIdStoreObjectIdTooLong",
    @"ErrorInvalidIdTooManyAttachmentLevels",
    @"ErrorInvalidIdXml",
    @"ErrorInvalidIndexedPagingParameters",
    @"ErrorInvalidInternetHeaderChildNodes",
    @"ErrorInvalidItemForOperationAcceptItem",
    @"ErrorInvalidItemForOperationCancelItem",
    @"ErrorInvalidItemForOperationCreateItem",
    @"ErrorInvalidItemForOperationCreateItemAttachment",
    @"ErrorInvalidItemForOperationDeclineItem",
    @"ErrorInvalidItemForOperationExpandDL",
    @"ErrorInvalidItemForOperationRemoveItem",
    @"ErrorInvalidItemForOperationSendItem",
    @"ErrorInvalidItemForOperationTentative",
    @"ErrorInvalidLogonType",
    @"ErrorInvalidMailbox",
    @"ErrorInvalidManagedFolderProperty",
    @"ErrorInvalidManagedFolderQuota",
    @"ErrorInvalidManagedFolderSize",
    @"ErrorInvalidMergedFreeBusyInterval",
    @"ErrorInvalidNameForNameResolution",
    @"ErrorInvalidNetworkServiceContext",
    @"ErrorInvalidOofParameter",
    @"ErrorInvalidOperation",
    @"ErrorInvalidOrganizationRelationshipForFreeBusy",
    @"ErrorInvalidPagingMaxRows",
    @"ErrorInvalidParentFolder",
    @"ErrorInvalidPercentCompleteValue",
    @"ErrorInvalidPermissionSettings",
    @"ErrorInvalidPhoneCallId",
    @"ErrorInvalidPhoneNumber",
    @"ErrorInvalidPropertyAppend",
    @"ErrorInvalidPropertyDelete",
    @"ErrorInvalidPropertyForExists",
    @"ErrorInvalidPropertyForOperation",
    @"ErrorInvalidPropertyRequest",
    @"ErrorInvalidPropertySet",
    @"ErrorInvalidPropertyUpdateSentMessage",
    @"ErrorInvalidProxySecurityContext",
    @"ErrorInvalidPullSubscriptionId",
    @"ErrorInvalidPushSubscriptionUrl",
    @"ErrorInvalidRecipientSubfilter",
    @"ErrorInvalidRecipientSubfilterComparison",
    @"ErrorInvalidRecipientSubfilterOrder",
    @"ErrorInvalidRecipientSubfilterTextFilter",
    @"ErrorInvalidRecipients",
    @"ErrorInvalidReferenceItem",
    @"ErrorInvalidRequest",
    @"ErrorInvalidRestriction",
    @"ErrorInvalidRoutingType",
    @"ErrorInvalidSIPUri",
    @"ErrorInvalidScheduledOofDuration",
    @"ErrorInvalidSchemaVersionForMailboxVersion",
    @"ErrorInvalidSecurityDescriptor",
    @"ErrorInvalidSendItemSaveSettings",
    @"ErrorInvalidSerializedAccessToken",
    @"ErrorInvalidServerVersion",
    @"ErrorInvalidSharingData",
    @"ErrorInvalidSharingMessage",
    @"ErrorInvalidSid",
    @"ErrorInvalidSmtpAddress",
    @"ErrorInvalidSubfilterType",
    @"ErrorInvalidSubfilterTypeNotAttendeeType",
    @"ErrorInvalidSubfilterTypeNotRecipientType",
    @"ErrorInvalidSubscription",
    @"ErrorInvalidSubscriptionRequest",
    @"ErrorInvalidSyncStateData",
    @"ErrorInvalidTimeInterval",
    @"ErrorInvalidUserInfo",
    @"ErrorInvalidUserOofSettings",
    @"ErrorInvalidUserPrincipalName",
    @"ErrorInvalidUserSid",
    @"ErrorInvalidUserSidMissingUPN",
    @"ErrorInvalidValueForProperty",
    @"ErrorInvalidWatermark",
    @"ErrorIrresolvableConflict",
    @"ErrorItemCorrupt",
    @"ErrorItemNotFound",
    @"ErrorItemPropertyRequestFailed",
    @"ErrorItemSave",
    @"ErrorItemSavePropertyError",
    @"ErrorLegacyMailboxFreeBusyViewTypeNotMerged",
    @"ErrorLocalServerObjectNotFound",
    @"ErrorLogonAsNetworkServiceFailed",
    @"ErrorMailRecipientNotFound",
    @"ErrorMailTipsDisabled",
    @"ErrorMailboxConfiguration",
    @"ErrorMailboxDataArrayEmpty",
    @"ErrorMailboxDataArrayTooBig",
    @"ErrorMailboxFailover",
    @"ErrorMailboxLogonFailed",
    @"ErrorMailboxMoveInProgress",
    @"ErrorMailboxStoreUnavailable",
    @"ErrorManagedFolderAlreadyExists",
    @"ErrorManagedFolderNotFound",
    @"ErrorManagedFoldersRootFailure",
    @"ErrorMeetingSuggestionGenerationFailed",
    @"ErrorMessageDispositionRequired",
    @"ErrorMessageSizeExceeded",
    @"ErrorMessageTrackingNoSuchDomain",
    @"ErrorMessageTrackingPermanentError",
    @"ErrorMessageTrackingTransientError",
    @"ErrorMimeContentConversionFailed",
    @"ErrorMimeContentInvalid",
    @"ErrorMimeContentInvalidBase64String",
    @"ErrorMissedNotificationEvents",
    @"ErrorMissingArgument",
    @"ErrorMissingEmailAddress",
    @"ErrorMissingEmailAddressForManagedFolder",
    @"ErrorMissingInformationEmailAddress",
    @"ErrorMissingInformationReferenceItemId",
    @"ErrorMissingInformationSharingFolderId",
    @"ErrorMissingItemForCreateItemAttachment",
    @"ErrorMissingManagedFolderId",
    @"ErrorMissingRecipients",
    @"ErrorMissingUserIdInformation",
    @"ErrorMoreThanOneAccessModeSpecified",
    @"ErrorMoveCopyFailed",
    @"ErrorMoveDistinguishedFolder",
    @"ErrorNameResolutionMultipleResults",
    @"ErrorNameResolutionNoMailbox",
    @"ErrorNameResolutionNoResults",
    @"ErrorNewEventStreamConnectionOpened",
    @"ErrorNoApplicableProxyCASServersAvailable",
    @"ErrorNoCalendar",
    @"ErrorNoDestinationCASDueToKerberosRequirements",
    @"ErrorNoDestinationCASDueToSSLRequirements",
    @"ErrorNoDestinationCASDueToVersionMismatch",
    @"ErrorNoFolderClassOverride",
    @"ErrorNoFreeBusyAccess",
    @"ErrorNoPropertyTagForCustomProperties",
    @"ErrorNoPublicFolderReplicaAvailable",
    @"ErrorNoPublicFolderServerAvailable",
    @"ErrorNoRespondingCASInDestinationSite",
    @"ErrorNonExistentMailbox",
    @"ErrorNonPrimarySmtpAddress",
    @"ErrorNotAllowedExternalSharingByPolicy",
    @"ErrorNotDelegate",
    @"ErrorNotEnoughMemory",
    @"ErrorNotSupportedSharingMessage",
    @"ErrorObjectTypeChanged",
    @"ErrorOccurrenceCrossingBoundary",
    @"ErrorOccurrenceTimeSpanTooBig",
    @"ErrorOperationNotAllowedWithPublicFolderRoot",
    @"ErrorOrganizationNotFederated",
    @"ErrorOutlookRuleBlobExists",
    @"ErrorParentFolderIdRequired",
    @"ErrorParentFolderNotFound",
    @"ErrorPasswordChangeRequired",
    @"ErrorPasswordExpired",
    @"ErrorPermissionNotAllowedByPolicy",
    @"ErrorPhoneNumberNotDialable",
    @"ErrorPropertyUpdate",
    @"ErrorPropertyValidationFailure",
    @"ErrorProxiedSubscriptionCallFailure",
    @"ErrorProxyCallFailed",
    @"ErrorProxyGroupSidLimitExceeded",
    @"ErrorProxyRequestNotAllowed",
    @"ErrorProxyRequestProcessingFailed",
    @"ErrorProxyServiceDiscoveryFailed",
    @"ErrorProxyTokenExpired",
    @"ErrorPublicFolderRequestProcessingFailed",
    @"ErrorPublicFolderServerNotFound",
    @"ErrorQueryFilterTooLong",
    @"ErrorQuotaExceeded",
    @"ErrorReadEventsFailed",
    @"ErrorReadReceiptNotPending",
    @"ErrorRecurrenceEndDateTooBig",
    @"ErrorRecurrenceHasNoOccurrence",
    @"ErrorRemoveDelegatesFailed",
    @"ErrorRequestAborted",
    @"ErrorRequestStreamTooBig",
    @"ErrorRequiredPropertyMissing",
    @"ErrorResolveNamesInvalidFolderType",
    @"ErrorResolveNamesOnlyOneContactsFolderAllowed",
    @"ErrorResponseSchemaValidation",
    @"ErrorRestrictionTooComplex",
    @"ErrorRestrictionTooLong",
    @"ErrorResultSetTooBig",
    @"ErrorRulesOverQuota",
    @"ErrorSavedItemFolderNotFound",
    @"ErrorSchemaValidation",
    @"ErrorSearchFolderNotInitialized",
    @"ErrorSendAsDenied",
    @"ErrorSendMeetingCancellationsRequired",
    @"ErrorSendMeetingInvitationsOrCancellationsRequired",
    @"ErrorSendMeetingInvitationsRequired",
    @"ErrorSentMeetingRequestUpdate",
    @"ErrorSentTaskRequestUpdate",
    @"ErrorServerBusy",
    @"ErrorServiceDiscoveryFailed",
    @"ErrorSharingNoExternalEwsAvailable",
    @"ErrorSharingSynchronizationFailed",
    @"ErrorStaleObject",
    @"ErrorSubmissionQuotaExceeded",
    @"ErrorSubscriptionAccessDenied",
    @"ErrorSubscriptionDelegateAccessNotSupported",
    @"ErrorSubscriptionNotFound",
    @"ErrorSubscriptionUnsubscribed",
    @"ErrorSyncFolderNotFound",
    @"ErrorTimeIntervalTooBig",
    @"ErrorTimeZone",
    @"ErrorTimeoutExpired",
    @"ErrorToFolderNotFound",
    @"ErrorTokenSerializationDenied",
    @"ErrorUnableToGetUserOofSettings",
    @"ErrorUnifiedMessagingDialPlanNotFound",
    @"ErrorUnifiedMessagingRequestFailed",
    @"ErrorUnifiedMessagingServerNotFound",
    @"ErrorUnsupportedCulture",
    @"ErrorUnsupportedMapiPropertyType",
    @"ErrorUnsupportedMimeConversion",
    @"ErrorUnsupportedPathForQuery",
    @"ErrorUnsupportedPathForSortGroup",
    @"ErrorUnsupportedPropertyDefinition",
    @"ErrorUnsupportedQueryFilter",
    @"ErrorUnsupportedRecurrence",
    @"ErrorUnsupportedSubFilter",
    @"ErrorUnsupportedTypeForConversion",
    @"ErrorUpdateDelegatesFailed",
    @"ErrorUpdatePropertyMismatch",
    @"ErrorUserNotAllowedByPolicy",
    @"ErrorUserNotUnifiedMessagingEnabled",
    @"ErrorUserWithoutFederatedProxyAddress",
    @"ErrorValueOutOfRange",
    @"ErrorVirusDetected",
    @"ErrorVirusMessageDeleted",
    @"ErrorVoiceMailNotImplemented",
    @"ErrorWebRequestInInvalidState",
    @"ErrorWin32InteropError",
    @"ErrorWorkingHoursSaveFailed",
    @"ErrorWorkingHoursXmlMalformed",
    @"ErrorWrongServerVersion",
    @"ErrorWrongServerVersionDelegate",
    @"NoError",
};

@implementation ExchangeWebService_ResponseCodeType
+ (ExchangeWebService_ResponseCodeTypeEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(ExchangeWebService_ResponseCodeType_enumValues) / sizeof(ExchangeWebService_ResponseCodeType_enumValues[0]); ++i) {
        if ([string isEqualToString:ExchangeWebService_ResponseCodeType_enumValues[i]])
            return (ExchangeWebService_ResponseCodeTypeEnum)i;
    }

    return ExchangeWebService_ResponseCodeType_none;
}

+ (NSString *)stringFromValue:(ExchangeWebService_ResponseCodeTypeEnum)value {
    return ExchangeWebService_ResponseCodeType_enumValues[(int)value];
}

+ (ExchangeWebService_ResponseCodeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : ExchangeWebService_ResponseCodeType_none;
}

+ (ExchangeWebService_ResponseCodeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ResponseCodeTypeEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(ExchangeWebService_ResponseCodeTypeEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
@implementation ExchangeWebService_ResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_ResponseClassType serializeToProperty:"ResponseClass" onNode:node value:_ResponseClass];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_MessageText)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:MessageText" value:_MessageText];

    if (_ResponseCode)
        [ExchangeWebService_ResponseCodeType serializeToChildOf:node withName:"ExchangeWebService:ResponseCode" value:_ResponseCode];

    if (_DescriptiveLinkKey)
        [xsd_int serializeToChildOf:node withName:"ExchangeWebService:DescriptiveLinkKey" value:_DescriptiveLinkKey];

    if (_MessageXml)
        [ExchangeWebService_SequenceElement_MessageXml serializeToChildOf:node withName:"ExchangeWebService:MessageXml" value:_MessageXml];

}


- (ExchangeWebService_SequenceElement_MessageXml *)MessageXml {
    if (!_MessageXml) _MessageXml = [ExchangeWebService_SequenceElement_MessageXml new];
    return _MessageXml;
}

+ (ExchangeWebService_ResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.ResponseClass = [t_ResponseClassType deserializeAttribute:"ResponseClass" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"MessageText")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.MessageText = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ResponseCode")) {
            self.ResponseCode = [ExchangeWebService_ResponseCodeType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DescriptiveLinkKey")) {
            Class elementClass = classForElement(cur) ?: [xsd_int class];
            self.DescriptiveLinkKey = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MessageXml")) {
            Class elementClass = classForElement(cur) ?: [ExchangeWebService_SequenceElement_MessageXml class];
            self.MessageXml = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_FindItemResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_FindItemResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_RootFolder)
        [t_FindItemParentType serializeToChildOf:node withName:"ExchangeWebService:RootFolder" value:_RootFolder];

}


- (t_FindItemParentType *)RootFolder {
    if (!_RootFolder) _RootFolder = [t_FindItemParentType new];
    return _RootFolder;
}
+ (ExchangeWebService_FindItemResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_FindItemResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"RootFolder")) {
            Class elementClass = classForElement(cur) ?: [t_FindItemParentType class];
            self.RootFolder = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_ItemInfoResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ItemInfoResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Items)
        [t_ArrayOfRealItemsType serializeToChildOf:node withName:"ExchangeWebService:Items" value:_Items];

}

+ (ExchangeWebService_ItemInfoResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ItemInfoResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Items")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRealItemsType class];
            self.Items = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_ExportItemsResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ExportItemsResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_ItemId)
        [t_ItemIdType serializeToChildOf:node withName:"ExchangeWebService:ItemId" value:_ItemId];

    if (_Data)
        [xsd_base64Binary serializeToChildOf:node withName:"ExchangeWebService:Data" value:_Data];

}


- (t_ItemIdType *)ItemId {
    if (!_ItemId) _ItemId = [t_ItemIdType new];
    return _ItemId;
}
+ (ExchangeWebService_ExportItemsResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ExportItemsResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

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
@implementation ExchangeWebService_GetRoomListsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetRoomListsType *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (ExchangeWebService_GetRoomListsType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetRoomListsType *newObject = [self new];


    return newObject;
}
@end
@implementation ExchangeWebService_ConvertIdResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ConvertIdResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_ConvertIdResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ConvertIdResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_FindFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_FindFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_FolderQueryTraversalType serializeToProperty:"Traversal" onNode:node value:_Traversal];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FolderShape)
        [t_FolderResponseShapeType serializeToChildOf:node withName:"ExchangeWebService:FolderShape" value:_FolderShape];

    if (_IndexedPageFolderView)
        [t_IndexedPageViewType serializeToChildOf:node withName:"ExchangeWebService:IndexedPageFolderView" value:_IndexedPageFolderView];

    if (_FractionalPageFolderView)
        [t_FractionalPageViewType serializeToChildOf:node withName:"ExchangeWebService:FractionalPageFolderView" value:_FractionalPageFolderView];

    if (_Restriction)
        [t_RestrictionType serializeToChildOf:node withName:"ExchangeWebService:Restriction" value:_Restriction];

    if (_ParentFolderIds)
        [t_NonEmptyArrayOfBaseFolderIdsType serializeToChildOf:node withName:"ExchangeWebService:ParentFolderIds" value:_ParentFolderIds];

}


- (t_FolderResponseShapeType *)FolderShape {
    if (!_FolderShape) _FolderShape = [t_FolderResponseShapeType new];
    return _FolderShape;
}

- (t_IndexedPageViewType *)IndexedPageFolderView {
    if (!_IndexedPageFolderView) _IndexedPageFolderView = [t_IndexedPageViewType new];
    return _IndexedPageFolderView;
}

- (t_FractionalPageViewType *)FractionalPageFolderView {
    if (!_FractionalPageFolderView) _FractionalPageFolderView = [t_FractionalPageViewType new];
    return _FractionalPageFolderView;
}

- (t_RestrictionType *)Restriction {
    if (!_Restriction) _Restriction = [t_RestrictionType new];
    return _Restriction;
}

+ (ExchangeWebService_FindFolderType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_FindFolderType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Traversal = [t_FolderQueryTraversalType deserializeAttribute:"Traversal" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderShape")) {
            Class elementClass = classForElement(cur) ?: [t_FolderResponseShapeType class];
            self.FolderShape = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IndexedPageFolderView")) {
            Class elementClass = classForElement(cur) ?: [t_IndexedPageViewType class];
            self.IndexedPageFolderView = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FractionalPageFolderView")) {
            Class elementClass = classForElement(cur) ?: [t_FractionalPageViewType class];
            self.FractionalPageFolderView = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Restriction")) {
            Class elementClass = classForElement(cur) ?: [t_RestrictionType class];
            self.Restriction = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ParentFolderIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseFolderIdsType class];
            self.ParentFolderIds = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_CopyItemResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_CopyItemResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_CopyItemResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_CopyItemResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_GetSharingFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetSharingFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SmtpAddress)
        [t_NonEmptyStringType serializeToChildOf:node withName:"ExchangeWebService:SmtpAddress" value:_SmtpAddress];

    if (_DataType)
        [t_SharingDataType serializeToChildOf:node withName:"ExchangeWebService:DataType" value:_DataType];

    if (_SharedFolderId)
        [t_NonEmptyStringType serializeToChildOf:node withName:"ExchangeWebService:SharedFolderId" value:_SharedFolderId];

}

+ (ExchangeWebService_GetSharingFolderType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetSharingFolderType *newObject = [self new];

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
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DataType")) {
            self.DataType = [t_SharingDataType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SharedFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.SharedFolderId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_ServiceConfigurationResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ServiceConfigurationResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_MailTipsConfiguration)
        [t_MailTipsServiceConfiguration serializeToChildOf:node withName:"ExchangeWebService:MailTipsConfiguration" value:_MailTipsConfiguration];

    if (_UnifiedMessagingConfiguration)
        [t_UnifiedMessageServiceConfiguration serializeToChildOf:node withName:"ExchangeWebService:UnifiedMessagingConfiguration" value:_UnifiedMessagingConfiguration];

    if (_ProtectionRulesConfiguration)
        [t_ProtectionRulesServiceConfiguration serializeToChildOf:node withName:"ExchangeWebService:ProtectionRulesConfiguration" value:_ProtectionRulesConfiguration];

}


- (t_MailTipsServiceConfiguration *)MailTipsConfiguration {
    if (!_MailTipsConfiguration) _MailTipsConfiguration = [t_MailTipsServiceConfiguration new];
    return _MailTipsConfiguration;
}

- (t_UnifiedMessageServiceConfiguration *)UnifiedMessagingConfiguration {
    if (!_UnifiedMessagingConfiguration) _UnifiedMessagingConfiguration = [t_UnifiedMessageServiceConfiguration new];
    return _UnifiedMessagingConfiguration;
}

- (t_ProtectionRulesServiceConfiguration *)ProtectionRulesConfiguration {
    if (!_ProtectionRulesConfiguration) _ProtectionRulesConfiguration = [t_ProtectionRulesServiceConfiguration new];
    return _ProtectionRulesConfiguration;
}
+ (ExchangeWebService_ServiceConfigurationResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ServiceConfigurationResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"MailTipsConfiguration")) {
            Class elementClass = classForElement(cur) ?: [t_MailTipsServiceConfiguration class];
            self.MailTipsConfiguration = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"UnifiedMessagingConfiguration")) {
            Class elementClass = classForElement(cur) ?: [t_UnifiedMessageServiceConfiguration class];
            self.UnifiedMessagingConfiguration = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ProtectionRulesConfiguration")) {
            Class elementClass = classForElement(cur) ?: [t_ProtectionRulesServiceConfiguration class];
            self.ProtectionRulesConfiguration = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_UnsubscribeType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UnsubscribeType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SubscriptionId)
        [t_SubscriptionIdType serializeToChildOf:node withName:"ExchangeWebService:SubscriptionId" value:_SubscriptionId];

}

+ (ExchangeWebService_UnsubscribeType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UnsubscribeType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SubscriptionId")) {
            Class elementClass = classForElement(cur) ?: [t_SubscriptionIdType class];
            self.SubscriptionId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_ArrayOfMailTipsResponseMessageType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"MailTipsResponseMessageType")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_MailTipsResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (ExchangeWebService_MailTipsResponseMessageType * item in value)
        [ExchangeWebService_MailTipsResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:MailTipsResponseMessageType" value:item];
}
@end
@implementation ExchangeWebService_GetMailTipsResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetMailTipsResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_ResponseMessages)
        [ExchangeWebService_ArrayOfMailTipsResponseMessageType serializeToChildOf:node withName:"ExchangeWebService:ResponseMessages" value:_ResponseMessages];

}

+ (ExchangeWebService_GetMailTipsResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetMailTipsResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ResponseMessages")) {
            Class elementClass = classForElement(cur) ?: [ExchangeWebService_ArrayOfMailTipsResponseMessageType class];
            self.ResponseMessages = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_DeleteItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_DeleteItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_DisposalType serializeToProperty:"DeleteType" onNode:node value:_DeleteType];
    [t_CalendarItemCreateOrDeleteOperationType serializeToProperty:"SendMeetingCancellations" onNode:node value:_SendMeetingCancellations];
    [t_AffectedTaskOccurrencesType serializeToProperty:"AffectedTaskOccurrences" onNode:node value:_AffectedTaskOccurrences];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ItemIds)
        [t_NonEmptyArrayOfBaseItemIdsType serializeToChildOf:node withName:"ExchangeWebService:ItemIds" value:_ItemIds];

}


+ (ExchangeWebService_DeleteItemType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_DeleteItemType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.DeleteType = [t_DisposalType deserializeAttribute:"DeleteType" ofNode:cur];
    self.SendMeetingCancellations = [t_CalendarItemCreateOrDeleteOperationType deserializeAttribute:"SendMeetingCancellations" ofNode:cur];
    self.AffectedTaskOccurrences = [t_AffectedTaskOccurrencesType deserializeAttribute:"AffectedTaskOccurrences" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseItemIdsType class];
            self.ItemIds = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_ApplyConversationActionType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ApplyConversationActionType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ConversationActions)
        [t_NonEmptyArrayOfApplyConversationActionType serializeToChildOf:node withName:"ExchangeWebService:ConversationActions" value:_ConversationActions];

}

+ (ExchangeWebService_ApplyConversationActionType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ApplyConversationActionType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConversationActions")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfApplyConversationActionType class];
            self.ConversationActions = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_DisconnectPhoneCallResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_DisconnectPhoneCallResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (ExchangeWebService_DisconnectPhoneCallResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_DisconnectPhoneCallResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_DeleteFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_DeleteFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_DisposalType serializeToProperty:"DeleteType" onNode:node value:_DeleteType];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FolderIds)
        [t_NonEmptyArrayOfBaseFolderIdsType serializeToChildOf:node withName:"ExchangeWebService:FolderIds" value:_FolderIds];

}


+ (ExchangeWebService_DeleteFolderType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_DeleteFolderType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.DeleteType = [t_DisposalType deserializeAttribute:"DeleteType" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseFolderIdsType class];
            self.FolderIds = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_ExportItemsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ExportItemsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ItemIds)
        [t_NonEmptyArrayOfItemIdsType serializeToChildOf:node withName:"ExchangeWebService:ItemIds" value:_ItemIds];

}

+ (ExchangeWebService_ExportItemsType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ExportItemsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfItemIdsType class];
            self.ItemIds = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetUserConfigurationResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetUserConfigurationResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_GetUserConfigurationResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetUserConfigurationResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_GetServerTimeZonesType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetServerTimeZonesType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_boolean serializeToProperty:"ReturnFullTimeZoneData" onNode:node value:_ReturnFullTimeZoneData];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Ids)
        [t_NonEmptyArrayOfTimeZoneIdType serializeToChildOf:node withName:"ExchangeWebService:Ids" value:_Ids];

}


+ (ExchangeWebService_GetServerTimeZonesType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetServerTimeZonesType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.ReturnFullTimeZoneData = [xsd_boolean deserializeAttribute:"ReturnFullTimeZoneData" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Ids")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfTimeZoneIdType class];
            self.Ids = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_UpdateItemResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UpdateItemResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_UpdateItemResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UpdateItemResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_BaseDelegateType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_BaseDelegateType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Mailbox)
        [t_EmailAddressType serializeToChildOf:node withName:"ExchangeWebService:Mailbox" value:_Mailbox];

}


- (t_EmailAddressType *)Mailbox {
    if (!_Mailbox) _Mailbox = [t_EmailAddressType new];
    return _Mailbox;
}
+ (ExchangeWebService_BaseDelegateType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_BaseDelegateType *newObject = [self new];

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
    }
}
@end
@implementation ExchangeWebService_AddDelegateType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_AddDelegateType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_DelegateUsers)
        [t_ArrayOfDelegateUserType serializeToChildOf:node withName:"ExchangeWebService:DelegateUsers" value:_DelegateUsers];

    if (_DeliverMeetingRequests)
        [t_DeliverMeetingRequestsType serializeToChildOf:node withName:"ExchangeWebService:DeliverMeetingRequests" value:_DeliverMeetingRequests];

}

+ (ExchangeWebService_AddDelegateType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_AddDelegateType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"DelegateUsers")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfDelegateUserType class];
            self.DelegateUsers = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DeliverMeetingRequests")) {
            self.DeliverMeetingRequests = [t_DeliverMeetingRequestsType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation ExchangeWebService_SubscribeResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SubscribeResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_SubscribeResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SubscribeResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_ArrayOfDelegateUserResponseMessageType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"DelegateUserResponseMessageType")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_DelegateUserResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (ExchangeWebService_DelegateUserResponseMessageType * item in value)
        [ExchangeWebService_DelegateUserResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:DelegateUserResponseMessageType" value:item];
}
@end
@implementation ExchangeWebService_BaseDelegateResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_BaseDelegateResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_ResponseMessages)
        [ExchangeWebService_ArrayOfDelegateUserResponseMessageType serializeToChildOf:node withName:"ExchangeWebService:ResponseMessages" value:_ResponseMessages];

}

+ (ExchangeWebService_BaseDelegateResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_BaseDelegateResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ResponseMessages")) {
            Class elementClass = classForElement(cur) ?: [ExchangeWebService_ArrayOfDelegateUserResponseMessageType class];
            self.ResponseMessages = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetDelegateResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetDelegateResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_DeliverMeetingRequests)
        [t_DeliverMeetingRequestsType serializeToChildOf:node withName:"ExchangeWebService:DeliverMeetingRequests" value:_DeliverMeetingRequests];

}

+ (ExchangeWebService_GetDelegateResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetDelegateResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"DeliverMeetingRequests")) {
            self.DeliverMeetingRequests = [t_DeliverMeetingRequestsType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation ExchangeWebService_RemoveDelegateResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_RemoveDelegateResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (ExchangeWebService_RemoveDelegateResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_RemoveDelegateResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_ApplyConversationActionResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ApplyConversationActionResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_ApplyConversationActionResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ApplyConversationActionResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_CreateAttachmentResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_CreateAttachmentResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_CreateAttachmentResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_CreateAttachmentResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_RefreshSharingFolderResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_RefreshSharingFolderResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (ExchangeWebService_RefreshSharingFolderResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_RefreshSharingFolderResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_DeleteAttachmentType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_DeleteAttachmentType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_AttachmentIds)
        [t_NonEmptyArrayOfRequestAttachmentIdsType serializeToChildOf:node withName:"ExchangeWebService:AttachmentIds" value:_AttachmentIds];

}

+ (ExchangeWebService_DeleteAttachmentType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_DeleteAttachmentType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"AttachmentIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfRequestAttachmentIdsType class];
            self.AttachmentIds = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_ResolveNamesResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ResolveNamesResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_ResolutionSet)
        [t_ArrayOfResolutionType serializeToChildOf:node withName:"ExchangeWebService:ResolutionSet" value:_ResolutionSet];

}


- (t_ArrayOfResolutionType *)ResolutionSet {
    if (!_ResolutionSet) _ResolutionSet = [t_ArrayOfResolutionType new];
    return _ResolutionSet;
}
+ (ExchangeWebService_ResolveNamesResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ResolveNamesResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ResolutionSet")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfResolutionType class];
            self.ResolutionSet = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_EmptyFolderResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_EmptyFolderResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_EmptyFolderResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_EmptyFolderResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_UpdateUserConfigurationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UpdateUserConfigurationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_UserConfiguration)
        [t_UserConfigurationType serializeToChildOf:node withName:"ExchangeWebService:UserConfiguration" value:_UserConfiguration];

}


- (t_UserConfigurationType *)UserConfiguration {
    if (!_UserConfiguration) _UserConfiguration = [t_UserConfigurationType new];
    return _UserConfiguration;
}
+ (ExchangeWebService_UpdateUserConfigurationType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UpdateUserConfigurationType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"UserConfiguration")) {
            Class elementClass = classForElement(cur) ?: [t_UserConfigurationType class];
            self.UserConfiguration = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetRoomsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetRoomsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_RoomList)
        [t_EmailAddressType serializeToChildOf:node withName:"ExchangeWebService:RoomList" value:_RoomList];

}


- (t_EmailAddressType *)RoomList {
    if (!_RoomList) _RoomList = [t_EmailAddressType new];
    return _RoomList;
}
+ (ExchangeWebService_GetRoomsType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetRoomsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"RoomList")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.RoomList = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_CreateAttachmentType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_CreateAttachmentType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ParentItemId)
        [t_ItemIdType serializeToChildOf:node withName:"ExchangeWebService:ParentItemId" value:_ParentItemId];

    if (_Attachments)
        [t_NonEmptyArrayOfAttachmentsType serializeToChildOf:node withName:"ExchangeWebService:Attachments" value:_Attachments];

}


- (t_ItemIdType *)ParentItemId {
    if (!_ParentItemId) _ParentItemId = [t_ItemIdType new];
    return _ParentItemId;
}
+ (ExchangeWebService_CreateAttachmentType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_CreateAttachmentType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ParentItemId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ParentItemId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Attachments")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfAttachmentsType class];
            self.Attachments = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_BaseMoveCopyFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_BaseMoveCopyFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ToFolderId)
        [t_TargetFolderIdType serializeToChildOf:node withName:"ExchangeWebService:ToFolderId" value:_ToFolderId];

    if (_FolderIds)
        [t_NonEmptyArrayOfBaseFolderIdsType serializeToChildOf:node withName:"ExchangeWebService:FolderIds" value:_FolderIds];

}

+ (ExchangeWebService_BaseMoveCopyFolderType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_BaseMoveCopyFolderType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ToFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_TargetFolderIdType class];
            self.ToFolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseFolderIdsType class];
            self.FolderIds = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_CopyFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_CopyFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_CopyFolderType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_CopyFolderType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_ConvertIdResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ConvertIdResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_AlternateId)
        [t_AlternateIdBaseType serializeToChildOf:node withName:"ExchangeWebService:AlternateId" value:_AlternateId];

}


- (t_AlternateIdBaseType *)AlternateId {
    if (!_AlternateId) _AlternateId = [t_AlternateIdBaseType new];
    return _AlternateId;
}
+ (ExchangeWebService_ConvertIdResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ConvertIdResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"AlternateId")) {
            Class elementClass = classForElement(cur) ?: [t_AlternateIdBaseType class];
            self.AlternateId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_CreateItemResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_CreateItemResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_CreateItemResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_CreateItemResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_GetMessageTrackingReportResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetMessageTrackingReportResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_MessageTrackingReport)
        [t_MessageTrackingReportType serializeToChildOf:node withName:"ExchangeWebService:MessageTrackingReport" value:_MessageTrackingReport];

    if (_Diagnostics)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"ExchangeWebService:Diagnostics" value:_Diagnostics];

    if (_Errors)
        [t_ArrayOfArraysOfTrackingPropertiesType serializeToChildOf:node withName:"ExchangeWebService:Errors" value:_Errors];

    if (_Properties)
        [t_ArrayOfTrackingPropertiesType serializeToChildOf:node withName:"ExchangeWebService:Properties" value:_Properties];

}


- (t_MessageTrackingReportType *)MessageTrackingReport {
    if (!_MessageTrackingReport) _MessageTrackingReport = [t_MessageTrackingReportType new];
    return _MessageTrackingReport;
}
+ (ExchangeWebService_GetMessageTrackingReportResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetMessageTrackingReportResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"MessageTrackingReport")) {
            Class elementClass = classForElement(cur) ?: [t_MessageTrackingReportType class];
            self.MessageTrackingReport = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Diagnostics")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.Diagnostics = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Errors")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfArraysOfTrackingPropertiesType class];
            self.Errors = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Properties")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfTrackingPropertiesType class];
            self.Properties = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetRoomListsResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetRoomListsResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_RoomLists)
        [t_ArrayOfEmailAddressesType serializeToChildOf:node withName:"ExchangeWebService:RoomLists" value:_RoomLists];

}

+ (ExchangeWebService_GetRoomListsResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetRoomListsResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"RoomLists")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfEmailAddressesType class];
            self.RoomLists = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_CreateFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_CreateFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ParentFolderId)
        [t_TargetFolderIdType serializeToChildOf:node withName:"ExchangeWebService:ParentFolderId" value:_ParentFolderId];

    if (_Folders)
        [t_NonEmptyArrayOfFoldersType serializeToChildOf:node withName:"ExchangeWebService:Folders" value:_Folders];

}

+ (ExchangeWebService_CreateFolderType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_CreateFolderType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ParentFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_TargetFolderIdType class];
            self.ParentFolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Folders")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfFoldersType class];
            self.Folders = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_ArrayOfServiceConfigurationType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"ConfigurationName")) {
            Class elementClass = classForElement(child) ?: [t_ServiceConfigurationType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (NSString * item in value)
        [t_ServiceConfigurationType serializeToChildOf:child withName:"ExchangeWebService:ConfigurationName" value:item];
}
@end
@implementation ExchangeWebService_FindItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_FindItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_ItemQueryTraversalType serializeToProperty:"Traversal" onNode:node value:_Traversal];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ItemShape)
        [t_ItemResponseShapeType serializeToChildOf:node withName:"ExchangeWebService:ItemShape" value:_ItemShape];

    if (_IndexedPageItemView)
        [t_IndexedPageViewType serializeToChildOf:node withName:"ExchangeWebService:IndexedPageItemView" value:_IndexedPageItemView];

    if (_FractionalPageItemView)
        [t_FractionalPageViewType serializeToChildOf:node withName:"ExchangeWebService:FractionalPageItemView" value:_FractionalPageItemView];

    if (_CalendarView)
        [t_CalendarViewType serializeToChildOf:node withName:"ExchangeWebService:CalendarView" value:_CalendarView];

    if (_ContactsView)
        [t_ContactsViewType serializeToChildOf:node withName:"ExchangeWebService:ContactsView" value:_ContactsView];

    if (_GroupBy)
        [t_GroupByType serializeToChildOf:node withName:"ExchangeWebService:GroupBy" value:_GroupBy];

    if (_DistinguishedGroupBy)
        [t_DistinguishedGroupByType serializeToChildOf:node withName:"ExchangeWebService:DistinguishedGroupBy" value:_DistinguishedGroupBy];

    if (_Restriction)
        [t_RestrictionType serializeToChildOf:node withName:"ExchangeWebService:Restriction" value:_Restriction];

    if (_SortOrder)
        [t_NonEmptyArrayOfFieldOrdersType serializeToChildOf:node withName:"ExchangeWebService:SortOrder" value:_SortOrder];

    if (_ParentFolderIds)
        [t_NonEmptyArrayOfBaseFolderIdsType serializeToChildOf:node withName:"ExchangeWebService:ParentFolderIds" value:_ParentFolderIds];

    if (_QueryString)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:QueryString" value:_QueryString];

}


- (t_ItemResponseShapeType *)ItemShape {
    if (!_ItemShape) _ItemShape = [t_ItemResponseShapeType new];
    return _ItemShape;
}

- (t_IndexedPageViewType *)IndexedPageItemView {
    if (!_IndexedPageItemView) _IndexedPageItemView = [t_IndexedPageViewType new];
    return _IndexedPageItemView;
}

- (t_FractionalPageViewType *)FractionalPageItemView {
    if (!_FractionalPageItemView) _FractionalPageItemView = [t_FractionalPageViewType new];
    return _FractionalPageItemView;
}

- (t_CalendarViewType *)CalendarView {
    if (!_CalendarView) _CalendarView = [t_CalendarViewType new];
    return _CalendarView;
}

- (t_ContactsViewType *)ContactsView {
    if (!_ContactsView) _ContactsView = [t_ContactsViewType new];
    return _ContactsView;
}

- (t_GroupByType *)GroupBy {
    if (!_GroupBy) _GroupBy = [t_GroupByType new];
    return _GroupBy;
}

- (t_DistinguishedGroupByType *)DistinguishedGroupBy {
    if (!_DistinguishedGroupBy) _DistinguishedGroupBy = [t_DistinguishedGroupByType new];
    return _DistinguishedGroupBy;
}

- (t_RestrictionType *)Restriction {
    if (!_Restriction) _Restriction = [t_RestrictionType new];
    return _Restriction;
}

+ (ExchangeWebService_FindItemType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_FindItemType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.Traversal = [t_ItemQueryTraversalType deserializeAttribute:"Traversal" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemShape")) {
            Class elementClass = classForElement(cur) ?: [t_ItemResponseShapeType class];
            self.ItemShape = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IndexedPageItemView")) {
            Class elementClass = classForElement(cur) ?: [t_IndexedPageViewType class];
            self.IndexedPageItemView = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FractionalPageItemView")) {
            Class elementClass = classForElement(cur) ?: [t_FractionalPageViewType class];
            self.FractionalPageItemView = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"CalendarView")) {
            Class elementClass = classForElement(cur) ?: [t_CalendarViewType class];
            self.CalendarView = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ContactsView")) {
            Class elementClass = classForElement(cur) ?: [t_ContactsViewType class];
            self.ContactsView = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"GroupBy")) {
            Class elementClass = classForElement(cur) ?: [t_GroupByType class];
            self.GroupBy = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DistinguishedGroupBy")) {
            Class elementClass = classForElement(cur) ?: [t_DistinguishedGroupByType class];
            self.DistinguishedGroupBy = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Restriction")) {
            Class elementClass = classForElement(cur) ?: [t_RestrictionType class];
            self.Restriction = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SortOrder")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfFieldOrdersType class];
            self.SortOrder = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ParentFolderIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseFolderIdsType class];
            self.ParentFolderIds = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"QueryString")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.QueryString = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_FolderInfoResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_FolderInfoResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Folders)
        [t_ArrayOfFoldersType serializeToChildOf:node withName:"ExchangeWebService:Folders" value:_Folders];

}

+ (ExchangeWebService_FolderInfoResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_FolderInfoResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Folders")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfFoldersType class];
            self.Folders = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetEventsResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetEventsResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Notification)
        [t_NotificationType serializeToChildOf:node withName:"ExchangeWebService:Notification" value:_Notification];

}


- (t_NotificationType *)Notification {
    if (!_Notification) _Notification = [t_NotificationType new];
    return _Notification;
}
+ (ExchangeWebService_GetEventsResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetEventsResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Notification")) {
            Class elementClass = classForElement(cur) ?: [t_NotificationType class];
            self.Notification = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_FindMailboxStatisticsByKeywordsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_FindMailboxStatisticsByKeywordsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Mailboxes)
        [t_ArrayOfUserMailboxesType serializeToChildOf:node withName:"ExchangeWebService:Mailboxes" value:_Mailboxes];

    if (_Keywords)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"ExchangeWebService:Keywords" value:_Keywords];

    if (_Language)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:Language" value:_Language];

    if (_Senders)
        [t_ArrayOfSmtpAddressType serializeToChildOf:node withName:"ExchangeWebService:Senders" value:_Senders];

    if (_Recipients)
        [t_ArrayOfSmtpAddressType serializeToChildOf:node withName:"ExchangeWebService:Recipients" value:_Recipients];

    if (_FromDate)
        [xsd_dateTime serializeToChildOf:node withName:"ExchangeWebService:FromDate" value:_FromDate];

    if (_ToDate)
        [xsd_dateTime serializeToChildOf:node withName:"ExchangeWebService:ToDate" value:_ToDate];

    if (_MessageTypes)
        [t_ArrayOfSearchItemKindsType serializeToChildOf:node withName:"ExchangeWebService:MessageTypes" value:_MessageTypes];

    if (_SearchDumpster)
        [xsd_boolean serializeToChildOf:node withName:"ExchangeWebService:SearchDumpster" value:_SearchDumpster];

    if (_IncludePersonalArchive)
        [xsd_boolean serializeToChildOf:node withName:"ExchangeWebService:IncludePersonalArchive" value:_IncludePersonalArchive];

    if (_IncludeUnsearchableItems)
        [xsd_boolean serializeToChildOf:node withName:"ExchangeWebService:IncludeUnsearchableItems" value:_IncludeUnsearchableItems];

}

+ (ExchangeWebService_FindMailboxStatisticsByKeywordsType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_FindMailboxStatisticsByKeywordsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Mailboxes")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfUserMailboxesType class];
            self.Mailboxes = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Keywords")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.Keywords = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Language")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Language = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Senders")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfSmtpAddressType class];
            self.Senders = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Recipients")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfSmtpAddressType class];
            self.Recipients = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FromDate")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.FromDate = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ToDate")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.ToDate = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MessageTypes")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfSearchItemKindsType class];
            self.MessageTypes = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SearchDumpster")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.SearchDumpster = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IncludePersonalArchive")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IncludePersonalArchive = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IncludeUnsearchableItems")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IncludeUnsearchableItems = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_SyncFolderItemsResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SyncFolderItemsResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_SyncFolderItemsResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SyncFolderItemsResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_ExportItemsResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ExportItemsResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_ExportItemsResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ExportItemsResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_AddDelegateResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_AddDelegateResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (ExchangeWebService_AddDelegateResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_AddDelegateResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_GetSharingMetadataResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetSharingMetadataResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_EncryptedSharedFolderDataCollection)
        [t_ArrayOfEncryptedSharedFolderDataType serializeToChildOf:node withName:"ExchangeWebService:EncryptedSharedFolderDataCollection" value:_EncryptedSharedFolderDataCollection];

    if (_InvalidRecipients)
        [t_ArrayOfInvalidRecipientsType serializeToChildOf:node withName:"ExchangeWebService:InvalidRecipients" value:_InvalidRecipients];

}

+ (ExchangeWebService_GetSharingMetadataResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetSharingMetadataResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"EncryptedSharedFolderDataCollection")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfEncryptedSharedFolderDataType class];
            self.EncryptedSharedFolderDataCollection = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"InvalidRecipients")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfInvalidRecipientsType class];
            self.InvalidRecipients = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_SyncFolderHierarchyResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SyncFolderHierarchyResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_SyncState)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:SyncState" value:_SyncState];

    if (_IncludesLastFolderInRange)
        [xsd_boolean serializeToChildOf:node withName:"ExchangeWebService:IncludesLastFolderInRange" value:_IncludesLastFolderInRange];

    if (_Changes)
        [t_SyncFolderHierarchyChangesType serializeToChildOf:node withName:"ExchangeWebService:Changes" value:_Changes];

}

+ (ExchangeWebService_SyncFolderHierarchyResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SyncFolderHierarchyResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SyncState")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.SyncState = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IncludesLastFolderInRange")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IncludesLastFolderInRange = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Changes")) {
            Class elementClass = classForElement(cur) ?: [t_SyncFolderHierarchyChangesType class];
            self.Changes = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_DeleteAttachmentResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_DeleteAttachmentResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_DeleteAttachmentResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_DeleteAttachmentResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_UpdateUserConfigurationResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UpdateUserConfigurationResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_UpdateUserConfigurationResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UpdateUserConfigurationResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_MoveItemResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_MoveItemResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_MoveItemResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_MoveItemResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_SendNotificationResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SendNotificationResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_SendNotificationResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SendNotificationResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_UpdateFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UpdateFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FolderChanges)
        [t_NonEmptyArrayOfFolderChangesType serializeToChildOf:node withName:"ExchangeWebService:FolderChanges" value:_FolderChanges];

}

+ (ExchangeWebService_UpdateFolderType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UpdateFolderType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderChanges")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfFolderChangesType class];
            self.FolderChanges = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_CreateFolderResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_CreateFolderResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_CreateFolderResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_CreateFolderResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_MailTipsResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_MailTipsResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_MailTips)
        [t_MailTips serializeToChildOf:node withName:"ExchangeWebService:MailTips" value:_MailTips];

}


- (t_MailTips *)MailTips {
    if (!_MailTips) _MailTips = [t_MailTips new];
    return _MailTips;
}
+ (ExchangeWebService_MailTipsResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_MailTipsResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"MailTips")) {
            Class elementClass = classForElement(cur) ?: [t_MailTips class];
            self.MailTips = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_FindConversationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_FindConversationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_IndexedPageItemView)
        [t_IndexedPageViewType serializeToChildOf:node withName:"ExchangeWebService:IndexedPageItemView" value:_IndexedPageItemView];

    if (_SortOrder)
        [t_NonEmptyArrayOfFieldOrdersType serializeToChildOf:node withName:"ExchangeWebService:SortOrder" value:_SortOrder];

    if (_ParentFolderId)
        [t_TargetFolderIdType serializeToChildOf:node withName:"ExchangeWebService:ParentFolderId" value:_ParentFolderId];

}


- (t_IndexedPageViewType *)IndexedPageItemView {
    if (!_IndexedPageItemView) _IndexedPageItemView = [t_IndexedPageViewType new];
    return _IndexedPageItemView;
}
+ (ExchangeWebService_FindConversationType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_FindConversationType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"IndexedPageItemView")) {
            Class elementClass = classForElement(cur) ?: [t_IndexedPageViewType class];
            self.IndexedPageItemView = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SortOrder")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfFieldOrdersType class];
            self.SortOrder = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ParentFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_TargetFolderIdType class];
            self.ParentFolderId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_CreateItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_CreateItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_MessageDispositionType serializeToProperty:"MessageDisposition" onNode:node value:_MessageDisposition];
    [t_CalendarItemCreateOrDeleteOperationType serializeToProperty:"SendMeetingInvitations" onNode:node value:_SendMeetingInvitations];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SavedItemFolderId)
        [t_TargetFolderIdType serializeToChildOf:node withName:"ExchangeWebService:SavedItemFolderId" value:_SavedItemFolderId];

    if (_Items)
        [t_NonEmptyArrayOfAllItemsType serializeToChildOf:node withName:"ExchangeWebService:Items" value:_Items];

}


+ (ExchangeWebService_CreateItemType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_CreateItemType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.MessageDisposition = [t_MessageDispositionType deserializeAttribute:"MessageDisposition" ofNode:cur];
    self.SendMeetingInvitations = [t_CalendarItemCreateOrDeleteOperationType deserializeAttribute:"SendMeetingInvitations" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SavedItemFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_TargetFolderIdType class];
            self.SavedItemFolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Items")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfAllItemsType class];
            self.Items = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_AttachmentInfoResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_AttachmentInfoResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Attachments)
        [t_ArrayOfAttachmentsType serializeToChildOf:node withName:"ExchangeWebService:Attachments" value:_Attachments];

}

+ (ExchangeWebService_AttachmentInfoResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_AttachmentInfoResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Attachments")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfAttachmentsType class];
            self.Attachments = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_SequenceElement_MessageXml
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SequenceElement_MessageXml *)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
}
+ (ExchangeWebService_SequenceElement_MessageXml *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SequenceElement_MessageXml *newObject = [self new];


    return newObject;
}
@end
@implementation ExchangeWebService_DeleteAttachmentResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_DeleteAttachmentResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_RootItemId)
        [t_RootItemIdType serializeToChildOf:node withName:"ExchangeWebService:RootItemId" value:_RootItemId];

}


- (t_RootItemIdType *)RootItemId {
    if (!_RootItemId) _RootItemId = [t_RootItemIdType new];
    return _RootItemId;
}
+ (ExchangeWebService_DeleteAttachmentResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_DeleteAttachmentResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"RootItemId")) {
            Class elementClass = classForElement(cur) ?: [t_RootItemIdType class];
            self.RootItemId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetItemResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetItemResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_GetItemResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetItemResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_GetAttachmentType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetAttachmentType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_AttachmentShape)
        [t_AttachmentResponseShapeType serializeToChildOf:node withName:"ExchangeWebService:AttachmentShape" value:_AttachmentShape];

    if (_AttachmentIds)
        [t_NonEmptyArrayOfRequestAttachmentIdsType serializeToChildOf:node withName:"ExchangeWebService:AttachmentIds" value:_AttachmentIds];

}


- (t_AttachmentResponseShapeType *)AttachmentShape {
    if (!_AttachmentShape) _AttachmentShape = [t_AttachmentResponseShapeType new];
    return _AttachmentShape;
}
+ (ExchangeWebService_GetAttachmentType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetAttachmentType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"AttachmentShape")) {
            Class elementClass = classForElement(cur) ?: [t_AttachmentResponseShapeType class];
            self.AttachmentShape = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AttachmentIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfRequestAttachmentIdsType class];
            self.AttachmentIds = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_CreateManagedFolderRequestType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_CreateManagedFolderRequestType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FolderNames)
        [t_NonEmptyArrayOfFolderNamesType serializeToChildOf:node withName:"ExchangeWebService:FolderNames" value:_FolderNames];

    if (_Mailbox)
        [t_EmailAddressType serializeToChildOf:node withName:"ExchangeWebService:Mailbox" value:_Mailbox];

}


- (t_EmailAddressType *)Mailbox {
    if (!_Mailbox) _Mailbox = [t_EmailAddressType new];
    return _Mailbox;
}
+ (ExchangeWebService_CreateManagedFolderRequestType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_CreateManagedFolderRequestType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderNames")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfFolderNamesType class];
            self.FolderNames = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Mailbox")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.Mailbox = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_SetUserOofSettingsResponse
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SetUserOofSettingsResponse *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ResponseMessage)
        [ExchangeWebService_ResponseMessageType serializeToChildOf:node withName:"ExchangeWebService:ResponseMessage" value:_ResponseMessage];

}


- (ExchangeWebService_ResponseMessageType *)ResponseMessage {
    if (!_ResponseMessage) _ResponseMessage = [ExchangeWebService_ResponseMessageType new];
    return _ResponseMessage;
}
+ (ExchangeWebService_SetUserOofSettingsResponse *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SetUserOofSettingsResponse *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ResponseMessage")) {
            Class elementClass = classForElement(cur) ?: [ExchangeWebService_ResponseMessageType class];
            self.ResponseMessage = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_CreateManagedFolderResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_CreateManagedFolderResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_CreateManagedFolderResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_CreateManagedFolderResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_GetStreamingEventsResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetStreamingEventsResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Notifications)
        [t_NonEmptyArrayOfNotificationsType serializeToChildOf:node withName:"ExchangeWebService:Notifications" value:_Notifications];

    if (_ErrorSubscriptionIds)
        [t_NonEmptyArrayOfSubscriptionIdsType serializeToChildOf:node withName:"ExchangeWebService:ErrorSubscriptionIds" value:_ErrorSubscriptionIds];

    if (_ConnectionStatus)
        [t_ConnectionStatusType serializeToChildOf:node withName:"ExchangeWebService:ConnectionStatus" value:_ConnectionStatus];

}

+ (ExchangeWebService_GetStreamingEventsResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetStreamingEventsResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Notifications")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfNotificationsType class];
            self.Notifications = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ErrorSubscriptionIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfSubscriptionIdsType class];
            self.ErrorSubscriptionIds = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConnectionStatus")) {
            self.ConnectionStatus = [t_ConnectionStatusType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation ExchangeWebService_FindMailboxStatisticsByKeywordsResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_FindMailboxStatisticsByKeywordsResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_MailboxStatisticsSearchResult)
        [t_MailboxStatisticsSearchResultType serializeToChildOf:node withName:"ExchangeWebService:MailboxStatisticsSearchResult" value:_MailboxStatisticsSearchResult];

}


- (t_MailboxStatisticsSearchResultType *)MailboxStatisticsSearchResult {
    if (!_MailboxStatisticsSearchResult) _MailboxStatisticsSearchResult = [t_MailboxStatisticsSearchResultType new];
    return _MailboxStatisticsSearchResult;
}
+ (ExchangeWebService_FindMailboxStatisticsByKeywordsResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_FindMailboxStatisticsByKeywordsResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"MailboxStatisticsSearchResult")) {
            Class elementClass = classForElement(cur) ?: [t_MailboxStatisticsSearchResultType class];
            self.MailboxStatisticsSearchResult = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_SendNotificationResultType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SendNotificationResultType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SubscriptionStatus)
        [t_SubscriptionStatusType serializeToChildOf:node withName:"ExchangeWebService:SubscriptionStatus" value:_SubscriptionStatus];

}

+ (ExchangeWebService_SendNotificationResultType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SendNotificationResultType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SubscriptionStatus")) {
            self.SubscriptionStatus = [t_SubscriptionStatusType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation ExchangeWebService_FindItemResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_FindItemResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_FindItemResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_FindItemResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_SyncFolderItemsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SyncFolderItemsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ItemShape)
        [t_ItemResponseShapeType serializeToChildOf:node withName:"ExchangeWebService:ItemShape" value:_ItemShape];

    if (_SyncFolderId)
        [t_TargetFolderIdType serializeToChildOf:node withName:"ExchangeWebService:SyncFolderId" value:_SyncFolderId];

    if (_SyncState)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:SyncState" value:_SyncState];

    if (_Ignore)
        [t_ArrayOfBaseItemIdsType serializeToChildOf:node withName:"ExchangeWebService:Ignore" value:_Ignore];

    if (_MaxChangesReturned)
        [t_MaxSyncChangesReturnedType serializeToChildOf:node withName:"ExchangeWebService:MaxChangesReturned" value:_MaxChangesReturned];

    if (_SyncScope)
        [t_SyncFolderItemsScopeType serializeToChildOf:node withName:"ExchangeWebService:SyncScope" value:_SyncScope];

}


- (t_ItemResponseShapeType *)ItemShape {
    if (!_ItemShape) _ItemShape = [t_ItemResponseShapeType new];
    return _ItemShape;
}
+ (ExchangeWebService_SyncFolderItemsType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SyncFolderItemsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemShape")) {
            Class elementClass = classForElement(cur) ?: [t_ItemResponseShapeType class];
            self.ItemShape = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SyncFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_TargetFolderIdType class];
            self.SyncFolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SyncState")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.SyncState = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Ignore")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfBaseItemIdsType class];
            self.Ignore = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MaxChangesReturned")) {
            Class elementClass = classForElement(cur) ?: [t_MaxSyncChangesReturnedType class];
            self.MaxChangesReturned = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SyncScope")) {
            self.SyncScope = [t_SyncFolderItemsScopeType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation ExchangeWebService_SyncFolderItemsResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SyncFolderItemsResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_SyncState)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:SyncState" value:_SyncState];

    if (_IncludesLastItemInRange)
        [xsd_boolean serializeToChildOf:node withName:"ExchangeWebService:IncludesLastItemInRange" value:_IncludesLastItemInRange];

    if (_Changes)
        [t_SyncFolderItemsChangesType serializeToChildOf:node withName:"ExchangeWebService:Changes" value:_Changes];

}

+ (ExchangeWebService_SyncFolderItemsResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SyncFolderItemsResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SyncState")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.SyncState = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"IncludesLastItemInRange")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.IncludesLastItemInRange = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Changes")) {
            Class elementClass = classForElement(cur) ?: [t_SyncFolderItemsChangesType class];
            self.Changes = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_ResolveNamesType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ResolveNamesType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_boolean serializeToProperty:"ReturnFullContactData" onNode:node value:_ReturnFullContactData];
    [t_ResolveNamesSearchScopeType serializeToProperty:"SearchScope" onNode:node value:_SearchScope];
    [t_DefaultShapeNamesType serializeToProperty:"ContactDataShape" onNode:node value:_ContactDataShape];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ParentFolderIds)
        [t_NonEmptyArrayOfBaseFolderIdsType serializeToChildOf:node withName:"ExchangeWebService:ParentFolderIds" value:_ParentFolderIds];

    if (_UnresolvedEntry)
        [t_NonEmptyStringType serializeToChildOf:node withName:"ExchangeWebService:UnresolvedEntry" value:_UnresolvedEntry];

}


+ (ExchangeWebService_ResolveNamesType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ResolveNamesType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.ReturnFullContactData = [xsd_boolean deserializeAttribute:"ReturnFullContactData" ofNode:cur];
    self.SearchScope = [t_ResolveNamesSearchScopeType deserializeAttribute:"SearchScope" ofNode:cur];
    self.ContactDataShape = [t_DefaultShapeNamesType deserializeAttribute:"ContactDataShape" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ParentFolderIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseFolderIdsType class];
            self.ParentFolderIds = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"UnresolvedEntry")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.UnresolvedEntry = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_ArrayOfFreeBusyResponse
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"FreeBusyResponse")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_FreeBusyResponseType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (ExchangeWebService_FreeBusyResponseType * item in value)
        [ExchangeWebService_FreeBusyResponseType serializeToChildOf:child withName:"ExchangeWebService:FreeBusyResponse" value:item];
}
@end
@implementation ExchangeWebService_GetPhoneCallInformationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetPhoneCallInformationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_PhoneCallId)
        [t_PhoneCallIdType serializeToChildOf:node withName:"ExchangeWebService:PhoneCallId" value:_PhoneCallId];

}


- (t_PhoneCallIdType *)PhoneCallId {
    if (!_PhoneCallId) _PhoneCallId = [t_PhoneCallIdType new];
    return _PhoneCallId;
}
+ (ExchangeWebService_GetPhoneCallInformationType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetPhoneCallInformationType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"PhoneCallId")) {
            Class elementClass = classForElement(cur) ?: [t_PhoneCallIdType class];
            self.PhoneCallId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetUserOofSettingsRequest
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetUserOofSettingsRequest *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Mailbox)
        [t_EmailAddress serializeToChildOf:node withName:"ExchangeWebService:Mailbox" value:_Mailbox];

}


- (t_EmailAddress *)Mailbox {
    if (!_Mailbox) _Mailbox = [t_EmailAddress new];
    return _Mailbox;
}
+ (ExchangeWebService_GetUserOofSettingsRequest *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetUserOofSettingsRequest *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Mailbox")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddress class];
            self.Mailbox = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_PlayOnPhoneType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_PlayOnPhoneType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ItemId)
        [t_ItemIdType serializeToChildOf:node withName:"ExchangeWebService:ItemId" value:_ItemId];

    if (_DialString)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:DialString" value:_DialString];

}


- (t_ItemIdType *)ItemId {
    if (!_ItemId) _ItemId = [t_ItemIdType new];
    return _ItemId;
}
+ (ExchangeWebService_PlayOnPhoneType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_PlayOnPhoneType *newObject = [self new];

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
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DialString")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.DialString = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_UploadItemsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UploadItemsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Items)
        [t_NonEmptyArrayOfUploadItemsType serializeToChildOf:node withName:"ExchangeWebService:Items" value:_Items];

}

+ (ExchangeWebService_UploadItemsType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UploadItemsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Items")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfUploadItemsType class];
            self.Items = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetPhoneCallInformationResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetPhoneCallInformationResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_PhoneCallInformation)
        [t_PhoneCallInformationType serializeToChildOf:node withName:"ExchangeWebService:PhoneCallInformation" value:_PhoneCallInformation];

}


- (t_PhoneCallInformationType *)PhoneCallInformation {
    if (!_PhoneCallInformation) _PhoneCallInformation = [t_PhoneCallInformationType new];
    return _PhoneCallInformation;
}
+ (ExchangeWebService_GetPhoneCallInformationResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetPhoneCallInformationResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"PhoneCallInformation")) {
            Class elementClass = classForElement(cur) ?: [t_PhoneCallInformationType class];
            self.PhoneCallInformation = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_DelegateUserResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_DelegateUserResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_DelegateUser)
        [t_DelegateUserType serializeToChildOf:node withName:"ExchangeWebService:DelegateUser" value:_DelegateUser];

}


- (t_DelegateUserType *)DelegateUser {
    if (!_DelegateUser) _DelegateUser = [t_DelegateUserType new];
    return _DelegateUser;
}
+ (ExchangeWebService_DelegateUserResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_DelegateUserResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"DelegateUser")) {
            Class elementClass = classForElement(cur) ?: [t_DelegateUserType class];
            self.DelegateUser = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_FindFolderResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_FindFolderResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_RootFolder)
        [t_FindFolderParentType serializeToChildOf:node withName:"ExchangeWebService:RootFolder" value:_RootFolder];

}


- (t_FindFolderParentType *)RootFolder {
    if (!_RootFolder) _RootFolder = [t_FindFolderParentType new];
    return _RootFolder;
}
+ (ExchangeWebService_FindFolderResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_FindFolderResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"RootFolder")) {
            Class elementClass = classForElement(cur) ?: [t_FindFolderParentType class];
            self.RootFolder = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_SubscribeResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SubscribeResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_SubscriptionId)
        [t_SubscriptionIdType serializeToChildOf:node withName:"ExchangeWebService:SubscriptionId" value:_SubscriptionId];

    if (_Watermark)
        [t_WatermarkType serializeToChildOf:node withName:"ExchangeWebService:Watermark" value:_Watermark];

}

+ (ExchangeWebService_SubscribeResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SubscribeResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SubscriptionId")) {
            Class elementClass = classForElement(cur) ?: [t_SubscriptionIdType class];
            self.SubscriptionId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Watermark")) {
            Class elementClass = classForElement(cur) ?: [t_WatermarkType class];
            self.Watermark = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_UpdateDelegateType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UpdateDelegateType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_DelegateUsers)
        [t_ArrayOfDelegateUserType serializeToChildOf:node withName:"ExchangeWebService:DelegateUsers" value:_DelegateUsers];

    if (_DeliverMeetingRequests)
        [t_DeliverMeetingRequestsType serializeToChildOf:node withName:"ExchangeWebService:DeliverMeetingRequests" value:_DeliverMeetingRequests];

}

+ (ExchangeWebService_UpdateDelegateType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UpdateDelegateType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"DelegateUsers")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfDelegateUserType class];
            self.DelegateUsers = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DeliverMeetingRequests")) {
            self.DeliverMeetingRequests = [t_DeliverMeetingRequestsType deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetPasswordExpirationDateResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetPasswordExpirationDateResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_PasswordExpirationDate)
        [xsd_dateTime serializeToChildOf:node withName:"ExchangeWebService:PasswordExpirationDate" value:_PasswordExpirationDate];

}

+ (ExchangeWebService_GetPasswordExpirationDateResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetPasswordExpirationDateResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"PasswordExpirationDate")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.PasswordExpirationDate = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_FindMessageTrackingReportRequestType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_FindMessageTrackingReportRequestType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Scope)
        [t_NonEmptyStringType serializeToChildOf:node withName:"ExchangeWebService:Scope" value:_Scope];

    if (_Domain)
        [t_NonEmptyStringType serializeToChildOf:node withName:"ExchangeWebService:Domain" value:_Domain];

    if (_Sender)
        [t_EmailAddressType serializeToChildOf:node withName:"ExchangeWebService:Sender" value:_Sender];

    if (_PurportedSender)
        [t_EmailAddressType serializeToChildOf:node withName:"ExchangeWebService:PurportedSender" value:_PurportedSender];

    if (_Recipient)
        [t_EmailAddressType serializeToChildOf:node withName:"ExchangeWebService:Recipient" value:_Recipient];

    if (_Subject)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:Subject" value:_Subject];

    if (_StartDateTime)
        [xsd_dateTime serializeToChildOf:node withName:"ExchangeWebService:StartDateTime" value:_StartDateTime];

    if (_EndDateTime)
        [xsd_dateTime serializeToChildOf:node withName:"ExchangeWebService:EndDateTime" value:_EndDateTime];

    if (_MessageId)
        [t_NonEmptyStringType serializeToChildOf:node withName:"ExchangeWebService:MessageId" value:_MessageId];

    if (_FederatedDeliveryMailbox)
        [t_EmailAddressType serializeToChildOf:node withName:"ExchangeWebService:FederatedDeliveryMailbox" value:_FederatedDeliveryMailbox];

    if (_DiagnosticsLevel)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:DiagnosticsLevel" value:_DiagnosticsLevel];

    if (_ServerHint)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:ServerHint" value:_ServerHint];

    if (_Properties)
        [t_ArrayOfTrackingPropertiesType serializeToChildOf:node withName:"ExchangeWebService:Properties" value:_Properties];

}


- (t_EmailAddressType *)Sender {
    if (!_Sender) _Sender = [t_EmailAddressType new];
    return _Sender;
}

- (t_EmailAddressType *)PurportedSender {
    if (!_PurportedSender) _PurportedSender = [t_EmailAddressType new];
    return _PurportedSender;
}

- (t_EmailAddressType *)Recipient {
    if (!_Recipient) _Recipient = [t_EmailAddressType new];
    return _Recipient;
}

- (t_EmailAddressType *)FederatedDeliveryMailbox {
    if (!_FederatedDeliveryMailbox) _FederatedDeliveryMailbox = [t_EmailAddressType new];
    return _FederatedDeliveryMailbox;
}
+ (ExchangeWebService_FindMessageTrackingReportRequestType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_FindMessageTrackingReportRequestType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Scope")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.Scope = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Domain")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.Domain = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Sender")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.Sender = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"PurportedSender")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.PurportedSender = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Recipient")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.Recipient = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Subject")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.Subject = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"StartDateTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.StartDateTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"EndDateTime")) {
            Class elementClass = classForElement(cur) ?: [xsd_dateTime class];
            self.EndDateTime = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MessageId")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.MessageId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FederatedDeliveryMailbox")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.FederatedDeliveryMailbox = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DiagnosticsLevel")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.DiagnosticsLevel = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ServerHint")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.ServerHint = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Properties")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfTrackingPropertiesType class];
            self.Properties = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_DeleteFolderResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_DeleteFolderResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_DeleteFolderResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_DeleteFolderResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_CopyFolderResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_CopyFolderResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_CopyFolderResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_CopyFolderResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_DeleteUserConfigurationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_DeleteUserConfigurationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_UserConfigurationName)
        [t_UserConfigurationNameType serializeToChildOf:node withName:"ExchangeWebService:UserConfigurationName" value:_UserConfigurationName];

}


- (t_UserConfigurationNameType *)UserConfigurationName {
    if (!_UserConfigurationName) _UserConfigurationName = [t_UserConfigurationNameType new];
    return _UserConfigurationName;
}
+ (ExchangeWebService_DeleteUserConfigurationType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_DeleteUserConfigurationType *newObject = [self new];

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
    }
}
@end
@implementation ExchangeWebService_EmptyFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_EmptyFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_DisposalType serializeToProperty:"DeleteType" onNode:node value:_DeleteType];
    [xsd_boolean serializeToProperty:"DeleteSubFolders" onNode:node value:_DeleteSubFolders];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FolderIds)
        [t_NonEmptyArrayOfBaseFolderIdsType serializeToChildOf:node withName:"ExchangeWebService:FolderIds" value:_FolderIds];

}


+ (ExchangeWebService_EmptyFolderType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_EmptyFolderType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.DeleteType = [t_DisposalType deserializeAttribute:"DeleteType" ofNode:cur];
    self.DeleteSubFolders = [xsd_boolean deserializeAttribute:"DeleteSubFolders" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseFolderIdsType class];
            self.FolderIds = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetServerTimeZonesResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetServerTimeZonesResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_TimeZoneDefinitions)
        [t_ArrayOfTimeZoneDefinitionType serializeToChildOf:node withName:"ExchangeWebService:TimeZoneDefinitions" value:_TimeZoneDefinitions];

}

+ (ExchangeWebService_GetServerTimeZonesResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetServerTimeZonesResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"TimeZoneDefinitions")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfTimeZoneDefinitionType class];
            self.TimeZoneDefinitions = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetServiceConfigurationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetServiceConfigurationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ActingAs)
        [t_EmailAddressType serializeToChildOf:node withName:"ExchangeWebService:ActingAs" value:_ActingAs];

    if (_RequestedConfiguration)
        [ExchangeWebService_ArrayOfServiceConfigurationType serializeToChildOf:node withName:"ExchangeWebService:RequestedConfiguration" value:_RequestedConfiguration];

}


- (t_EmailAddressType *)ActingAs {
    if (!_ActingAs) _ActingAs = [t_EmailAddressType new];
    return _ActingAs;
}
+ (ExchangeWebService_GetServiceConfigurationType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetServiceConfigurationType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ActingAs")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.ActingAs = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RequestedConfiguration")) {
            Class elementClass = classForElement(cur) ?: [ExchangeWebService_ArrayOfServiceConfigurationType class];
            self.RequestedConfiguration = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_MoveFolderResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_MoveFolderResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_MoveFolderResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_MoveFolderResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_GetEventsResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetEventsResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_GetEventsResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetEventsResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_GetUserAvailabilityResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetUserAvailabilityResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FreeBusyResponseArray)
        [ExchangeWebService_ArrayOfFreeBusyResponse serializeToChildOf:node withName:"ExchangeWebService:FreeBusyResponseArray" value:_FreeBusyResponseArray];

    if (_SuggestionsResponse)
        [ExchangeWebService_SuggestionsResponseType serializeToChildOf:node withName:"ExchangeWebService:SuggestionsResponse" value:_SuggestionsResponse];

}


- (ExchangeWebService_SuggestionsResponseType *)SuggestionsResponse {
    if (!_SuggestionsResponse) _SuggestionsResponse = [ExchangeWebService_SuggestionsResponseType new];
    return _SuggestionsResponse;
}
+ (ExchangeWebService_GetUserAvailabilityResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetUserAvailabilityResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FreeBusyResponseArray")) {
            Class elementClass = classForElement(cur) ?: [ExchangeWebService_ArrayOfFreeBusyResponse class];
            self.FreeBusyResponseArray = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SuggestionsResponse")) {
            Class elementClass = classForElement(cur) ?: [ExchangeWebService_SuggestionsResponseType class];
            self.SuggestionsResponse = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_FindFolderResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_FindFolderResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_FindFolderResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_FindFolderResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_CreateUserConfigurationResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_CreateUserConfigurationResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_CreateUserConfigurationResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_CreateUserConfigurationResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_DeleteItemResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_DeleteItemResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_DeleteItemResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_DeleteItemResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_SetUserOofSettingsRequest
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SetUserOofSettingsRequest *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Mailbox)
        [t_EmailAddress serializeToChildOf:node withName:"ExchangeWebService:Mailbox" value:_Mailbox];

    if (_UserOofSettings)
        [t_UserOofSettings serializeToChildOf:node withName:"ExchangeWebService:UserOofSettings" value:_UserOofSettings];

}


- (t_EmailAddress *)Mailbox {
    if (!_Mailbox) _Mailbox = [t_EmailAddress new];
    return _Mailbox;
}

- (t_UserOofSettings *)UserOofSettings {
    if (!_UserOofSettings) _UserOofSettings = [t_UserOofSettings new];
    return _UserOofSettings;
}
+ (ExchangeWebService_SetUserOofSettingsRequest *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SetUserOofSettingsRequest *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Mailbox")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddress class];
            self.Mailbox = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"UserOofSettings")) {
            Class elementClass = classForElement(cur) ?: [t_UserOofSettings class];
            self.UserOofSettings = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetMessageTrackingReportRequestType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetMessageTrackingReportRequestType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Scope)
        [t_NonEmptyStringType serializeToChildOf:node withName:"ExchangeWebService:Scope" value:_Scope];

    if (_ReportTemplate)
        [t_MessageTrackingReportTemplateType serializeToChildOf:node withName:"ExchangeWebService:ReportTemplate" value:_ReportTemplate];

    if (_RecipientFilter)
        [t_EmailAddressType serializeToChildOf:node withName:"ExchangeWebService:RecipientFilter" value:_RecipientFilter];

    if (_MessageTrackingReportId)
        [t_NonEmptyStringType serializeToChildOf:node withName:"ExchangeWebService:MessageTrackingReportId" value:_MessageTrackingReportId];

    if (_ReturnQueueEvents)
        [xsd_boolean serializeToChildOf:node withName:"ExchangeWebService:ReturnQueueEvents" value:_ReturnQueueEvents];

    if (_DiagnosticsLevel)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:DiagnosticsLevel" value:_DiagnosticsLevel];

    if (_Properties)
        [t_ArrayOfTrackingPropertiesType serializeToChildOf:node withName:"ExchangeWebService:Properties" value:_Properties];

}


- (t_EmailAddressType *)RecipientFilter {
    if (!_RecipientFilter) _RecipientFilter = [t_EmailAddressType new];
    return _RecipientFilter;
}
+ (ExchangeWebService_GetMessageTrackingReportRequestType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetMessageTrackingReportRequestType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Scope")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.Scope = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ReportTemplate")) {
            self.ReportTemplate = [t_MessageTrackingReportTemplateType deserializeNodeRaw:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RecipientFilter")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.RecipientFilter = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MessageTrackingReportId")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.MessageTrackingReportId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ReturnQueueEvents")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.ReturnQueueEvents = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"DiagnosticsLevel")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.DiagnosticsLevel = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Properties")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfTrackingPropertiesType class];
            self.Properties = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_ArrayOfServiceConfigurationResponseMessageType
+ (NSArray *)deserializeNode:(xmlNodePtr)cur {
    NSMutableArray *ret = [NSMutableArray new];
    for (xmlNodePtr child = cur->children; child; child = child->next) {
        if (false);
        else if (xmlStrEqual(child->name, (const xmlChar *)"ServiceConfigurationResponseMessageType")) {
            Class elementClass = classForElement(child) ?: [ExchangeWebService_ServiceConfigurationResponseMessageType class];
            [ret addObject:[elementClass deserializeNode:child]];
        }
    }
    return ret;
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    for (ExchangeWebService_ServiceConfigurationResponseMessageType * item in value)
        [ExchangeWebService_ServiceConfigurationResponseMessageType serializeToChildOf:child withName:"ExchangeWebService:ServiceConfigurationResponseMessageType" value:item];
}
@end
@implementation ExchangeWebService_GetServiceConfigurationResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetServiceConfigurationResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_ResponseMessages)
        [ExchangeWebService_ArrayOfServiceConfigurationResponseMessageType serializeToChildOf:node withName:"ExchangeWebService:ResponseMessages" value:_ResponseMessages];

}

+ (ExchangeWebService_GetServiceConfigurationResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetServiceConfigurationResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ResponseMessages")) {
            Class elementClass = classForElement(cur) ?: [ExchangeWebService_ArrayOfServiceConfigurationResponseMessageType class];
            self.ResponseMessages = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_BaseMoveCopyItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_BaseMoveCopyItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ToFolderId)
        [t_TargetFolderIdType serializeToChildOf:node withName:"ExchangeWebService:ToFolderId" value:_ToFolderId];

    if (_ItemIds)
        [t_NonEmptyArrayOfBaseItemIdsType serializeToChildOf:node withName:"ExchangeWebService:ItemIds" value:_ItemIds];

    if (_ReturnNewItemIds)
        [xsd_boolean serializeToChildOf:node withName:"ExchangeWebService:ReturnNewItemIds" value:_ReturnNewItemIds];

}

+ (ExchangeWebService_BaseMoveCopyItemType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_BaseMoveCopyItemType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ToFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_TargetFolderIdType class];
            self.ToFolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseItemIdsType class];
            self.ItemIds = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ReturnNewItemIds")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.ReturnNewItemIds = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetUserOofSettingsResponse
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetUserOofSettingsResponse *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ResponseMessage)
        [ExchangeWebService_ResponseMessageType serializeToChildOf:node withName:"ExchangeWebService:ResponseMessage" value:_ResponseMessage];

    if (_OofSettings)
        [t_UserOofSettings serializeToChildOf:node withName:"ExchangeWebService:OofSettings" value:_OofSettings];

    if (_AllowExternalOof)
        [t_ExternalAudience serializeToChildOf:node withName:"ExchangeWebService:AllowExternalOof" value:_AllowExternalOof];

}


- (ExchangeWebService_ResponseMessageType *)ResponseMessage {
    if (!_ResponseMessage) _ResponseMessage = [ExchangeWebService_ResponseMessageType new];
    return _ResponseMessage;
}

- (t_UserOofSettings *)OofSettings {
    if (!_OofSettings) _OofSettings = [t_UserOofSettings new];
    return _OofSettings;
}
+ (ExchangeWebService_GetUserOofSettingsResponse *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetUserOofSettingsResponse *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ResponseMessage")) {
            Class elementClass = classForElement(cur) ?: [ExchangeWebService_ResponseMessageType class];
            self.ResponseMessage = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"OofSettings")) {
            Class elementClass = classForElement(cur) ?: [t_UserOofSettings class];
            self.OofSettings = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"AllowExternalOof")) {
            self.AllowExternalOof = [t_ExternalAudience deserializeNodeRaw:cur];
        }
    }
}
@end
@implementation ExchangeWebService_CopyItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_CopyItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_CopyItemType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_CopyItemType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_GetUserAvailabilityRequestType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetUserAvailabilityRequestType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);
    
    xmlNewProp(child, (xmlChar *) [@"xmlns" UTF8String], (xmlChar *)[@"http://schemas.microsoft.com/exchange/services/2006/messages" UTF8String]);
    xmlNewProp(child, (xmlChar *) [@"xmlns:t" UTF8String], (xmlChar *)[@"http://schemas.microsoft.com/exchange/services/2006/types" UTF8String]);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_TimeZone)
        [t_SerializableTimeZone serializeToChildOf:node withName:"t:TimeZone" value:_TimeZone];

    if (_MailboxDataArray)
        [t_ArrayOfMailboxData serializeToChildOf:node withName:"MailboxDataArray" value:_MailboxDataArray];

    if (_FreeBusyViewOptions)
        [t_FreeBusyViewOptionsType serializeToChildOf:node withName:"t:FreeBusyViewOptions" value:_FreeBusyViewOptions];

    if (_SuggestionsViewOptions)
        [t_SuggestionsViewOptionsType serializeToChildOf:node withName:"ExchangeWebService:SuggestionsViewOptions" value:_SuggestionsViewOptions];

}


- (t_SerializableTimeZone *)TimeZone {
    if (!_TimeZone) _TimeZone = [t_SerializableTimeZone new];
    return _TimeZone;
}

- (t_FreeBusyViewOptionsType *)FreeBusyViewOptions {
    if (!_FreeBusyViewOptions) _FreeBusyViewOptions = [t_FreeBusyViewOptionsType new];
    return _FreeBusyViewOptions;
}

- (t_SuggestionsViewOptionsType *)SuggestionsViewOptions {
    if (!_SuggestionsViewOptions) _SuggestionsViewOptions = [t_SuggestionsViewOptionsType new];
    return _SuggestionsViewOptions;
}
+ (ExchangeWebService_GetUserAvailabilityRequestType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetUserAvailabilityRequestType *newObject = [self new];

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
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MailboxDataArray")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfMailboxData class];
            self.MailboxDataArray = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FreeBusyViewOptions")) {
            Class elementClass = classForElement(cur) ?: [t_FreeBusyViewOptionsType class];
            self.FreeBusyViewOptions = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SuggestionsViewOptions")) {
            Class elementClass = classForElement(cur) ?: [t_SuggestionsViewOptionsType class];
            self.SuggestionsViewOptions = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_MoveItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_MoveItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_MoveItemType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_MoveItemType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_GetUserConfigurationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetUserConfigurationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_UserConfigurationName)
        [t_UserConfigurationNameType serializeToChildOf:node withName:"ExchangeWebService:UserConfigurationName" value:_UserConfigurationName];

    if (_UserConfigurationProperties)
        [t_UserConfigurationPropertyType serializeToChildOf:node withName:"ExchangeWebService:UserConfigurationProperties" value:_UserConfigurationProperties];

}


- (t_UserConfigurationNameType *)UserConfigurationName {
    if (!_UserConfigurationName) _UserConfigurationName = [t_UserConfigurationNameType new];
    return _UserConfigurationName;
}
+ (ExchangeWebService_GetUserConfigurationType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetUserConfigurationType *newObject = [self new];

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
        else if (xmlStrEqual(cur->name, (const xmlChar *)"UserConfigurationProperties")) {
            Class elementClass = classForElement(cur) ?: [t_UserConfigurationPropertyType class];
            self.UserConfigurationProperties = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_MoveFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_MoveFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_MoveFolderType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_MoveFolderType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_FindMailboxStatisticsByKeywordsResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_FindMailboxStatisticsByKeywordsResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_FindMailboxStatisticsByKeywordsResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_FindMailboxStatisticsByKeywordsResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_UpdateItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UpdateItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_ConflictResolutionType serializeToProperty:"ConflictResolution" onNode:node value:_ConflictResolution];
    [t_MessageDispositionType serializeToProperty:"MessageDisposition" onNode:node value:_MessageDisposition];
    [t_CalendarItemUpdateOperationType serializeToProperty:"SendMeetingInvitationsOrCancellations" onNode:node value:_SendMeetingInvitationsOrCancellations];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SavedItemFolderId)
        [t_TargetFolderIdType serializeToChildOf:node withName:"ExchangeWebService:SavedItemFolderId" value:_SavedItemFolderId];

    if (_ItemChanges)
        [t_NonEmptyArrayOfItemChangesType serializeToChildOf:node withName:"ExchangeWebService:ItemChanges" value:_ItemChanges];

}


+ (ExchangeWebService_UpdateItemType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UpdateItemType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.ConflictResolution = [t_ConflictResolutionType deserializeAttribute:"ConflictResolution" ofNode:cur];
    self.MessageDisposition = [t_MessageDispositionType deserializeAttribute:"MessageDisposition" ofNode:cur];
    self.SendMeetingInvitationsOrCancellations = [t_CalendarItemUpdateOperationType deserializeAttribute:"SendMeetingInvitationsOrCancellations" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SavedItemFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_TargetFolderIdType class];
            self.SavedItemFolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemChanges")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfItemChangesType class];
            self.ItemChanges = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_PlayOnPhoneResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_PlayOnPhoneResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_PhoneCallId)
        [t_PhoneCallIdType serializeToChildOf:node withName:"ExchangeWebService:PhoneCallId" value:_PhoneCallId];

}


- (t_PhoneCallIdType *)PhoneCallId {
    if (!_PhoneCallId) _PhoneCallId = [t_PhoneCallIdType new];
    return _PhoneCallId;
}
+ (ExchangeWebService_PlayOnPhoneResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_PlayOnPhoneResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"PhoneCallId")) {
            Class elementClass = classForElement(cur) ?: [t_PhoneCallIdType class];
            self.PhoneCallId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FolderShape)
        [t_FolderResponseShapeType serializeToChildOf:node withName:"ExchangeWebService:FolderShape" value:_FolderShape];

    if (_FolderIds)
        [t_NonEmptyArrayOfBaseFolderIdsType serializeToChildOf:node withName:"ExchangeWebService:FolderIds" value:_FolderIds];

}


- (t_FolderResponseShapeType *)FolderShape {
    if (!_FolderShape) _FolderShape = [t_FolderResponseShapeType new];
    return _FolderShape;
}
+ (ExchangeWebService_GetFolderType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetFolderType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderShape")) {
            Class elementClass = classForElement(cur) ?: [t_FolderResponseShapeType class];
            self.FolderShape = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseFolderIdsType class];
            self.FolderIds = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_UnsubscribeResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UnsubscribeResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_UnsubscribeResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UnsubscribeResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_FreeBusyResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_FreeBusyResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ResponseMessage)
        [ExchangeWebService_ResponseMessageType serializeToChildOf:node withName:"ExchangeWebService:ResponseMessage" value:_ResponseMessage];

    if (_FreeBusyView)
        [t_FreeBusyView serializeToChildOf:node withName:"ExchangeWebService:FreeBusyView" value:_FreeBusyView];

}


- (ExchangeWebService_ResponseMessageType *)ResponseMessage {
    if (!_ResponseMessage) _ResponseMessage = [ExchangeWebService_ResponseMessageType new];
    return _ResponseMessage;
}

- (t_FreeBusyView *)FreeBusyView {
    if (!_FreeBusyView) _FreeBusyView = [t_FreeBusyView new];
    return _FreeBusyView;
}
+ (ExchangeWebService_FreeBusyResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_FreeBusyResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ResponseMessage")) {
            Class elementClass = classForElement(cur) ?: [ExchangeWebService_ResponseMessageType class];
            self.ResponseMessage = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"FreeBusyView")) {
            Class elementClass = classForElement(cur) ?: [t_FreeBusyView class];
            self.FreeBusyView = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_RemoveDelegateType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_RemoveDelegateType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_UserIds)
        [t_ArrayOfUserIdType serializeToChildOf:node withName:"ExchangeWebService:UserIds" value:_UserIds];

}

+ (ExchangeWebService_RemoveDelegateType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_RemoveDelegateType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"UserIds")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfUserIdType class];
            self.UserIds = [elementClass deserializeNode:cur];
        }
    }
}
@end

@implementation ExchangeWebService_FindConversationResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_FindConversationResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Conversations)
        [t_ArrayOfConversationsType serializeToChildOf:node withName:"ExchangeWebService:Conversations" value:_Conversations];

}

+ (ExchangeWebService_FindConversationResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_FindConversationResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Conversations")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfConversationsType class];
            self.Conversations = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_RefreshSharingFolderType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_RefreshSharingFolderType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SharingFolderId)
        [t_FolderIdType serializeToChildOf:node withName:"ExchangeWebService:SharingFolderId" value:_SharingFolderId];

}


- (t_FolderIdType *)SharingFolderId {
    if (!_SharingFolderId) _SharingFolderId = [t_FolderIdType new];
    return _SharingFolderId;
}
+ (ExchangeWebService_RefreshSharingFolderType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_RefreshSharingFolderType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SharingFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_FolderIdType class];
            self.SharingFolderId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_SendNotificationResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SendNotificationResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Notification)
        [t_NotificationType serializeToChildOf:node withName:"ExchangeWebService:Notification" value:_Notification];

}


- (t_NotificationType *)Notification {
    if (!_Notification) _Notification = [t_NotificationType new];
    return _Notification;
}
+ (ExchangeWebService_SendNotificationResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SendNotificationResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Notification")) {
            Class elementClass = classForElement(cur) ?: [t_NotificationType class];
            self.Notification = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_SendItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SendItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_boolean serializeToProperty:"SaveItemToFolder" onNode:node value:_SaveItemToFolder];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ItemIds)
        [t_NonEmptyArrayOfBaseItemIdsType serializeToChildOf:node withName:"ExchangeWebService:ItemIds" value:_ItemIds];

    if (_SavedItemFolderId)
        [t_TargetFolderIdType serializeToChildOf:node withName:"ExchangeWebService:SavedItemFolderId" value:_SavedItemFolderId];

}


+ (ExchangeWebService_SendItemType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SendItemType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.SaveItemToFolder = [xsd_boolean deserializeAttribute:"SaveItemToFolder" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseItemIdsType class];
            self.ItemIds = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SavedItemFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_TargetFolderIdType class];
            self.SavedItemFolderId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetInboxRulesResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetInboxRulesResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_OutlookRuleBlobExists)
        [xsd_boolean serializeToChildOf:node withName:"ExchangeWebService:OutlookRuleBlobExists" value:_OutlookRuleBlobExists];

    if (_InboxRules)
        [t_ArrayOfRulesType serializeToChildOf:node withName:"ExchangeWebService:InboxRules" value:_InboxRules];

}

+ (ExchangeWebService_GetInboxRulesResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetInboxRulesResponseType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"OutlookRuleBlobExists")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.OutlookRuleBlobExists = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"InboxRules")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRulesType class];
            self.InboxRules = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetStreamingEventsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetStreamingEventsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SubscriptionIds)
        [t_NonEmptyArrayOfSubscriptionIdsType serializeToChildOf:node withName:"ExchangeWebService:SubscriptionIds" value:_SubscriptionIds];

    if (_ConnectionTimeout)
        [t_StreamingSubscriptionConnectionTimeoutType serializeToChildOf:node withName:"ExchangeWebService:ConnectionTimeout" value:_ConnectionTimeout];

}

+ (ExchangeWebService_GetStreamingEventsType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetStreamingEventsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SubscriptionIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfSubscriptionIdsType class];
            self.SubscriptionIds = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConnectionTimeout")) {
            Class elementClass = classForElement(cur) ?: [t_StreamingSubscriptionConnectionTimeoutType class];
            self.ConnectionTimeout = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_UpdateItemResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UpdateItemResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_ConflictResults)
        [t_ConflictResultsType serializeToChildOf:node withName:"ExchangeWebService:ConflictResults" value:_ConflictResults];

}


- (t_ConflictResultsType *)ConflictResults {
    if (!_ConflictResults) _ConflictResults = [t_ConflictResultsType new];
    return _ConflictResults;
}
+ (ExchangeWebService_UpdateItemResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UpdateItemResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ConflictResults")) {
            Class elementClass = classForElement(cur) ?: [t_ConflictResultsType class];
            self.ConflictResults = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetEventsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetEventsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SubscriptionId)
        [t_SubscriptionIdType serializeToChildOf:node withName:"ExchangeWebService:SubscriptionId" value:_SubscriptionId];

    if (_Watermark)
        [t_WatermarkType serializeToChildOf:node withName:"ExchangeWebService:Watermark" value:_Watermark];

}

+ (ExchangeWebService_GetEventsType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetEventsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SubscriptionId")) {
            Class elementClass = classForElement(cur) ?: [t_SubscriptionIdType class];
            self.SubscriptionId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Watermark")) {
            Class elementClass = classForElement(cur) ?: [t_WatermarkType class];
            self.Watermark = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetAttachmentResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetAttachmentResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_GetAttachmentResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetAttachmentResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_GetUserConfigurationResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetUserConfigurationResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_UserConfiguration)
        [t_UserConfigurationType serializeToChildOf:node withName:"ExchangeWebService:UserConfiguration" value:_UserConfiguration];

}


- (t_UserConfigurationType *)UserConfiguration {
    if (!_UserConfiguration) _UserConfiguration = [t_UserConfigurationType new];
    return _UserConfiguration;
}
+ (ExchangeWebService_GetUserConfigurationResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetUserConfigurationResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"UserConfiguration")) {
            Class elementClass = classForElement(cur) ?: [t_UserConfigurationType class];
            self.UserConfiguration = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetMailTipsType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetMailTipsType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SendingAs)
        [t_EmailAddressType serializeToChildOf:node withName:"ExchangeWebService:SendingAs" value:_SendingAs];

    if (_Recipients)
        [t_ArrayOfRecipientsType serializeToChildOf:node withName:"ExchangeWebService:Recipients" value:_Recipients];

    if (_MailTipsRequested)
        [t_MailTipTypes serializeToChildOf:node withName:"ExchangeWebService:MailTipsRequested" value:_MailTipsRequested];

}


- (t_EmailAddressType *)SendingAs {
    if (!_SendingAs) _SendingAs = [t_EmailAddressType new];
    return _SendingAs;
}
+ (ExchangeWebService_GetMailTipsType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetMailTipsType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SendingAs")) {
            Class elementClass = classForElement(cur) ?: [t_EmailAddressType class];
            self.SendingAs = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Recipients")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRecipientsType class];
            self.Recipients = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MailTipsRequested")) {
            Class elementClass = classForElement(cur) ?: [t_MailTipTypes class];
            self.MailTipsRequested = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_ExpandDLResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ExpandDLResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_ExpandDLResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ExpandDLResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_GetItemType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetItemType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ItemShape)
        [t_ItemResponseShapeType serializeToChildOf:node withName:"ExchangeWebService:ItemShape" value:_ItemShape];

    if (_ItemIds)
        [t_NonEmptyArrayOfBaseItemIdsType serializeToChildOf:node withName:"ExchangeWebService:ItemIds" value:_ItemIds];

}


- (t_ItemResponseShapeType *)ItemShape {
    if (!_ItemShape) _ItemShape = [t_ItemResponseShapeType new];
    return _ItemShape;
}
+ (ExchangeWebService_GetItemType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetItemType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemShape")) {
            Class elementClass = classForElement(cur) ?: [t_ItemResponseShapeType class];
            self.ItemShape = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfBaseItemIdsType class];
            self.ItemIds = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_UpdateInboxRulesResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UpdateInboxRulesResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_RuleOperationErrors)
        [t_ArrayOfRuleOperationErrorsType serializeToChildOf:node withName:"ExchangeWebService:RuleOperationErrors" value:_RuleOperationErrors];

}

+ (ExchangeWebService_UpdateInboxRulesResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UpdateInboxRulesResponseType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"RuleOperationErrors")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRuleOperationErrorsType class];
            self.RuleOperationErrors = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetServerTimeZonesResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetServerTimeZonesResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_GetServerTimeZonesResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetServerTimeZonesResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_ConvertIdType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ConvertIdType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [t_IdFormatType serializeToProperty:"DestinationFormat" onNode:node value:_DestinationFormat];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_SourceIds)
        [t_NonEmptyArrayOfAlternateIdsType serializeToChildOf:node withName:"ExchangeWebService:SourceIds" value:_SourceIds];

}


+ (ExchangeWebService_ConvertIdType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ConvertIdType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.DestinationFormat = [t_IdFormatType deserializeAttribute:"DestinationFormat" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SourceIds")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyArrayOfAlternateIdsType class];
            self.SourceIds = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_ExpandDLType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ExpandDLType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_Mailbox)
        [t_EmailAddressType serializeToChildOf:node withName:"ExchangeWebService:Mailbox" value:_Mailbox];

}


- (t_EmailAddressType *)Mailbox {
    if (!_Mailbox) _Mailbox = [t_EmailAddressType new];
    return _Mailbox;
}
+ (ExchangeWebService_ExpandDLType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ExpandDLType *newObject = [self new];

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
    }
}
@end
@implementation ExchangeWebService_SyncFolderHierarchyResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SyncFolderHierarchyResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_SyncFolderHierarchyResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SyncFolderHierarchyResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_DisconnectPhoneCallType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_DisconnectPhoneCallType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_PhoneCallId)
        [t_PhoneCallIdType serializeToChildOf:node withName:"ExchangeWebService:PhoneCallId" value:_PhoneCallId];

}


- (t_PhoneCallIdType *)PhoneCallId {
    if (!_PhoneCallId) _PhoneCallId = [t_PhoneCallIdType new];
    return _PhoneCallId;
}
+ (ExchangeWebService_DisconnectPhoneCallType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_DisconnectPhoneCallType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"PhoneCallId")) {
            Class elementClass = classForElement(cur) ?: [t_PhoneCallIdType class];
            self.PhoneCallId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_DeleteUserConfigurationResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_DeleteUserConfigurationResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_DeleteUserConfigurationResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_DeleteUserConfigurationResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_UploadItemsResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UploadItemsResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_ItemId)
        [t_ItemIdType serializeToChildOf:node withName:"ExchangeWebService:ItemId" value:_ItemId];

}


- (t_ItemIdType *)ItemId {
    if (!_ItemId) _ItemId = [t_ItemIdType new];
    return _ItemId;
}
+ (ExchangeWebService_UploadItemsResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UploadItemsResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ItemId")) {
            Class elementClass = classForElement(cur) ?: [t_ItemIdType class];
            self.ItemId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_SuggestionsResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SuggestionsResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_ResponseMessage)
        [ExchangeWebService_ResponseMessageType serializeToChildOf:node withName:"ExchangeWebService:ResponseMessage" value:_ResponseMessage];

    if (_SuggestionDayResultArray)
        [t_ArrayOfSuggestionDayResult serializeToChildOf:node withName:"ExchangeWebService:SuggestionDayResultArray" value:_SuggestionDayResultArray];

}


- (ExchangeWebService_ResponseMessageType *)ResponseMessage {
    if (!_ResponseMessage) _ResponseMessage = [ExchangeWebService_ResponseMessageType new];
    return _ResponseMessage;
}
+ (ExchangeWebService_SuggestionsResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SuggestionsResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"ResponseMessage")) {
            Class elementClass = classForElement(cur) ?: [ExchangeWebService_ResponseMessageType class];
            self.ResponseMessage = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SuggestionDayResultArray")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfSuggestionDayResult class];
            self.SuggestionDayResultArray = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetSharingFolderResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetSharingFolderResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_SharingFolderId)
        [t_FolderIdType serializeToChildOf:node withName:"ExchangeWebService:SharingFolderId" value:_SharingFolderId];

}


- (t_FolderIdType *)SharingFolderId {
    if (!_SharingFolderId) _SharingFolderId = [t_FolderIdType new];
    return _SharingFolderId;
}
+ (ExchangeWebService_GetSharingFolderResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetSharingFolderResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"SharingFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_FolderIdType class];
            self.SharingFolderId = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_ResolveNamesResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ResolveNamesResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_ResolveNamesResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ResolveNamesResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_FindMessageTrackingReportResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_FindMessageTrackingReportResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Diagnostics)
        [t_ArrayOfStringsType serializeToChildOf:node withName:"ExchangeWebService:Diagnostics" value:_Diagnostics];

    if (_MessageTrackingSearchResults)
        [t_ArrayOfFindMessageTrackingSearchResultType serializeToChildOf:node withName:"ExchangeWebService:MessageTrackingSearchResults" value:_MessageTrackingSearchResults];

    if (_ExecutedSearchScope)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:ExecutedSearchScope" value:_ExecutedSearchScope];

    if (_Errors)
        [t_ArrayOfArraysOfTrackingPropertiesType serializeToChildOf:node withName:"ExchangeWebService:Errors" value:_Errors];

    if (_Properties)
        [t_ArrayOfTrackingPropertiesType serializeToChildOf:node withName:"ExchangeWebService:Properties" value:_Properties];

}

+ (ExchangeWebService_FindMessageTrackingReportResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_FindMessageTrackingReportResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Diagnostics")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfStringsType class];
            self.Diagnostics = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"MessageTrackingSearchResults")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfFindMessageTrackingSearchResultType class];
            self.MessageTrackingSearchResults = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"ExecutedSearchScope")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.ExecutedSearchScope = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Errors")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfArraysOfTrackingPropertiesType class];
            self.Errors = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Properties")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfTrackingPropertiesType class];
            self.Properties = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetInboxRulesRequestType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetInboxRulesRequestType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_MailboxSmtpAddress)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:MailboxSmtpAddress" value:_MailboxSmtpAddress];

}

+ (ExchangeWebService_GetInboxRulesRequestType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetInboxRulesRequestType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"MailboxSmtpAddress")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.MailboxSmtpAddress = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_CreateUserConfigurationType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_CreateUserConfigurationType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_UserConfiguration)
        [t_UserConfigurationType serializeToChildOf:node withName:"ExchangeWebService:UserConfiguration" value:_UserConfiguration];

}


- (t_UserConfigurationType *)UserConfiguration {
    if (!_UserConfiguration) _UserConfiguration = [t_UserConfigurationType new];
    return _UserConfiguration;
}
+ (ExchangeWebService_CreateUserConfigurationType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_CreateUserConfigurationType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"UserConfiguration")) {
            Class elementClass = classForElement(cur) ?: [t_UserConfigurationType class];
            self.UserConfiguration = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_ExpandDLResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_ExpandDLResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [super addAttributesToNode:node];

    [xsd_int serializeToProperty:"IndexedPagingOffset" onNode:node value:_IndexedPagingOffset];
    [xsd_int serializeToProperty:"NumeratorOffset" onNode:node value:_NumeratorOffset];
    [xsd_int serializeToProperty:"AbsoluteDenominator" onNode:node value:_AbsoluteDenominator];
    [xsd_boolean serializeToProperty:"IncludesLastItemInRange" onNode:node value:_IncludesLastItemInRange];
    [xsd_int serializeToProperty:"TotalItemsInView" onNode:node value:_TotalItemsInView];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_DLExpansion)
        [t_ArrayOfDLExpansionType serializeToChildOf:node withName:"ExchangeWebService:DLExpansion" value:_DLExpansion];

}


- (t_ArrayOfDLExpansionType *)DLExpansion {
    if (!_DLExpansion) _DLExpansion = [t_ArrayOfDLExpansionType new];
    return _DLExpansion;
}

+ (ExchangeWebService_ExpandDLResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_ExpandDLResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    [super deserializeAttributesFromNode:cur];

    self.IndexedPagingOffset = [xsd_int deserializeAttribute:"IndexedPagingOffset" ofNode:cur];
    self.NumeratorOffset = [xsd_int deserializeAttribute:"NumeratorOffset" ofNode:cur];
    self.AbsoluteDenominator = [xsd_int deserializeAttribute:"AbsoluteDenominator" ofNode:cur];
    self.IncludesLastItemInRange = [xsd_boolean deserializeAttribute:"IncludesLastItemInRange" ofNode:cur];
    self.TotalItemsInView = [xsd_int deserializeAttribute:"TotalItemsInView" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"DLExpansion")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfDLExpansionType class];
            self.DLExpansion = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_UpdateDelegateResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UpdateDelegateResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}
+ (ExchangeWebService_UpdateDelegateResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UpdateDelegateResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_GetDelegateType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetDelegateType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addAttributesToNode:(xmlNodePtr)node {
    [xsd_boolean serializeToProperty:"IncludePermissions" onNode:node value:_IncludePermissions];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_UserIds)
        [t_ArrayOfUserIdType serializeToChildOf:node withName:"ExchangeWebService:UserIds" value:_UserIds];

}


+ (ExchangeWebService_GetDelegateType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetDelegateType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeAttributesFromNode:(xmlNodePtr)cur {
    self.IncludePermissions = [xsd_boolean deserializeAttribute:"IncludePermissions" ofNode:cur];
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"UserIds")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfUserIdType class];
            self.UserIds = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_UpdateInboxRulesRequestType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UpdateInboxRulesRequestType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_MailboxSmtpAddress)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:MailboxSmtpAddress" value:_MailboxSmtpAddress];

    if (_RemoveOutlookRuleBlob)
        [xsd_boolean serializeToChildOf:node withName:"ExchangeWebService:RemoveOutlookRuleBlob" value:_RemoveOutlookRuleBlob];

    if (_Operations)
        [t_ArrayOfRuleOperationsType serializeToChildOf:node withName:"ExchangeWebService:Operations" value:_Operations];

}

+ (ExchangeWebService_UpdateInboxRulesRequestType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UpdateInboxRulesRequestType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"MailboxSmtpAddress")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.MailboxSmtpAddress = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"RemoveOutlookRuleBlob")) {
            Class elementClass = classForElement(cur) ?: [xsd_boolean class];
            self.RemoveOutlookRuleBlob = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Operations")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRuleOperationsType class];
            self.Operations = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetPasswordExpirationDateType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetPasswordExpirationDateType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_MailboxSmtpAddress)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:MailboxSmtpAddress" value:_MailboxSmtpAddress];

}

+ (ExchangeWebService_GetPasswordExpirationDateType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetPasswordExpirationDateType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"MailboxSmtpAddress")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.MailboxSmtpAddress = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetRoomsResponseMessageType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetRoomsResponseMessageType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addAttributesToNode:child];
    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    [super addElementsToNode:node];

    if (_Rooms)
        [t_ArrayOfRoomsType serializeToChildOf:node withName:"ExchangeWebService:Rooms" value:_Rooms];

}

+ (ExchangeWebService_GetRoomsResponseMessageType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetRoomsResponseMessageType *newObject = [self new];

    [newObject deserializeAttributesFromNode:cur];
    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    [super deserializeElementsFromNode:cur];

    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"Rooms")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfRoomsType class];
            self.Rooms = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_UpdateFolderResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UpdateFolderResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_UpdateFolderResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UpdateFolderResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_SyncFolderHierarchyType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_SyncFolderHierarchyType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_FolderShape)
        [t_FolderResponseShapeType serializeToChildOf:node withName:"ExchangeWebService:FolderShape" value:_FolderShape];

    if (_SyncFolderId)
        [t_TargetFolderIdType serializeToChildOf:node withName:"ExchangeWebService:SyncFolderId" value:_SyncFolderId];

    if (_SyncState)
        [xsd_string serializeToChildOf:node withName:"ExchangeWebService:SyncState" value:_SyncState];

}


- (t_FolderResponseShapeType *)FolderShape {
    if (!_FolderShape) _FolderShape = [t_FolderResponseShapeType new];
    return _FolderShape;
}
+ (ExchangeWebService_SyncFolderHierarchyType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_SyncFolderHierarchyType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"FolderShape")) {
            Class elementClass = classForElement(cur) ?: [t_FolderResponseShapeType class];
            self.FolderShape = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SyncFolderId")) {
            Class elementClass = classForElement(cur) ?: [t_TargetFolderIdType class];
            self.SyncFolderId = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SyncState")) {
            Class elementClass = classForElement(cur) ?: [xsd_string class];
            self.SyncState = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_GetFolderResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetFolderResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_GetFolderResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetFolderResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService_GetSharingMetadataType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_GetSharingMetadataType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}

- (void)addElementsToNode:(xmlNodePtr)node {
    if (_IdOfFolderToShare)
        [t_FolderIdType serializeToChildOf:node withName:"ExchangeWebService:IdOfFolderToShare" value:_IdOfFolderToShare];

    if (_SenderSmtpAddress)
        [t_NonEmptyStringType serializeToChildOf:node withName:"ExchangeWebService:SenderSmtpAddress" value:_SenderSmtpAddress];

    if (_Recipients)
        [t_ArrayOfSmtpAddressType serializeToChildOf:node withName:"ExchangeWebService:Recipients" value:_Recipients];

}


- (t_FolderIdType *)IdOfFolderToShare {
    if (!_IdOfFolderToShare) _IdOfFolderToShare = [t_FolderIdType new];
    return _IdOfFolderToShare;
}
+ (ExchangeWebService_GetSharingMetadataType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_GetSharingMetadataType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}

- (void)deserializeElementsFromNode:(xmlNodePtr)cur {
    for (cur = cur->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        else if (xmlStrEqual(cur->name, (const xmlChar *)"IdOfFolderToShare")) {
            Class elementClass = classForElement(cur) ?: [t_FolderIdType class];
            self.IdOfFolderToShare = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"SenderSmtpAddress")) {
            Class elementClass = classForElement(cur) ?: [t_NonEmptyStringType class];
            self.SenderSmtpAddress = [elementClass deserializeNode:cur];
        }
        else if (xmlStrEqual(cur->name, (const xmlChar *)"Recipients")) {
            Class elementClass = classForElement(cur) ?: [t_ArrayOfSmtpAddressType class];
            self.Recipients = [elementClass deserializeNode:cur];
        }
    }
}
@end
@implementation ExchangeWebService_UploadItemsResponseType
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(ExchangeWebService_UploadItemsResponseType *)value {
    xmlNodePtr child = xmlNewChild(node, NULL, (const xmlChar *)childName, NULL);

    [value addElementsToNode:child];
}
+ (ExchangeWebService_UploadItemsResponseType *)deserializeNode:(xmlNodePtr)cur {
    ExchangeWebService_UploadItemsResponseType *newObject = [self new];

    [newObject deserializeElementsFromNode:cur];

    return newObject;
}
@end
@implementation ExchangeWebService

+ (void)initialize {
    [USGlobals sharedInstance].wsdlStandardNamespaces[@"http://www.w3.org/2001/XMLSchema"] = @"xsd";
    [USGlobals sharedInstance].wsdlStandardNamespaces[@"http://schemas.microsoft.com/exchange/services/2006/messages"] = @"ExchangeWebService";
    [USGlobals sharedInstance].wsdlStandardNamespaces[@"http://www.w3.org/1999/xhtml"] = @"m";
    [USGlobals sharedInstance].wsdlStandardNamespaces[@"http://schemas.microsoft.com/exchange/services/2006/types"] = @"t";
    [USGlobals sharedInstance].wsdlStandardNamespaces[@"http://www.w3.org/XML/1998/namespace"] = @"xml";
}

+ (ExchangeWebService_ExchangeServiceBinding *)ExchangeServiceBinding {
   // NSString *ewsRequestURL = [[NSUserDefaults standardUserDefaults] objectForKey:EWS_REQUSET_URL_KEY];
    return [[ExchangeWebService_ExchangeServiceBinding alloc] initWithAddress:EWS_REQUSET_URL];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding

+ (NSTimeInterval)defaultTimeout {
    return 10;
}

- (id)init {
    if ((self = [super init])) {
        _customHeaders = [NSMutableDictionary new];
        _timeout = [[self class] defaultTimeout];
    }

    return self;
}

- (id)initWithAddress:(NSString *)anAddress {
    if ((self = [self init]))
        self.address = [NSURL URLWithString:anAddress];

    return self;
}

- (NSString *)MIMEType {
    return @"text/xml";
}

- (void)addCookie:(NSHTTPCookie *)toAdd {
    if (toAdd) {
        if (!self.cookies) self.cookies = [NSMutableArray new];
        [self.cookies addObject:toAdd];
    }
}

- (ExchangeWebService_ExchangeServiceBindingResponse *)performSynchronousOperation:(ExchangeWebService_ExchangeServiceBindingOperation *)operation {
    [operation start];

    // Now wait for response
    NSRunLoop *theRL = [NSRunLoop currentRunLoop];

    while (![operation isFinished] && [theRL runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]);

    return operation.response;
}

- (ExchangeWebService_ExchangeServiceBindingResponse *)AddDelegate:(ExchangeWebService_AddDelegateType *)aAddDelegate {
    ExchangeWebService_ExchangeServiceBinding_AddDelegate *op = [[ExchangeWebService_ExchangeServiceBinding_AddDelegate alloc] initWithBinding:self success:nil error:nil
        AddDelegate:aAddDelegate
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_AddDelegate*)AddDelegate:(ExchangeWebService_AddDelegateType *)aAddDelegate success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_AddDelegate *op = [[ExchangeWebService_ExchangeServiceBinding_AddDelegate alloc] initWithBinding:self success:success error:error
        AddDelegate:aAddDelegate
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)ApplyConversationAction:(ExchangeWebService_ApplyConversationActionType *)aApplyConversationAction {
    ExchangeWebService_ExchangeServiceBinding_ApplyConversationAction *op = [[ExchangeWebService_ExchangeServiceBinding_ApplyConversationAction alloc] initWithBinding:self success:nil error:nil
        ApplyConversationAction:aApplyConversationAction
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_ApplyConversationAction*)ApplyConversationAction:(ExchangeWebService_ApplyConversationActionType *)aApplyConversationAction success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_ApplyConversationAction *op = [[ExchangeWebService_ExchangeServiceBinding_ApplyConversationAction alloc] initWithBinding:self success:success error:error
        ApplyConversationAction:aApplyConversationAction
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)ConvertId:(ExchangeWebService_ConvertIdType *)aConvertId {
    ExchangeWebService_ExchangeServiceBinding_ConvertId *op = [[ExchangeWebService_ExchangeServiceBinding_ConvertId alloc] initWithBinding:self success:nil error:nil
        ConvertId:aConvertId
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_ConvertId*)ConvertId:(ExchangeWebService_ConvertIdType *)aConvertId success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_ConvertId *op = [[ExchangeWebService_ExchangeServiceBinding_ConvertId alloc] initWithBinding:self success:success error:error
        ConvertId:aConvertId
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)CopyFolder:(ExchangeWebService_CopyFolderType *)aCopyFolder {
    ExchangeWebService_ExchangeServiceBinding_CopyFolder *op = [[ExchangeWebService_ExchangeServiceBinding_CopyFolder alloc] initWithBinding:self success:nil error:nil
        CopyFolder:aCopyFolder
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_CopyFolder*)CopyFolder:(ExchangeWebService_CopyFolderType *)aCopyFolder success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_CopyFolder *op = [[ExchangeWebService_ExchangeServiceBinding_CopyFolder alloc] initWithBinding:self success:success error:error
        CopyFolder:aCopyFolder
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)CopyItem:(ExchangeWebService_CopyItemType *)aCopyItem {
    ExchangeWebService_ExchangeServiceBinding_CopyItem *op = [[ExchangeWebService_ExchangeServiceBinding_CopyItem alloc] initWithBinding:self success:nil error:nil
        CopyItem:aCopyItem
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_CopyItem*)CopyItem:(ExchangeWebService_CopyItemType *)aCopyItem success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_CopyItem *op = [[ExchangeWebService_ExchangeServiceBinding_CopyItem alloc] initWithBinding:self success:success error:error
        CopyItem:aCopyItem
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)CreateAttachment:(ExchangeWebService_CreateAttachmentType *)aCreateAttachment {
    ExchangeWebService_ExchangeServiceBinding_CreateAttachment *op = [[ExchangeWebService_ExchangeServiceBinding_CreateAttachment alloc] initWithBinding:self success:nil error:nil
        CreateAttachment:aCreateAttachment
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_CreateAttachment*)CreateAttachment:(ExchangeWebService_CreateAttachmentType *)aCreateAttachment success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_CreateAttachment *op = [[ExchangeWebService_ExchangeServiceBinding_CreateAttachment alloc] initWithBinding:self success:success error:error
        CreateAttachment:aCreateAttachment
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)CreateFolder:(ExchangeWebService_CreateFolderType *)aCreateFolder {
    ExchangeWebService_ExchangeServiceBinding_CreateFolder *op = [[ExchangeWebService_ExchangeServiceBinding_CreateFolder alloc] initWithBinding:self success:nil error:nil
        CreateFolder:aCreateFolder
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_CreateFolder*)CreateFolder:(ExchangeWebService_CreateFolderType *)aCreateFolder success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_CreateFolder *op = [[ExchangeWebService_ExchangeServiceBinding_CreateFolder alloc] initWithBinding:self success:success error:error
        CreateFolder:aCreateFolder
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)CreateItem:(ExchangeWebService_CreateItemType *)aCreateItem {
    ExchangeWebService_ExchangeServiceBinding_CreateItem *op = [[ExchangeWebService_ExchangeServiceBinding_CreateItem alloc] initWithBinding:self success:nil error:nil
        CreateItem:aCreateItem
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_CreateItem*)CreateItem:(ExchangeWebService_CreateItemType *)aCreateItem success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_CreateItem *op = [[ExchangeWebService_ExchangeServiceBinding_CreateItem alloc] initWithBinding:self success:success error:error
        CreateItem:aCreateItem
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)CreateManagedFolder:(ExchangeWebService_CreateManagedFolderRequestType *)aCreateManagedFolder {
    ExchangeWebService_ExchangeServiceBinding_CreateManagedFolder *op = [[ExchangeWebService_ExchangeServiceBinding_CreateManagedFolder alloc] initWithBinding:self success:nil error:nil
        CreateManagedFolder:aCreateManagedFolder
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_CreateManagedFolder*)CreateManagedFolder:(ExchangeWebService_CreateManagedFolderRequestType *)aCreateManagedFolder success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_CreateManagedFolder *op = [[ExchangeWebService_ExchangeServiceBinding_CreateManagedFolder alloc] initWithBinding:self success:success error:error
        CreateManagedFolder:aCreateManagedFolder
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)CreateUserConfiguration:(ExchangeWebService_CreateUserConfigurationType *)aCreateUserConfiguration {
    ExchangeWebService_ExchangeServiceBinding_CreateUserConfiguration *op = [[ExchangeWebService_ExchangeServiceBinding_CreateUserConfiguration alloc] initWithBinding:self success:nil error:nil
        CreateUserConfiguration:aCreateUserConfiguration
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_CreateUserConfiguration*)CreateUserConfiguration:(ExchangeWebService_CreateUserConfigurationType *)aCreateUserConfiguration success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_CreateUserConfiguration *op = [[ExchangeWebService_ExchangeServiceBinding_CreateUserConfiguration alloc] initWithBinding:self success:success error:error
        CreateUserConfiguration:aCreateUserConfiguration
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)DeleteAttachment:(ExchangeWebService_DeleteAttachmentType *)aDeleteAttachment {
    ExchangeWebService_ExchangeServiceBinding_DeleteAttachment *op = [[ExchangeWebService_ExchangeServiceBinding_DeleteAttachment alloc] initWithBinding:self success:nil error:nil
        DeleteAttachment:aDeleteAttachment
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_DeleteAttachment*)DeleteAttachment:(ExchangeWebService_DeleteAttachmentType *)aDeleteAttachment success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_DeleteAttachment *op = [[ExchangeWebService_ExchangeServiceBinding_DeleteAttachment alloc] initWithBinding:self success:success error:error
        DeleteAttachment:aDeleteAttachment
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)DeleteFolder:(ExchangeWebService_DeleteFolderType *)aDeleteFolder {
    ExchangeWebService_ExchangeServiceBinding_DeleteFolder *op = [[ExchangeWebService_ExchangeServiceBinding_DeleteFolder alloc] initWithBinding:self success:nil error:nil
        DeleteFolder:aDeleteFolder
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_DeleteFolder*)DeleteFolder:(ExchangeWebService_DeleteFolderType *)aDeleteFolder success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_DeleteFolder *op = [[ExchangeWebService_ExchangeServiceBinding_DeleteFolder alloc] initWithBinding:self success:success error:error
        DeleteFolder:aDeleteFolder
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)DeleteItem:(ExchangeWebService_DeleteItemType *)aDeleteItem {
    ExchangeWebService_ExchangeServiceBinding_DeleteItem *op = [[ExchangeWebService_ExchangeServiceBinding_DeleteItem alloc] initWithBinding:self success:nil error:nil
        DeleteItem:aDeleteItem
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_DeleteItem*)DeleteItem:(ExchangeWebService_DeleteItemType *)aDeleteItem success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_DeleteItem *op = [[ExchangeWebService_ExchangeServiceBinding_DeleteItem alloc] initWithBinding:self success:success error:error
        DeleteItem:aDeleteItem
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)DeleteUserConfiguration:(ExchangeWebService_DeleteUserConfigurationType *)aDeleteUserConfiguration {
    ExchangeWebService_ExchangeServiceBinding_DeleteUserConfiguration *op = [[ExchangeWebService_ExchangeServiceBinding_DeleteUserConfiguration alloc] initWithBinding:self success:nil error:nil
        DeleteUserConfiguration:aDeleteUserConfiguration
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_DeleteUserConfiguration*)DeleteUserConfiguration:(ExchangeWebService_DeleteUserConfigurationType *)aDeleteUserConfiguration success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_DeleteUserConfiguration *op = [[ExchangeWebService_ExchangeServiceBinding_DeleteUserConfiguration alloc] initWithBinding:self success:success error:error
        DeleteUserConfiguration:aDeleteUserConfiguration
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)DisconnectPhoneCall:(ExchangeWebService_DisconnectPhoneCallType *)aDisconnectPhoneCall {
    ExchangeWebService_ExchangeServiceBinding_DisconnectPhoneCall *op = [[ExchangeWebService_ExchangeServiceBinding_DisconnectPhoneCall alloc] initWithBinding:self success:nil error:nil
        DisconnectPhoneCall:aDisconnectPhoneCall
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_DisconnectPhoneCall*)DisconnectPhoneCall:(ExchangeWebService_DisconnectPhoneCallType *)aDisconnectPhoneCall success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_DisconnectPhoneCall *op = [[ExchangeWebService_ExchangeServiceBinding_DisconnectPhoneCall alloc] initWithBinding:self success:success error:error
        DisconnectPhoneCall:aDisconnectPhoneCall
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)EmptyFolder:(ExchangeWebService_EmptyFolderType *)aEmptyFolder {
    ExchangeWebService_ExchangeServiceBinding_EmptyFolder *op = [[ExchangeWebService_ExchangeServiceBinding_EmptyFolder alloc] initWithBinding:self success:nil error:nil
        EmptyFolder:aEmptyFolder
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_EmptyFolder*)EmptyFolder:(ExchangeWebService_EmptyFolderType *)aEmptyFolder success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_EmptyFolder *op = [[ExchangeWebService_ExchangeServiceBinding_EmptyFolder alloc] initWithBinding:self success:success error:error
        EmptyFolder:aEmptyFolder
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)ExpandDL:(ExchangeWebService_ExpandDLType *)aExpandDL {
    ExchangeWebService_ExchangeServiceBinding_ExpandDL *op = [[ExchangeWebService_ExchangeServiceBinding_ExpandDL alloc] initWithBinding:self success:nil error:nil
        ExpandDL:aExpandDL
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_ExpandDL*)ExpandDL:(ExchangeWebService_ExpandDLType *)aExpandDL success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_ExpandDL *op = [[ExchangeWebService_ExchangeServiceBinding_ExpandDL alloc] initWithBinding:self success:success error:error
        ExpandDL:aExpandDL
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)ExportItems:(ExchangeWebService_ExportItemsType *)aExportItems {
    ExchangeWebService_ExchangeServiceBinding_ExportItems *op = [[ExchangeWebService_ExchangeServiceBinding_ExportItems alloc] initWithBinding:self success:nil error:nil
        ExportItems:aExportItems
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_ExportItems*)ExportItems:(ExchangeWebService_ExportItemsType *)aExportItems success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_ExportItems *op = [[ExchangeWebService_ExchangeServiceBinding_ExportItems alloc] initWithBinding:self success:success error:error
        ExportItems:aExportItems
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)FindConversation:(ExchangeWebService_FindConversationType *)aFindConversation {
    ExchangeWebService_ExchangeServiceBinding_FindConversation *op = [[ExchangeWebService_ExchangeServiceBinding_FindConversation alloc] initWithBinding:self success:nil error:nil
        FindConversation:aFindConversation
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_FindConversation*)FindConversation:(ExchangeWebService_FindConversationType *)aFindConversation success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_FindConversation *op = [[ExchangeWebService_ExchangeServiceBinding_FindConversation alloc] initWithBinding:self success:success error:error
        FindConversation:aFindConversation
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)FindFolder:(ExchangeWebService_FindFolderType *)aFindFolder {
    ExchangeWebService_ExchangeServiceBinding_FindFolder *op = [[ExchangeWebService_ExchangeServiceBinding_FindFolder alloc] initWithBinding:self success:nil error:nil
        FindFolder:aFindFolder
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_FindFolder*)FindFolder:(ExchangeWebService_FindFolderType *)aFindFolder success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_FindFolder *op = [[ExchangeWebService_ExchangeServiceBinding_FindFolder alloc] initWithBinding:self success:success error:error
        FindFolder:aFindFolder
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)FindItem:(ExchangeWebService_FindItemType *)aFindItem {
    ExchangeWebService_ExchangeServiceBinding_FindItem *op = [[ExchangeWebService_ExchangeServiceBinding_FindItem alloc] initWithBinding:self success:nil error:nil
        FindItem:aFindItem
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_FindItem*)FindItem:(ExchangeWebService_FindItemType *)aFindItem success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_FindItem *op = [[ExchangeWebService_ExchangeServiceBinding_FindItem alloc] initWithBinding:self success:success error:error
        FindItem:aFindItem
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)FindMessageTrackingReport:(ExchangeWebService_FindMessageTrackingReportRequestType *)aFindMessageTrackingReport {
    ExchangeWebService_ExchangeServiceBinding_FindMessageTrackingReport *op = [[ExchangeWebService_ExchangeServiceBinding_FindMessageTrackingReport alloc] initWithBinding:self success:nil error:nil
        FindMessageTrackingReport:aFindMessageTrackingReport
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_FindMessageTrackingReport*)FindMessageTrackingReport:(ExchangeWebService_FindMessageTrackingReportRequestType *)aFindMessageTrackingReport success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_FindMessageTrackingReport *op = [[ExchangeWebService_ExchangeServiceBinding_FindMessageTrackingReport alloc] initWithBinding:self success:success error:error
        FindMessageTrackingReport:aFindMessageTrackingReport
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetAttachment:(ExchangeWebService_GetAttachmentType *)aGetAttachment {
    ExchangeWebService_ExchangeServiceBinding_GetAttachment *op = [[ExchangeWebService_ExchangeServiceBinding_GetAttachment alloc] initWithBinding:self success:nil error:nil
        GetAttachment:aGetAttachment
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetAttachment*)GetAttachment:(ExchangeWebService_GetAttachmentType *)aGetAttachment success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetAttachment *op = [[ExchangeWebService_ExchangeServiceBinding_GetAttachment alloc] initWithBinding:self success:success error:error
        GetAttachment:aGetAttachment
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetDelegate:(ExchangeWebService_GetDelegateType *)aGetDelegate {
    ExchangeWebService_ExchangeServiceBinding_GetDelegate *op = [[ExchangeWebService_ExchangeServiceBinding_GetDelegate alloc] initWithBinding:self success:nil error:nil
        GetDelegate:aGetDelegate
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetDelegate*)GetDelegate:(ExchangeWebService_GetDelegateType *)aGetDelegate success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetDelegate *op = [[ExchangeWebService_ExchangeServiceBinding_GetDelegate alloc] initWithBinding:self success:success error:error
        GetDelegate:aGetDelegate
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetEvents:(ExchangeWebService_GetEventsType *)aGetEvents {
    ExchangeWebService_ExchangeServiceBinding_GetEvents *op = [[ExchangeWebService_ExchangeServiceBinding_GetEvents alloc] initWithBinding:self success:nil error:nil
        GetEvents:aGetEvents
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetEvents*)GetEvents:(ExchangeWebService_GetEventsType *)aGetEvents success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetEvents *op = [[ExchangeWebService_ExchangeServiceBinding_GetEvents alloc] initWithBinding:self success:success error:error
        GetEvents:aGetEvents
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetFolder:(ExchangeWebService_GetFolderType *)aGetFolder {
    ExchangeWebService_ExchangeServiceBinding_GetFolder *op = [[ExchangeWebService_ExchangeServiceBinding_GetFolder alloc] initWithBinding:self success:nil error:nil
        GetFolder:aGetFolder
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetFolder*)GetFolder:(ExchangeWebService_GetFolderType *)aGetFolder success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetFolder *op = [[ExchangeWebService_ExchangeServiceBinding_GetFolder alloc] initWithBinding:self success:success error:error
        GetFolder:aGetFolder
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetInboxRules:(ExchangeWebService_GetInboxRulesRequestType *)aGetInboxRules {
    ExchangeWebService_ExchangeServiceBinding_GetInboxRules *op = [[ExchangeWebService_ExchangeServiceBinding_GetInboxRules alloc] initWithBinding:self success:nil error:nil
        GetInboxRules:aGetInboxRules
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetInboxRules*)GetInboxRules:(ExchangeWebService_GetInboxRulesRequestType *)aGetInboxRules success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetInboxRules *op = [[ExchangeWebService_ExchangeServiceBinding_GetInboxRules alloc] initWithBinding:self success:success error:error
        GetInboxRules:aGetInboxRules
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetItem:(ExchangeWebService_GetItemType *)aGetItem {
    ExchangeWebService_ExchangeServiceBinding_GetItem *op = [[ExchangeWebService_ExchangeServiceBinding_GetItem alloc] initWithBinding:self success:nil error:nil
        GetItem:aGetItem
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetItem*)GetItem:(ExchangeWebService_GetItemType *)aGetItem success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetItem *op = [[ExchangeWebService_ExchangeServiceBinding_GetItem alloc] initWithBinding:self success:success error:error
        GetItem:aGetItem
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetMailTips:(ExchangeWebService_GetMailTipsType *)aGetMailTips {
    ExchangeWebService_ExchangeServiceBinding_GetMailTips *op = [[ExchangeWebService_ExchangeServiceBinding_GetMailTips alloc] initWithBinding:self success:nil error:nil
        GetMailTips:aGetMailTips
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetMailTips*)GetMailTips:(ExchangeWebService_GetMailTipsType *)aGetMailTips success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetMailTips *op = [[ExchangeWebService_ExchangeServiceBinding_GetMailTips alloc] initWithBinding:self success:success error:error
        GetMailTips:aGetMailTips
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetMessageTrackingReport:(ExchangeWebService_GetMessageTrackingReportRequestType *)aGetMessageTrackingReport {
    ExchangeWebService_ExchangeServiceBinding_GetMessageTrackingReport *op = [[ExchangeWebService_ExchangeServiceBinding_GetMessageTrackingReport alloc] initWithBinding:self success:nil error:nil
        GetMessageTrackingReport:aGetMessageTrackingReport
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetMessageTrackingReport*)GetMessageTrackingReport:(ExchangeWebService_GetMessageTrackingReportRequestType *)aGetMessageTrackingReport success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetMessageTrackingReport *op = [[ExchangeWebService_ExchangeServiceBinding_GetMessageTrackingReport alloc] initWithBinding:self success:success error:error
        GetMessageTrackingReport:aGetMessageTrackingReport
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetPasswordExpirationDate:(ExchangeWebService_GetPasswordExpirationDateType *)aGetPasswordExpirationDate {
    ExchangeWebService_ExchangeServiceBinding_GetPasswordExpirationDate *op = [[ExchangeWebService_ExchangeServiceBinding_GetPasswordExpirationDate alloc] initWithBinding:self success:nil error:nil
        GetPasswordExpirationDate:aGetPasswordExpirationDate
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetPasswordExpirationDate*)GetPasswordExpirationDate:(ExchangeWebService_GetPasswordExpirationDateType *)aGetPasswordExpirationDate success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetPasswordExpirationDate *op = [[ExchangeWebService_ExchangeServiceBinding_GetPasswordExpirationDate alloc] initWithBinding:self success:success error:error
        GetPasswordExpirationDate:aGetPasswordExpirationDate
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetPhoneCallInformation:(ExchangeWebService_GetPhoneCallInformationType *)aGetPhoneCallInformation {
    ExchangeWebService_ExchangeServiceBinding_GetPhoneCallInformation *op = [[ExchangeWebService_ExchangeServiceBinding_GetPhoneCallInformation alloc] initWithBinding:self success:nil error:nil
        GetPhoneCallInformation:aGetPhoneCallInformation
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetPhoneCallInformation*)GetPhoneCallInformation:(ExchangeWebService_GetPhoneCallInformationType *)aGetPhoneCallInformation success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetPhoneCallInformation *op = [[ExchangeWebService_ExchangeServiceBinding_GetPhoneCallInformation alloc] initWithBinding:self success:success error:error
        GetPhoneCallInformation:aGetPhoneCallInformation
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetRoomLists:(ExchangeWebService_GetRoomListsType *)aGetRoomLists {
    ExchangeWebService_ExchangeServiceBinding_GetRoomLists *op = [[ExchangeWebService_ExchangeServiceBinding_GetRoomLists alloc] initWithBinding:self success:nil error:nil
        GetRoomLists:aGetRoomLists
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetRoomLists*)GetRoomLists:(ExchangeWebService_GetRoomListsType *)aGetRoomLists success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetRoomLists *op = [[ExchangeWebService_ExchangeServiceBinding_GetRoomLists alloc] initWithBinding:self success:success error:error
        GetRoomLists:aGetRoomLists
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetRooms:(ExchangeWebService_GetRoomsType *)aGetRooms {
    ExchangeWebService_ExchangeServiceBinding_GetRooms *op = [[ExchangeWebService_ExchangeServiceBinding_GetRooms alloc] initWithBinding:self success:nil error:nil
        GetRooms:aGetRooms
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetRooms*)GetRooms:(ExchangeWebService_GetRoomsType *)aGetRooms success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetRooms *op = [[ExchangeWebService_ExchangeServiceBinding_GetRooms alloc] initWithBinding:self success:success error:error
        GetRooms:aGetRooms
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetServerTimeZones:(ExchangeWebService_GetServerTimeZonesType *)aGetServerTimeZones {
    ExchangeWebService_ExchangeServiceBinding_GetServerTimeZones *op = [[ExchangeWebService_ExchangeServiceBinding_GetServerTimeZones alloc] initWithBinding:self success:nil error:nil
        GetServerTimeZones:aGetServerTimeZones
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetServerTimeZones*)GetServerTimeZones:(ExchangeWebService_GetServerTimeZonesType *)aGetServerTimeZones success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetServerTimeZones *op = [[ExchangeWebService_ExchangeServiceBinding_GetServerTimeZones alloc] initWithBinding:self success:success error:error
        GetServerTimeZones:aGetServerTimeZones
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetServiceConfiguration:(ExchangeWebService_GetServiceConfigurationType *)aGetServiceConfiguration {
    ExchangeWebService_ExchangeServiceBinding_GetServiceConfiguration *op = [[ExchangeWebService_ExchangeServiceBinding_GetServiceConfiguration alloc] initWithBinding:self success:nil error:nil
        GetServiceConfiguration:aGetServiceConfiguration
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetServiceConfiguration*)GetServiceConfiguration:(ExchangeWebService_GetServiceConfigurationType *)aGetServiceConfiguration success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetServiceConfiguration *op = [[ExchangeWebService_ExchangeServiceBinding_GetServiceConfiguration alloc] initWithBinding:self success:success error:error
        GetServiceConfiguration:aGetServiceConfiguration
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetSharingFolder:(ExchangeWebService_GetSharingFolderType *)aGetSharingFolder {
    ExchangeWebService_ExchangeServiceBinding_GetSharingFolder *op = [[ExchangeWebService_ExchangeServiceBinding_GetSharingFolder alloc] initWithBinding:self success:nil error:nil
        GetSharingFolder:aGetSharingFolder
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetSharingFolder*)GetSharingFolder:(ExchangeWebService_GetSharingFolderType *)aGetSharingFolder success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetSharingFolder *op = [[ExchangeWebService_ExchangeServiceBinding_GetSharingFolder alloc] initWithBinding:self success:success error:error
        GetSharingFolder:aGetSharingFolder
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetSharingMetadata:(ExchangeWebService_GetSharingMetadataType *)aGetSharingMetadata {
    ExchangeWebService_ExchangeServiceBinding_GetSharingMetadata *op = [[ExchangeWebService_ExchangeServiceBinding_GetSharingMetadata alloc] initWithBinding:self success:nil error:nil
        GetSharingMetadata:aGetSharingMetadata
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetSharingMetadata*)GetSharingMetadata:(ExchangeWebService_GetSharingMetadataType *)aGetSharingMetadata success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetSharingMetadata *op = [[ExchangeWebService_ExchangeServiceBinding_GetSharingMetadata alloc] initWithBinding:self success:success error:error
        GetSharingMetadata:aGetSharingMetadata
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetStreamingEvents:(ExchangeWebService_GetStreamingEventsType *)aGetStreamingEvents {
    ExchangeWebService_ExchangeServiceBinding_GetStreamingEvents *op = [[ExchangeWebService_ExchangeServiceBinding_GetStreamingEvents alloc] initWithBinding:self success:nil error:nil
        GetStreamingEvents:aGetStreamingEvents
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetStreamingEvents*)GetStreamingEvents:(ExchangeWebService_GetStreamingEventsType *)aGetStreamingEvents success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetStreamingEvents *op = [[ExchangeWebService_ExchangeServiceBinding_GetStreamingEvents alloc] initWithBinding:self success:success error:error
        GetStreamingEvents:aGetStreamingEvents
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetUserAvailabilityUsingGetUserAvailabilityRequest:(ExchangeWebService_GetUserAvailabilityRequestType *)aGetUserAvailabilityRequest {
    ExchangeWebService_ExchangeServiceBinding_GetUserAvailability *op = [[ExchangeWebService_ExchangeServiceBinding_GetUserAvailability alloc] initWithBinding:self success:nil error:nil
        GetUserAvailabilityRequest:aGetUserAvailabilityRequest
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetUserAvailability*)GetUserAvailabilityUsingGetUserAvailabilityRequest:(ExchangeWebService_GetUserAvailabilityRequestType *)aGetUserAvailabilityRequest success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetUserAvailability *op = [[ExchangeWebService_ExchangeServiceBinding_GetUserAvailability alloc] initWithBinding:self success:success error:error
        GetUserAvailabilityRequest:aGetUserAvailabilityRequest
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetUserConfiguration:(ExchangeWebService_GetUserConfigurationType *)aGetUserConfiguration {
    ExchangeWebService_ExchangeServiceBinding_GetUserConfiguration *op = [[ExchangeWebService_ExchangeServiceBinding_GetUserConfiguration alloc] initWithBinding:self success:nil error:nil
        GetUserConfiguration:aGetUserConfiguration
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetUserConfiguration*)GetUserConfiguration:(ExchangeWebService_GetUserConfigurationType *)aGetUserConfiguration success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetUserConfiguration *op = [[ExchangeWebService_ExchangeServiceBinding_GetUserConfiguration alloc] initWithBinding:self success:success error:error
        GetUserConfiguration:aGetUserConfiguration
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)GetUserOofSettingsUsingGetUserOofSettingsRequest:(ExchangeWebService_GetUserOofSettingsRequest *)aGetUserOofSettingsRequest {
    ExchangeWebService_ExchangeServiceBinding_GetUserOofSettings *op = [[ExchangeWebService_ExchangeServiceBinding_GetUserOofSettings alloc] initWithBinding:self success:nil error:nil
        GetUserOofSettingsRequest:aGetUserOofSettingsRequest
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_GetUserOofSettings*)GetUserOofSettingsUsingGetUserOofSettingsRequest:(ExchangeWebService_GetUserOofSettingsRequest *)aGetUserOofSettingsRequest success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_GetUserOofSettings *op = [[ExchangeWebService_ExchangeServiceBinding_GetUserOofSettings alloc] initWithBinding:self success:success error:error
        GetUserOofSettingsRequest:aGetUserOofSettingsRequest
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)MoveFolder:(ExchangeWebService_MoveFolderType *)aMoveFolder {
    ExchangeWebService_ExchangeServiceBinding_MoveFolder *op = [[ExchangeWebService_ExchangeServiceBinding_MoveFolder alloc] initWithBinding:self success:nil error:nil
        MoveFolder:aMoveFolder
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_MoveFolder*)MoveFolder:(ExchangeWebService_MoveFolderType *)aMoveFolder success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_MoveFolder *op = [[ExchangeWebService_ExchangeServiceBinding_MoveFolder alloc] initWithBinding:self success:success error:error
        MoveFolder:aMoveFolder
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)MoveItem:(ExchangeWebService_MoveItemType *)aMoveItem {
    ExchangeWebService_ExchangeServiceBinding_MoveItem *op = [[ExchangeWebService_ExchangeServiceBinding_MoveItem alloc] initWithBinding:self success:nil error:nil
        MoveItem:aMoveItem
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_MoveItem*)MoveItem:(ExchangeWebService_MoveItemType *)aMoveItem success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_MoveItem *op = [[ExchangeWebService_ExchangeServiceBinding_MoveItem alloc] initWithBinding:self success:success error:error
        MoveItem:aMoveItem
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)PlayOnPhone:(ExchangeWebService_PlayOnPhoneType *)aPlayOnPhone {
    ExchangeWebService_ExchangeServiceBinding_PlayOnPhone *op = [[ExchangeWebService_ExchangeServiceBinding_PlayOnPhone alloc] initWithBinding:self success:nil error:nil
        PlayOnPhone:aPlayOnPhone
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_PlayOnPhone*)PlayOnPhone:(ExchangeWebService_PlayOnPhoneType *)aPlayOnPhone success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_PlayOnPhone *op = [[ExchangeWebService_ExchangeServiceBinding_PlayOnPhone alloc] initWithBinding:self success:success error:error
        PlayOnPhone:aPlayOnPhone
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)RefreshSharingFolder:(ExchangeWebService_RefreshSharingFolderType *)aRefreshSharingFolder {
    ExchangeWebService_ExchangeServiceBinding_RefreshSharingFolder *op = [[ExchangeWebService_ExchangeServiceBinding_RefreshSharingFolder alloc] initWithBinding:self success:nil error:nil
        RefreshSharingFolder:aRefreshSharingFolder
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_RefreshSharingFolder*)RefreshSharingFolder:(ExchangeWebService_RefreshSharingFolderType *)aRefreshSharingFolder success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_RefreshSharingFolder *op = [[ExchangeWebService_ExchangeServiceBinding_RefreshSharingFolder alloc] initWithBinding:self success:success error:error
        RefreshSharingFolder:aRefreshSharingFolder
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)RemoveDelegate:(ExchangeWebService_RemoveDelegateType *)aRemoveDelegate {
    ExchangeWebService_ExchangeServiceBinding_RemoveDelegate *op = [[ExchangeWebService_ExchangeServiceBinding_RemoveDelegate alloc] initWithBinding:self success:nil error:nil
        RemoveDelegate:aRemoveDelegate
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_RemoveDelegate*)RemoveDelegate:(ExchangeWebService_RemoveDelegateType *)aRemoveDelegate success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_RemoveDelegate *op = [[ExchangeWebService_ExchangeServiceBinding_RemoveDelegate alloc] initWithBinding:self success:success error:error
        RemoveDelegate:aRemoveDelegate
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)ResolveNames:(ExchangeWebService_ResolveNamesType *)aResolveNames {
    ExchangeWebService_ExchangeServiceBinding_ResolveNames *op = [[ExchangeWebService_ExchangeServiceBinding_ResolveNames alloc] initWithBinding:self success:nil error:nil
        ResolveNames:aResolveNames
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_ResolveNames*)ResolveNames:(ExchangeWebService_ResolveNamesType *)aResolveNames success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_ResolveNames *op = [[ExchangeWebService_ExchangeServiceBinding_ResolveNames alloc] initWithBinding:self success:success error:error
        ResolveNames:aResolveNames
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)SendItem:(ExchangeWebService_SendItemType *)aSendItem {
    ExchangeWebService_ExchangeServiceBinding_SendItem *op = [[ExchangeWebService_ExchangeServiceBinding_SendItem alloc] initWithBinding:self success:nil error:nil
        SendItem:aSendItem
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_SendItem*)SendItem:(ExchangeWebService_SendItemType *)aSendItem success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_SendItem *op = [[ExchangeWebService_ExchangeServiceBinding_SendItem alloc] initWithBinding:self success:success error:error
        SendItem:aSendItem
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)SetUserOofSettingsUsingSetUserOofSettingsRequest:(ExchangeWebService_SetUserOofSettingsRequest *)aSetUserOofSettingsRequest {
    ExchangeWebService_ExchangeServiceBinding_SetUserOofSettings *op = [[ExchangeWebService_ExchangeServiceBinding_SetUserOofSettings alloc] initWithBinding:self success:nil error:nil
        SetUserOofSettingsRequest:aSetUserOofSettingsRequest
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_SetUserOofSettings*)SetUserOofSettingsUsingSetUserOofSettingsRequest:(ExchangeWebService_SetUserOofSettingsRequest *)aSetUserOofSettingsRequest success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_SetUserOofSettings *op = [[ExchangeWebService_ExchangeServiceBinding_SetUserOofSettings alloc] initWithBinding:self success:success error:error
        SetUserOofSettingsRequest:aSetUserOofSettingsRequest
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)Subscribe:(ExchangeWebService_SubscribeType *)aSubscribe {
    ExchangeWebService_ExchangeServiceBinding_Subscribe *op = [[ExchangeWebService_ExchangeServiceBinding_Subscribe alloc] initWithBinding:self success:nil error:nil
        Subscribe:aSubscribe
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_Subscribe*)Subscribe:(ExchangeWebService_SubscribeType *)aSubscribe success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_Subscribe *op = [[ExchangeWebService_ExchangeServiceBinding_Subscribe alloc] initWithBinding:self success:success error:error
        Subscribe:aSubscribe
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)SyncFolderHierarchy:(ExchangeWebService_SyncFolderHierarchyType *)aSyncFolderHierarchy {
    ExchangeWebService_ExchangeServiceBinding_SyncFolderHierarchy *op = [[ExchangeWebService_ExchangeServiceBinding_SyncFolderHierarchy alloc] initWithBinding:self success:nil error:nil
        SyncFolderHierarchy:aSyncFolderHierarchy
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_SyncFolderHierarchy*)SyncFolderHierarchy:(ExchangeWebService_SyncFolderHierarchyType *)aSyncFolderHierarchy success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_SyncFolderHierarchy *op = [[ExchangeWebService_ExchangeServiceBinding_SyncFolderHierarchy alloc] initWithBinding:self success:success error:error
        SyncFolderHierarchy:aSyncFolderHierarchy
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)SyncFolderItems:(ExchangeWebService_SyncFolderItemsType *)aSyncFolderItems {
    ExchangeWebService_ExchangeServiceBinding_SyncFolderItems *op = [[ExchangeWebService_ExchangeServiceBinding_SyncFolderItems alloc] initWithBinding:self success:nil error:nil
        SyncFolderItems:aSyncFolderItems
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_SyncFolderItems*)SyncFolderItems:(ExchangeWebService_SyncFolderItemsType *)aSyncFolderItems success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_SyncFolderItems *op = [[ExchangeWebService_ExchangeServiceBinding_SyncFolderItems alloc] initWithBinding:self success:success error:error
        SyncFolderItems:aSyncFolderItems
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)Unsubscribe:(ExchangeWebService_UnsubscribeType *)aUnsubscribe {
    ExchangeWebService_ExchangeServiceBinding_Unsubscribe *op = [[ExchangeWebService_ExchangeServiceBinding_Unsubscribe alloc] initWithBinding:self success:nil error:nil
        Unsubscribe:aUnsubscribe
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_Unsubscribe*)Unsubscribe:(ExchangeWebService_UnsubscribeType *)aUnsubscribe success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_Unsubscribe *op = [[ExchangeWebService_ExchangeServiceBinding_Unsubscribe alloc] initWithBinding:self success:success error:error
        Unsubscribe:aUnsubscribe
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)UpdateDelegate:(ExchangeWebService_UpdateDelegateType *)aUpdateDelegate {
    ExchangeWebService_ExchangeServiceBinding_UpdateDelegate *op = [[ExchangeWebService_ExchangeServiceBinding_UpdateDelegate alloc] initWithBinding:self success:nil error:nil
        UpdateDelegate:aUpdateDelegate
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_UpdateDelegate*)UpdateDelegate:(ExchangeWebService_UpdateDelegateType *)aUpdateDelegate success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_UpdateDelegate *op = [[ExchangeWebService_ExchangeServiceBinding_UpdateDelegate alloc] initWithBinding:self success:success error:error
        UpdateDelegate:aUpdateDelegate
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)UpdateFolder:(ExchangeWebService_UpdateFolderType *)aUpdateFolder {
    ExchangeWebService_ExchangeServiceBinding_UpdateFolder *op = [[ExchangeWebService_ExchangeServiceBinding_UpdateFolder alloc] initWithBinding:self success:nil error:nil
        UpdateFolder:aUpdateFolder
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_UpdateFolder*)UpdateFolder:(ExchangeWebService_UpdateFolderType *)aUpdateFolder success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_UpdateFolder *op = [[ExchangeWebService_ExchangeServiceBinding_UpdateFolder alloc] initWithBinding:self success:success error:error
        UpdateFolder:aUpdateFolder
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)UpdateInboxRules:(ExchangeWebService_UpdateInboxRulesRequestType *)aUpdateInboxRules {
    ExchangeWebService_ExchangeServiceBinding_UpdateInboxRules *op = [[ExchangeWebService_ExchangeServiceBinding_UpdateInboxRules alloc] initWithBinding:self success:nil error:nil
        UpdateInboxRules:aUpdateInboxRules
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_UpdateInboxRules*)UpdateInboxRules:(ExchangeWebService_UpdateInboxRulesRequestType *)aUpdateInboxRules success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_UpdateInboxRules *op = [[ExchangeWebService_ExchangeServiceBinding_UpdateInboxRules alloc] initWithBinding:self success:success error:error
        UpdateInboxRules:aUpdateInboxRules
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)UpdateItem:(ExchangeWebService_UpdateItemType *)aUpdateItem {
    ExchangeWebService_ExchangeServiceBinding_UpdateItem *op = [[ExchangeWebService_ExchangeServiceBinding_UpdateItem alloc] initWithBinding:self success:nil error:nil
        UpdateItem:aUpdateItem
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_UpdateItem*)UpdateItem:(ExchangeWebService_UpdateItemType *)aUpdateItem success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_UpdateItem *op = [[ExchangeWebService_ExchangeServiceBinding_UpdateItem alloc] initWithBinding:self success:success error:error
        UpdateItem:aUpdateItem
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)UpdateUserConfiguration:(ExchangeWebService_UpdateUserConfigurationType *)aUpdateUserConfiguration {
    ExchangeWebService_ExchangeServiceBinding_UpdateUserConfiguration *op = [[ExchangeWebService_ExchangeServiceBinding_UpdateUserConfiguration alloc] initWithBinding:self success:nil error:nil
        UpdateUserConfiguration:aUpdateUserConfiguration
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_UpdateUserConfiguration*)UpdateUserConfiguration:(ExchangeWebService_UpdateUserConfigurationType *)aUpdateUserConfiguration success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_UpdateUserConfiguration *op = [[ExchangeWebService_ExchangeServiceBinding_UpdateUserConfiguration alloc] initWithBinding:self success:success error:error
        UpdateUserConfiguration:aUpdateUserConfiguration
    ];
    [op start];
    return op;
}
- (ExchangeWebService_ExchangeServiceBindingResponse *)UploadItems:(ExchangeWebService_UploadItemsType *)aUploadItems {
    ExchangeWebService_ExchangeServiceBinding_UploadItems *op = [[ExchangeWebService_ExchangeServiceBinding_UploadItems alloc] initWithBinding:self success:nil error:nil
        UploadItems:aUploadItems
    ];

    return [self performSynchronousOperation:op];
}

- (ExchangeWebService_ExchangeServiceBinding_UploadItems*)UploadItems:(ExchangeWebService_UploadItemsType *)aUploadItems success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    ExchangeWebService_ExchangeServiceBinding_UploadItems *op = [[ExchangeWebService_ExchangeServiceBinding_UploadItems alloc] initWithBinding:self success:success error:error
        UploadItems:aUploadItems
    ];
    [op start];
    return op;
}

- (void)sendHTTPCallUsingBody:(NSString *)outputBody soapAction:(NSString *)soapAction forOperation:(ExchangeWebService_ExchangeServiceBindingOperation *)operation {
    if (!outputBody) {
        NSError *err = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingNULLRequestException" code:0 userInfo:nil];
        [operation connection:nil didFailWithError:err];
        return;
    }

    //Output body for testing
//    outputBody = @"<?xml version=\"1.0\"?> <soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:ExchangeWebService=\"http://schemas.microsoft.com/exchange/services/2006/messages\" xmlns:m=\"http://www.w3.org/1999/xhtml\" xmlns:t=\"http://schemas.microsoft.com/exchange/services/2006/types\" xsl:version=\"1.0\"> <soap:Header> <t:RequestServerVersion Version=\"Exchange2010_SP2\"/> </soap:Header> <soap:Body> <GetUserAvailabilityRequest xmlns=\"http://schemas.microsoft.com/exchange/services/2006/messages\" xmlns:t=\"http://schemas.microsoft.com/exchange/services/2006/types\"> <t:TimeZone xmlns=\"http://schemas.microsoft.com/exchange/services/2006/types\"><Bias>330</Bias> <StandardTime> <Bias>0</Bias> <Time>12:00:00</Time> <DayOrder>3</DayOrder> <Month>0</Month> <DayOfWeek>Wednesday</DayOfWeek> </StandardTime> <DaylightTime> <Bias>0</Bias> <Time>00:00:00</Time> <DayOrder>0</DayOrder> <Month>0</Month> <DayOfWeek>Sunday</DayOfWeek> </DaylightTime> </t:TimeZone> <ExchangeWebService:MailboxDataArray> <t:MailboxData> <t:Email> <t:Address>boardroom@vmex.com</t:Address> </t:Email> <t:AttendeeType>Required</t:AttendeeType> <t:ExcludeConflicts>0</t:ExcludeConflicts> </t:MailboxData> </ExchangeWebService:MailboxDataArray> <t:FreeBusyViewOptions> <t:TimeWindow> <t:StartTime>2015-03-18T09:35:21</t:StartTime> <t:EndTime>2015-03-18T10:35:21</t:EndTime> </t:TimeWindow> <t:MergedFreeBusyIntervalInMinutes>45</t:MergedFreeBusyIntervalInMinutes> <t:RequestedView>FreeBusy</t:RequestedView> </t:FreeBusyViewOptions> </GetUserAvailabilityRequest> </soap:Body> </soap:Envelope>";
    
    
    
    
   //Down are the working ones
    
//    outputBody = @"<?xml version=\"1.0\" encoding=\"utf-8\"?>  <soap:Envelope xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:t=\"http://schemas.microsoft.com/exchange/services/2006/types\" xmlns:m=\"http://schemas.microsoft.com/exchange/services/2006/messages\">    <soap:Header>    <t:RequestServerVersion Version =\"Exchange2010_SP1\"/>    </soap:Header>    <soap:Body>    <m:GetRoomLists />    </soap:Body>    </soap:Envelope>";
    
//    outputBody = @"<?xml version=\"1.0\" encoding=\"utf-8\"?> <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:t=\"http://schemas.microsoft.com/exchange/services/2006/types\"> <soap:Body> <GetUserAvailabilityRequest xmlns=\"http://schemas.microsoft.com/exchange/services/2006/messages\" xmlns:t=\"http://schemas.microsoft.com/exchange/services/2006/types\"> <t:TimeZone xmlns=\"http://schemas.microsoft.com/exchange/services/2006/types\"> <Bias>330</Bias> <StandardTime> <Bias>0</Bias> <Time>12:00:00</Time> <DayOrder>3</DayOrder> <Month>0</Month> <DayOfWeek>Wednesday</DayOfWeek> </StandardTime> <DaylightTime> <Bias>0</Bias> <Time>00:00:00</Time> <DayOrder>0</DayOrder> <Month>0</Month> <DayOfWeek>Sunday</DayOfWeek> </DaylightTime> </t:TimeZone> <MailboxDataArray> <t:MailboxData> <t:Email> <t:Address>boardroom@vmex.com</t:Address> </t:Email> <t:AttendeeType>Required</t:AttendeeType> <t:ExcludeConflicts>false</t:ExcludeConflicts> </t:MailboxData> </MailboxDataArray> <t:FreeBusyViewOptions> <t:TimeWindow> <t:StartTime>2015-03-18T00:00:00</t:StartTime> <t:EndTime>2015-03-19T00:00:00</t:EndTime> </t:TimeWindow> <t:MergedFreeBusyIntervalInMinutes>1440</t:MergedFreeBusyIntervalInMinutes> <t:RequestedView>DetailedMerged</t:RequestedView> </t:FreeBusyViewOptions> </GetUserAvailabilityRequest> </soap:Body> </soap:Envelope>";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.address
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                       timeoutInterval:self.timeout];
    NSData *bodyData = [outputBody dataUsingEncoding:NSUTF8StringEncoding];

    if (self.cookies)
        [request setAllHTTPHeaderFields:[NSHTTPCookie requestHeaderFieldsWithCookies:self.cookies]];
    [request setValue:@"wsdl2objc" forHTTPHeaderField:@"User-Agent"];
    [request setValue:soapAction forHTTPHeaderField:@"SOAPAction"];
    [request setValue:[[self MIMEType] stringByAppendingString:@"; charset=utf-8"] forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[bodyData length]] forHTTPHeaderField:@"Content-Length"];
    [request setValue:self.address.host forHTTPHeaderField:@"Host"];
    for (NSString *eachHeaderField in self.customHeaders)
        [request setValue:[self.customHeaders objectForKey:eachHeaderField] forHTTPHeaderField:eachHeaderField];
    [request setHTTPMethod:@"POST"];
    // set version 1.1 - how?
    [request setHTTPBody: bodyData];

    if (self.logXMLInOut) {
        NSLog(@"OutputHeaders:\n%@", [request allHTTPHeaderFields]);
        NSLog(@"OutputBody:\n%@", outputBody);
    }

    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:operation];

    operation.urlConnection = connection;
}

@end

@interface ExchangeWebService_ExchangeServiceBindingOperation ()
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
@property(nonatomic, strong) ExchangeWebService_ExchangeServiceBindingResponse *response;
@property(nonatomic, strong) ExchangeWebService_ExchangeServiceBindingSuccessBlock success;
@property(nonatomic, strong) ExchangeWebService_ExchangeServiceBindingErrorBlock error;
@property(nonatomic) BOOL isFinished;
@end

@implementation ExchangeWebService_ExchangeServiceBindingOperation
- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error {
    if ((self = [super init])) {
        self.binding = aBinding;
        self.success = success;
        self.error = error;
    }

    return self;
}

- (void)cancel {
    NSError *cancelError = [NSError errorWithDomain:(__bridge NSString *)kCFErrorDomainCFNetwork code:kCFURLErrorCancelled userInfo:nil];

    [self.urlConnection cancel];
    [super cancel];
    [self connection:self.urlConnection didFailWithError:cancelError];
}

- (void)completedWithResponse:(ExchangeWebService_ExchangeServiceBindingResponse *)aResponse {
    if (aResponse.error) {
        if (self.error)
            self.error(aResponse.error);
    }
    else if (self.success)
        self.success(aResponse.headers, aResponse.bodyParts);
    self.success = nil;
    self.error = nil;
    self.isFinished = YES;
}

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
    return [self.binding.sslManager canAuthenticateForAuthenticationMethod:protectionSpace.authenticationMethod];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    if (![self.binding.sslManager authenticateForChallenge:challenge]) {
        [[challenge sender] cancelAuthenticationChallenge:challenge];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)urlResponse {
    if (![urlResponse isKindOfClass:[NSHTTPURLResponse class]]) {
        NSLog(@"Unexpected url response: %@", urlResponse);
        return;
    }

    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)urlResponse;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseStatus: %ld\n", (long)[httpResponse statusCode]);
        NSLog(@"ResponseHeaders:\n%@", [httpResponse allHeaderFields]);
    }

    self.binding.cookies = [[NSHTTPCookie cookiesWithResponseHeaderFields:[httpResponse allHeaderFields] forURL:self.binding.address] mutableCopy];

    if ([urlResponse.MIMEType rangeOfString:[self.binding MIMEType]].length != 0)
        return;

    NSInteger contentLength = [httpResponse.allHeaderFields[@"Content-Length"] integerValue];

    if (contentLength == 0 && self.binding.ignoreEmptyResponse) {
        [self completedWithResponse:self.response];
        return;
    }

    NSError *error = nil;
    [connection cancel];
    if ([httpResponse statusCode] >= 400) {
        NSDictionary *userInfo =  @{NSURLErrorKey: httpResponse.URL ?: @"",
                                    NSLocalizedDescriptionKey: [NSHTTPURLResponse localizedStringForStatusCode:[httpResponse statusCode]]};
        error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseHTTP" code:[httpResponse statusCode] userInfo:userInfo];
    } else {
        NSDictionary *userInfo =  @{NSURLErrorKey: httpResponse.URL ?: @"",
                                    NSLocalizedDescriptionKey: [NSString stringWithFormat:@"Unexpected response MIME type to SOAP call:%@", urlResponse.MIMEType]};
        error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseHTTP" code:1 userInfo:userInfo];
    }

    [self connection:connection didFailWithError:error];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    if (!self.responseData)
        self.responseData = [data mutableCopy];
    else
        [self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    if (self.binding.logXMLInOut && (![[error domain] isEqualToString:(__bridge NSString *)kCFErrorDomainCFNetwork] || [error code] != kCFURLErrorCancelled)) {
        NSLog(@"ResponseError:\n%@", error);
    }
    self.response.error = error;
    [self completedWithResponse:self.response];
}

@end

@implementation ExchangeWebService_ExchangeServiceBinding_AddDelegate

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
AddDelegate:(ExchangeWebService_AddDelegateType *)aAddDelegate
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.AddDelegate = aAddDelegate;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/AddDelegate"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_AddDelegate)
        [ExchangeWebService_AddDelegateType serializeToChildOf:bodyNode withName:"ExchangeWebService:AddDelegate" value:_AddDelegate];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"AddDelegateResponse": [ExchangeWebService_AddDelegateResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_ApplyConversationAction

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
ApplyConversationAction:(ExchangeWebService_ApplyConversationActionType *)aApplyConversationAction
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.ApplyConversationAction = aApplyConversationAction;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/ApplyConversationAction"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_ApplyConversationAction)
        [ExchangeWebService_ApplyConversationActionType serializeToChildOf:bodyNode withName:"ExchangeWebService:ApplyConversationAction" value:_ApplyConversationAction];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"ApplyConversationActionResponse": [ExchangeWebService_ApplyConversationActionResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_ConvertId

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
ConvertId:(ExchangeWebService_ConvertIdType *)aConvertId
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.ConvertId = aConvertId;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/ConvertId"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_ConvertId)
        [ExchangeWebService_ConvertIdType serializeToChildOf:bodyNode withName:"ExchangeWebService:ConvertId" value:_ConvertId];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"ConvertIdResponse": [ExchangeWebService_ConvertIdResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_CopyFolder

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
CopyFolder:(ExchangeWebService_CopyFolderType *)aCopyFolder
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.CopyFolder = aCopyFolder;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/CopyFolder"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_CopyFolder)
        [ExchangeWebService_CopyFolderType serializeToChildOf:bodyNode withName:"ExchangeWebService:CopyFolder" value:_CopyFolder];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"CopyFolderResponse": [ExchangeWebService_CopyFolderResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_CopyItem

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
CopyItem:(ExchangeWebService_CopyItemType *)aCopyItem
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.CopyItem = aCopyItem;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/CopyItem"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_CopyItem)
        [ExchangeWebService_CopyItemType serializeToChildOf:bodyNode withName:"ExchangeWebService:CopyItem" value:_CopyItem];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"CopyItemResponse": [ExchangeWebService_CopyItemResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_CreateAttachment

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
CreateAttachment:(ExchangeWebService_CreateAttachmentType *)aCreateAttachment
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.CreateAttachment = aCreateAttachment;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/CreateAttachment"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.TimeZoneContextHeader)
        [t_TimeZoneContextType serializeToChildOf:headerNode withName:"t:TimeZoneContext" value:self.binding.TimeZoneContextHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_CreateAttachment)
        [ExchangeWebService_CreateAttachmentType serializeToChildOf:bodyNode withName:"ExchangeWebService:CreateAttachment" value:_CreateAttachment];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"CreateAttachmentResponse": [ExchangeWebService_CreateAttachmentResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_CreateFolder

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
CreateFolder:(ExchangeWebService_CreateFolderType *)aCreateFolder
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.CreateFolder = aCreateFolder;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/CreateFolder"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.TimeZoneContextHeader)
        [t_TimeZoneContextType serializeToChildOf:headerNode withName:"t:TimeZoneContext" value:self.binding.TimeZoneContextHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_CreateFolder)
        [ExchangeWebService_CreateFolderType serializeToChildOf:bodyNode withName:"ExchangeWebService:CreateFolder" value:_CreateFolder];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"CreateFolderResponse": [ExchangeWebService_CreateFolderResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_CreateItem

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
CreateItem:(ExchangeWebService_CreateItemType *)aCreateItem
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.CreateItem = aCreateItem;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/CreateItem"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.TimeZoneContextHeader)
        [t_TimeZoneContextType serializeToChildOf:headerNode withName:"t:TimeZoneContext" value:self.binding.TimeZoneContextHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_CreateItem)
        [ExchangeWebService_CreateItemType serializeToChildOf:bodyNode withName:"ExchangeWebService:CreateItem" value:_CreateItem];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"CreateItemResponse": [ExchangeWebService_CreateItemResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_CreateManagedFolder

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
CreateManagedFolder:(ExchangeWebService_CreateManagedFolderRequestType *)aCreateManagedFolder
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.CreateManagedFolder = aCreateManagedFolder;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/CreateManagedFolder"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_CreateManagedFolder)
        [ExchangeWebService_CreateManagedFolderRequestType serializeToChildOf:bodyNode withName:"ExchangeWebService:CreateManagedFolder" value:_CreateManagedFolder];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"CreateManagedFolderResponse": [ExchangeWebService_CreateManagedFolderResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_CreateUserConfiguration

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
CreateUserConfiguration:(ExchangeWebService_CreateUserConfigurationType *)aCreateUserConfiguration
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.CreateUserConfiguration = aCreateUserConfiguration;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/CreateUserConfiguration"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_CreateUserConfiguration)
        [ExchangeWebService_CreateUserConfigurationType serializeToChildOf:bodyNode withName:"ExchangeWebService:CreateUserConfiguration" value:_CreateUserConfiguration];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"CreateUserConfigurationResponse": [ExchangeWebService_CreateUserConfigurationResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_DeleteAttachment

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
DeleteAttachment:(ExchangeWebService_DeleteAttachmentType *)aDeleteAttachment
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.DeleteAttachment = aDeleteAttachment;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/DeleteAttachment"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_DeleteAttachment)
        [ExchangeWebService_DeleteAttachmentType serializeToChildOf:bodyNode withName:"ExchangeWebService:DeleteAttachment" value:_DeleteAttachment];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"DeleteAttachmentResponse": [ExchangeWebService_DeleteAttachmentResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_DeleteFolder

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
DeleteFolder:(ExchangeWebService_DeleteFolderType *)aDeleteFolder
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.DeleteFolder = aDeleteFolder;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/DeleteFolder"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_DeleteFolder)
        [ExchangeWebService_DeleteFolderType serializeToChildOf:bodyNode withName:"ExchangeWebService:DeleteFolder" value:_DeleteFolder];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"DeleteFolderResponse": [ExchangeWebService_DeleteFolderResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_DeleteItem

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
DeleteItem:(ExchangeWebService_DeleteItemType *)aDeleteItem
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.DeleteItem = aDeleteItem;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/DeleteItem"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_DeleteItem)
        [ExchangeWebService_DeleteItemType serializeToChildOf:bodyNode withName:"ExchangeWebService:DeleteItem" value:_DeleteItem];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"DeleteItemResponse": [ExchangeWebService_DeleteItemResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_DeleteUserConfiguration

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
DeleteUserConfiguration:(ExchangeWebService_DeleteUserConfigurationType *)aDeleteUserConfiguration
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.DeleteUserConfiguration = aDeleteUserConfiguration;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/DeleteUserConfiguration"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_DeleteUserConfiguration)
        [ExchangeWebService_DeleteUserConfigurationType serializeToChildOf:bodyNode withName:"ExchangeWebService:DeleteUserConfiguration" value:_DeleteUserConfiguration];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"DeleteUserConfigurationResponse": [ExchangeWebService_DeleteUserConfigurationResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_DisconnectPhoneCall

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
DisconnectPhoneCall:(ExchangeWebService_DisconnectPhoneCallType *)aDisconnectPhoneCall
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.DisconnectPhoneCall = aDisconnectPhoneCall;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/DisconnectPhoneCall"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_DisconnectPhoneCall)
        [ExchangeWebService_DisconnectPhoneCallType serializeToChildOf:bodyNode withName:"ExchangeWebService:DisconnectPhoneCall" value:_DisconnectPhoneCall];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"DisconnectPhoneCallResponse": [ExchangeWebService_DisconnectPhoneCallResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_EmptyFolder

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
EmptyFolder:(ExchangeWebService_EmptyFolderType *)aEmptyFolder
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.EmptyFolder = aEmptyFolder;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/EmptyFolder"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_EmptyFolder)
        [ExchangeWebService_EmptyFolderType serializeToChildOf:bodyNode withName:"ExchangeWebService:EmptyFolder" value:_EmptyFolder];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"EmptyFolderResponse": [ExchangeWebService_EmptyFolderResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_ExpandDL

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
ExpandDL:(ExchangeWebService_ExpandDLType *)aExpandDL
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.ExpandDL = aExpandDL;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/ExpandDL"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_ExpandDL)
        [ExchangeWebService_ExpandDLType serializeToChildOf:bodyNode withName:"ExchangeWebService:ExpandDL" value:_ExpandDL];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"ExpandDLResponse": [ExchangeWebService_ExpandDLResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_ExportItems

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
ExportItems:(ExchangeWebService_ExportItemsType *)aExportItems
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.ExportItems = aExportItems;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/ExportItems"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_ExportItems)
        [ExchangeWebService_ExportItemsType serializeToChildOf:bodyNode withName:"ExchangeWebService:ExportItems" value:_ExportItems];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"ExportItemsResponse": [ExchangeWebService_ExportItemsResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_FindConversation

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
FindConversation:(ExchangeWebService_FindConversationType *)aFindConversation
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.FindConversation = aFindConversation;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/FindConversation"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_FindConversation)
        [ExchangeWebService_FindConversationType serializeToChildOf:bodyNode withName:"ExchangeWebService:FindConversation" value:_FindConversation];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"FindConversationResponse": [ExchangeWebService_FindConversationResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_FindFolder

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
FindFolder:(ExchangeWebService_FindFolderType *)aFindFolder
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.FindFolder = aFindFolder;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/FindFolder"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.TimeZoneContextHeader)
        [t_TimeZoneContextType serializeToChildOf:headerNode withName:"t:TimeZoneContext" value:self.binding.TimeZoneContextHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_FindFolder)
        [ExchangeWebService_FindFolderType serializeToChildOf:bodyNode withName:"ExchangeWebService:FindFolder" value:_FindFolder];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"FindFolderResponse": [ExchangeWebService_FindFolderResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_FindItem

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
FindItem:(ExchangeWebService_FindItemType *)aFindItem
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.FindItem = aFindItem;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/FindItem"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.TimeZoneContextHeader)
        [t_TimeZoneContextType serializeToChildOf:headerNode withName:"t:TimeZoneContext" value:self.binding.TimeZoneContextHeader];

    if (self.binding.DateTimePrecisionHeader)
        [t_DateTimePrecisionType serializeToChildOf:headerNode withName:"t:DateTimePrecision" value:self.binding.DateTimePrecisionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_FindItem)
        [ExchangeWebService_FindItemType serializeToChildOf:bodyNode withName:"ExchangeWebService:FindItem" value:_FindItem];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"FindItemResponse": [ExchangeWebService_FindItemResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_FindMessageTrackingReport

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
FindMessageTrackingReport:(ExchangeWebService_FindMessageTrackingReportRequestType *)aFindMessageTrackingReport
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.FindMessageTrackingReport = aFindMessageTrackingReport;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/FindMessageTrackingReport"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_FindMessageTrackingReport)
        [ExchangeWebService_FindMessageTrackingReportRequestType serializeToChildOf:bodyNode withName:"ExchangeWebService:FindMessageTrackingReport" value:_FindMessageTrackingReport];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"FindMessageTrackingReportResponse": [ExchangeWebService_FindMessageTrackingReportResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetAttachment

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetAttachment:(ExchangeWebService_GetAttachmentType *)aGetAttachment
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetAttachment = aGetAttachment;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetAttachment"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.TimeZoneContextHeader)
        [t_TimeZoneContextType serializeToChildOf:headerNode withName:"t:TimeZoneContext" value:self.binding.TimeZoneContextHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetAttachment)
        [ExchangeWebService_GetAttachmentType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetAttachment" value:_GetAttachment];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetAttachmentResponse": [ExchangeWebService_GetAttachmentResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetDelegate

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetDelegate:(ExchangeWebService_GetDelegateType *)aGetDelegate
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetDelegate = aGetDelegate;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetDelegate"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetDelegate)
        [ExchangeWebService_GetDelegateType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetDelegate" value:_GetDelegate];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetDelegateResponse": [ExchangeWebService_GetDelegateResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetEvents

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetEvents:(ExchangeWebService_GetEventsType *)aGetEvents
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetEvents = aGetEvents;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetEvents"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetEvents)
        [ExchangeWebService_GetEventsType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetEvents" value:_GetEvents];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetEventsResponse": [ExchangeWebService_GetEventsResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetFolder

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetFolder:(ExchangeWebService_GetFolderType *)aGetFolder
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetFolder = aGetFolder;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetFolder"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.TimeZoneContextHeader)
        [t_TimeZoneContextType serializeToChildOf:headerNode withName:"t:TimeZoneContext" value:self.binding.TimeZoneContextHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetFolder)
        [ExchangeWebService_GetFolderType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetFolder" value:_GetFolder];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetFolderResponse": [ExchangeWebService_GetFolderResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetInboxRules

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetInboxRules:(ExchangeWebService_GetInboxRulesRequestType *)aGetInboxRules
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetInboxRules = aGetInboxRules;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetInboxRules"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.TimeZoneContextHeader)
        [t_TimeZoneContextType serializeToChildOf:headerNode withName:"t:TimeZoneContext" value:self.binding.TimeZoneContextHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetInboxRules)
        [ExchangeWebService_GetInboxRulesRequestType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetInboxRules" value:_GetInboxRules];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetInboxRulesResponse": [ExchangeWebService_GetInboxRulesResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetItem

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetItem:(ExchangeWebService_GetItemType *)aGetItem
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetItem = aGetItem;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetItem"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.TimeZoneContextHeader)
        [t_TimeZoneContextType serializeToChildOf:headerNode withName:"t:TimeZoneContext" value:self.binding.TimeZoneContextHeader];

    if (self.binding.DateTimePrecisionHeader)
        [t_DateTimePrecisionType serializeToChildOf:headerNode withName:"t:DateTimePrecision" value:self.binding.DateTimePrecisionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetItem)
        [ExchangeWebService_GetItemType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetItem" value:_GetItem];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetItemResponse": [ExchangeWebService_GetItemResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetMailTips

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetMailTips:(ExchangeWebService_GetMailTipsType *)aGetMailTips
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetMailTips = aGetMailTips;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetMailTips"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetMailTips)
        [ExchangeWebService_GetMailTipsType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetMailTips" value:_GetMailTips];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetMailTipsResponse": [ExchangeWebService_GetMailTipsResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetMessageTrackingReport

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetMessageTrackingReport:(ExchangeWebService_GetMessageTrackingReportRequestType *)aGetMessageTrackingReport
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetMessageTrackingReport = aGetMessageTrackingReport;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetMessageTrackingReport"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetMessageTrackingReport)
        [ExchangeWebService_GetMessageTrackingReportRequestType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetMessageTrackingReport" value:_GetMessageTrackingReport];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetMessageTrackingReportResponse": [ExchangeWebService_GetMessageTrackingReportResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetPasswordExpirationDate

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetPasswordExpirationDate:(ExchangeWebService_GetPasswordExpirationDateType *)aGetPasswordExpirationDate
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetPasswordExpirationDate = aGetPasswordExpirationDate;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetPasswordExpirationDate"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetPasswordExpirationDate)
        [ExchangeWebService_GetPasswordExpirationDateType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetPasswordExpirationDate" value:_GetPasswordExpirationDate];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetPasswordExpirationDateResponse": [ExchangeWebService_GetPasswordExpirationDateResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetPhoneCallInformation

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetPhoneCallInformation:(ExchangeWebService_GetPhoneCallInformationType *)aGetPhoneCallInformation
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetPhoneCallInformation = aGetPhoneCallInformation;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetPhoneCallInformation"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetPhoneCallInformation)
        [ExchangeWebService_GetPhoneCallInformationType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetPhoneCallInformation" value:_GetPhoneCallInformation];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetPhoneCallInformationResponse": [ExchangeWebService_GetPhoneCallInformationResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetRoomLists

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetRoomLists:(ExchangeWebService_GetRoomListsType *)aGetRoomLists
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetRoomLists = aGetRoomLists;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetRoomLists"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetRoomLists)
        [ExchangeWebService_GetRoomListsType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetRoomLists" value:_GetRoomLists];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetRoomListsResponse": [ExchangeWebService_GetRoomListsResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetRooms

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetRooms:(ExchangeWebService_GetRoomsType *)aGetRooms
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetRooms = aGetRooms;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetRooms"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetRooms)
        [ExchangeWebService_GetRoomsType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetRooms" value:_GetRooms];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetRoomsResponse": [ExchangeWebService_GetRoomsResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetServerTimeZones

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetServerTimeZones:(ExchangeWebService_GetServerTimeZonesType *)aGetServerTimeZones
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetServerTimeZones = aGetServerTimeZones;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetServerTimeZones"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetServerTimeZones)
        [ExchangeWebService_GetServerTimeZonesType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetServerTimeZones" value:_GetServerTimeZones];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetServerTimeZonesResponse": [ExchangeWebService_GetServerTimeZonesResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetServiceConfiguration

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetServiceConfiguration:(ExchangeWebService_GetServiceConfigurationType *)aGetServiceConfiguration
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetServiceConfiguration = aGetServiceConfiguration;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetServiceConfiguration"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetServiceConfiguration)
        [ExchangeWebService_GetServiceConfigurationType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetServiceConfiguration" value:_GetServiceConfiguration];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetServiceConfigurationResponse": [ExchangeWebService_GetServiceConfigurationResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetSharingFolder

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetSharingFolder:(ExchangeWebService_GetSharingFolderType *)aGetSharingFolder
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetSharingFolder = aGetSharingFolder;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetSharingFolder"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetSharingFolder)
        [ExchangeWebService_GetSharingFolderType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetSharingFolder" value:_GetSharingFolder];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetSharingFolderResponse": [ExchangeWebService_GetSharingFolderResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetSharingMetadata

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetSharingMetadata:(ExchangeWebService_GetSharingMetadataType *)aGetSharingMetadata
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetSharingMetadata = aGetSharingMetadata;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetSharingMetadata"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetSharingMetadata)
        [ExchangeWebService_GetSharingMetadataType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetSharingMetadata" value:_GetSharingMetadata];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetSharingMetadataResponse": [ExchangeWebService_GetSharingMetadataResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetStreamingEvents

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetStreamingEvents:(ExchangeWebService_GetStreamingEventsType *)aGetStreamingEvents
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetStreamingEvents = aGetStreamingEvents;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetEvents"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetStreamingEvents)
        [ExchangeWebService_GetStreamingEventsType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetStreamingEvents" value:_GetStreamingEvents];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetStreamingEventsResponse": [ExchangeWebService_GetStreamingEventsResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetUserAvailability

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetUserAvailabilityRequest:(ExchangeWebService_GetUserAvailabilityRequestType *)aGetUserAvailabilityRequest
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetUserAvailabilityRequest = aGetUserAvailabilityRequest;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;
//    operationXMLString = @"<?xml version=\"1.0\"?> <soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:ExchangeWebService=\"http://schemas.microsoft.com/exchange/services/2006/messages\" xmlns:m=\"http://www.w3.org/1999/xhtml\" xmlns:t=\"http://schemas.microsoft.com/exchange/services/2006/types\" xsl:version=\"1.0\"> <soap:Header> <t:TimeZoneContext> <t:TimeZoneDefinition Id=\"India Standard Time\"/> </t:TimeZoneContext> <t:RequestServerVersion Version=\"Exchange2010\"/> </soap:Header><soap:Body> <GetUserAvailabilityRequest xmlns=\"http://schemas.microsoft.com/exchange/services/2006/messages\" xmlns:t=\"http://schemas.microsoft.com/exchange/services/2006/types\"> <t:TimeZone xmlns=\"http://schemas.microsoft.com/exchange/services/2006/types\"> <Bias>480</Bias> <StandardTime> <Bias>0</Bias> <Time>02:00:00</Time> <DayOrder>5</DayOrder> <Month>10</Month> <DayOfWeek>Sunday</DayOfWeek> </StandardTime> <DaylightTime> <Bias>-60</Bias> <Time>02:00:00</Time> <DayOrder>1</DayOrder> <Month>4</Month> <DayOfWeek>Sunday</DayOfWeek> </DaylightTime> </t:TimeZone> <MailboxDataArray> <t:MailboxData> <t:Email> <t:Address>user1@vmexchange.com</t:Address> </t:Email> <t:AttendeeType>Required</t:AttendeeType> <t:ExcludeConflicts>false</t:ExcludeConflicts> </t:MailboxData> </MailboxDataArray> <t:FreeBusyViewOptions> <t:TimeWindow> <t:StartTime>2006-10-16T00:00:00</t:StartTime> <t:EndTime>2006-10-16T23:59:59</t:EndTime> </t:TimeWindow> <t:MergedFreeBusyIntervalInMinutes>60</t:MergedFreeBusyIntervalInMinutes> <t:RequestedView>DetailedMerged</t:RequestedView> </t:FreeBusyViewOptions> </GetUserAvailabilityRequest> </soap:Body> </soap:Envelope>";
    
    
    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetUserAvailability"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.TimeZoneContextHeader)
        [t_TimeZoneContextType serializeToChildOf:headerNode withName:"t:TimeZoneContext" value:self.binding.TimeZoneContextHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetUserAvailabilityRequest)
        [ExchangeWebService_GetUserAvailabilityRequestType serializeToChildOf:bodyNode withName:"GetUserAvailabilityRequest" value:_GetUserAvailabilityRequest];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetUserAvailabilityResponse": [ExchangeWebService_GetUserAvailabilityResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetUserConfiguration

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetUserConfiguration:(ExchangeWebService_GetUserConfigurationType *)aGetUserConfiguration
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetUserConfiguration = aGetUserConfiguration;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetUserConfiguration"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetUserConfiguration)
        [ExchangeWebService_GetUserConfigurationType serializeToChildOf:bodyNode withName:"ExchangeWebService:GetUserConfiguration" value:_GetUserConfiguration];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetUserConfigurationResponse": [ExchangeWebService_GetUserConfigurationResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_GetUserOofSettings

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
GetUserOofSettingsRequest:(ExchangeWebService_GetUserOofSettingsRequest *)aGetUserOofSettingsRequest
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.GetUserOofSettingsRequest = aGetUserOofSettingsRequest;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/GetUserOofSettings"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_GetUserOofSettingsRequest)
        [ExchangeWebService_GetUserOofSettingsRequest serializeToChildOf:bodyNode withName:"ExchangeWebService:GetUserOofSettingsRequest" value:_GetUserOofSettingsRequest];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"GetUserOofSettingsResponse": [ExchangeWebService_GetUserOofSettingsResponse class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_MoveFolder

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
MoveFolder:(ExchangeWebService_MoveFolderType *)aMoveFolder
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.MoveFolder = aMoveFolder;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/MoveFolder"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_MoveFolder)
        [ExchangeWebService_MoveFolderType serializeToChildOf:bodyNode withName:"ExchangeWebService:MoveFolder" value:_MoveFolder];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"MoveFolderResponse": [ExchangeWebService_MoveFolderResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_MoveItem

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
MoveItem:(ExchangeWebService_MoveItemType *)aMoveItem
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.MoveItem = aMoveItem;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/MoveItem"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_MoveItem)
        [ExchangeWebService_MoveItemType serializeToChildOf:bodyNode withName:"ExchangeWebService:MoveItem" value:_MoveItem];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"MoveItemResponse": [ExchangeWebService_MoveItemResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_PlayOnPhone

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
PlayOnPhone:(ExchangeWebService_PlayOnPhoneType *)aPlayOnPhone
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.PlayOnPhone = aPlayOnPhone;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/PlayOnPhone"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_PlayOnPhone)
        [ExchangeWebService_PlayOnPhoneType serializeToChildOf:bodyNode withName:"ExchangeWebService:PlayOnPhone" value:_PlayOnPhone];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"PlayOnPhoneResponse": [ExchangeWebService_PlayOnPhoneResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_RefreshSharingFolder

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
RefreshSharingFolder:(ExchangeWebService_RefreshSharingFolderType *)aRefreshSharingFolder
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.RefreshSharingFolder = aRefreshSharingFolder;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/RefreshSharingFolder"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_RefreshSharingFolder)
        [ExchangeWebService_RefreshSharingFolderType serializeToChildOf:bodyNode withName:"ExchangeWebService:RefreshSharingFolder" value:_RefreshSharingFolder];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"RefreshSharingFolderResponse": [ExchangeWebService_RefreshSharingFolderResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_RemoveDelegate

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
RemoveDelegate:(ExchangeWebService_RemoveDelegateType *)aRemoveDelegate
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.RemoveDelegate = aRemoveDelegate;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/RemoveDelegate"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_RemoveDelegate)
        [ExchangeWebService_RemoveDelegateType serializeToChildOf:bodyNode withName:"ExchangeWebService:RemoveDelegate" value:_RemoveDelegate];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"RemoveDelegateResponse": [ExchangeWebService_RemoveDelegateResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_ResolveNames

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
ResolveNames:(ExchangeWebService_ResolveNamesType *)aResolveNames
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.ResolveNames = aResolveNames;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/ResolveNames"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_ResolveNames)
        [ExchangeWebService_ResolveNamesType serializeToChildOf:bodyNode withName:"ExchangeWebService:ResolveNames" value:_ResolveNames];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"ResolveNamesResponse": [ExchangeWebService_ResolveNamesResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_SendItem

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
SendItem:(ExchangeWebService_SendItemType *)aSendItem
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.SendItem = aSendItem;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/SendItem"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_SendItem)
        [ExchangeWebService_SendItemType serializeToChildOf:bodyNode withName:"ExchangeWebService:SendItem" value:_SendItem];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"SendItemResponse": [ExchangeWebService_SendItemResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_SetUserOofSettings

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
SetUserOofSettingsRequest:(ExchangeWebService_SetUserOofSettingsRequest *)aSetUserOofSettingsRequest
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.SetUserOofSettingsRequest = aSetUserOofSettingsRequest;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/SetUserOofSettings"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_SetUserOofSettingsRequest)
        [ExchangeWebService_SetUserOofSettingsRequest serializeToChildOf:bodyNode withName:"ExchangeWebService:SetUserOofSettingsRequest" value:_SetUserOofSettingsRequest];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"SetUserOofSettingsResponse": [ExchangeWebService_SetUserOofSettingsResponse class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_Subscribe

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
Subscribe:(ExchangeWebService_SubscribeType *)aSubscribe
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.Subscribe = aSubscribe;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/Subscribe"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_Subscribe)
        [ExchangeWebService_SubscribeType serializeToChildOf:bodyNode withName:"ExchangeWebService:Subscribe" value:_Subscribe];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"SubscribeResponse": [ExchangeWebService_SubscribeResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_SyncFolderHierarchy

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
SyncFolderHierarchy:(ExchangeWebService_SyncFolderHierarchyType *)aSyncFolderHierarchy
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.SyncFolderHierarchy = aSyncFolderHierarchy;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/SyncFolderHierarchy"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_SyncFolderHierarchy)
        [ExchangeWebService_SyncFolderHierarchyType serializeToChildOf:bodyNode withName:"ExchangeWebService:SyncFolderHierarchy" value:_SyncFolderHierarchy];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"SyncFolderHierarchyResponse": [ExchangeWebService_SyncFolderHierarchyResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_SyncFolderItems

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
SyncFolderItems:(ExchangeWebService_SyncFolderItemsType *)aSyncFolderItems
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.SyncFolderItems = aSyncFolderItems;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/SyncFolderItems"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_SyncFolderItems)
        [ExchangeWebService_SyncFolderItemsType serializeToChildOf:bodyNode withName:"ExchangeWebService:SyncFolderItems" value:_SyncFolderItems];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"SyncFolderItemsResponse": [ExchangeWebService_SyncFolderItemsResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_Unsubscribe

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
Unsubscribe:(ExchangeWebService_UnsubscribeType *)aUnsubscribe
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.Unsubscribe = aUnsubscribe;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/Unsubscribe"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_Unsubscribe)
        [ExchangeWebService_UnsubscribeType serializeToChildOf:bodyNode withName:"ExchangeWebService:Unsubscribe" value:_Unsubscribe];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"UnsubscribeResponse": [ExchangeWebService_UnsubscribeResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_UpdateDelegate

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
UpdateDelegate:(ExchangeWebService_UpdateDelegateType *)aUpdateDelegate
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.UpdateDelegate = aUpdateDelegate;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/UpdateDelegate"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_UpdateDelegate)
        [ExchangeWebService_UpdateDelegateType serializeToChildOf:bodyNode withName:"ExchangeWebService:UpdateDelegate" value:_UpdateDelegate];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"UpdateDelegateResponse": [ExchangeWebService_UpdateDelegateResponseMessageType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_UpdateFolder

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
UpdateFolder:(ExchangeWebService_UpdateFolderType *)aUpdateFolder
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.UpdateFolder = aUpdateFolder;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/UpdateFolder"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.TimeZoneContextHeader)
        [t_TimeZoneContextType serializeToChildOf:headerNode withName:"t:TimeZoneContext" value:self.binding.TimeZoneContextHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_UpdateFolder)
        [ExchangeWebService_UpdateFolderType serializeToChildOf:bodyNode withName:"ExchangeWebService:UpdateFolder" value:_UpdateFolder];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"UpdateFolderResponse": [ExchangeWebService_UpdateFolderResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_UpdateInboxRules

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
UpdateInboxRules:(ExchangeWebService_UpdateInboxRulesRequestType *)aUpdateInboxRules
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.UpdateInboxRules = aUpdateInboxRules;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/UpdateInboxRules"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.TimeZoneContextHeader)
        [t_TimeZoneContextType serializeToChildOf:headerNode withName:"t:TimeZoneContext" value:self.binding.TimeZoneContextHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_UpdateInboxRules)
        [ExchangeWebService_UpdateInboxRulesRequestType serializeToChildOf:bodyNode withName:"ExchangeWebService:UpdateInboxRules" value:_UpdateInboxRules];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"UpdateInboxRulesResponse": [ExchangeWebService_UpdateInboxRulesResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_UpdateItem

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
UpdateItem:(ExchangeWebService_UpdateItemType *)aUpdateItem
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.UpdateItem = aUpdateItem;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/UpdateItem"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    if (self.binding.TimeZoneContextHeader)
        [t_TimeZoneContextType serializeToChildOf:headerNode withName:"t:TimeZoneContext" value:self.binding.TimeZoneContextHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_UpdateItem)
        [ExchangeWebService_UpdateItemType serializeToChildOf:bodyNode withName:"ExchangeWebService:UpdateItem" value:_UpdateItem];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"UpdateItemResponse": [ExchangeWebService_UpdateItemResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_UpdateUserConfiguration

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
UpdateUserConfiguration:(ExchangeWebService_UpdateUserConfigurationType *)aUpdateUserConfiguration
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.UpdateUserConfiguration = aUpdateUserConfiguration;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/UpdateUserConfiguration"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_UpdateUserConfiguration)
        [ExchangeWebService_UpdateUserConfigurationType serializeToChildOf:bodyNode withName:"ExchangeWebService:UpdateUserConfiguration" value:_UpdateUserConfiguration];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"UpdateUserConfigurationResponse": [ExchangeWebService_UpdateUserConfigurationResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end
@implementation ExchangeWebService_ExchangeServiceBinding_UploadItems

- (id)initWithBinding:(ExchangeWebService_ExchangeServiceBinding *)aBinding success:(ExchangeWebService_ExchangeServiceBindingSuccessBlock)success error:(ExchangeWebService_ExchangeServiceBindingErrorBlock)error
UploadItems:(ExchangeWebService_UploadItemsType *)aUploadItems
{
    if ((self = [super initWithBinding:aBinding success:success error:error])) {
        self.UploadItems = aUploadItems;
    }

    return self;
}

- (void)main {
    self.response = [ExchangeWebService_ExchangeServiceBindingResponse new];

    NSString *operationXMLString = [ExchangeWebService_ExchangeServiceBinding_envelope serializedFormUsingDelegate:self];
    operationXMLString = self.binding.soapSigner ? [self.binding.soapSigner signRequest:operationXMLString] : operationXMLString;

    [self.binding sendHTTPCallUsingBody:operationXMLString
                             soapAction:@"http://schemas.microsoft.com/exchange/services/2006/messages/UploadItems"
                           forOperation:self];
}

- (void)addSoapBody:(xmlNodePtr)root {
    xmlNodePtr headerNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Header", NULL);
    xmlAddChild(root, headerNode);

    if (self.binding.ExchangeImpersonationHeader)
        [t_ExchangeImpersonationType serializeToChildOf:headerNode withName:"t:ExchangeImpersonation" value:self.binding.ExchangeImpersonationHeader];

    if (self.binding.MailboxCultureHeader)
        [t_MailboxCultureType serializeToChildOf:headerNode withName:"t:MailboxCulture" value:self.binding.MailboxCultureHeader];

    if (self.binding.RequestServerVersionHeader)
        [t_ElementRequestServerVersion serializeToChildOf:headerNode withName:"t:RequestServerVersion" value:self.binding.RequestServerVersionHeader];

    xmlSetNs(headerNode, root->ns);
    xmlNodePtr bodyNode = xmlNewDocNode(root->doc, NULL, (const xmlChar *)"Body", NULL);
    xmlAddChild(root, bodyNode);

    if (_UploadItems)
        [ExchangeWebService_UploadItemsType serializeToChildOf:bodyNode withName:"ExchangeWebService:UploadItems" value:_UploadItems];

    xmlSetNs(bodyNode, root->ns);
}

- (void)processResponseNode:(xmlNodePtr)node classes:(NSDictionary *)classes result:(NSMutableArray *)result {
    if (node->type != XML_ELEMENT_NODE) return;
    NSString *name = [NSString stringWithXmlString:(xmlChar *)node->name free:NO];
    id object = [classes[name] deserializeNode:node];
    if (object)
        [result addObject:object];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.responseData) return;

    if (self.binding.logXMLInOut) {
        NSLog(@"ResponseBody:\n%@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    }

    xmlDocPtr doc = xmlReadMemory([self.responseData bytes], (int)[self.responseData length], NULL, NULL, XML_PARSE_COMPACT | XML_PARSE_NOBLANKS);
    if (doc == NULL) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Errors while parsing returned XML"};
        self.response.error = [NSError errorWithDomain:@"ExchangeWebService_ExchangeServiceBindingResponseXML" code:1 userInfo:userInfo];
        goto done;
    }

    for (xmlNodePtr cur = xmlDocGetRootElement(doc)->children; cur; cur = cur->next) {
        if (cur->type != XML_ELEMENT_NODE) continue;

        if (xmlStrEqual(cur->name, (const xmlChar *) "Header")) {
            NSMutableArray *responseHeaders = [NSMutableArray array];
            NSDictionary *headers = @{
                @"ServerVersionInfo": [t_ElementServerVersionInfo class],
            };

            for (xmlNodePtr headerNode = cur->children; headerNode; headerNode = headerNode->next)
                [self processResponseNode:headerNode classes:headers result:responseHeaders];

            self.response.headers = responseHeaders;
            continue;
        }

        if (xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
            NSMutableArray *responseBodyParts = [NSMutableArray array];
            NSDictionary *bodyParts = @{
                @"UploadItemsResponse": [ExchangeWebService_UploadItemsResponseType class],
            };
            for (xmlNodePtr bodyNode = cur->children; bodyNode; bodyNode = bodyNode->next) {
                [self processResponseNode:bodyNode classes:bodyParts result:responseBodyParts];

                if (cur->type != XML_ELEMENT_NODE) continue;
                if ((bodyNode->ns && xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix)) &&
                    xmlStrEqual(bodyNode->name, (const xmlChar *)"Fault")) {
                    SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode expectedExceptions:@{}];
                    if (bodyObject) [responseBodyParts addObject:bodyObject];
                }
            }

            self.response.bodyParts = responseBodyParts;
        }
    }

    xmlFreeDoc(doc);

done:
    xmlCleanupParser();
    [self completedWithResponse:self.response];
}

@end

@implementation ExchangeWebService_ExchangeServiceBinding_envelope
+ (NSString *)serializedFormUsingDelegate:(id)delegate {
    xmlDocPtr doc = xmlNewDoc((const xmlChar *)XML_DEFAULT_VERSION);

    if (doc == NULL) {
        NSLog(@"Error creating the xml document tree");
        return @"";
    }

    xmlNodePtr root = xmlNewDocNode(doc, NULL, (const xmlChar *)"Envelope", NULL);
    xmlDocSetRootElement(doc, root);

    xmlNsPtr soapEnvelopeNs = xmlNewNs(root, (const xmlChar *)"http://schemas.xmlsoap.org/soap/envelope/", (const xmlChar *)"soap");

    xmlSetNs(root, soapEnvelopeNs);

    xmlNsPtr xslNs = xmlNewNs(root, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", (const xmlChar *)"xsl");
    xmlNewNsProp(root, xslNs, (const xmlChar *)"version", (const xmlChar *)"1.0");
    xmlNewNs(root, (const xmlChar *)"http://www.w3.org/2001/XMLSchema", (const xmlChar *)"xsd");
    xmlNewNs(root, (const xmlChar *)"http://schemas.microsoft.com/exchange/services/2006/messages", (const xmlChar *)"ExchangeWebService");
    xmlNewNs(root, (const xmlChar *)"http://www.w3.org/1999/xhtml", (const xmlChar *)"m");
    xmlNewNs(root, (const xmlChar *)"http://schemas.microsoft.com/exchange/services/2006/types", (const xmlChar *)"t");
    xmlNewNs(root, (const xmlChar *)"http://www.w3.org/XML/1998/namespace", (const xmlChar *)"xml");

    [delegate addSoapBody:root];

    xmlChar *buf;
    int size;
    xmlDocDumpFormatMemory(doc, &buf, &size, 1);

    NSString *serializedForm = [NSString stringWithXmlString:buf free:YES];

    xmlFreeDoc(doc);
    return serializedForm;
}

@end

@implementation ExchangeWebService_ExchangeServiceBindingResponse
@end
