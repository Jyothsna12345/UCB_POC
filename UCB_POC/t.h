#import <Foundation/Foundation.h>
#import <libxml/tree.h>
#import <objc/runtime.h>

#import "USAdditions.h"
#import "USGlobals.h"

@class t_AbsoluteDateTransitionType;
@class t_AbsoluteMonthlyRecurrencePatternType;
@class t_AbsoluteYearlyRecurrencePatternType;
@class t_AcceptItemType;
@class t_AcceptSharingInvitationType;
@class t_AffectedTaskOccurrencesType;
@class t_AggregateOnType;
@class t_AggregateType;
@class t_AlternateIdBaseType;
@class t_AlternateIdType;
@class t_AlternatePublicFolderIdType;
@class t_AlternatePublicFolderItemIdType;
@class t_AndType;
@class t_AppendToFolderFieldType;
@class t_AppendToItemFieldType;
@class t_ArrayOfArraysOfTrackingPropertiesType;
@class t_ArrayOfAttachmentsType;
@class t_ArrayOfAttendeeConflictData;
@class t_ArrayOfBaseItemIdsType;
@class t_ArrayOfBinaryType;
@class t_ArrayOfCalendarEvent;
@class t_ArrayOfCalendarPermissionsType;
@class t_ArrayOfConversationsType;
@class t_ArrayOfDLExpansionType;
@class t_ArrayOfDelegateUserType;
@class t_ArrayOfEmailAddressesType;
@class t_ArrayOfEncryptedSharedFolderDataType;
@class t_ArrayOfFindMessageTrackingSearchResultType;
@class t_ArrayOfFoldersType;
@class t_ArrayOfGroupedItemsType;
@class t_ArrayOfInvalidRecipientsType;
@class t_ArrayOfItemClassType;
@class t_ArrayOfMailboxData;
@class t_ArrayOfPermissionsType;
@class t_ArrayOfProtectionRulesType;
@class t_ArrayOfRealItemsType;
@class t_ArrayOfRecipientTrackingEventType;
@class t_ArrayOfRecipientsType;
@class t_ArrayOfResolutionType;
@class t_ArrayOfRoomsType;
@class t_ArrayOfRuleOperationErrorsType;
@class t_ArrayOfRuleOperationsType;
@class t_ArrayOfRuleValidationErrorsType;
@class t_ArrayOfRulesType;
@class t_ArrayOfSearchItemKindsType;
@class t_ArrayOfSmtpAddressType;
@class t_ArrayOfStringsType;
@class t_ArrayOfSuggestion;
@class t_ArrayOfSuggestionDayResult;
@class t_ArrayOfTimeZoneDefinitionType;
@class t_ArrayOfTrackingPropertiesType;
@class t_ArrayOfTransitionsGroupsType;
@class t_ArrayOfTransitionsType;
@class t_ArrayOfUnknownEntriesType;
@class t_ArrayOfUserIdType;
@class t_ArrayOfUserMailboxesType;
@class t_ArrayOfWorkingPeriod;
@class t_AttachmentIdType;
@class t_AttachmentResponseShapeType;
@class t_AttachmentType;
@class t_AttendeeConflictData;
@class t_AttendeeType;
@class t_AttributeName;
@class t_AttributePriority;
@class t_AttributeRefreshInterval;
@class t_AttributeValue;
@class t_AvailabilityProxyRequestType;
@class t_BaseEmailAddressType;
@class t_BaseFolderIdType;
@class t_BaseFolderType;
@class t_BaseGroupByType;
@class t_BaseItemIdType;
@class t_BaseNotificationEventType;
@class t_BaseObjectChangedEventType;
@class t_BasePagingType;
@class t_BasePathToElementType;
@class t_BasePermissionType;
@class t_BaseSubscriptionRequestType;
@class t_BodyType;
@class t_BodyTypeResponseType;
@class t_BodyTypeType;
@class t_CalendarEvent;
@class t_CalendarEventDetails;
@class t_CalendarFolderType;
@class t_CalendarItemCreateOrDeleteOperationType;
@class t_CalendarItemType;
@class t_CalendarItemTypeType;
@class t_CalendarItemUpdateOperationType;
@class t_CalendarPermissionLevelType;
@class t_CalendarPermissionReadAccessType;
@class t_CalendarPermissionSetType;
@class t_CalendarPermissionType;
@class t_CalendarViewType;
@class t_CancelCalendarItemType;
@class t_ChangeDescriptionType;
@class t_CompleteActionType;
@class t_CompleteNameType;
@class t_ConflictResolutionType;
@class t_ConflictResultsType;
@class t_ConnectingSIDType;
@class t_ConnectionFailureCauseType;
@class t_ConnectionStatusType;
@class t_ConstantValueType;
@class t_ContactItemType;
@class t_ContactSourceType;
@class t_ContactsFolderType;
@class t_ContactsViewType;
@class t_ContainmentComparisonType;
@class t_ContainmentModeType;
@class t_ContainsExpressionType;
@class t_ConversationActionType;
@class t_ConversationActionTypeType;
@class t_ConversationType;
@class t_CreateActionType;
@class t_CreateRuleOperationType;
@class t_DailyRecurrencePatternType;
@class t_DailyRegeneratingPatternType;
@class t_DateTimePrecisionType;
@class t_DayOfWeekIndexType;
@class t_DayOfWeekType;
@class t_DaysOfWeekType;
@class t_DeclineItemType;
@class t_DefaultShapeNamesType;
@class t_DelegateFolderPermissionLevelType;
@class t_DelegatePermissionsType;
@class t_DelegateUserType;
@class t_DeleteFolderFieldType;
@class t_DeleteItemFieldType;
@class t_DeleteRuleOperationType;
@class t_DeletedOccurrenceInfoType;
@class t_DeliverMeetingRequestsType;
@class t_DerivedItemIdType;
@class t_DictionaryURIType;
@class t_DirectoryEntryType;
@class t_DisposalType;
@class t_DistinguishedFolderIdNameType;
@class t_DistinguishedFolderIdType;
@class t_DistinguishedGroupByType;
@class t_DistinguishedPropertySetType;
@class t_DistinguishedUserType;
@class t_DistributionListType;
@class t_Duration;
@class t_EffectiveRightsType;
@class t_ElementRequestServerVersion;
@class t_ElementServerVersionInfo;
@class t_EmailAddress;
@class t_EmailAddressDictionaryEntryType;
@class t_EmailAddressDictionaryType;
@class t_EmailAddressKeyType;
@class t_EmailAddressType;
@class t_EncryptedDataContainerType;
@class t_EncryptedSharedFolderDataType;
@class t_EndDateRecurrenceRangeType;
@class t_ExceptionPropertyURIType;
@class t_ExchangeImpersonationType;
@class t_ExchangeVersionType;
@class t_ExcludesAttributeType;
@class t_ExcludesType;
@class t_ExcludesValueType;
@class t_ExistsType;
@class t_ExtendedPropertyType;
@class t_ExternalAudience;
@class t_FieldOrderType;
@class t_FieldURIOrConstantType;
@class t_FileAsMappingType;
@class t_FileAttachmentType;
@class t_FindFolderParentType;
@class t_FindItemParentType;
@class t_FindMessageTrackingSearchResultType;
@class t_FlagStatusType;
@class t_FlaggedForActionType;
@class t_FolderChangeDescriptionType;
@class t_FolderChangeType;
@class t_FolderClassType;
@class t_FolderIdType;
@class t_FolderQueryTraversalType;
@class t_FolderResponseShapeType;
@class t_FolderType;
@class t_ForwardItemType;
@class t_FractionalPageViewType;
@class t_FreeBusyView;
@class t_FreeBusyViewOptionsType;
@class t_FreeBusyViewType;
@class t_GroupAttendeeConflictData;
@class t_GroupByType;
@class t_GroupedItemsType;
@class t_GuidType;
@class t_IdFormatType;
@class t_ImAddressDictionaryEntryType;
@class t_ImAddressDictionaryType;
@class t_ImAddressKeyType;
@class t_ImportanceChoicesType;
@class t_IndexBasePointType;
@class t_IndexedPageViewType;
@class t_IndividualAttendeeConflictData;
@class t_InternetHeaderType;
@class t_IntervalRecurrencePatternBaseType;
@class t_InvalidRecipientResponseCodeType;
@class t_InvalidRecipientType;
@class t_IsEqualToType;
@class t_IsGreaterThanOrEqualToType;
@class t_IsGreaterThanType;
@class t_IsLessThanOrEqualToType;
@class t_IsLessThanType;
@class t_IsNotEqualToType;
@class t_ItemAttachmentType;
@class t_ItemChangeDescriptionType;
@class t_ItemChangeType;
@class t_ItemClassType;
@class t_ItemIdType;
@class t_ItemQueryTraversalType;
@class t_ItemResponseShapeType;
@class t_ItemType;
@class t_KeywordStatisticsSearchResultType;
@class t_LegacyFreeBusyType;
@class t_MailTipTypes;
@class t_MailTips;
@class t_MailTipsServiceConfiguration;
@class t_MailboxCultureType;
@class t_MailboxData;
@class t_MailboxStatisticsSearchResultType;
@class t_MailboxTypeType;
@class t_ManagedFolderInformationType;
@class t_MapiPropertyTypeType;
@class t_MaxSyncChangesReturnedType;
@class t_MeetingAttendeeType;
@class t_MeetingCancellationMessageType;
@class t_MeetingMessageType;
@class t_MeetingRequestMessageType;
@class t_MeetingRequestTypeType;
@class t_MeetingResponseMessageType;
@class t_MemberStatusType;
@class t_MemberType;
@class t_MembersListType;
@class t_MessageDispositionType;
@class t_MessageTrackingReportTemplateType;
@class t_MessageTrackingReportType;
@class t_MessageType;
@class t_MimeContentType;
@class t_ModifiedEventType;
@class t_MonthNamesType;
@class t_MonthlyRegeneratingPatternType;
@class t_MovedCopiedEventType;
@class t_MultipleOperandBooleanExpressionType;
@class t_NoEndRecurrenceRangeType;
@class t_NonEmptyArrayOfAllItemsType;
@class t_NonEmptyArrayOfAlternateIdsType;
@class t_NonEmptyArrayOfApplyConversationActionType;
@class t_NonEmptyArrayOfAttachmentsType;
@class t_NonEmptyArrayOfAttendeesType;
@class t_NonEmptyArrayOfBaseFolderIdsType;
@class t_NonEmptyArrayOfBaseItemIdsType;
@class t_NonEmptyArrayOfDeletedOccurrencesType;
@class t_NonEmptyArrayOfFieldOrdersType;
@class t_NonEmptyArrayOfFolderChangeDescriptionsType;
@class t_NonEmptyArrayOfFolderChangesType;
@class t_NonEmptyArrayOfFolderNamesType;
@class t_NonEmptyArrayOfFoldersType;
@class t_NonEmptyArrayOfGroupIdentifiersType;
@class t_NonEmptyArrayOfInternetHeadersType;
@class t_NonEmptyArrayOfItemChangeDescriptionsType;
@class t_NonEmptyArrayOfItemChangesType;
@class t_NonEmptyArrayOfItemIdsType;
@class t_NonEmptyArrayOfNotificationEventTypesType;
@class t_NonEmptyArrayOfNotificationsType;
@class t_NonEmptyArrayOfOccurrenceInfoType;
@class t_NonEmptyArrayOfPathsToElementType;
@class t_NonEmptyArrayOfPeriodsType;
@class t_NonEmptyArrayOfPropertyValuesType;
@class t_NonEmptyArrayOfRequestAttachmentIdsType;
@class t_NonEmptyArrayOfResponseObjectsType;
@class t_NonEmptyArrayOfRestrictedGroupIdentifiersType;
@class t_NonEmptyArrayOfSubscriptionIdsType;
@class t_NonEmptyArrayOfTimeZoneIdType;
@class t_NonEmptyArrayOfUploadItemsType;
@class t_NonEmptyStringType;
@class t_NotType;
@class t_NotificationEventTypeType;
@class t_NotificationType;
@class t_NumberedRecurrenceRangeType;
@class t_OccurrenceInfoType;
@class t_OccurrenceItemIdType;
@class t_OofState;
@class t_OpenAsAdminOrSystemServiceType;
@class t_OrType;
@class t_OutOfOfficeMailTip;
@class t_PathToExceptionFieldType;
@class t_PathToExtendedFieldType;
@class t_PathToIndexedFieldType;
@class t_PathToUnindexedFieldType;
@class t_PeriodType;
@class t_PermissionActionType;
@class t_PermissionLevelType;
@class t_PermissionReadAccessType;
@class t_PermissionSetType;
@class t_PermissionType;
@class t_PhoneCallIdType;
@class t_PhoneCallInformationType;
@class t_PhoneCallStateType;
@class t_PhoneNumberDictionaryEntryType;
@class t_PhoneNumberDictionaryType;
@class t_PhoneNumberKeyType;
@class t_PhysicalAddressDictionaryEntryType;
@class t_PhysicalAddressDictionaryType;
@class t_PhysicalAddressIndexType;
@class t_PhysicalAddressKeyType;
@class t_PostItemType;
@class t_PostReplyItemBaseType;
@class t_PostReplyItemType;
@class t_PropertyTagType;
@class t_ProtectionRuleActionKindType;
@class t_ProtectionRuleActionType;
@class t_ProtectionRuleAllInternalType;
@class t_ProtectionRuleAndType;
@class t_ProtectionRuleArgumentType;
@class t_ProtectionRuleConditionType;
@class t_ProtectionRuleRecipientIsType;
@class t_ProtectionRuleSenderDepartmentsType;
@class t_ProtectionRuleTrueType;
@class t_ProtectionRuleType;
@class t_ProtectionRuleValueType;
@class t_ProtectionRulesServiceConfiguration;
@class t_ProxySecurityContextType;
@class t_PullSubscriptionRequestType;
@class t_PushSubscriptionRequestType;
@class t_RecipientTrackingEventType;
@class t_RecurrencePatternBaseType;
@class t_RecurrenceRangeBaseType;
@class t_RecurrenceType;
@class t_RecurringDateTransitionType;
@class t_RecurringDayTransitionType;
@class t_RecurringMasterItemIdType;
@class t_RecurringTimeTransitionType;
@class t_ReferenceItemResponseType;
@class t_RegeneratingPatternBaseType;
@class t_RelativeMonthlyRecurrencePatternType;
@class t_RelativeYearlyRecurrencePatternType;
@class t_ReminderMinutesBeforeStartType;
@class t_RemoveItemType;
@class t_ReplyAllToItemType;
@class t_ReplyBody;
@class t_ReplyToItemType;
@class t_RequestAttachmentIdType;
@class t_RequestTypeHeader;
@class t_ResolutionType;
@class t_ResolveNamesSearchScopeType;
@class t_ResponseClassType;
@class t_ResponseObjectCoreType;
@class t_ResponseObjectType;
@class t_ResponseTypeType;
@class t_RestrictionType;
@class t_RoomType;
@class t_RootItemIdType;
@class t_RuleActionsType;
@class t_RuleFieldURIType;
@class t_RuleOperationErrorType;
@class t_RuleOperationType;
@class t_RulePredicateDateRangeType;
@class t_RulePredicateSizeRangeType;
@class t_RulePredicatesType;
@class t_RuleType;
@class t_RuleValidationErrorCodeType;
@class t_RuleValidationErrorType;
@class t_SearchExpressionType;
@class t_SearchFolderTraversalType;
@class t_SearchFolderType;
@class t_SearchItemKindType;
@class t_SearchParametersType;
@class t_SensitivityChoicesType;
@class t_SerializableTimeZone;
@class t_SerializableTimeZoneTime;
@class t_SerializedSecurityContextType;
@class t_ServiceConfiguration;
@class t_ServiceConfigurationType;
@class t_SetFolderFieldType;
@class t_SetItemFieldType;
@class t_SetRuleOperationType;
@class t_SharingDataType;
@class t_SidAndAttributesType;
@class t_SingleRecipientType;
@class t_SmartResponseBaseType;
@class t_SmartResponseType;
@class t_SmtpDomain;
@class t_SmtpDomainList;
@class t_SortDirectionType;
@class t_SpecialLogonTypeType;
@class t_StandardGroupByType;
@class t_StreamingSubscriptionConnectionTimeoutType;
@class t_StreamingSubscriptionRequestType;
@class t_SubscriptionIdType;
@class t_SubscriptionStatusFrequencyType;
@class t_SubscriptionStatusType;
@class t_SubscriptionTimeoutType;
@class t_Suggestion;
@class t_SuggestionDayResult;
@class t_SuggestionQuality;
@class t_SuggestionsViewOptionsType;
@class t_SuppressReadReceiptType;
@class t_SyncFolderHierarchyChangesType;
@class t_SyncFolderHierarchyCreateOrUpdateType;
@class t_SyncFolderHierarchyDeleteType;
@class t_SyncFolderItemsChangesType;
@class t_SyncFolderItemsCreateOrUpdateType;
@class t_SyncFolderItemsDeleteType;
@class t_SyncFolderItemsReadFlagType;
@class t_SyncFolderItemsScopeType;
@class t_TargetFolderIdType;
@class t_TaskDelegateStateType;
@class t_TaskRecurrenceType;
@class t_TaskStatusType;
@class t_TaskType;
@class t_TasksFolderType;
@class t_TentativelyAcceptItemType;
@class t_TimeChangeType;
@class t_TimeZoneContextType;
@class t_TimeZoneDefinitionType;
@class t_TimeZoneType;
@class t_TooBigGroupAttendeeConflictData;
@class t_TrackingPropertyType;
@class t_TransitionTargetKindType;
@class t_TransitionTargetType;
@class t_TransitionType;
@class t_TwoOperandExpressionType;
@class t_UnifiedMessageServiceConfiguration;
@class t_UnindexedFieldURIType;
@class t_UnknownAttendeeConflictData;
@class t_UploadItemType;
@class t_UserConfigurationDictionaryEntryType;
@class t_UserConfigurationDictionaryObjectType;
@class t_UserConfigurationDictionaryObjectTypesType;
@class t_UserConfigurationDictionaryType;
@class t_UserConfigurationNameType;
@class t_UserConfigurationPropertyType;
@class t_UserConfigurationType;
@class t_UserIdType;
@class t_UserMailboxType;
@class t_UserOofSettings;
@class t_Value;
@class t_WatermarkType;
@class t_WeeklyRecurrencePatternType;
@class t_WeeklyRegeneratingPatternType;
@class t_WellKnownResponseObjectType;
@class t_WorkingHours;
@class t_WorkingPeriod;
@class t_YearlyRegeneratingPatternType;

#import "xml.h"
@interface t_AttributeName : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
typedef enum t_BodyTypeTypeEnum {
	t_BodyTypeType_none = 0,
	t_BodyTypeType_HTML,
	t_BodyTypeType_Text,
} t_BodyTypeTypeEnum;

@interface t_BodyTypeType : NSObject
+ (t_BodyTypeTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_BodyTypeTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_BodyTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_BodyTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BodyTypeTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_BodyTypeTypeEnum)value;
@end
@interface t_BodyType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BodyType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* content */
@property (nonatomic, strong) NSString * _content;


/* attributes */
@property (nonatomic) t_BodyTypeTypeEnum BodyType;
@end
typedef enum t_FlagStatusTypeEnum {
	t_FlagStatusType_none = 0,
	t_FlagStatusType_Complete,
	t_FlagStatusType_Flagged,
	t_FlagStatusType_NotFlagged,
} t_FlagStatusTypeEnum;

@interface t_FlagStatusType : NSObject
+ (t_FlagStatusTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_FlagStatusTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_FlagStatusTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_FlagStatusTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FlagStatusTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_FlagStatusTypeEnum)value;
@end
@interface t_ArrayOfEncryptedSharedFolderDataType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ArrayOfGroupedItemsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_RecurrenceType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RecurrenceType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

@end
typedef enum t_DistinguishedFolderIdNameTypeEnum {
	t_DistinguishedFolderIdNameType_none = 0,
	t_DistinguishedFolderIdNameType_archivedeleteditems,
	t_DistinguishedFolderIdNameType_archivemsgfolderroot,
	t_DistinguishedFolderIdNameType_archiverecoverableitemsdeletions,
	t_DistinguishedFolderIdNameType_archiverecoverableitemspurges,
	t_DistinguishedFolderIdNameType_archiverecoverableitemsroot,
	t_DistinguishedFolderIdNameType_archiverecoverableitemsversions,
	t_DistinguishedFolderIdNameType_archiveroot,
	t_DistinguishedFolderIdNameType_calendar,
	t_DistinguishedFolderIdNameType_contacts,
	t_DistinguishedFolderIdNameType_deleteditems,
	t_DistinguishedFolderIdNameType_drafts,
	t_DistinguishedFolderIdNameType_inbox,
	t_DistinguishedFolderIdNameType_journal,
	t_DistinguishedFolderIdNameType_junkemail,
	t_DistinguishedFolderIdNameType_msgfolderroot,
	t_DistinguishedFolderIdNameType_notes,
	t_DistinguishedFolderIdNameType_outbox,
	t_DistinguishedFolderIdNameType_publicfoldersroot,
	t_DistinguishedFolderIdNameType_recoverableitemsdeletions,
	t_DistinguishedFolderIdNameType_recoverableitemspurges,
	t_DistinguishedFolderIdNameType_recoverableitemsroot,
	t_DistinguishedFolderIdNameType_recoverableitemsversions,
	t_DistinguishedFolderIdNameType_root,
	t_DistinguishedFolderIdNameType_searchfolders,
	t_DistinguishedFolderIdNameType_sentitems,
	t_DistinguishedFolderIdNameType_tasks,
	t_DistinguishedFolderIdNameType_voicemail,
} t_DistinguishedFolderIdNameTypeEnum;

@interface t_DistinguishedFolderIdNameType : NSObject
+ (t_DistinguishedFolderIdNameTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_DistinguishedFolderIdNameTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_DistinguishedFolderIdNameTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_DistinguishedFolderIdNameTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DistinguishedFolderIdNameTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DistinguishedFolderIdNameTypeEnum)value;
@end
@interface t_MailboxStatisticsSearchResultType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MailboxStatisticsSearchResultType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_UserMailboxType * UserMailbox;
@property (nonatomic, strong) t_KeywordStatisticsSearchResultType * KeywordStatisticsSearchResult;
@end
typedef enum t_AvailabilityProxyRequestTypeEnum {
	t_AvailabilityProxyRequestType_none = 0,
	t_AvailabilityProxyRequestType_CrossForest,
	t_AvailabilityProxyRequestType_CrossSite,
} t_AvailabilityProxyRequestTypeEnum;

@interface t_AvailabilityProxyRequestType : NSObject
+ (t_AvailabilityProxyRequestTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_AvailabilityProxyRequestTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_AvailabilityProxyRequestTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_AvailabilityProxyRequestTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AvailabilityProxyRequestTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_AvailabilityProxyRequestTypeEnum)value;
@end
@interface t_ServiceConfigurationType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
typedef enum t_DeliverMeetingRequestsTypeEnum {
	t_DeliverMeetingRequestsType_none = 0,
	t_DeliverMeetingRequestsType_DelegatesAndMe,
	t_DeliverMeetingRequestsType_DelegatesAndSendInformationToMe,
	t_DeliverMeetingRequestsType_DelegatesOnly,
	t_DeliverMeetingRequestsType_NoForward,
} t_DeliverMeetingRequestsTypeEnum;

@interface t_DeliverMeetingRequestsType : NSObject
+ (t_DeliverMeetingRequestsTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_DeliverMeetingRequestsTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_DeliverMeetingRequestsTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_DeliverMeetingRequestsTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DeliverMeetingRequestsTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DeliverMeetingRequestsTypeEnum)value;
@end
@interface t_StreamingSubscriptionConnectionTimeoutType : NSObject
+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (NSNumber *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSNumber *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSNumber *)value;
@end
typedef enum t_SearchItemKindTypeEnum {
	t_SearchItemKindType_none = 0,
	t_SearchItemKindType_Contacts,
	t_SearchItemKindType_Docs,
	t_SearchItemKindType_Email,
	t_SearchItemKindType_Faxes,
	t_SearchItemKindType_Im,
	t_SearchItemKindType_Journals,
	t_SearchItemKindType_Meetings,
	t_SearchItemKindType_Notes,
	t_SearchItemKindType_Posts,
	t_SearchItemKindType_Rssfeeds,
	t_SearchItemKindType_Tasks,
	t_SearchItemKindType_Voicemail,
} t_SearchItemKindTypeEnum;

@interface t_SearchItemKindType : NSObject
+ (t_SearchItemKindTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_SearchItemKindTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_SearchItemKindTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_SearchItemKindTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SearchItemKindTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SearchItemKindTypeEnum)value;
@end
@interface t_OutOfOfficeMailTip : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_OutOfOfficeMailTip *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_ReplyBody * ReplyBody;
@property (nonatomic, strong) t_Duration * Duration;
@end
typedef enum t_MeetingAttendeeTypeEnum {
	t_MeetingAttendeeType_none = 0,
	t_MeetingAttendeeType_Optional,
	t_MeetingAttendeeType_Organizer,
	t_MeetingAttendeeType_Required,
	t_MeetingAttendeeType_Resource,
	t_MeetingAttendeeType_Room,
} t_MeetingAttendeeTypeEnum;

@interface t_MeetingAttendeeType : NSObject
+ (t_MeetingAttendeeTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_MeetingAttendeeTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_MeetingAttendeeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_MeetingAttendeeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MeetingAttendeeTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MeetingAttendeeTypeEnum)value;
@end
@interface t_ChangeDescriptionType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ChangeDescriptionType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_BasePathToElementType * Path;
@property (nonatomic, strong) t_PathToUnindexedFieldType * FieldURI;
@property (nonatomic, strong) t_PathToIndexedFieldType * IndexedFieldURI;
@property (nonatomic, strong) t_PathToExtendedFieldType * ExtendedFieldURI;
@end
@interface t_FolderChangeDescriptionType : t_ChangeDescriptionType
@end
@interface t_AttributeRefreshInterval : NSObject
+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (NSNumber *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSNumber *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSNumber *)value;
@end
@interface t_SearchExpressionType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SearchExpressionType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

@end
@interface t_FieldURIOrConstantType : NSObject
+ (id)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(id)value;
@end
@interface t_TwoOperandExpressionType : t_SearchExpressionType
/* elements */
@property (nonatomic, strong) t_BasePathToElementType * Path;
@property (nonatomic, strong) t_PathToUnindexedFieldType * FieldURI;
@property (nonatomic, strong) t_PathToIndexedFieldType * IndexedFieldURI;
@property (nonatomic, strong) t_PathToExtendedFieldType * ExtendedFieldURI;
@property (nonatomic, strong) id FieldURIOrConstant;
@end
@interface t_IsEqualToType : t_TwoOperandExpressionType
@end
@interface t_EmailAddress : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_EmailAddress *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * Name;
@property (nonatomic, strong) NSString * Address;
@property (nonatomic, strong) NSString * RoutingType;
@end
@interface t_NonEmptyArrayOfBaseFolderIdsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
typedef enum t_SearchFolderTraversalTypeEnum {
	t_SearchFolderTraversalType_none = 0,
	t_SearchFolderTraversalType_Deep,
	t_SearchFolderTraversalType_Shallow,
} t_SearchFolderTraversalTypeEnum;

@interface t_SearchFolderTraversalType : NSObject
+ (t_SearchFolderTraversalTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_SearchFolderTraversalTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_SearchFolderTraversalTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_SearchFolderTraversalTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SearchFolderTraversalTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SearchFolderTraversalTypeEnum)value;
@end
@interface t_SearchParametersType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SearchParametersType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_RestrictionType * Restriction;
@property (nonatomic, strong) NSArray * BaseFolderIds;

/* attributes */
@property (nonatomic) t_SearchFolderTraversalTypeEnum Traversal;
@end
@interface t_ItemClassType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
typedef enum t_SensitivityChoicesTypeEnum {
	t_SensitivityChoicesType_none = 0,
	t_SensitivityChoicesType_Confidential,
	t_SensitivityChoicesType_Normal,
	t_SensitivityChoicesType_Personal,
	t_SensitivityChoicesType_Private,
} t_SensitivityChoicesTypeEnum;

@interface t_SensitivityChoicesType : NSObject
+ (t_SensitivityChoicesTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_SensitivityChoicesTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_SensitivityChoicesTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_SensitivityChoicesTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SensitivityChoicesTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SensitivityChoicesTypeEnum)value;
@end
@interface t_NonEmptyArrayOfAttachmentsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ArrayOfStringsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
typedef enum t_ImportanceChoicesTypeEnum {
	t_ImportanceChoicesType_none = 0,
	t_ImportanceChoicesType_High,
	t_ImportanceChoicesType_Low,
	t_ImportanceChoicesType_Normal,
} t_ImportanceChoicesTypeEnum;

@interface t_ImportanceChoicesType : NSObject
+ (t_ImportanceChoicesTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ImportanceChoicesTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ImportanceChoicesTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ImportanceChoicesTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ImportanceChoicesTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ImportanceChoicesTypeEnum)value;
@end
@interface t_NonEmptyArrayOfInternetHeadersType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_NonEmptyArrayOfResponseObjectsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ReminderMinutesBeforeStartType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
@interface t_ItemType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ItemType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_MimeContentType * MimeContent;
@property (nonatomic, strong) t_ItemIdType * ItemId;
@property (nonatomic, strong) t_FolderIdType * ParentFolderId;
@property (nonatomic, strong) NSString * ItemClass;
@property (nonatomic, strong) NSString * Subject;
@property (nonatomic) t_SensitivityChoicesTypeEnum Sensitivity;
@property (nonatomic, strong) t_BodyType * Body;
@property (nonatomic, strong) NSArray * Attachments;
@property (nonatomic, strong) NSDate * DateTimeReceived;
@property (nonatomic, strong) NSNumber * Size;
@property (nonatomic, strong) NSArray * Categories;
@property (nonatomic) t_ImportanceChoicesTypeEnum Importance;
@property (nonatomic, strong) NSString * InReplyTo;
@property (nonatomic, strong) NSNumber * IsSubmitted;
@property (nonatomic, strong) NSNumber * IsDraft;
@property (nonatomic, strong) NSNumber * IsFromMe;
@property (nonatomic, strong) NSNumber * IsResend;
@property (nonatomic, strong) NSNumber * IsUnmodified;
@property (nonatomic, strong) NSArray * InternetMessageHeaders;
@property (nonatomic, strong) NSDate * DateTimeSent;
@property (nonatomic, strong) NSDate * DateTimeCreated;
@property (nonatomic, strong) NSArray * ResponseObjects;
@property (nonatomic, strong) NSDate * ReminderDueBy;
@property (nonatomic, strong) NSNumber * ReminderIsSet;
@property (nonatomic, strong) NSString * ReminderMinutesBeforeStart;
@property (nonatomic, strong) NSString * DisplayCc;
@property (nonatomic, strong) NSString * DisplayTo;
@property (nonatomic, strong) NSNumber * HasAttachments;
@property(nonatomic, strong) NSArray *ExtendedProperty; // Array of *ExtendedPropertyType
@property (nonatomic, strong) NSString * Culture;
@property (nonatomic, strong) t_EffectiveRightsType * EffectiveRights;
@property (nonatomic, strong) NSString * LastModifiedName;
@property (nonatomic, strong) NSDate * LastModifiedTime;
@property (nonatomic, strong) NSNumber * IsAssociated;
@property (nonatomic, strong) NSString * WebClientReadFormQueryString;
@property (nonatomic, strong) NSString * WebClientEditFormQueryString;
@property (nonatomic, strong) t_ItemIdType * ConversationId;
@property (nonatomic, strong) t_BodyType * UniqueBody;
@property (nonatomic, strong) NSData * StoreEntryId;
@end
@interface t_SingleRecipientType : NSObject
+ (id)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(id)value;
@end
@interface t_ArrayOfRecipientsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_MessageType : t_ItemType
/* elements */
@property (nonatomic, strong) id Sender;
@property (nonatomic, strong) NSArray * ToRecipients;
@property (nonatomic, strong) NSArray * CcRecipients;
@property (nonatomic, strong) NSArray * BccRecipients;
@property (nonatomic, strong) NSNumber * IsReadReceiptRequested;
@property (nonatomic, strong) NSNumber * IsDeliveryReceiptRequested;
@property (nonatomic, strong) NSData * ConversationIndex;
@property (nonatomic, strong) NSString * ConversationTopic;
@property (nonatomic, strong) id From;
@property (nonatomic, strong) NSString * InternetMessageId;
@property (nonatomic, strong) NSNumber * IsRead;
@property (nonatomic, strong) NSNumber * IsResponseRequested;
@property (nonatomic, strong) NSString * References;
@property (nonatomic, strong) NSArray * ReplyTo;
@property (nonatomic, strong) id ReceivedBy;
@property (nonatomic, strong) id ReceivedRepresenting;
@end
@interface t_ResponseObjectCoreType : t_MessageType
/* elements */
@property (nonatomic, strong) t_ItemIdType * ReferenceItemId;
@end
@interface t_ResponseObjectType : t_ResponseObjectCoreType

/* attributes */
@property (nonatomic, strong) NSString * ObjectName;
@end
@interface t_WellKnownResponseObjectType : t_ResponseObjectType
@end
typedef enum t_CreateActionTypeEnum {
	t_CreateActionType_none = 0,
	t_CreateActionType_CreateNew,
	t_CreateActionType_Update,
	t_CreateActionType_UpdateOrCreate,
} t_CreateActionTypeEnum;

@interface t_CreateActionType : NSObject
+ (t_CreateActionTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_CreateActionTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_CreateActionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_CreateActionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CreateActionTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_CreateActionTypeEnum)value;
@end
@interface t_SerializableTimeZone : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SerializableTimeZone *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSNumber * Bias;
@property (nonatomic, strong) t_SerializableTimeZoneTime * StandardTime;
@property (nonatomic, strong) t_SerializableTimeZoneTime * DaylightTime;
@end
@interface t_BaseFolderIdType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BaseFolderIdType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

@end
typedef enum t_AggregateTypeEnum {
	t_AggregateType_none = 0,
	t_AggregateType_Maximum,
	t_AggregateType_Minimum,
} t_AggregateTypeEnum;

@interface t_AggregateType : NSObject
+ (t_AggregateTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_AggregateTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_AggregateTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_AggregateTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AggregateTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_AggregateTypeEnum)value;
@end
typedef enum t_PhoneNumberKeyTypeEnum {
	t_PhoneNumberKeyType_none = 0,
	t_PhoneNumberKeyType_AssistantPhone,
	t_PhoneNumberKeyType_BusinessFax,
	t_PhoneNumberKeyType_BusinessPhone,
	t_PhoneNumberKeyType_BusinessPhone2,
	t_PhoneNumberKeyType_Callback,
	t_PhoneNumberKeyType_CarPhone,
	t_PhoneNumberKeyType_CompanyMainPhone,
	t_PhoneNumberKeyType_HomeFax,
	t_PhoneNumberKeyType_HomePhone,
	t_PhoneNumberKeyType_HomePhone2,
	t_PhoneNumberKeyType_Isdn,
	t_PhoneNumberKeyType_MobilePhone,
	t_PhoneNumberKeyType_OtherFax,
	t_PhoneNumberKeyType_OtherTelephone,
	t_PhoneNumberKeyType_Pager,
	t_PhoneNumberKeyType_PrimaryPhone,
	t_PhoneNumberKeyType_RadioPhone,
	t_PhoneNumberKeyType_Telex,
	t_PhoneNumberKeyType_TtyTddPhone,
} t_PhoneNumberKeyTypeEnum;

@interface t_PhoneNumberKeyType : NSObject
+ (t_PhoneNumberKeyTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_PhoneNumberKeyTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_PhoneNumberKeyTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_PhoneNumberKeyTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhoneNumberKeyTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_PhoneNumberKeyTypeEnum)value;
@end
typedef enum t_UserConfigurationDictionaryObjectTypesTypeEnum {
	t_UserConfigurationDictionaryObjectTypesType_none = 0,
	t_UserConfigurationDictionaryObjectTypesType_Boolean,
	t_UserConfigurationDictionaryObjectTypesType_Byte,
	t_UserConfigurationDictionaryObjectTypesType_ByteArray,
	t_UserConfigurationDictionaryObjectTypesType_DateTime,
	t_UserConfigurationDictionaryObjectTypesType_Integer32,
	t_UserConfigurationDictionaryObjectTypesType_Integer64,
	t_UserConfigurationDictionaryObjectTypesType_String,
	t_UserConfigurationDictionaryObjectTypesType_StringArray,
	t_UserConfigurationDictionaryObjectTypesType_UnsignedInteger32,
	t_UserConfigurationDictionaryObjectTypesType_UnsignedInteger64,
} t_UserConfigurationDictionaryObjectTypesTypeEnum;

@interface t_UserConfigurationDictionaryObjectTypesType : NSObject
+ (t_UserConfigurationDictionaryObjectTypesTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_UserConfigurationDictionaryObjectTypesTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_UserConfigurationDictionaryObjectTypesTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_UserConfigurationDictionaryObjectTypesTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserConfigurationDictionaryObjectTypesTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_UserConfigurationDictionaryObjectTypesTypeEnum)value;
@end
@interface t_FreeBusyViewType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
@interface t_ArrayOfCalendarEvent : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_FreeBusyView : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FreeBusyView *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * FreeBusyViewType;
@property (nonatomic, strong) NSString * MergedFreeBusy;
@property (nonatomic, strong) NSArray * CalendarEventArray;
@property (nonatomic, strong) t_WorkingHours * WorkingHours;
@end
@interface t_ItemChangeDescriptionType : t_ChangeDescriptionType
@end
@interface t_AppendToItemFieldType : t_ItemChangeDescriptionType
/* elements */
@property (nonatomic, strong) t_ItemType * Item;
@property (nonatomic, strong) t_MessageType * Message;
@property (nonatomic, strong) t_CalendarItemType * CalendarItem;
@property (nonatomic, strong) t_ContactItemType * Contact;
@property (nonatomic, strong) t_DistributionListType * DistributionList;
@property (nonatomic, strong) t_MeetingMessageType * MeetingMessage;
@property (nonatomic, strong) t_MeetingRequestMessageType * MeetingRequest;
@property (nonatomic, strong) t_MeetingResponseMessageType * MeetingResponse;
@property (nonatomic, strong) t_MeetingCancellationMessageType * MeetingCancellation;
@property (nonatomic, strong) t_TaskType * Task;
@property (nonatomic, strong) t_PostItemType * PostItem;
@end
typedef enum t_ProtectionRuleActionKindTypeEnum {
	t_ProtectionRuleActionKindType_none = 0,
	t_ProtectionRuleActionKindType_RightsProtectMessage,
} t_ProtectionRuleActionKindTypeEnum;

@interface t_ProtectionRuleActionKindType : NSObject
+ (t_ProtectionRuleActionKindTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ProtectionRuleActionKindTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ProtectionRuleActionKindTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ProtectionRuleActionKindTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ProtectionRuleActionKindTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ProtectionRuleActionKindTypeEnum)value;
@end
@interface t_ArrayOfUnknownEntriesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
typedef enum t_DayOfWeekTypeEnum {
	t_DayOfWeekType_none = 0,
	t_DayOfWeekType_Day,
	t_DayOfWeekType_Friday,
	t_DayOfWeekType_Monday,
	t_DayOfWeekType_Saturday,
	t_DayOfWeekType_Sunday,
	t_DayOfWeekType_Thursday,
	t_DayOfWeekType_Tuesday,
	t_DayOfWeekType_Wednesday,
	t_DayOfWeekType_Weekday,
	t_DayOfWeekType_WeekendDay,
} t_DayOfWeekTypeEnum;

@interface t_DayOfWeekType : NSObject
+ (t_DayOfWeekTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_DayOfWeekTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_DayOfWeekTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_DayOfWeekTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DayOfWeekTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DayOfWeekTypeEnum)value;
@end
@interface t_SerializableTimeZoneTime : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SerializableTimeZoneTime *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSNumber * Bias;
@property (nonatomic, strong) NSString * Time;
@property (nonatomic, strong) NSNumber * DayOrder;
@property (nonatomic, strong) NSNumber * Month;
@property (nonatomic) t_DayOfWeekTypeEnum DayOfWeek;
@property (nonatomic, strong) NSString * Year;
@end
typedef enum t_CalendarItemUpdateOperationTypeEnum {
	t_CalendarItemUpdateOperationType_none = 0,
	t_CalendarItemUpdateOperationType_SendOnlyToAll,
	t_CalendarItemUpdateOperationType_SendOnlyToChanged,
	t_CalendarItemUpdateOperationType_SendToAllAndSaveCopy,
	t_CalendarItemUpdateOperationType_SendToChangedAndSaveCopy,
	t_CalendarItemUpdateOperationType_SendToNone,
} t_CalendarItemUpdateOperationTypeEnum;

@interface t_CalendarItemUpdateOperationType : NSObject
+ (t_CalendarItemUpdateOperationTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_CalendarItemUpdateOperationTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_CalendarItemUpdateOperationTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_CalendarItemUpdateOperationTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarItemUpdateOperationTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_CalendarItemUpdateOperationTypeEnum)value;
@end
@interface t_SetFolderFieldType : t_FolderChangeDescriptionType
/* elements */
@property (nonatomic, strong) t_FolderType * Folder;
@property (nonatomic, strong) t_CalendarFolderType * CalendarFolder;
@property (nonatomic, strong) t_ContactsFolderType * ContactsFolder;
@property (nonatomic, strong) t_SearchFolderType * SearchFolder;
@property (nonatomic, strong) t_TasksFolderType * TasksFolder;
@end
@interface t_RecurrencePatternBaseType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RecurrencePatternBaseType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

@end
@interface t_IntervalRecurrencePatternBaseType : t_RecurrencePatternBaseType
/* elements */
@property (nonatomic, strong) NSNumber * Interval;
@end
typedef enum t_DayOfWeekIndexTypeEnum {
	t_DayOfWeekIndexType_none = 0,
	t_DayOfWeekIndexType_First,
	t_DayOfWeekIndexType_Fourth,
	t_DayOfWeekIndexType_Last,
	t_DayOfWeekIndexType_Second,
	t_DayOfWeekIndexType_Third,
} t_DayOfWeekIndexTypeEnum;

@interface t_DayOfWeekIndexType : NSObject
+ (t_DayOfWeekIndexTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_DayOfWeekIndexTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_DayOfWeekIndexTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_DayOfWeekIndexTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DayOfWeekIndexTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DayOfWeekIndexTypeEnum)value;
@end
@interface t_RelativeMonthlyRecurrencePatternType : t_IntervalRecurrencePatternBaseType
/* elements */
@property (nonatomic) t_DayOfWeekTypeEnum DaysOfWeek;
@property (nonatomic) t_DayOfWeekIndexTypeEnum DayOfWeekIndex;
@end
@interface t_DerivedItemIdType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
typedef enum t_InvalidRecipientResponseCodeTypeEnum {
	t_InvalidRecipientResponseCodeType_none = 0,
	t_InvalidRecipientResponseCodeType_CannotObtainTokenFromSTS,
	t_InvalidRecipientResponseCodeType_OtherError,
	t_InvalidRecipientResponseCodeType_RecipientOrganizationFederatedWithUnknownTokenIssuer,
	t_InvalidRecipientResponseCodeType_RecipientOrganizationNotFederated,
	t_InvalidRecipientResponseCodeType_SystemPolicyBlocksSharingWithThisRecipient,
} t_InvalidRecipientResponseCodeTypeEnum;

@interface t_InvalidRecipientResponseCodeType : NSObject
+ (t_InvalidRecipientResponseCodeTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_InvalidRecipientResponseCodeTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_InvalidRecipientResponseCodeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_InvalidRecipientResponseCodeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_InvalidRecipientResponseCodeTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_InvalidRecipientResponseCodeTypeEnum)value;
@end
@interface t_WatermarkType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
@interface t_BaseNotificationEventType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BaseNotificationEventType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * Watermark;
@end
@interface t_BaseObjectChangedEventType : t_BaseNotificationEventType
/* elements */
@property (nonatomic, strong) NSDate * TimeStamp;
@property (nonatomic, strong) t_FolderIdType * FolderId;
@property (nonatomic, strong) t_ItemIdType * ItemId;
@property (nonatomic, strong) t_FolderIdType * ParentFolderId;
@end
@interface t_MovedCopiedEventType : t_BaseObjectChangedEventType
/* elements */
@property (nonatomic, strong) t_FolderIdType * OldFolderId;
@property (nonatomic, strong) t_ItemIdType * OldItemId;
@property (nonatomic, strong) t_FolderIdType * OldParentFolderId;
@end
@interface t_BaseFolderType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BaseFolderType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_FolderIdType * FolderId;
@property (nonatomic, strong) t_FolderIdType * ParentFolderId;
@property (nonatomic, strong) NSString * FolderClass;
@property (nonatomic, strong) NSString * DisplayName;
@property (nonatomic, strong) NSNumber * TotalCount;
@property (nonatomic, strong) NSNumber * ChildFolderCount;
@property(nonatomic, strong) NSArray *ExtendedProperty; // Array of *ExtendedPropertyType
@property (nonatomic, strong) t_ManagedFolderInformationType * ManagedFolderInformation;
@property (nonatomic, strong) t_EffectiveRightsType * EffectiveRights;
@end
@interface t_FolderType : t_BaseFolderType
/* elements */
@property (nonatomic, strong) t_PermissionSetType * PermissionSet;
@property (nonatomic, strong) NSNumber * UnreadCount;
@end
typedef enum t_FileAsMappingTypeEnum {
	t_FileAsMappingType_none = 0,
	t_FileAsMappingType_Company,
	t_FileAsMappingType_CompanyLastCommaFirst,
	t_FileAsMappingType_CompanyLastFirst,
	t_FileAsMappingType_CompanyLastSpaceFirst,
	t_FileAsMappingType_DisplayName,
	t_FileAsMappingType_Empty,
	t_FileAsMappingType_FirstName,
	t_FileAsMappingType_FirstSpaceLast,
	t_FileAsMappingType_LastCommaFirst,
	t_FileAsMappingType_LastCommaFirstCompany,
	t_FileAsMappingType_LastFirst,
	t_FileAsMappingType_LastFirstCompany,
	t_FileAsMappingType_LastFirstMiddleSuffix,
	t_FileAsMappingType_LastFirstSuffix,
	t_FileAsMappingType_LastName,
	t_FileAsMappingType_LastSpaceFirst,
	t_FileAsMappingType_LastSpaceFirstCompany,
	t_FileAsMappingType_None,
} t_FileAsMappingTypeEnum;

@interface t_FileAsMappingType : NSObject
+ (t_FileAsMappingTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_FileAsMappingTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_FileAsMappingTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_FileAsMappingTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FileAsMappingTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_FileAsMappingTypeEnum)value;
@end
@interface t_EmailAddressDictionaryType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_PhysicalAddressDictionaryType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_PhoneNumberDictionaryType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
typedef enum t_ContactSourceTypeEnum {
	t_ContactSourceType_none = 0,
	t_ContactSourceType_ActiveDirectory,
	t_ContactSourceType_Store,
} t_ContactSourceTypeEnum;

@interface t_ContactSourceType : NSObject
+ (t_ContactSourceTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ContactSourceTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ContactSourceTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ContactSourceTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ContactSourceTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ContactSourceTypeEnum)value;
@end
@interface t_ImAddressDictionaryType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
typedef enum t_PhysicalAddressIndexTypeEnum {
	t_PhysicalAddressIndexType_none = 0,
	t_PhysicalAddressIndexType_Business,
	t_PhysicalAddressIndexType_Home,
	t_PhysicalAddressIndexType_None,
	t_PhysicalAddressIndexType_Other,
} t_PhysicalAddressIndexTypeEnum;

@interface t_PhysicalAddressIndexType : NSObject
+ (t_PhysicalAddressIndexTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_PhysicalAddressIndexTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_PhysicalAddressIndexTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_PhysicalAddressIndexTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhysicalAddressIndexTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_PhysicalAddressIndexTypeEnum)value;
@end
@interface t_ArrayOfBinaryType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ContactItemType : t_ItemType
/* elements */
@property (nonatomic, strong) NSString * FileAs;
@property (nonatomic) t_FileAsMappingTypeEnum FileAsMapping;
@property (nonatomic, strong) NSString * DisplayName;
@property (nonatomic, strong) NSString * GivenName;
@property (nonatomic, strong) NSString * Initials;
@property (nonatomic, strong) NSString * MiddleName;
@property (nonatomic, strong) NSString * Nickname;
@property (nonatomic, strong) t_CompleteNameType * CompleteName;
@property (nonatomic, strong) NSString * CompanyName;
@property (nonatomic, strong) NSArray * EmailAddresses;
@property (nonatomic, strong) NSArray * PhysicalAddresses;
@property (nonatomic, strong) NSArray * PhoneNumbers;
@property (nonatomic, strong) NSString * AssistantName;
@property (nonatomic, strong) NSDate * Birthday;
@property (nonatomic, strong) NSString * BusinessHomePage;
@property (nonatomic, strong) NSArray * Children;
@property (nonatomic, strong) NSArray * Companies;
@property (nonatomic) t_ContactSourceTypeEnum ContactSource;
@property (nonatomic, strong) NSString * Department;
@property (nonatomic, strong) NSString * Generation;
@property (nonatomic, strong) NSArray * ImAddresses;
@property (nonatomic, strong) NSString * JobTitle;
@property (nonatomic, strong) NSString * Manager;
@property (nonatomic, strong) NSString * Mileage;
@property (nonatomic, strong) NSString * OfficeLocation;
@property (nonatomic) t_PhysicalAddressIndexTypeEnum PostalAddressIndex;
@property (nonatomic, strong) NSString * Profession;
@property (nonatomic, strong) NSString * SpouseName;
@property (nonatomic, strong) NSString * Surname;
@property (nonatomic, strong) NSDate * WeddingAnniversary;
@property (nonatomic, strong) NSNumber * HasPicture;
@property (nonatomic, strong) NSString * PhoneticFullName;
@property (nonatomic, strong) NSString * PhoneticFirstName;
@property (nonatomic, strong) NSString * PhoneticLastName;
@property (nonatomic, strong) NSString * Alias;
@property (nonatomic, strong) NSString * Notes;
@property (nonatomic, strong) NSData * Photo;
@property (nonatomic, strong) NSArray * UserSMIMECertificate;
@property (nonatomic, strong) NSArray * MSExchangeCertificate;
@property (nonatomic, strong) NSString * DirectoryId;
@property (nonatomic, strong) id ManagerMailbox;
@property (nonatomic, strong) NSArray * DirectReports;
@end
@interface t_SmtpDomainList : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_DelegateUserType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DelegateUserType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_UserIdType * UserId;
@property (nonatomic, strong) t_DelegatePermissionsType * DelegatePermissions;
@property (nonatomic, strong) NSNumber * ReceiveCopiesOfMeetingMessages;
@property (nonatomic, strong) NSNumber * ViewPrivateItems;
@end
@interface t_SmartResponseBaseType : t_ResponseObjectType
@end
@interface t_SmartResponseType : t_SmartResponseBaseType
/* elements */
@property (nonatomic, strong) t_BodyType * NewBodyContent;
@end
@interface t_ReplyToItemType : t_SmartResponseType
@end
typedef enum t_IndexBasePointTypeEnum {
	t_IndexBasePointType_none = 0,
	t_IndexBasePointType_Beginning,
	t_IndexBasePointType_End,
} t_IndexBasePointTypeEnum;

@interface t_IndexBasePointType : NSObject
+ (t_IndexBasePointTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_IndexBasePointTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_IndexBasePointTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_IndexBasePointTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_IndexBasePointTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_IndexBasePointTypeEnum)value;
@end
@interface t_UserConfigurationDictionaryType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_BasePagingType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BasePagingType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;


/* attributes */
@property (nonatomic, strong) NSNumber * MaxEntriesReturned;
@end
@interface t_CalendarViewType : t_BasePagingType

/* attributes */
@property (nonatomic, strong) NSDate * StartDate;
@property (nonatomic, strong) NSDate * EndDate;
@end
typedef enum t_ContainmentModeTypeEnum {
	t_ContainmentModeType_none = 0,
	t_ContainmentModeType_ExactPhrase,
	t_ContainmentModeType_FullString,
	t_ContainmentModeType_PrefixOnWords,
	t_ContainmentModeType_Prefixed,
	t_ContainmentModeType_Substring,
} t_ContainmentModeTypeEnum;

@interface t_ContainmentModeType : NSObject
+ (t_ContainmentModeTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ContainmentModeTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ContainmentModeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ContainmentModeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ContainmentModeTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ContainmentModeTypeEnum)value;
@end
typedef enum t_EmailAddressKeyTypeEnum {
	t_EmailAddressKeyType_none = 0,
	t_EmailAddressKeyType_EmailAddress1,
	t_EmailAddressKeyType_EmailAddress2,
	t_EmailAddressKeyType_EmailAddress3,
} t_EmailAddressKeyTypeEnum;

@interface t_EmailAddressKeyType : NSObject
+ (t_EmailAddressKeyTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_EmailAddressKeyTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_EmailAddressKeyTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_EmailAddressKeyTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_EmailAddressKeyTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_EmailAddressKeyTypeEnum)value;
@end
typedef enum t_MailboxTypeTypeEnum {
	t_MailboxTypeType_none = 0,
	t_MailboxTypeType_Contact,
	t_MailboxTypeType_Mailbox,
	t_MailboxTypeType_OneOff,
	t_MailboxTypeType_PrivateDL,
	t_MailboxTypeType_PublicDL,
	t_MailboxTypeType_PublicFolder,
	t_MailboxTypeType_Unknown,
} t_MailboxTypeTypeEnum;

@interface t_MailboxTypeType : NSObject
+ (t_MailboxTypeTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_MailboxTypeTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_MailboxTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_MailboxTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MailboxTypeTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MailboxTypeTypeEnum)value;
@end
@interface t_EmailAddressDictionaryEntryType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_EmailAddressDictionaryEntryType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* content */
@property (nonatomic, strong) NSString * _content;


/* attributes */
@property (nonatomic) t_EmailAddressKeyTypeEnum Key;
@property (nonatomic, strong) NSString * Name;
@property (nonatomic, strong) NSString * RoutingType;
@property (nonatomic) t_MailboxTypeTypeEnum MailboxType;
@end
typedef enum t_FlaggedForActionTypeEnum {
	t_FlaggedForActionType_none = 0,
	t_FlaggedForActionType_Any,
	t_FlaggedForActionType_Call,
	t_FlaggedForActionType_DoNotForward,
	t_FlaggedForActionType_FYI,
	t_FlaggedForActionType_FollowUp,
	t_FlaggedForActionType_Forward,
	t_FlaggedForActionType_NoResponseNecessary,
	t_FlaggedForActionType_Read,
	t_FlaggedForActionType_Reply,
	t_FlaggedForActionType_ReplyToAll,
	t_FlaggedForActionType_Review,
} t_FlaggedForActionTypeEnum;

@interface t_FlaggedForActionType : NSObject
+ (t_FlaggedForActionTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_FlaggedForActionTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_FlaggedForActionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_FlaggedForActionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FlaggedForActionTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_FlaggedForActionTypeEnum)value;
@end
@interface t_ArrayOfEmailAddressesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_RulePredicatesType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RulePredicatesType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSArray * Categories;
@property (nonatomic, strong) NSArray * ContainsBodyStrings;
@property (nonatomic, strong) NSArray * ContainsHeaderStrings;
@property (nonatomic, strong) NSArray * ContainsRecipientStrings;
@property (nonatomic, strong) NSArray * ContainsSenderStrings;
@property (nonatomic, strong) NSArray * ContainsSubjectOrBodyStrings;
@property (nonatomic, strong) NSArray * ContainsSubjectStrings;
@property (nonatomic) t_FlaggedForActionTypeEnum FlaggedForAction;
@property (nonatomic, strong) NSArray * FromAddresses;
@property (nonatomic, strong) NSArray * FromConnectedAccounts;
@property (nonatomic, strong) NSNumber * HasAttachments;
@property (nonatomic) t_ImportanceChoicesTypeEnum Importance;
@property (nonatomic, strong) NSNumber * IsApprovalRequest;
@property (nonatomic, strong) NSNumber * IsAutomaticForward;
@property (nonatomic, strong) NSNumber * IsAutomaticReply;
@property (nonatomic, strong) NSNumber * IsEncrypted;
@property (nonatomic, strong) NSNumber * IsMeetingRequest;
@property (nonatomic, strong) NSNumber * IsMeetingResponse;
@property (nonatomic, strong) NSNumber * IsNDR;
@property (nonatomic, strong) NSNumber * IsPermissionControlled;
@property (nonatomic, strong) NSNumber * IsReadReceipt;
@property (nonatomic, strong) NSNumber * IsSigned;
@property (nonatomic, strong) NSNumber * IsVoicemail;
@property (nonatomic, strong) NSArray * ItemClasses;
@property (nonatomic, strong) NSArray * MessageClassifications;
@property (nonatomic, strong) NSNumber * NotSentToMe;
@property (nonatomic, strong) NSNumber * SentCcMe;
@property (nonatomic, strong) NSNumber * SentOnlyToMe;
@property (nonatomic, strong) NSArray * SentToAddresses;
@property (nonatomic, strong) NSNumber * SentToMe;
@property (nonatomic, strong) NSNumber * SentToOrCcMe;
@property (nonatomic) t_SensitivityChoicesTypeEnum Sensitivity;
@property (nonatomic, strong) t_RulePredicateDateRangeType * WithinDateRange;
@property (nonatomic, strong) t_RulePredicateSizeRangeType * WithinSizeRange;
@end
typedef enum t_DateTimePrecisionTypeEnum {
	t_DateTimePrecisionType_none = 0,
	t_DateTimePrecisionType_Milliseconds,
	t_DateTimePrecisionType_Seconds,
} t_DateTimePrecisionTypeEnum;

@interface t_DateTimePrecisionType : NSObject
+ (t_DateTimePrecisionTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_DateTimePrecisionTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_DateTimePrecisionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_DateTimePrecisionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DateTimePrecisionTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DateTimePrecisionTypeEnum)value;
@end
typedef enum t_CalendarPermissionReadAccessTypeEnum {
	t_CalendarPermissionReadAccessType_none = 0,
	t_CalendarPermissionReadAccessType_FullDetails,
	t_CalendarPermissionReadAccessType_None,
	t_CalendarPermissionReadAccessType_TimeAndSubjectAndLocation,
	t_CalendarPermissionReadAccessType_TimeOnly,
} t_CalendarPermissionReadAccessTypeEnum;

@interface t_CalendarPermissionReadAccessType : NSObject
+ (t_CalendarPermissionReadAccessTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_CalendarPermissionReadAccessTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_CalendarPermissionReadAccessTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_CalendarPermissionReadAccessTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarPermissionReadAccessTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_CalendarPermissionReadAccessTypeEnum)value;
@end
@interface t_CalendarFolderType : t_BaseFolderType
/* elements */
@property (nonatomic) t_CalendarPermissionReadAccessTypeEnum SharingEffectiveRights;
@property (nonatomic, strong) t_CalendarPermissionSetType * PermissionSet;
@end
@interface t_NonEmptyArrayOfFoldersType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_NonEmptyArrayOfItemIdsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_NotType : t_SearchExpressionType
/* elements */
@property (nonatomic, strong) t_SearchExpressionType * SearchExpression;
@property (nonatomic, strong) t_ExistsType * Exists;
@property (nonatomic, strong) t_ExcludesType * Excludes;
@property (nonatomic, strong) t_IsEqualToType * IsEqualTo;
@property (nonatomic, strong) t_IsNotEqualToType * IsNotEqualTo;
@property (nonatomic, strong) t_IsGreaterThanType * IsGreaterThan;
@property (nonatomic, strong) t_IsGreaterThanOrEqualToType * IsGreaterThanOrEqualTo;
@property (nonatomic, strong) t_IsLessThanType * IsLessThan;
@property (nonatomic, strong) t_IsLessThanOrEqualToType * IsLessThanOrEqualTo;
@property (nonatomic, strong) t_ContainsExpressionType * Contains;
@property (nonatomic, strong) t_NotType * Not;
@property (nonatomic, strong) t_AndType * And;
@property (nonatomic, strong) t_OrType * Or;
@end
@interface t_MaxSyncChangesReturnedType : NSObject
+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (NSNumber *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSNumber *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSNumber *)value;
@end
@interface t_MailboxCultureType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MailboxCultureType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* content */
@property (nonatomic, strong) NSString * _content;

@end
@interface t_NonEmptyArrayOfAttendeesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
typedef enum t_MeetingRequestTypeTypeEnum {
	t_MeetingRequestTypeType_none = 0,
	t_MeetingRequestTypeType_FullUpdate,
	t_MeetingRequestTypeType_InformationalUpdate,
	t_MeetingRequestTypeType_NewMeetingRequest,
	t_MeetingRequestTypeType_None,
	t_MeetingRequestTypeType_Outdated,
	t_MeetingRequestTypeType_PrincipalWantsCopy,
	t_MeetingRequestTypeType_SilentUpdate,
} t_MeetingRequestTypeTypeEnum;

@interface t_MeetingRequestTypeType : NSObject
+ (t_MeetingRequestTypeTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_MeetingRequestTypeTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_MeetingRequestTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_MeetingRequestTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MeetingRequestTypeTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MeetingRequestTypeTypeEnum)value;
@end
@interface t_ArrayOfResolutionType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ArrayOfResolutionType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property(nonatomic, strong) NSArray *Resolution; // Array of *ResolutionType

/* attributes */
@property (nonatomic, strong) NSNumber * IndexedPagingOffset;
@property (nonatomic, strong) NSNumber * NumeratorOffset;
@property (nonatomic, strong) NSNumber * AbsoluteDenominator;
@property (nonatomic, strong) NSNumber * IncludesLastItemInRange;
@property (nonatomic, strong) NSNumber * TotalItemsInView;
@end
@interface t_ArrayOfUserMailboxesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_UploadItemType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UploadItemType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_FolderIdType * ParentFolderId;
@property (nonatomic, strong) t_ItemIdType * ItemId;
@property (nonatomic, strong) NSData * Data;

/* attributes */
@property (nonatomic) t_CreateActionTypeEnum CreateAction;
@property (nonatomic, strong) NSNumber * IsAssociated;
@end
@interface t_NonEmptyArrayOfSubscriptionIdsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_NonEmptyArrayOfUploadItemsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
typedef enum t_PermissionReadAccessTypeEnum {
	t_PermissionReadAccessType_none = 0,
	t_PermissionReadAccessType_FullDetails,
	t_PermissionReadAccessType_None,
} t_PermissionReadAccessTypeEnum;

@interface t_PermissionReadAccessType : NSObject
+ (t_PermissionReadAccessTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_PermissionReadAccessTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_PermissionReadAccessTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_PermissionReadAccessTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PermissionReadAccessTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_PermissionReadAccessTypeEnum)value;
@end
@interface t_ContactsFolderType : t_BaseFolderType
/* elements */
@property (nonatomic) t_PermissionReadAccessTypeEnum SharingEffectiveRights;
@property (nonatomic, strong) t_PermissionSetType * PermissionSet;
@end
@interface t_BasePathToElementType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BasePathToElementType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

@end
typedef enum t_DistinguishedPropertySetTypeEnum {
	t_DistinguishedPropertySetType_none = 0,
	t_DistinguishedPropertySetType_Address,
	t_DistinguishedPropertySetType_Appointment,
	t_DistinguishedPropertySetType_CalendarAssistant,
	t_DistinguishedPropertySetType_Common,
	t_DistinguishedPropertySetType_InternetHeaders,
	t_DistinguishedPropertySetType_Meeting,
	t_DistinguishedPropertySetType_PublicStrings,
	t_DistinguishedPropertySetType_Task,
	t_DistinguishedPropertySetType_UnifiedMessaging,
} t_DistinguishedPropertySetTypeEnum;

@interface t_DistinguishedPropertySetType : NSObject
+ (t_DistinguishedPropertySetTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_DistinguishedPropertySetTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_DistinguishedPropertySetTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_DistinguishedPropertySetTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DistinguishedPropertySetTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DistinguishedPropertySetTypeEnum)value;
@end
@interface t_GuidType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
@interface t_PropertyTagType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
typedef enum t_MapiPropertyTypeTypeEnum {
	t_MapiPropertyTypeType_none = 0,
	t_MapiPropertyTypeType_ApplicationTime,
	t_MapiPropertyTypeType_ApplicationTimeArray,
	t_MapiPropertyTypeType_Binary,
	t_MapiPropertyTypeType_BinaryArray,
	t_MapiPropertyTypeType_Boolean,
	t_MapiPropertyTypeType_CLSID,
	t_MapiPropertyTypeType_CLSIDArray,
	t_MapiPropertyTypeType_Currency,
	t_MapiPropertyTypeType_CurrencyArray,
	t_MapiPropertyTypeType_Double,
	t_MapiPropertyTypeType_DoubleArray,
	t_MapiPropertyTypeType_Error,
	t_MapiPropertyTypeType_Float,
	t_MapiPropertyTypeType_FloatArray,
	t_MapiPropertyTypeType_Integer,
	t_MapiPropertyTypeType_IntegerArray,
	t_MapiPropertyTypeType_Long,
	t_MapiPropertyTypeType_LongArray,
	t_MapiPropertyTypeType_Null,
	t_MapiPropertyTypeType_Object,
	t_MapiPropertyTypeType_ObjectArray,
	t_MapiPropertyTypeType_Short,
	t_MapiPropertyTypeType_ShortArray,
	t_MapiPropertyTypeType_String,
	t_MapiPropertyTypeType_StringArray,
	t_MapiPropertyTypeType_SystemTime,
	t_MapiPropertyTypeType_SystemTimeArray,
} t_MapiPropertyTypeTypeEnum;

@interface t_MapiPropertyTypeType : NSObject
+ (t_MapiPropertyTypeTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_MapiPropertyTypeTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_MapiPropertyTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_MapiPropertyTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MapiPropertyTypeTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MapiPropertyTypeTypeEnum)value;
@end
@interface t_PathToExtendedFieldType : t_BasePathToElementType

/* attributes */
@property (nonatomic) t_DistinguishedPropertySetTypeEnum DistinguishedPropertySetId;
@property (nonatomic, strong) NSString * PropertySetId;
@property (nonatomic, strong) NSString * PropertyTag;
@property (nonatomic, strong) NSString * PropertyName;
@property (nonatomic, strong) NSNumber * PropertyId;
@property (nonatomic) t_MapiPropertyTypeTypeEnum PropertyType;
@end
@interface t_ArrayOfItemClassType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_NonEmptyArrayOfBaseItemIdsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ConversationType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConversationType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_ItemIdType * ConversationId;
@property (nonatomic, strong) NSString * ConversationTopic;
@property (nonatomic, strong) NSArray * UniqueRecipients;
@property (nonatomic, strong) NSArray * GlobalUniqueRecipients;
@property (nonatomic, strong) NSArray * UniqueUnreadSenders;
@property (nonatomic, strong) NSArray * GlobalUniqueUnreadSenders;
@property (nonatomic, strong) NSArray * UniqueSenders;
@property (nonatomic, strong) NSArray * GlobalUniqueSenders;
@property (nonatomic, strong) NSDate * LastDeliveryTime;
@property (nonatomic, strong) NSDate * GlobalLastDeliveryTime;
@property (nonatomic, strong) NSArray * Categories;
@property (nonatomic, strong) NSArray * GlobalCategories;
@property (nonatomic) t_FlagStatusTypeEnum FlagStatus;
@property (nonatomic) t_FlagStatusTypeEnum GlobalFlagStatus;
@property (nonatomic, strong) NSNumber * HasAttachments;
@property (nonatomic, strong) NSNumber * GlobalHasAttachments;
@property (nonatomic, strong) NSNumber * MessageCount;
@property (nonatomic, strong) NSNumber * GlobalMessageCount;
@property (nonatomic, strong) NSNumber * UnreadCount;
@property (nonatomic, strong) NSNumber * GlobalUnreadCount;
@property (nonatomic, strong) NSNumber * Size;
@property (nonatomic, strong) NSNumber * GlobalSize;
@property (nonatomic, strong) NSArray * ItemClasses;
@property (nonatomic, strong) NSArray * GlobalItemClasses;
@property (nonatomic) t_ImportanceChoicesTypeEnum Importance;
@property (nonatomic) t_ImportanceChoicesTypeEnum GlobalImportance;
@property (nonatomic, strong) NSArray * ItemIds;
@property (nonatomic, strong) NSArray * GlobalItemIds;
@end
typedef enum t_FolderQueryTraversalTypeEnum {
	t_FolderQueryTraversalType_none = 0,
	t_FolderQueryTraversalType_Deep,
	t_FolderQueryTraversalType_Shallow,
	t_FolderQueryTraversalType_SoftDeleted,
} t_FolderQueryTraversalTypeEnum;

@interface t_FolderQueryTraversalType : NSObject
+ (t_FolderQueryTraversalTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_FolderQueryTraversalTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_FolderQueryTraversalTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_FolderQueryTraversalTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FolderQueryTraversalTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_FolderQueryTraversalTypeEnum)value;
@end
typedef enum t_DelegateFolderPermissionLevelTypeEnum {
	t_DelegateFolderPermissionLevelType_none = 0,
	t_DelegateFolderPermissionLevelType_Author,
	t_DelegateFolderPermissionLevelType_Custom,
	t_DelegateFolderPermissionLevelType_Editor,
	t_DelegateFolderPermissionLevelType_None,
	t_DelegateFolderPermissionLevelType_Reviewer,
} t_DelegateFolderPermissionLevelTypeEnum;

@interface t_DelegateFolderPermissionLevelType : NSObject
+ (t_DelegateFolderPermissionLevelTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_DelegateFolderPermissionLevelTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_DelegateFolderPermissionLevelTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_DelegateFolderPermissionLevelTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DelegateFolderPermissionLevelTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DelegateFolderPermissionLevelTypeEnum)value;
@end
typedef enum t_SpecialLogonTypeTypeEnum {
	t_SpecialLogonTypeType_none = 0,
	t_SpecialLogonTypeType_Admin,
	t_SpecialLogonTypeType_SystemService,
} t_SpecialLogonTypeTypeEnum;

@interface t_SpecialLogonTypeType : NSObject
+ (t_SpecialLogonTypeTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_SpecialLogonTypeTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_SpecialLogonTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_SpecialLogonTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SpecialLogonTypeTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SpecialLogonTypeTypeEnum)value;
@end
@interface t_MultipleOperandBooleanExpressionType : t_SearchExpressionType
/* elements */
@property(nonatomic, strong) NSArray *SearchExpression; // Array of *SearchExpressionType
@property (nonatomic, strong) t_ExistsType * Exists;
@property (nonatomic, strong) t_ExcludesType * Excludes;
@property (nonatomic, strong) t_IsEqualToType * IsEqualTo;
@property (nonatomic, strong) t_IsNotEqualToType * IsNotEqualTo;
@property (nonatomic, strong) t_IsGreaterThanType * IsGreaterThan;
@property (nonatomic, strong) t_IsGreaterThanOrEqualToType * IsGreaterThanOrEqualTo;
@property (nonatomic, strong) t_IsLessThanType * IsLessThan;
@property (nonatomic, strong) t_IsLessThanOrEqualToType * IsLessThanOrEqualTo;
@property (nonatomic, strong) t_ContainsExpressionType * Contains;
@property (nonatomic, strong) t_NotType * Not;
@property (nonatomic, strong) t_AndType * And;
@property (nonatomic, strong) t_OrType * Or;
@end
@interface t_OrType : t_MultipleOperandBooleanExpressionType
@end
@interface t_TimeChangeType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TimeChangeType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSDate * Offset;
@property (nonatomic, strong) NSDate * Time;

/* attributes */
@property (nonatomic, strong) NSString * TimeZoneName;
@end
typedef enum t_ExceptionPropertyURITypeEnum {
	t_ExceptionPropertyURIType_none = 0,
	t_ExceptionPropertyURIType_attachment_Content,
	t_ExceptionPropertyURIType_attachment_ContentType,
	t_ExceptionPropertyURIType_attachment_Name,
	t_ExceptionPropertyURIType_recurrence_DayOfMonth,
	t_ExceptionPropertyURIType_recurrence_DayOfWeekIndex,
	t_ExceptionPropertyURIType_recurrence_DaysOfWeek,
	t_ExceptionPropertyURIType_recurrence_Interval,
	t_ExceptionPropertyURIType_recurrence_Month,
	t_ExceptionPropertyURIType_recurrence_NumberOfOccurrences,
	t_ExceptionPropertyURIType_timezone_Offset,
} t_ExceptionPropertyURITypeEnum;

@interface t_ExceptionPropertyURIType : NSObject
+ (t_ExceptionPropertyURITypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ExceptionPropertyURITypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ExceptionPropertyURITypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ExceptionPropertyURITypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ExceptionPropertyURITypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ExceptionPropertyURITypeEnum)value;
@end
typedef enum t_UnindexedFieldURITypeEnum {
	t_UnindexedFieldURIType_none = 0,
	t_UnindexedFieldURIType_calendar_AdjacentMeetingCount,
	t_UnindexedFieldURIType_calendar_AdjacentMeetings,
	t_UnindexedFieldURIType_calendar_AllowNewTimeProposal,
	t_UnindexedFieldURIType_calendar_AppointmentReplyTime,
	t_UnindexedFieldURIType_calendar_AppointmentSequenceNumber,
	t_UnindexedFieldURIType_calendar_AppointmentState,
	t_UnindexedFieldURIType_calendar_CalendarItemType,
	t_UnindexedFieldURIType_calendar_ConferenceType,
	t_UnindexedFieldURIType_calendar_ConflictingMeetingCount,
	t_UnindexedFieldURIType_calendar_ConflictingMeetings,
	t_UnindexedFieldURIType_calendar_DateTimeStamp,
	t_UnindexedFieldURIType_calendar_DeletedOccurrences,
	t_UnindexedFieldURIType_calendar_Duration,
	t_UnindexedFieldURIType_calendar_End,
	t_UnindexedFieldURIType_calendar_EndTimeZone,
	t_UnindexedFieldURIType_calendar_FirstOccurrence,
	t_UnindexedFieldURIType_calendar_IsAllDayEvent,
	t_UnindexedFieldURIType_calendar_IsCancelled,
	t_UnindexedFieldURIType_calendar_IsMeeting,
	t_UnindexedFieldURIType_calendar_IsOnlineMeeting,
	t_UnindexedFieldURIType_calendar_IsRecurring,
	t_UnindexedFieldURIType_calendar_IsResponseRequested,
	t_UnindexedFieldURIType_calendar_LastOccurrence,
	t_UnindexedFieldURIType_calendar_LegacyFreeBusyStatus,
	t_UnindexedFieldURIType_calendar_Location,
	t_UnindexedFieldURIType_calendar_MeetingRequestWasSent,
	t_UnindexedFieldURIType_calendar_MeetingTimeZone,
	t_UnindexedFieldURIType_calendar_MeetingWorkspaceUrl,
	t_UnindexedFieldURIType_calendar_ModifiedOccurrences,
	t_UnindexedFieldURIType_calendar_MyResponseType,
	t_UnindexedFieldURIType_calendar_NetShowUrl,
	t_UnindexedFieldURIType_calendar_OptionalAttendees,
	t_UnindexedFieldURIType_calendar_Organizer,
	t_UnindexedFieldURIType_calendar_OriginalStart,
	t_UnindexedFieldURIType_calendar_Recurrence,
	t_UnindexedFieldURIType_calendar_RecurrenceId,
	t_UnindexedFieldURIType_calendar_RequiredAttendees,
	t_UnindexedFieldURIType_calendar_Resources,
	t_UnindexedFieldURIType_calendar_Start,
	t_UnindexedFieldURIType_calendar_StartTimeZone,
	t_UnindexedFieldURIType_calendar_TimeZone,
	t_UnindexedFieldURIType_calendar_UID,
	t_UnindexedFieldURIType_calendar_When,
	t_UnindexedFieldURIType_contacts_Alias,
	t_UnindexedFieldURIType_contacts_AssistantName,
	t_UnindexedFieldURIType_contacts_Birthday,
	t_UnindexedFieldURIType_contacts_BusinessHomePage,
	t_UnindexedFieldURIType_contacts_Children,
	t_UnindexedFieldURIType_contacts_Companies,
	t_UnindexedFieldURIType_contacts_CompanyName,
	t_UnindexedFieldURIType_contacts_CompleteName,
	t_UnindexedFieldURIType_contacts_ContactSource,
	t_UnindexedFieldURIType_contacts_Culture,
	t_UnindexedFieldURIType_contacts_Department,
	t_UnindexedFieldURIType_contacts_DirectReports,
	t_UnindexedFieldURIType_contacts_DirectoryId,
	t_UnindexedFieldURIType_contacts_DisplayName,
	t_UnindexedFieldURIType_contacts_EmailAddresses,
	t_UnindexedFieldURIType_contacts_FileAs,
	t_UnindexedFieldURIType_contacts_FileAsMapping,
	t_UnindexedFieldURIType_contacts_Generation,
	t_UnindexedFieldURIType_contacts_GivenName,
	t_UnindexedFieldURIType_contacts_HasPicture,
	t_UnindexedFieldURIType_contacts_ImAddresses,
	t_UnindexedFieldURIType_contacts_Initials,
	t_UnindexedFieldURIType_contacts_JobTitle,
	t_UnindexedFieldURIType_contacts_MSExchangeCertificate,
	t_UnindexedFieldURIType_contacts_Manager,
	t_UnindexedFieldURIType_contacts_ManagerMailbox,
	t_UnindexedFieldURIType_contacts_MiddleName,
	t_UnindexedFieldURIType_contacts_Mileage,
	t_UnindexedFieldURIType_contacts_Nickname,
	t_UnindexedFieldURIType_contacts_Notes,
	t_UnindexedFieldURIType_contacts_OfficeLocation,
	t_UnindexedFieldURIType_contacts_PhoneNumbers,
	t_UnindexedFieldURIType_contacts_PhoneticFirstName,
	t_UnindexedFieldURIType_contacts_PhoneticFullName,
	t_UnindexedFieldURIType_contacts_PhoneticLastName,
	t_UnindexedFieldURIType_contacts_Photo,
	t_UnindexedFieldURIType_contacts_PhysicalAddresses,
	t_UnindexedFieldURIType_contacts_PostalAddressIndex,
	t_UnindexedFieldURIType_contacts_Profession,
	t_UnindexedFieldURIType_contacts_SpouseName,
	t_UnindexedFieldURIType_contacts_Surname,
	t_UnindexedFieldURIType_contacts_UserSMIMECertificate,
	t_UnindexedFieldURIType_contacts_WeddingAnniversary,
	t_UnindexedFieldURIType_conversation_Categories,
	t_UnindexedFieldURIType_conversation_ConversationId,
	t_UnindexedFieldURIType_conversation_ConversationTopic,
	t_UnindexedFieldURIType_conversation_FlagStatus,
	t_UnindexedFieldURIType_conversation_GlobalCategories,
	t_UnindexedFieldURIType_conversation_GlobalFlagStatus,
	t_UnindexedFieldURIType_conversation_GlobalHasAttachments,
	t_UnindexedFieldURIType_conversation_GlobalImportance,
	t_UnindexedFieldURIType_conversation_GlobalItemClasses,
	t_UnindexedFieldURIType_conversation_GlobalItemIds,
	t_UnindexedFieldURIType_conversation_GlobalLastDeliveryTime,
	t_UnindexedFieldURIType_conversation_GlobalMessageCount,
	t_UnindexedFieldURIType_conversation_GlobalSize,
	t_UnindexedFieldURIType_conversation_GlobalUniqueRecipients,
	t_UnindexedFieldURIType_conversation_GlobalUniqueSenders,
	t_UnindexedFieldURIType_conversation_GlobalUniqueUnreadSenders,
	t_UnindexedFieldURIType_conversation_GlobalUnreadCount,
	t_UnindexedFieldURIType_conversation_HasAttachments,
	t_UnindexedFieldURIType_conversation_Importance,
	t_UnindexedFieldURIType_conversation_ItemClasses,
	t_UnindexedFieldURIType_conversation_ItemIds,
	t_UnindexedFieldURIType_conversation_LastDeliveryTime,
	t_UnindexedFieldURIType_conversation_MessageCount,
	t_UnindexedFieldURIType_conversation_Size,
	t_UnindexedFieldURIType_conversation_UniqueRecipients,
	t_UnindexedFieldURIType_conversation_UniqueSenders,
	t_UnindexedFieldURIType_conversation_UniqueUnreadSenders,
	t_UnindexedFieldURIType_conversation_UnreadCount,
	t_UnindexedFieldURIType_distributionlist_Members,
	t_UnindexedFieldURIType_folder_ChildFolderCount,
	t_UnindexedFieldURIType_folder_DisplayName,
	t_UnindexedFieldURIType_folder_EffectiveRights,
	t_UnindexedFieldURIType_folder_FolderClass,
	t_UnindexedFieldURIType_folder_FolderId,
	t_UnindexedFieldURIType_folder_ManagedFolderInformation,
	t_UnindexedFieldURIType_folder_ParentFolderId,
	t_UnindexedFieldURIType_folder_PermissionSet,
	t_UnindexedFieldURIType_folder_SearchParameters,
	t_UnindexedFieldURIType_folder_SharingEffectiveRights,
	t_UnindexedFieldURIType_folder_TotalCount,
	t_UnindexedFieldURIType_folder_UnreadCount,
	t_UnindexedFieldURIType_item_Attachments,
	t_UnindexedFieldURIType_item_Body,
	t_UnindexedFieldURIType_item_Categories,
	t_UnindexedFieldURIType_item_ConversationId,
	t_UnindexedFieldURIType_item_Culture,
	t_UnindexedFieldURIType_item_DateTimeCreated,
	t_UnindexedFieldURIType_item_DateTimeReceived,
	t_UnindexedFieldURIType_item_DateTimeSent,
	t_UnindexedFieldURIType_item_DisplayCc,
	t_UnindexedFieldURIType_item_DisplayTo,
	t_UnindexedFieldURIType_item_EffectiveRights,
	t_UnindexedFieldURIType_item_HasAttachments,
	t_UnindexedFieldURIType_item_Importance,
	t_UnindexedFieldURIType_item_InReplyTo,
	t_UnindexedFieldURIType_item_InternetMessageHeaders,
	t_UnindexedFieldURIType_item_IsAssociated,
	t_UnindexedFieldURIType_item_IsDraft,
	t_UnindexedFieldURIType_item_IsFromMe,
	t_UnindexedFieldURIType_item_IsResend,
	t_UnindexedFieldURIType_item_IsSubmitted,
	t_UnindexedFieldURIType_item_IsUnmodified,
	t_UnindexedFieldURIType_item_ItemClass,
	t_UnindexedFieldURIType_item_ItemId,
	t_UnindexedFieldURIType_item_LastModifiedName,
	t_UnindexedFieldURIType_item_LastModifiedTime,
	t_UnindexedFieldURIType_item_MimeContent,
	t_UnindexedFieldURIType_item_ParentFolderId,
	t_UnindexedFieldURIType_item_ReminderDueBy,
	t_UnindexedFieldURIType_item_ReminderIsSet,
	t_UnindexedFieldURIType_item_ReminderMinutesBeforeStart,
	t_UnindexedFieldURIType_item_ResponseObjects,
	t_UnindexedFieldURIType_item_Sensitivity,
	t_UnindexedFieldURIType_item_Size,
	t_UnindexedFieldURIType_item_StoreEntryId,
	t_UnindexedFieldURIType_item_Subject,
	t_UnindexedFieldURIType_item_UniqueBody,
	t_UnindexedFieldURIType_item_WebClientEditFormQueryString,
	t_UnindexedFieldURIType_item_WebClientReadFormQueryString,
	t_UnindexedFieldURIType_meeting_AssociatedCalendarItemId,
	t_UnindexedFieldURIType_meeting_HasBeenProcessed,
	t_UnindexedFieldURIType_meeting_IsDelegated,
	t_UnindexedFieldURIType_meeting_IsOutOfDate,
	t_UnindexedFieldURIType_meeting_ResponseType,
	t_UnindexedFieldURIType_meetingRequest_IntendedFreeBusyStatus,
	t_UnindexedFieldURIType_meetingRequest_MeetingRequestType,
	t_UnindexedFieldURIType_message_BccRecipients,
	t_UnindexedFieldURIType_message_CcRecipients,
	t_UnindexedFieldURIType_message_ConversationIndex,
	t_UnindexedFieldURIType_message_ConversationTopic,
	t_UnindexedFieldURIType_message_From,
	t_UnindexedFieldURIType_message_InternetMessageId,
	t_UnindexedFieldURIType_message_IsDeliveryReceiptRequested,
	t_UnindexedFieldURIType_message_IsRead,
	t_UnindexedFieldURIType_message_IsReadReceiptRequested,
	t_UnindexedFieldURIType_message_IsResponseRequested,
	t_UnindexedFieldURIType_message_ReceivedBy,
	t_UnindexedFieldURIType_message_ReceivedRepresenting,
	t_UnindexedFieldURIType_message_References,
	t_UnindexedFieldURIType_message_ReplyTo,
	t_UnindexedFieldURIType_message_Sender,
	t_UnindexedFieldURIType_message_ToRecipients,
	t_UnindexedFieldURIType_postitem_PostedTime,
	t_UnindexedFieldURIType_task_ActualWork,
	t_UnindexedFieldURIType_task_AssignedTime,
	t_UnindexedFieldURIType_task_BillingInformation,
	t_UnindexedFieldURIType_task_ChangeCount,
	t_UnindexedFieldURIType_task_Companies,
	t_UnindexedFieldURIType_task_CompleteDate,
	t_UnindexedFieldURIType_task_Contacts,
	t_UnindexedFieldURIType_task_DelegationState,
	t_UnindexedFieldURIType_task_Delegator,
	t_UnindexedFieldURIType_task_DueDate,
	t_UnindexedFieldURIType_task_IsAssignmentEditable,
	t_UnindexedFieldURIType_task_IsComplete,
	t_UnindexedFieldURIType_task_IsRecurring,
	t_UnindexedFieldURIType_task_IsTeamTask,
	t_UnindexedFieldURIType_task_Mileage,
	t_UnindexedFieldURIType_task_Owner,
	t_UnindexedFieldURIType_task_PercentComplete,
	t_UnindexedFieldURIType_task_Recurrence,
	t_UnindexedFieldURIType_task_StartDate,
	t_UnindexedFieldURIType_task_Status,
	t_UnindexedFieldURIType_task_StatusDescription,
	t_UnindexedFieldURIType_task_TotalWork,
} t_UnindexedFieldURITypeEnum;

@interface t_UnindexedFieldURIType : NSObject
+ (t_UnindexedFieldURITypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_UnindexedFieldURITypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_UnindexedFieldURITypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_UnindexedFieldURITypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UnindexedFieldURITypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_UnindexedFieldURITypeEnum)value;
@end
@interface t_PathToUnindexedFieldType : t_BasePathToElementType

/* attributes */
@property (nonatomic) t_UnindexedFieldURITypeEnum FieldURI;
@end
@interface t_TransitionType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TransitionType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_TransitionTargetType * To;
@end
@interface t_RecurringTimeTransitionType : t_TransitionType
/* elements */
@property (nonatomic, strong) NSDate * TimeOffset;
@property (nonatomic, strong) NSNumber * Month;
@end
@interface t_RecurringDateTransitionType : t_RecurringTimeTransitionType
/* elements */
@property (nonatomic, strong) NSNumber * Day;
@end
@interface t_ArrayOfTimeZoneDefinitionType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_NonEmptyArrayOfItemChangeDescriptionsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_NonEmptyArrayOfAlternateIdsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ArrayOfWorkingPeriod : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_NonEmptyArrayOfPeriodsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ArrayOfTransitionsGroupsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_TimeZoneDefinitionType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TimeZoneDefinitionType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSArray * Periods;
@property (nonatomic, strong) NSArray * TransitionsGroups;
@property (nonatomic, strong) t_ArrayOfTransitionsType * Transitions;

/* attributes */
@property (nonatomic, strong) NSString * Id_;
@property (nonatomic, strong) NSString * Name;
@end
@interface t_AttributePriority : NSObject
+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (NSNumber *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSNumber *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSNumber *)value;
@end
typedef enum t_DefaultShapeNamesTypeEnum {
	t_DefaultShapeNamesType_none = 0,
	t_DefaultShapeNamesType_AllProperties,
	t_DefaultShapeNamesType_Default,
	t_DefaultShapeNamesType_IdOnly,
} t_DefaultShapeNamesTypeEnum;

@interface t_DefaultShapeNamesType : NSObject
+ (t_DefaultShapeNamesTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_DefaultShapeNamesTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_DefaultShapeNamesTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_DefaultShapeNamesTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DefaultShapeNamesTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DefaultShapeNamesTypeEnum)value;
@end
@interface t_NonEmptyArrayOfPathsToElementType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_FolderResponseShapeType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FolderResponseShapeType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic) t_DefaultShapeNamesTypeEnum BaseShape;
@property (nonatomic, strong) NSArray * AdditionalProperties;
@end
typedef enum t_NotificationEventTypeTypeEnum {
	t_NotificationEventTypeType_none = 0,
	t_NotificationEventTypeType_CopiedEvent,
	t_NotificationEventTypeType_CreatedEvent,
	t_NotificationEventTypeType_DeletedEvent,
	t_NotificationEventTypeType_FreeBusyChangedEvent,
	t_NotificationEventTypeType_ModifiedEvent,
	t_NotificationEventTypeType_MovedEvent,
	t_NotificationEventTypeType_NewMailEvent,
} t_NotificationEventTypeTypeEnum;

@interface t_NotificationEventTypeType : NSObject
+ (t_NotificationEventTypeTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_NotificationEventTypeTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_NotificationEventTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_NotificationEventTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_NotificationEventTypeTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_NotificationEventTypeTypeEnum)value;
@end
@interface t_OccurrenceInfoType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_OccurrenceInfoType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_ItemIdType * ItemId;
@property (nonatomic, strong) NSDate * Start;
@property (nonatomic, strong) NSDate * End;
@property (nonatomic, strong) NSDate * OriginalStart;
@end
@interface t_MailTipTypes : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
@interface t_PostReplyItemBaseType : t_ResponseObjectType
@end
typedef enum t_ConnectionStatusTypeEnum {
	t_ConnectionStatusType_none = 0,
	t_ConnectionStatusType_Closed,
	t_ConnectionStatusType_OK,
} t_ConnectionStatusTypeEnum;

@interface t_ConnectionStatusType : NSObject
+ (t_ConnectionStatusTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ConnectionStatusTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ConnectionStatusTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ConnectionStatusTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConnectionStatusTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ConnectionStatusTypeEnum)value;
@end
@interface t_MailboxData : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MailboxData *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_EmailAddress * Email;
@property (nonatomic) t_MeetingAttendeeTypeEnum AttendeeType;
@property (nonatomic, strong) NSNumber * ExcludeConflicts;
@end
@interface t_IsNotEqualToType : t_TwoOperandExpressionType
@end
typedef enum t_IdFormatTypeEnum {
	t_IdFormatType_none = 0,
	t_IdFormatType_EntryId,
	t_IdFormatType_EwsId,
	t_IdFormatType_EwsLegacyId,
	t_IdFormatType_HexEntryId,
	t_IdFormatType_OwaId,
	t_IdFormatType_StoreId,
} t_IdFormatTypeEnum;

@interface t_IdFormatType : NSObject
+ (t_IdFormatTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_IdFormatTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_IdFormatTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_IdFormatTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_IdFormatTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_IdFormatTypeEnum)value;
@end
@interface t_AlternateIdBaseType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AlternateIdBaseType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;


/* attributes */
@property (nonatomic) t_IdFormatTypeEnum Format;
@end
@interface t_NonEmptyStringType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
@interface t_AlternateIdType : t_AlternateIdBaseType

/* attributes */
@property (nonatomic, strong) NSString * Id_;
@property (nonatomic, strong) NSString * Mailbox;
@property (nonatomic, strong) NSNumber * IsArchive;
@end
typedef enum t_PhoneCallStateTypeEnum {
	t_PhoneCallStateType_none = 0,
	t_PhoneCallStateType_Alerted,
	t_PhoneCallStateType_Connected,
	t_PhoneCallStateType_Connecting,
	t_PhoneCallStateType_Disconnected,
	t_PhoneCallStateType_Forwarding,
	t_PhoneCallStateType_Idle,
	t_PhoneCallStateType_Incoming,
	t_PhoneCallStateType_Transferring,
} t_PhoneCallStateTypeEnum;

@interface t_PhoneCallStateType : NSObject
+ (t_PhoneCallStateTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_PhoneCallStateTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_PhoneCallStateTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_PhoneCallStateTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhoneCallStateTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_PhoneCallStateTypeEnum)value;
@end
@interface t_RuleType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RuleType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * RuleId;
@property (nonatomic, strong) NSString * DisplayName;
@property (nonatomic, strong) NSNumber * Priority;
@property (nonatomic, strong) NSNumber * IsEnabled;
@property (nonatomic, strong) NSNumber * IsNotSupported;
@property (nonatomic, strong) NSNumber * IsInError;
@property (nonatomic, strong) t_RulePredicatesType * Conditions;
@property (nonatomic, strong) t_RulePredicatesType * Exceptions;
@property (nonatomic, strong) t_RuleActionsType * Actions;
@end
@interface t_AndType : t_MultipleOperandBooleanExpressionType
@end
@interface t_ServiceConfiguration : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ServiceConfiguration *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

@end
@interface t_MailTipsServiceConfiguration : t_ServiceConfiguration
/* elements */
@property (nonatomic, strong) NSNumber * MailTipsEnabled;
@property (nonatomic, strong) NSNumber * MaxRecipientsPerGetMailTipsRequest;
@property (nonatomic, strong) NSNumber * MaxMessageSize;
@property (nonatomic, strong) NSNumber * LargeAudienceThreshold;
@property (nonatomic, strong) NSNumber * ShowExternalRecipientCount;
@property (nonatomic, strong) NSArray * InternalDomains;
@end
@interface t_SearchFolderType : t_FolderType
/* elements */
@property (nonatomic, strong) t_SearchParametersType * SearchParameters;
@end
@interface t_NonEmptyArrayOfGroupIdentifiersType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_NonEmptyArrayOfRestrictedGroupIdentifiersType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_SerializedSecurityContextType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SerializedSecurityContextType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * UserSid;
@property (nonatomic, strong) NSArray * GroupSids;
@property (nonatomic, strong) NSArray * RestrictedGroupSids;
@property (nonatomic, strong) NSString * PrimarySmtpAddress;
@end
typedef enum t_PermissionLevelTypeEnum {
	t_PermissionLevelType_none = 0,
	t_PermissionLevelType_Author,
	t_PermissionLevelType_Contributor,
	t_PermissionLevelType_Custom,
	t_PermissionLevelType_Editor,
	t_PermissionLevelType_None,
	t_PermissionLevelType_NoneditingAuthor,
	t_PermissionLevelType_Owner,
	t_PermissionLevelType_PublishingAuthor,
	t_PermissionLevelType_PublishingEditor,
	t_PermissionLevelType_Reviewer,
} t_PermissionLevelTypeEnum;

@interface t_PermissionLevelType : NSObject
+ (t_PermissionLevelTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_PermissionLevelTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_PermissionLevelTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_PermissionLevelTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PermissionLevelTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_PermissionLevelTypeEnum)value;
@end
typedef enum t_ResponseTypeTypeEnum {
	t_ResponseTypeType_none = 0,
	t_ResponseTypeType_Accept,
	t_ResponseTypeType_Decline,
	t_ResponseTypeType_NoResponseReceived,
	t_ResponseTypeType_Organizer,
	t_ResponseTypeType_Tentative,
	t_ResponseTypeType_Unknown,
} t_ResponseTypeTypeEnum;

@interface t_ResponseTypeType : NSObject
+ (t_ResponseTypeTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ResponseTypeTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ResponseTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ResponseTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ResponseTypeTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ResponseTypeTypeEnum)value;
@end
@interface t_MeetingMessageType : t_MessageType
/* elements */
@property (nonatomic, strong) t_ItemIdType * AssociatedCalendarItemId;
@property (nonatomic, strong) NSNumber * IsDelegated;
@property (nonatomic, strong) NSNumber * IsOutOfDate;
@property (nonatomic, strong) NSNumber * HasBeenProcessed;
@property (nonatomic) t_ResponseTypeTypeEnum ResponseType;
@property (nonatomic, strong) NSString * UID;
@property (nonatomic, strong) NSDate * RecurrenceId;
@property (nonatomic, strong) NSDate * DateTimeStamp;
@end
typedef enum t_PermissionActionTypeEnum {
	t_PermissionActionType_none = 0,
	t_PermissionActionType_All,
	t_PermissionActionType_None,
	t_PermissionActionType_Owned,
} t_PermissionActionTypeEnum;

@interface t_PermissionActionType : NSObject
+ (t_PermissionActionTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_PermissionActionTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_PermissionActionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_PermissionActionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PermissionActionTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_PermissionActionTypeEnum)value;
@end
@interface t_AttendeeConflictData : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AttendeeConflictData *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

@end
typedef enum t_LegacyFreeBusyTypeEnum {
	t_LegacyFreeBusyType_none = 0,
	t_LegacyFreeBusyType_Busy,
	t_LegacyFreeBusyType_Free,
	t_LegacyFreeBusyType_NoData,
	t_LegacyFreeBusyType_OOF,
	t_LegacyFreeBusyType_Tentative,
} t_LegacyFreeBusyTypeEnum;

@interface t_LegacyFreeBusyType : NSObject
+ (t_LegacyFreeBusyTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_LegacyFreeBusyTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_LegacyFreeBusyTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_LegacyFreeBusyTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_LegacyFreeBusyTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_LegacyFreeBusyTypeEnum)value;
@end
@interface t_IndividualAttendeeConflictData : t_AttendeeConflictData
/* elements */
@property (nonatomic) t_LegacyFreeBusyTypeEnum BusyType;
@end
@interface t_NonEmptyArrayOfRequestAttachmentIdsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_NonEmptyArrayOfNotificationEventTypesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_BaseSubscriptionRequestType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BaseSubscriptionRequestType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSArray * FolderIds;
@property (nonatomic, strong) NSArray * EventTypes;
@property (nonatomic, strong) NSString * Watermark;

/* attributes */
@property (nonatomic, strong) NSNumber * SubscribeToAllFolders;
@end
@interface t_SubscriptionStatusFrequencyType : NSObject
+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (NSNumber *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSNumber *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSNumber *)value;
@end
@interface t_PushSubscriptionRequestType : t_BaseSubscriptionRequestType
/* elements */
@property (nonatomic, strong) NSNumber * StatusFrequency;
@property (nonatomic, strong) NSString * URL;
@end
typedef enum t_MessageTrackingReportTemplateTypeEnum {
	t_MessageTrackingReportTemplateType_none = 0,
	t_MessageTrackingReportTemplateType_RecipientPath,
	t_MessageTrackingReportTemplateType_Summary,
} t_MessageTrackingReportTemplateTypeEnum;

@interface t_MessageTrackingReportTemplateType : NSObject
+ (t_MessageTrackingReportTemplateTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_MessageTrackingReportTemplateTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_MessageTrackingReportTemplateTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_MessageTrackingReportTemplateTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MessageTrackingReportTemplateTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MessageTrackingReportTemplateTypeEnum)value;
@end
typedef enum t_BodyTypeResponseTypeEnum {
	t_BodyTypeResponseType_none = 0,
	t_BodyTypeResponseType_Best,
	t_BodyTypeResponseType_HTML,
	t_BodyTypeResponseType_Text,
} t_BodyTypeResponseTypeEnum;

@interface t_BodyTypeResponseType : NSObject
+ (t_BodyTypeResponseTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_BodyTypeResponseTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_BodyTypeResponseTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_BodyTypeResponseTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BodyTypeResponseTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_BodyTypeResponseTypeEnum)value;
@end
@interface t_ItemResponseShapeType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ItemResponseShapeType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic) t_DefaultShapeNamesTypeEnum BaseShape;
@property (nonatomic, strong) NSNumber * IncludeMimeContent;
@property (nonatomic) t_BodyTypeResponseTypeEnum BodyType;
@property (nonatomic, strong) NSNumber * FilterHtmlContent;
@property (nonatomic, strong) NSNumber * ConvertHtmlCodePageToUTF8;
@property (nonatomic, strong) NSArray * AdditionalProperties;
@end
@interface t_ArrayOfTrackingPropertiesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_BaseEmailAddressType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BaseEmailAddressType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

@end
typedef enum t_MonthNamesTypeEnum {
	t_MonthNamesType_none = 0,
	t_MonthNamesType_April,
	t_MonthNamesType_August,
	t_MonthNamesType_December,
	t_MonthNamesType_February,
	t_MonthNamesType_January,
	t_MonthNamesType_July,
	t_MonthNamesType_June,
	t_MonthNamesType_March,
	t_MonthNamesType_May,
	t_MonthNamesType_November,
	t_MonthNamesType_October,
	t_MonthNamesType_September,
} t_MonthNamesTypeEnum;

@interface t_MonthNamesType : NSObject
+ (t_MonthNamesTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_MonthNamesTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_MonthNamesTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_MonthNamesTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MonthNamesTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MonthNamesTypeEnum)value;
@end
@interface t_RelativeYearlyRecurrencePatternType : t_RecurrencePatternBaseType
/* elements */
@property (nonatomic) t_DayOfWeekTypeEnum DaysOfWeek;
@property (nonatomic) t_DayOfWeekIndexTypeEnum DayOfWeekIndex;
@property (nonatomic) t_MonthNamesTypeEnum Month;
@end
@interface t_ResolutionType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ResolutionType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_EmailAddressType * Mailbox;
@property (nonatomic, strong) t_ContactItemType * Contact;
@end
@interface t_NonEmptyArrayOfAllItemsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_BaseItemIdType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BaseItemIdType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

@end
@interface t_OccurrenceItemIdType : t_BaseItemIdType

/* attributes */
@property (nonatomic, strong) NSString * RecurringMasterId;
@property (nonatomic, strong) NSString * ChangeKey;
@property (nonatomic, strong) NSNumber * InstanceIndex;
@end
@interface t_UnknownAttendeeConflictData : t_AttendeeConflictData
@end
typedef enum t_ConversationActionTypeTypeEnum {
	t_ConversationActionTypeType_none = 0,
	t_ConversationActionTypeType_AlwaysCategorize,
	t_ConversationActionTypeType_AlwaysDelete,
	t_ConversationActionTypeType_AlwaysMove,
	t_ConversationActionTypeType_Copy,
	t_ConversationActionTypeType_Delete,
	t_ConversationActionTypeType_Move,
	t_ConversationActionTypeType_SetReadState,
} t_ConversationActionTypeTypeEnum;

@interface t_ConversationActionTypeType : NSObject
+ (t_ConversationActionTypeTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ConversationActionTypeTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ConversationActionTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ConversationActionTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConversationActionTypeTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ConversationActionTypeTypeEnum)value;
@end
@interface t_TargetFolderIdType : NSObject
+ (id)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(id)value;
@end
typedef enum t_DisposalTypeEnum {
	t_DisposalType_none = 0,
	t_DisposalType_HardDelete,
	t_DisposalType_MoveToDeletedItems,
	t_DisposalType_SoftDelete,
} t_DisposalTypeEnum;

@interface t_DisposalType : NSObject
+ (t_DisposalTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_DisposalTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_DisposalTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_DisposalTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DisposalTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DisposalTypeEnum)value;
@end
@interface t_ConversationActionType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConversationActionType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic) t_ConversationActionTypeTypeEnum Action;
@property (nonatomic, strong) t_ItemIdType * ConversationId;
@property (nonatomic, strong) id ContextFolderId;
@property (nonatomic, strong) NSDate * ConversationLastSyncTime;
@property (nonatomic, strong) NSNumber * ProcessRightAway;
@property (nonatomic, strong) id DestinationFolderId;
@property (nonatomic, strong) NSArray * Categories;
@property (nonatomic, strong) NSNumber * EnableAlwaysDelete;
@property (nonatomic, strong) NSNumber * IsRead;
@property (nonatomic) t_DisposalTypeEnum DeleteType;
@end
@interface t_EncryptedSharedFolderDataType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_EncryptedSharedFolderDataType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_EncryptedDataContainerType * Token;
@property (nonatomic, strong) t_EncryptedDataContainerType * Data;
@end
@interface t_UserConfigurationType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserConfigurationType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_UserConfigurationNameType * UserConfigurationName;
@property (nonatomic, strong) t_ItemIdType * ItemId;
@property (nonatomic, strong) NSArray * Dictionary;
@property (nonatomic, strong) NSData * XmlData;
@property (nonatomic, strong) NSData * BinaryData;
@end
@interface t_InvalidRecipientType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_InvalidRecipientType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * SmtpAddress;
@property (nonatomic) t_InvalidRecipientResponseCodeTypeEnum ResponseCode;
@property (nonatomic, strong) NSString * MessageText;
@end
@interface t_RegeneratingPatternBaseType : t_IntervalRecurrencePatternBaseType
@end
@interface t_MonthlyRegeneratingPatternType : t_RegeneratingPatternBaseType
@end
@interface t_SyncFolderItemsReadFlagType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SyncFolderItemsReadFlagType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_ItemIdType * ItemId;
@property (nonatomic, strong) NSNumber * IsRead;
@end
typedef enum t_ConflictResolutionTypeEnum {
	t_ConflictResolutionType_none = 0,
	t_ConflictResolutionType_AlwaysOverwrite,
	t_ConflictResolutionType_AutoResolve,
	t_ConflictResolutionType_NeverOverwrite,
} t_ConflictResolutionTypeEnum;

@interface t_ConflictResolutionType : NSObject
+ (t_ConflictResolutionTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ConflictResolutionTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ConflictResolutionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ConflictResolutionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConflictResolutionTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ConflictResolutionTypeEnum)value;
@end
typedef enum t_SortDirectionTypeEnum {
	t_SortDirectionType_none = 0,
	t_SortDirectionType_Ascending,
	t_SortDirectionType_Descending,
} t_SortDirectionTypeEnum;

@interface t_SortDirectionType : NSObject
+ (t_SortDirectionTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_SortDirectionTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_SortDirectionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_SortDirectionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SortDirectionTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SortDirectionTypeEnum)value;
@end
@interface t_BaseGroupByType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BaseGroupByType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;


/* attributes */
@property (nonatomic) t_SortDirectionTypeEnum Order;
@end
@interface t_GroupByType : t_BaseGroupByType
/* elements */
@property (nonatomic, strong) t_PathToUnindexedFieldType * FieldURI;
@property (nonatomic, strong) t_PathToIndexedFieldType * IndexedFieldURI;
@property (nonatomic, strong) t_PathToExtendedFieldType * ExtendedFieldURI;
@property (nonatomic, strong) t_AggregateOnType * AggregateOn;
@end
@interface t_CompleteNameType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CompleteNameType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * Title;
@property (nonatomic, strong) NSString * FirstName;
@property (nonatomic, strong) NSString * MiddleName;
@property (nonatomic, strong) NSString * LastName;
@property (nonatomic, strong) NSString * Suffix;
@property (nonatomic, strong) NSString * Initials;
@property (nonatomic, strong) NSString * FullName;
@property (nonatomic, strong) NSString * Nickname;
@property (nonatomic, strong) NSString * YomiFirstName;
@property (nonatomic, strong) NSString * YomiLastName;
@end
@interface t_RuleOperationType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RuleOperationType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

@end
@interface t_TimeZoneContextType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TimeZoneContextType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_TimeZoneDefinitionType * TimeZoneDefinition;
@end
@interface t_NonEmptyArrayOfFolderChangeDescriptionsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
typedef enum t_MessageDispositionTypeEnum {
	t_MessageDispositionType_none = 0,
	t_MessageDispositionType_SaveOnly,
	t_MessageDispositionType_SendAndSaveCopy,
	t_MessageDispositionType_SendOnly,
} t_MessageDispositionTypeEnum;

@interface t_MessageDispositionType : NSObject
+ (t_MessageDispositionTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_MessageDispositionTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_MessageDispositionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_MessageDispositionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MessageDispositionTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MessageDispositionTypeEnum)value;
@end
@interface t_ArrayOfRuleValidationErrorsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_RuleOperationErrorType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RuleOperationErrorType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSNumber * OperationIndex;
@property (nonatomic, strong) NSArray * ValidationErrors;
@end
@interface t_RulePredicateDateRangeType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RulePredicateDateRangeType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSDate * StartDateTime;
@property (nonatomic, strong) NSDate * EndDateTime;
@end
@interface t_SmtpDomain : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SmtpDomain *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;


/* attributes */
@property (nonatomic, strong) NSString * Name;
@property (nonatomic, strong) NSNumber * IncludeSubdomains;
@end
@interface t_DelegatePermissionsType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DelegatePermissionsType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic) t_DelegateFolderPermissionLevelTypeEnum CalendarFolderPermissionLevel;
@property (nonatomic) t_DelegateFolderPermissionLevelTypeEnum TasksFolderPermissionLevel;
@property (nonatomic) t_DelegateFolderPermissionLevelTypeEnum InboxFolderPermissionLevel;
@property (nonatomic) t_DelegateFolderPermissionLevelTypeEnum ContactsFolderPermissionLevel;
@property (nonatomic) t_DelegateFolderPermissionLevelTypeEnum NotesFolderPermissionLevel;
@property (nonatomic) t_DelegateFolderPermissionLevelTypeEnum JournalFolderPermissionLevel;
@end
@interface t_EncryptedDataContainerType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_EncryptedDataContainerType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

@end
@interface t_AttachmentType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AttachmentType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_AttachmentIdType * AttachmentId;
@property (nonatomic, strong) NSString * Name;
@property (nonatomic, strong) NSString * ContentType;
@property (nonatomic, strong) NSString * ContentId;
@property (nonatomic, strong) NSString * ContentLocation;
@property (nonatomic, strong) NSNumber * Size;
@property (nonatomic, strong) NSDate * LastModifiedTime;
@property (nonatomic, strong) NSNumber * IsInline;
@end
@interface t_FileAttachmentType : t_AttachmentType
/* elements */
@property (nonatomic, strong) NSNumber * IsContactPhoto;
@property (nonatomic, strong) NSData * Content;
@end
@interface t_ProxySecurityContextType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ProxySecurityContextType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* content */
@property (nonatomic, strong) NSData * _content;

@end
@interface t_ArrayOfRealItemsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_FindItemParentType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FindItemParentType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSArray * Items;
@property (nonatomic, strong) NSArray * Groups;

/* attributes */
@property (nonatomic, strong) NSNumber * IndexedPagingOffset;
@property (nonatomic, strong) NSNumber * NumeratorOffset;
@property (nonatomic, strong) NSNumber * AbsoluteDenominator;
@property (nonatomic, strong) NSNumber * IncludesLastItemInRange;
@property (nonatomic, strong) NSNumber * TotalItemsInView;
@end
@interface t_ProtectionRuleActionType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ProtectionRuleActionType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property(nonatomic, strong) NSArray *Argument; // Array of *ProtectionRuleArgumentType

/* attributes */
@property (nonatomic) t_ProtectionRuleActionKindTypeEnum Name;
@end
@interface t_ArrayOfRuleOperationsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ArrayOfDelegateUserType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ArrayOfRecipientTrackingEventType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
typedef enum t_SuggestionQualityEnum {
	t_SuggestionQuality_none = 0,
	t_SuggestionQuality_Excellent,
	t_SuggestionQuality_Fair,
	t_SuggestionQuality_Good,
	t_SuggestionQuality_Poor,
} t_SuggestionQualityEnum;

@interface t_SuggestionQuality : NSObject
+ (t_SuggestionQualityEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_SuggestionQualityEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_SuggestionQualityEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_SuggestionQualityEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SuggestionQualityEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SuggestionQualityEnum)value;
@end
@interface t_ArrayOfAttendeeConflictData : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_Suggestion : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_Suggestion *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSDate * MeetingTime;
@property (nonatomic, strong) NSNumber * IsWorkTime;
@property (nonatomic) t_SuggestionQualityEnum SuggestionQuality;
@property (nonatomic, strong) NSArray * AttendeeConflictDataArray;
@end
typedef enum t_TaskDelegateStateTypeEnum {
	t_TaskDelegateStateType_none = 0,
	t_TaskDelegateStateType_Accepted,
	t_TaskDelegateStateType_Declined,
	t_TaskDelegateStateType_Max,
	t_TaskDelegateStateType_NoMatch,
	t_TaskDelegateStateType_OwnNew,
	t_TaskDelegateStateType_Owned,
} t_TaskDelegateStateTypeEnum;

@interface t_TaskDelegateStateType : NSObject
+ (t_TaskDelegateStateTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_TaskDelegateStateTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_TaskDelegateStateTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_TaskDelegateStateTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TaskDelegateStateTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_TaskDelegateStateTypeEnum)value;
@end
@interface t_ExcludesAttributeType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
@interface t_ExcludesValueType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ExcludesValueType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;


/* attributes */
@property (nonatomic, strong) NSString * Value;
@end
@interface t_DailyRecurrencePatternType : t_IntervalRecurrencePatternBaseType
@end
typedef enum t_DistinguishedUserTypeEnum {
	t_DistinguishedUserType_none = 0,
	t_DistinguishedUserType_Anonymous,
	t_DistinguishedUserType_Default,
} t_DistinguishedUserTypeEnum;

@interface t_DistinguishedUserType : NSObject
+ (t_DistinguishedUserTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_DistinguishedUserTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_DistinguishedUserTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_DistinguishedUserTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DistinguishedUserTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DistinguishedUserTypeEnum)value;
@end
@interface t_UserIdType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserIdType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * SID;
@property (nonatomic, strong) NSString * PrimarySmtpAddress;
@property (nonatomic, strong) NSString * DisplayName;
@property (nonatomic) t_DistinguishedUserTypeEnum DistinguishedUser;
@property (nonatomic, strong) NSString * ExternalUserIdentity;
@end
@interface t_SyncFolderHierarchyChangesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ArrayOfCalendarPermissionsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_CalendarPermissionSetType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarPermissionSetType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSArray * CalendarPermissions;
@property (nonatomic, strong) NSArray * UnknownEntries;
@end
@interface t_ConnectingSIDType : NSObject
+ (id)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(id)value;
@end
@interface t_ConflictResultsType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConflictResultsType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSNumber * Count;
@end
@interface t_PathToExceptionFieldType : t_BasePathToElementType

/* attributes */
@property (nonatomic) t_ExceptionPropertyURITypeEnum FieldURI;
@end
@interface t_ContactsViewType : t_BasePagingType

/* attributes */
@property (nonatomic, strong) NSString * InitialName;
@property (nonatomic, strong) NSString * FinalName;
@end
typedef enum t_SyncFolderItemsScopeTypeEnum {
	t_SyncFolderItemsScopeType_none = 0,
	t_SyncFolderItemsScopeType_NormalAndAssociatedItems,
	t_SyncFolderItemsScopeType_NormalItems,
} t_SyncFolderItemsScopeTypeEnum;

@interface t_SyncFolderItemsScopeType : NSObject
+ (t_SyncFolderItemsScopeTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_SyncFolderItemsScopeTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_SyncFolderItemsScopeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_SyncFolderItemsScopeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SyncFolderItemsScopeTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SyncFolderItemsScopeTypeEnum)value;
@end
typedef enum t_ItemQueryTraversalTypeEnum {
	t_ItemQueryTraversalType_none = 0,
	t_ItemQueryTraversalType_Associated,
	t_ItemQueryTraversalType_Shallow,
	t_ItemQueryTraversalType_SoftDeleted,
} t_ItemQueryTraversalTypeEnum;

@interface t_ItemQueryTraversalType : NSObject
+ (t_ItemQueryTraversalTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ItemQueryTraversalTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ItemQueryTraversalTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ItemQueryTraversalTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ItemQueryTraversalTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ItemQueryTraversalTypeEnum)value;
@end
typedef enum t_ExchangeVersionTypeEnum {
	t_ExchangeVersionType_none = 0,
	t_ExchangeVersionType_Exchange2007,
	t_ExchangeVersionType_Exchange2007_SP1,
	t_ExchangeVersionType_Exchange2010,
	t_ExchangeVersionType_Exchange2010_SP1,
	t_ExchangeVersionType_Exchange2010_SP2,
} t_ExchangeVersionTypeEnum;

@interface t_ExchangeVersionType : NSObject
+ (t_ExchangeVersionTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ExchangeVersionTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ExchangeVersionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ExchangeVersionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ExchangeVersionTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ExchangeVersionTypeEnum)value;
@end
@interface t_GroupAttendeeConflictData : t_AttendeeConflictData
/* elements */
@property (nonatomic, strong) NSNumber * NumberOfMembers;
@property (nonatomic, strong) NSNumber * NumberOfMembersAvailable;
@property (nonatomic, strong) NSNumber * NumberOfMembersWithConflict;
@property (nonatomic, strong) NSNumber * NumberOfMembersWithNoData;
@end
@interface t_ExchangeImpersonationType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ExchangeImpersonationType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) id ConnectingSID;
@end
@interface t_FolderChangeType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FolderChangeType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_FolderIdType * FolderId;
@property (nonatomic, strong) t_DistinguishedFolderIdType * DistinguishedFolderId;
@property (nonatomic, strong) NSArray * Updates;
@end
@interface t_AttendeeType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AttendeeType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_EmailAddressType * Mailbox;
@property (nonatomic) t_ResponseTypeTypeEnum ResponseType;
@property (nonatomic, strong) NSDate * LastResponseTime;
@end
typedef enum t_RuleFieldURITypeEnum {
	t_RuleFieldURIType_none = 0,
	t_RuleFieldURIType_Action_AssignCategories,
	t_RuleFieldURIType_Action_CopyToFolder,
	t_RuleFieldURIType_Action_Delete,
	t_RuleFieldURIType_Action_ForwardAsAttachmentToRecipients,
	t_RuleFieldURIType_Action_ForwardToRecipients,
	t_RuleFieldURIType_Action_MarkAsRead,
	t_RuleFieldURIType_Action_MarkImportance,
	t_RuleFieldURIType_Action_MoveToFolder,
	t_RuleFieldURIType_Action_PermanentDelete,
	t_RuleFieldURIType_Action_RedirectToRecipients,
	t_RuleFieldURIType_Action_SendSMSAlertToRecipients,
	t_RuleFieldURIType_Action_ServerReplyWithMessage,
	t_RuleFieldURIType_Action_StopProcessingRules,
	t_RuleFieldURIType_Actions,
	t_RuleFieldURIType_Condition_Categories,
	t_RuleFieldURIType_Condition_ContainsBodyStrings,
	t_RuleFieldURIType_Condition_ContainsHeaderStrings,
	t_RuleFieldURIType_Condition_ContainsRecipientStrings,
	t_RuleFieldURIType_Condition_ContainsSenderStrings,
	t_RuleFieldURIType_Condition_ContainsSubjectOrBodyStrings,
	t_RuleFieldURIType_Condition_ContainsSubjectStrings,
	t_RuleFieldURIType_Condition_FlaggedForAction,
	t_RuleFieldURIType_Condition_FromAddresses,
	t_RuleFieldURIType_Condition_FromConnectedAccounts,
	t_RuleFieldURIType_Condition_HasAttachments,
	t_RuleFieldURIType_Condition_Importance,
	t_RuleFieldURIType_Condition_IsApprovalRequest,
	t_RuleFieldURIType_Condition_IsAutomaticForward,
	t_RuleFieldURIType_Condition_IsAutomaticReply,
	t_RuleFieldURIType_Condition_IsEncrypted,
	t_RuleFieldURIType_Condition_IsMeetingRequest,
	t_RuleFieldURIType_Condition_IsMeetingResponse,
	t_RuleFieldURIType_Condition_IsNDR,
	t_RuleFieldURIType_Condition_IsPermissionControlled,
	t_RuleFieldURIType_Condition_IsReadReceipt,
	t_RuleFieldURIType_Condition_IsSigned,
	t_RuleFieldURIType_Condition_IsVoicemail,
	t_RuleFieldURIType_Condition_ItemClasses,
	t_RuleFieldURIType_Condition_MessageClassifications,
	t_RuleFieldURIType_Condition_NotSentToMe,
	t_RuleFieldURIType_Condition_Sensitivity,
	t_RuleFieldURIType_Condition_SentCcMe,
	t_RuleFieldURIType_Condition_SentOnlyToMe,
	t_RuleFieldURIType_Condition_SentToAddresses,
	t_RuleFieldURIType_Condition_SentToMe,
	t_RuleFieldURIType_Condition_SentToOrCcMe,
	t_RuleFieldURIType_Condition_WithinDateRange,
	t_RuleFieldURIType_Condition_WithinSizeRange,
	t_RuleFieldURIType_Conditions,
	t_RuleFieldURIType_DisplayName,
	t_RuleFieldURIType_Exception_Categories,
	t_RuleFieldURIType_Exception_ContainsBodyStrings,
	t_RuleFieldURIType_Exception_ContainsHeaderStrings,
	t_RuleFieldURIType_Exception_ContainsRecipientStrings,
	t_RuleFieldURIType_Exception_ContainsSenderStrings,
	t_RuleFieldURIType_Exception_ContainsSubjectOrBodyStrings,
	t_RuleFieldURIType_Exception_ContainsSubjectStrings,
	t_RuleFieldURIType_Exception_FlaggedForAction,
	t_RuleFieldURIType_Exception_FromAddresses,
	t_RuleFieldURIType_Exception_FromConnectedAccounts,
	t_RuleFieldURIType_Exception_HasAttachments,
	t_RuleFieldURIType_Exception_Importance,
	t_RuleFieldURIType_Exception_IsApprovalRequest,
	t_RuleFieldURIType_Exception_IsAutomaticForward,
	t_RuleFieldURIType_Exception_IsAutomaticReply,
	t_RuleFieldURIType_Exception_IsEncrypted,
	t_RuleFieldURIType_Exception_IsMeetingRequest,
	t_RuleFieldURIType_Exception_IsMeetingResponse,
	t_RuleFieldURIType_Exception_IsNDR,
	t_RuleFieldURIType_Exception_IsPermissionControlled,
	t_RuleFieldURIType_Exception_IsReadReceipt,
	t_RuleFieldURIType_Exception_IsSigned,
	t_RuleFieldURIType_Exception_IsVoicemail,
	t_RuleFieldURIType_Exception_ItemClasses,
	t_RuleFieldURIType_Exception_MessageClassifications,
	t_RuleFieldURIType_Exception_NotSentToMe,
	t_RuleFieldURIType_Exception_Sensitivity,
	t_RuleFieldURIType_Exception_SentCcMe,
	t_RuleFieldURIType_Exception_SentOnlyToMe,
	t_RuleFieldURIType_Exception_SentToAddresses,
	t_RuleFieldURIType_Exception_SentToMe,
	t_RuleFieldURIType_Exception_SentToOrCcMe,
	t_RuleFieldURIType_Exception_WithinDateRange,
	t_RuleFieldURIType_Exception_WithinSizeRange,
	t_RuleFieldURIType_Exceptions,
	t_RuleFieldURIType_IsEnabled,
	t_RuleFieldURIType_IsInError,
	t_RuleFieldURIType_IsNotSupported,
	t_RuleFieldURIType_Priority,
	t_RuleFieldURIType_RuleId,
} t_RuleFieldURITypeEnum;

@interface t_RuleFieldURIType : NSObject
+ (t_RuleFieldURITypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_RuleFieldURITypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_RuleFieldURITypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_RuleFieldURITypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RuleFieldURITypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_RuleFieldURITypeEnum)value;
@end
typedef enum t_RuleValidationErrorCodeTypeEnum {
	t_RuleValidationErrorCodeType_none = 0,
	t_RuleValidationErrorCodeType_ADOperationFailure,
	t_RuleValidationErrorCodeType_ConnectedAccountNotFound,
	t_RuleValidationErrorCodeType_CreateWithRuleId,
	t_RuleValidationErrorCodeType_DuplicatedOperationOnTheSameRule,
	t_RuleValidationErrorCodeType_DuplicatedPriority,
	t_RuleValidationErrorCodeType_EmptyValueFound,
	t_RuleValidationErrorCodeType_FolderDoesNotExist,
	t_RuleValidationErrorCodeType_InvalidAddress,
	t_RuleValidationErrorCodeType_InvalidDateRange,
	t_RuleValidationErrorCodeType_InvalidFolderId,
	t_RuleValidationErrorCodeType_InvalidSizeRange,
	t_RuleValidationErrorCodeType_InvalidValue,
	t_RuleValidationErrorCodeType_MessageClassificationNotFound,
	t_RuleValidationErrorCodeType_MissingAction,
	t_RuleValidationErrorCodeType_MissingParameter,
	t_RuleValidationErrorCodeType_MissingRangeValue,
	t_RuleValidationErrorCodeType_NotSettable,
	t_RuleValidationErrorCodeType_RecipientDoesNotExist,
	t_RuleValidationErrorCodeType_RuleNotFound,
	t_RuleValidationErrorCodeType_SizeLessThanZero,
	t_RuleValidationErrorCodeType_StringValueTooBig,
	t_RuleValidationErrorCodeType_UnexpectedError,
	t_RuleValidationErrorCodeType_UnsupportedAddress,
	t_RuleValidationErrorCodeType_UnsupportedRule,
} t_RuleValidationErrorCodeTypeEnum;

@interface t_RuleValidationErrorCodeType : NSObject
+ (t_RuleValidationErrorCodeTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_RuleValidationErrorCodeTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_RuleValidationErrorCodeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_RuleValidationErrorCodeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RuleValidationErrorCodeTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_RuleValidationErrorCodeTypeEnum)value;
@end
@interface t_RuleValidationErrorType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RuleValidationErrorType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic) t_RuleFieldURITypeEnum FieldURI;
@property (nonatomic) t_RuleValidationErrorCodeTypeEnum ErrorCode;
@property (nonatomic, strong) NSString * ErrorMessage;
@property (nonatomic, strong) NSString * FieldValue;
@end
@interface t_Value : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_Value *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* content */
@property (nonatomic, strong) NSString * _content;


/* attributes */
@property (nonatomic, strong) NSString * Name;
@end
@interface t_FractionalPageViewType : t_BasePagingType

/* attributes */
@property (nonatomic, strong) NSNumber * Numerator;
@property (nonatomic, strong) NSNumber * Denominator;
@end
@interface t_ProtectionRuleAndType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_DailyRegeneratingPatternType : t_RegeneratingPatternBaseType
@end
@interface t_EffectiveRightsType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_EffectiveRightsType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSNumber * CreateAssociated;
@property (nonatomic, strong) NSNumber * CreateContents;
@property (nonatomic, strong) NSNumber * CreateHierarchy;
@property (nonatomic, strong) NSNumber * Delete;
@property (nonatomic, strong) NSNumber * Modify;
@property (nonatomic, strong) NSNumber * Read;
@property (nonatomic, strong) NSNumber * ViewPrivateItems;
@end
@interface t_ReferenceItemResponseType : t_ResponseObjectType
@end
@interface t_RecurringDayTransitionType : t_RecurringTimeTransitionType
/* elements */
@property (nonatomic) t_DayOfWeekTypeEnum DayOfWeek;
@property (nonatomic, strong) NSNumber * Occurrence;
@end
@interface t_ReplyBody : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ReplyBody *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * Message;

/* attributes */
@property (nonatomic, strong) NSString * lang;
@end
@interface t_SidAndAttributesType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SidAndAttributesType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * SecurityIdentifier;

/* attributes */
@property (nonatomic, strong) NSNumber * Attributes;
@end
@interface t_NonEmptyArrayOfNotificationsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
typedef enum t_ConnectionFailureCauseTypeEnum {
	t_ConnectionFailureCauseType_none = 0,
	t_ConnectionFailureCauseType_NoAnswer,
	t_ConnectionFailureCauseType_None,
	t_ConnectionFailureCauseType_Other,
	t_ConnectionFailureCauseType_Unavailable,
	t_ConnectionFailureCauseType_UserBusy,
} t_ConnectionFailureCauseTypeEnum;

@interface t_ConnectionFailureCauseType : NSObject
+ (t_ConnectionFailureCauseTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ConnectionFailureCauseTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ConnectionFailureCauseTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ConnectionFailureCauseTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConnectionFailureCauseTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ConnectionFailureCauseTypeEnum)value;
@end
@interface t_PhoneCallInformationType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhoneCallInformationType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic) t_PhoneCallStateTypeEnum PhoneCallState;
@property (nonatomic) t_ConnectionFailureCauseTypeEnum ConnectionFailureCause;
@property (nonatomic, strong) NSString * SIPResponseText;
@property (nonatomic, strong) NSNumber * SIPResponseCode;
@end
@interface t_FindMessageTrackingSearchResultType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FindMessageTrackingSearchResultType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * Subject;
@property (nonatomic, strong) t_EmailAddressType * Sender;
@property (nonatomic, strong) t_EmailAddressType * PurportedSender;
@property (nonatomic, strong) NSArray * Recipients;
@property (nonatomic, strong) NSDate * SubmittedTime;
@property (nonatomic, strong) NSString * MessageTrackingReportId;
@property (nonatomic, strong) NSString * PreviousHopServer;
@property (nonatomic, strong) NSString * FirstHopServer;
@property (nonatomic, strong) NSArray * Properties;
@end
@interface t_SubscriptionTimeoutType : NSObject
+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (NSNumber *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSNumber *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSNumber *)value;
@end
@interface t_PullSubscriptionRequestType : t_BaseSubscriptionRequestType
/* elements */
@property (nonatomic, strong) NSNumber * Timeout;
@end
@interface t_RootItemIdType : t_BaseItemIdType

/* attributes */
@property (nonatomic, strong) NSString * RootItemId;
@property (nonatomic, strong) NSString * RootItemChangeKey;
@end
@interface t_ModifiedEventType : t_BaseObjectChangedEventType
/* elements */
@property (nonatomic, strong) NSNumber * UnreadCount;
@end
@interface t_SyncFolderItemsChangesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_AttributeValue : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
@interface t_ProtectionRuleArgumentType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ProtectionRuleArgumentType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;


/* attributes */
@property (nonatomic, strong) NSString * Value;
@end
@interface t_ArrayOfArraysOfTrackingPropertiesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
typedef enum t_DictionaryURITypeEnum {
	t_DictionaryURIType_none = 0,
	t_DictionaryURIType_contacts_EmailAddress,
	t_DictionaryURIType_contacts_ImAddress,
	t_DictionaryURIType_contacts_PhoneNumber,
	t_DictionaryURIType_contacts_PhysicalAddress_City,
	t_DictionaryURIType_contacts_PhysicalAddress_CountryOrRegion,
	t_DictionaryURIType_contacts_PhysicalAddress_PostalCode,
	t_DictionaryURIType_contacts_PhysicalAddress_State,
	t_DictionaryURIType_contacts_PhysicalAddress_Street,
	t_DictionaryURIType_distributionlist_Members_Member,
	t_DictionaryURIType_item_InternetMessageHeader,
} t_DictionaryURITypeEnum;

@interface t_DictionaryURIType : NSObject
+ (t_DictionaryURITypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_DictionaryURITypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_DictionaryURITypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_DictionaryURITypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DictionaryURITypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_DictionaryURITypeEnum)value;
@end
@interface t_PathToIndexedFieldType : t_BasePathToElementType

/* attributes */
@property (nonatomic) t_DictionaryURITypeEnum FieldURI;
@property (nonatomic, strong) NSString * FieldIndex;
@end
typedef enum t_TransitionTargetKindTypeEnum {
	t_TransitionTargetKindType_none = 0,
	t_TransitionTargetKindType_Group,
	t_TransitionTargetKindType_Period,
} t_TransitionTargetKindTypeEnum;

@interface t_TransitionTargetKindType : NSObject
+ (t_TransitionTargetKindTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_TransitionTargetKindTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_TransitionTargetKindTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_TransitionTargetKindTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TransitionTargetKindTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_TransitionTargetKindTypeEnum)value;
@end
typedef enum t_TaskStatusTypeEnum {
	t_TaskStatusType_none = 0,
	t_TaskStatusType_Completed,
	t_TaskStatusType_Deferred,
	t_TaskStatusType_InProgress,
	t_TaskStatusType_NotStarted,
	t_TaskStatusType_WaitingOnOthers,
} t_TaskStatusTypeEnum;

@interface t_TaskStatusType : NSObject
+ (t_TaskStatusTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_TaskStatusTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_TaskStatusTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_TaskStatusTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TaskStatusTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_TaskStatusTypeEnum)value;
@end
@interface t_ProtectionRuleSenderDepartmentsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_RequestAttachmentIdType : t_BaseItemIdType

/* attributes */
@property (nonatomic, strong) NSString * Id_;
@end
@interface t_AttachmentIdType : t_RequestAttachmentIdType

/* attributes */
@property (nonatomic, strong) NSString * RootItemId;
@property (nonatomic, strong) NSString * RootItemChangeKey;
@end
@interface t_AbsoluteYearlyRecurrencePatternType : t_RecurrencePatternBaseType
/* elements */
@property (nonatomic, strong) NSNumber * DayOfMonth;
@property (nonatomic) t_MonthNamesTypeEnum Month;
@end
@interface t_RecipientTrackingEventType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RecipientTrackingEventType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSDate * Date;
@property (nonatomic, strong) t_EmailAddressType * Recipient;
@property (nonatomic, strong) NSString * DeliveryStatus;
@property (nonatomic, strong) NSString * EventDescription;
@property (nonatomic, strong) NSArray * EventData;
@property (nonatomic, strong) NSString * Server;
@property (nonatomic, strong) NSNumber * InternalId;
@property (nonatomic, strong) NSNumber * BccRecipient;
@property (nonatomic, strong) NSNumber * HiddenRecipient;
@property (nonatomic, strong) NSString * UniquePathId;
@property (nonatomic, strong) NSString * RootAddress;
@property (nonatomic, strong) NSArray * Properties;
@end
@interface t_ProtectionRuleConditionType : NSObject
+ (id)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(id)value;
@end
@interface t_ArrayOfSuggestion : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_SuggestionDayResult : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SuggestionDayResult *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSDate * Date;
@property (nonatomic) t_SuggestionQualityEnum DayQuality;
@property (nonatomic, strong) NSArray * SuggestionArray;
@end
@interface t_TentativelyAcceptItemType : t_WellKnownResponseObjectType
@end
@interface t_RuleActionsType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RuleActionsType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSArray * AssignCategories;
@property (nonatomic, strong) id CopyToFolder;
@property (nonatomic, strong) NSNumber * Delete;
@property (nonatomic, strong) NSArray * ForwardAsAttachmentToRecipients;
@property (nonatomic, strong) NSArray * ForwardToRecipients;
@property (nonatomic) t_ImportanceChoicesTypeEnum MarkImportance;
@property (nonatomic, strong) NSNumber * MarkAsRead;
@property (nonatomic, strong) id MoveToFolder;
@property (nonatomic, strong) NSNumber * PermanentDelete;
@property (nonatomic, strong) NSArray * RedirectToRecipients;
@property (nonatomic, strong) NSArray * SendSMSAlertToRecipients;
@property (nonatomic, strong) t_ItemIdType * ServerReplyWithMessage;
@property (nonatomic, strong) NSNumber * StopProcessingRules;
@end
@interface t_ArrayOfRuleOperationErrorsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_SuppressReadReceiptType : t_ReferenceItemResponseType
@end
@interface t_RequestTypeHeader : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RequestTypeHeader *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic) t_AvailabilityProxyRequestTypeEnum RequestType;
@end
typedef enum t_ImAddressKeyTypeEnum {
	t_ImAddressKeyType_none = 0,
	t_ImAddressKeyType_ImAddress1,
	t_ImAddressKeyType_ImAddress2,
	t_ImAddressKeyType_ImAddress3,
} t_ImAddressKeyTypeEnum;

@interface t_ImAddressKeyType : NSObject
+ (t_ImAddressKeyTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ImAddressKeyTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ImAddressKeyTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ImAddressKeyTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ImAddressKeyTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ImAddressKeyTypeEnum)value;
@end
@interface t_ImAddressDictionaryEntryType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ImAddressDictionaryEntryType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* content */
@property (nonatomic, strong) NSString * _content;


/* attributes */
@property (nonatomic) t_ImAddressKeyTypeEnum Key;
@end
typedef enum t_OofStateEnum {
	t_OofState_none = 0,
	t_OofState_Disabled,
	t_OofState_Enabled,
	t_OofState_Scheduled,
} t_OofStateEnum;

@interface t_OofState : NSObject
+ (t_OofStateEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_OofStateEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_OofStateEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_OofStateEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_OofStateEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_OofStateEnum)value;
@end
@interface t_MessageTrackingReportType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MessageTrackingReportType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_EmailAddressType * Sender;
@property (nonatomic, strong) t_EmailAddressType * PurportedSender;
@property (nonatomic, strong) NSString * Subject;
@property (nonatomic, strong) NSDate * SubmitTime;
@property (nonatomic, strong) NSArray * OriginalRecipients;
@property (nonatomic, strong) NSArray * RecipientTrackingEvents;
@property (nonatomic, strong) NSArray * Properties;
@end
@interface t_IndexedPageViewType : t_BasePagingType

/* attributes */
@property (nonatomic, strong) NSNumber * Offset;
@property (nonatomic) t_IndexBasePointTypeEnum BasePoint;
@end
@interface t_RecurrenceRangeBaseType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RecurrenceRangeBaseType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSDate * StartDate;
@end
@interface t_EndDateRecurrenceRangeType : t_RecurrenceRangeBaseType
/* elements */
@property (nonatomic, strong) NSDate * EndDate;
@end
@interface t_SyncFolderHierarchyCreateOrUpdateType : NSObject
+ (id)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(id)value;
@end
@interface t_AggregateOnType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AggregateOnType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_PathToUnindexedFieldType * FieldURI;
@property (nonatomic, strong) t_PathToIndexedFieldType * IndexedFieldURI;
@property (nonatomic, strong) t_PathToExtendedFieldType * ExtendedFieldURI;

/* attributes */
@property (nonatomic) t_AggregateTypeEnum Aggregate;
@end
typedef enum t_CalendarItemCreateOrDeleteOperationTypeEnum {
	t_CalendarItemCreateOrDeleteOperationType_none = 0,
	t_CalendarItemCreateOrDeleteOperationType_SendOnlyToAll,
	t_CalendarItemCreateOrDeleteOperationType_SendToAllAndSaveCopy,
	t_CalendarItemCreateOrDeleteOperationType_SendToNone,
} t_CalendarItemCreateOrDeleteOperationTypeEnum;

@interface t_CalendarItemCreateOrDeleteOperationType : NSObject
+ (t_CalendarItemCreateOrDeleteOperationTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_CalendarItemCreateOrDeleteOperationTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_CalendarItemCreateOrDeleteOperationTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_CalendarItemCreateOrDeleteOperationTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarItemCreateOrDeleteOperationTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_CalendarItemCreateOrDeleteOperationTypeEnum)value;
@end
@interface t_ProtectionRuleAllInternalType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
@interface t_ArrayOfConversationsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_NonEmptyArrayOfFieldOrdersType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_AcceptItemType : t_WellKnownResponseObjectType
@end
@interface t_ProtectionRuleRecipientIsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
typedef enum t_MemberStatusTypeEnum {
	t_MemberStatusType_none = 0,
	t_MemberStatusType_Demoted,
	t_MemberStatusType_Normal,
	t_MemberStatusType_Unrecognized,
} t_MemberStatusTypeEnum;

@interface t_MemberStatusType : NSObject
+ (t_MemberStatusTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_MemberStatusTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_MemberStatusTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_MemberStatusTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MemberStatusTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_MemberStatusTypeEnum)value;
@end
@interface t_MemberType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MemberType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_EmailAddressType * Mailbox;
@property (nonatomic) t_MemberStatusTypeEnum Status;

/* attributes */
@property (nonatomic, strong) NSString * Key;
@end
@interface t_DeleteRuleOperationType : t_RuleOperationType
/* elements */
@property (nonatomic, strong) NSString * RuleId;
@end
@interface t_NoEndRecurrenceRangeType : t_RecurrenceRangeBaseType
@end
@interface t_DeleteFolderFieldType : t_FolderChangeDescriptionType
@end
@interface t_NonEmptyArrayOfTimeZoneIdType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_MimeContentType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MimeContentType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* content */
@property (nonatomic, strong) NSString * _content;


/* attributes */
@property (nonatomic, strong) NSString * CharacterSet;
@end
@interface t_ArrayOfProtectionRulesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ProtectionRulesServiceConfiguration : t_ServiceConfiguration
/* elements */
@property (nonatomic, strong) NSArray * Rules;
@property (nonatomic, strong) NSArray * InternalDomains;

/* attributes */
@property (nonatomic, strong) NSNumber * RefreshInterval;
@end
@interface t_TrackingPropertyType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TrackingPropertyType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * Name;
@property (nonatomic, strong) NSString * Value;
@end
@interface t_ManagedFolderInformationType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ManagedFolderInformationType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSNumber * CanDelete;
@property (nonatomic, strong) NSNumber * CanRenameOrMove;
@property (nonatomic, strong) NSNumber * MustDisplayComment;
@property (nonatomic, strong) NSNumber * HasQuota;
@property (nonatomic, strong) NSNumber * IsManagedFoldersRoot;
@property (nonatomic, strong) NSString * ManagedFolderId;
@property (nonatomic, strong) NSString * Comment;
@property (nonatomic, strong) NSNumber * StorageQuota;
@property (nonatomic, strong) NSNumber * FolderSize;
@property (nonatomic, strong) NSString * HomePage;
@end
@interface t_ExcludesType : t_SearchExpressionType
/* elements */
@property (nonatomic, strong) t_BasePathToElementType * Path;
@property (nonatomic, strong) t_PathToUnindexedFieldType * FieldURI;
@property (nonatomic, strong) t_PathToIndexedFieldType * IndexedFieldURI;
@property (nonatomic, strong) t_PathToExtendedFieldType * ExtendedFieldURI;
@property (nonatomic, strong) t_ExcludesValueType * Bitmask;
@end
typedef enum t_SubscriptionStatusTypeEnum {
	t_SubscriptionStatusType_none = 0,
	t_SubscriptionStatusType_OK,
	t_SubscriptionStatusType_Unsubscribe,
} t_SubscriptionStatusTypeEnum;

@interface t_SubscriptionStatusType : NSObject
+ (t_SubscriptionStatusTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_SubscriptionStatusTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_SubscriptionStatusTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_SubscriptionStatusTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SubscriptionStatusTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SubscriptionStatusTypeEnum)value;
@end
@interface t_CalendarEvent : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarEvent *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSDate * StartTime;
@property (nonatomic, strong) NSDate * EndTime;
@property (nonatomic) t_LegacyFreeBusyTypeEnum BusyType;
@property (nonatomic, strong) t_CalendarEventDetails * CalendarEventDetails;
@end
@interface t_TaskRecurrenceType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TaskRecurrenceType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

@end
@interface t_ArrayOfFoldersType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_FindFolderParentType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FindFolderParentType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSArray * Folders;

/* attributes */
@property (nonatomic, strong) NSNumber * IndexedPagingOffset;
@property (nonatomic, strong) NSNumber * NumeratorOffset;
@property (nonatomic, strong) NSNumber * AbsoluteDenominator;
@property (nonatomic, strong) NSNumber * IncludesLastItemInRange;
@property (nonatomic, strong) NSNumber * TotalItemsInView;
@end
@interface t_ProtectionRuleTrueType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
@interface t_NonEmptyArrayOfItemChangesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ArrayOfTransitionsType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ArrayOfTransitionsType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property(nonatomic, strong) NSArray *Transition; // Array of *TransitionType
@property (nonatomic, strong) t_AbsoluteDateTransitionType * AbsoluteDateTransition;
@property (nonatomic, strong) t_RecurringDayTransitionType * RecurringDayTransition;
@property (nonatomic, strong) t_RecurringDateTransitionType * RecurringDateTransition;

/* attributes */
@property (nonatomic, strong) NSString * Id_;
@end
@interface t_DeclineItemType : t_WellKnownResponseObjectType
@end
typedef enum t_AffectedTaskOccurrencesTypeEnum {
	t_AffectedTaskOccurrencesType_none = 0,
	t_AffectedTaskOccurrencesType_AllOccurrences,
	t_AffectedTaskOccurrencesType_SpecifiedOccurrenceOnly,
} t_AffectedTaskOccurrencesTypeEnum;

@interface t_AffectedTaskOccurrencesType : NSObject
+ (t_AffectedTaskOccurrencesTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_AffectedTaskOccurrencesTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_AffectedTaskOccurrencesTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_AffectedTaskOccurrencesTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AffectedTaskOccurrencesTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_AffectedTaskOccurrencesTypeEnum)value;
@end
@interface t_CancelCalendarItemType : t_SmartResponseType
@end
typedef enum t_ResponseClassTypeEnum {
	t_ResponseClassType_none = 0,
	t_ResponseClassType_Error,
	t_ResponseClassType_Success,
	t_ResponseClassType_Warning,
} t_ResponseClassTypeEnum;

@interface t_ResponseClassType : NSObject
+ (t_ResponseClassTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ResponseClassTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ResponseClassTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ResponseClassTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ResponseClassTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ResponseClassTypeEnum)value;
@end
@interface t_EmailAddressType : t_BaseEmailAddressType
/* elements */
@property (nonatomic, strong) NSString * Name;
@property (nonatomic, strong) NSString * EmailAddress;
@property (nonatomic, strong) NSString * RoutingType;
@property (nonatomic) t_MailboxTypeTypeEnum MailboxType;
@property (nonatomic, strong) t_ItemIdType * ItemId;
@end
@interface t_DeletedOccurrenceInfoType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DeletedOccurrenceInfoType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSDate * Start;
@end
@interface t_RulePredicateSizeRangeType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RulePredicateSizeRangeType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSNumber * MinimumSize;
@property (nonatomic, strong) NSNumber * MaximumSize;
@end
@interface t_ArrayOfRulesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_TransitionTargetType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TransitionTargetType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* content */
@property (nonatomic, strong) NSString * _content;


/* attributes */
@property (nonatomic) t_TransitionTargetKindTypeEnum Kind;
@end
@interface t_MembersListType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_DistributionListType : t_ItemType
/* elements */
@property (nonatomic, strong) NSString * DisplayName;
@property (nonatomic, strong) NSString * FileAs;
@property (nonatomic) t_ContactSourceTypeEnum ContactSource;
@property (nonatomic, strong) NSArray * Members;
@end
@interface t_CalendarEventDetails : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarEventDetails *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * ID;
@property (nonatomic, strong) NSString * Subject;
@property (nonatomic, strong) NSString * Location;
@property (nonatomic, strong) NSNumber * IsMeeting;
@property (nonatomic, strong) NSNumber * IsRecurring;
@property (nonatomic, strong) NSNumber * IsException;
@property (nonatomic, strong) NSNumber * IsReminderSet;
@property (nonatomic, strong) NSNumber * IsPrivate;
@end
@interface t_UserConfigurationDictionaryObjectType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserConfigurationDictionaryObjectType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic) t_UserConfigurationDictionaryObjectTypesTypeEnum Type;
@property(nonatomic, strong) NSArray *Value; // Array of *string
@end
@interface t_WorkingHours : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_WorkingHours *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_SerializableTimeZone * TimeZone;
@property (nonatomic, strong) NSArray * WorkingPeriodArray;
@end
@interface t_DirectoryEntryType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_DirectoryEntryType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_EmailAddressType * Id;
@end
@interface t_RoomType : t_DirectoryEntryType
@end
@interface t_IsGreaterThanType : t_TwoOperandExpressionType
@end
@interface t_IsLessThanOrEqualToType : t_TwoOperandExpressionType
@end
@interface t_OpenAsAdminOrSystemServiceType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_OpenAsAdminOrSystemServiceType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) id ConnectingSID;

/* attributes */
@property (nonatomic) t_SpecialLogonTypeTypeEnum LogonType;
@end
@interface t_RecurringMasterItemIdType : t_BaseItemIdType

/* attributes */
@property (nonatomic, strong) NSString * OccurrenceId;
@property (nonatomic, strong) NSString * ChangeKey;
@end
@interface t_SuggestionsViewOptionsType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SuggestionsViewOptionsType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSNumber * GoodThreshold;
@property (nonatomic, strong) NSNumber * MaximumResultsByDay;
@property (nonatomic, strong) NSNumber * MaximumNonWorkHourResultsByDay;
@property (nonatomic, strong) NSNumber * MeetingDurationInMinutes;
@property (nonatomic) t_SuggestionQualityEnum MinimumSuggestionQuality;
@property (nonatomic, strong) t_Duration * DetailedSuggestionsWindow;
@property (nonatomic, strong) NSDate * CurrentMeetingTime;
@property (nonatomic, strong) NSString * GlobalObjectId;
@end
@interface t_KeywordStatisticsSearchResultType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_KeywordStatisticsSearchResultType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * Keyword;
@property (nonatomic, strong) NSNumber * ItemHits;
@property (nonatomic, strong) NSNumber * Size;
@end
typedef enum t_ResolveNamesSearchScopeTypeEnum {
	t_ResolveNamesSearchScopeType_none = 0,
	t_ResolveNamesSearchScopeType_ActiveDirectory,
	t_ResolveNamesSearchScopeType_ActiveDirectoryContacts,
	t_ResolveNamesSearchScopeType_Contacts,
	t_ResolveNamesSearchScopeType_ContactsActiveDirectory,
} t_ResolveNamesSearchScopeTypeEnum;

@interface t_ResolveNamesSearchScopeType : NSObject
+ (t_ResolveNamesSearchScopeTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ResolveNamesSearchScopeTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ResolveNamesSearchScopeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ResolveNamesSearchScopeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ResolveNamesSearchScopeTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ResolveNamesSearchScopeTypeEnum)value;
@end
@interface t_DeleteItemFieldType : t_ItemChangeDescriptionType
@end
@interface t_ArrayOfFindMessageTrackingSearchResultType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_SyncFolderItemsDeleteType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SyncFolderItemsDeleteType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_ItemIdType * ItemId;
@end
@interface t_NonEmptyArrayOfFolderChangesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_DaysOfWeekType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
@interface t_WorkingPeriod : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_WorkingPeriod *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * DayOfWeek;
@property (nonatomic, strong) NSNumber * StartTimeInMinutes;
@property (nonatomic, strong) NSNumber * EndTimeInMinutes;
@end
@interface t_ItemAttachmentType : t_AttachmentType
/* elements */
@property (nonatomic, strong) t_ItemType * Item;
@property (nonatomic, strong) t_MessageType * Message;
@property (nonatomic, strong) t_CalendarItemType * CalendarItem;
@property (nonatomic, strong) t_ContactItemType * Contact;
@property (nonatomic, strong) t_MeetingMessageType * MeetingMessage;
@property (nonatomic, strong) t_MeetingRequestMessageType * MeetingRequest;
@property (nonatomic, strong) t_MeetingResponseMessageType * MeetingResponse;
@property (nonatomic, strong) t_MeetingCancellationMessageType * MeetingCancellation;
@property (nonatomic, strong) t_TaskType * Task;
@property (nonatomic, strong) t_PostItemType * PostItem;
@end
@interface t_ConstantValueType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ConstantValueType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;


/* attributes */
@property (nonatomic, strong) NSString * Value;
@end
@interface t_RemoveItemType : t_ResponseObjectType
@end
typedef enum t_PhysicalAddressKeyTypeEnum {
	t_PhysicalAddressKeyType_none = 0,
	t_PhysicalAddressKeyType_Business,
	t_PhysicalAddressKeyType_Home,
	t_PhysicalAddressKeyType_Other,
} t_PhysicalAddressKeyTypeEnum;

@interface t_PhysicalAddressKeyType : NSObject
+ (t_PhysicalAddressKeyTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_PhysicalAddressKeyTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_PhysicalAddressKeyTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_PhysicalAddressKeyTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhysicalAddressKeyTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_PhysicalAddressKeyTypeEnum)value;
@end
@interface t_PhysicalAddressDictionaryEntryType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhysicalAddressDictionaryEntryType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * Street;
@property (nonatomic, strong) NSString * City;
@property (nonatomic, strong) NSString * State;
@property (nonatomic, strong) NSString * CountryOrRegion;
@property (nonatomic, strong) NSString * PostalCode;

/* attributes */
@property (nonatomic) t_PhysicalAddressKeyTypeEnum Key;
@end
@interface t_ArrayOfDLExpansionType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ArrayOfDLExpansionType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property(nonatomic, strong) NSArray *Mailbox; // Array of *EmailAddressType

/* attributes */
@property (nonatomic, strong) NSNumber * IndexedPagingOffset;
@property (nonatomic, strong) NSNumber * NumeratorOffset;
@property (nonatomic, strong) NSNumber * AbsoluteDenominator;
@property (nonatomic, strong) NSNumber * IncludesLastItemInRange;
@property (nonatomic, strong) NSNumber * TotalItemsInView;
@end
@interface t_AbsoluteMonthlyRecurrencePatternType : t_IntervalRecurrencePatternBaseType
/* elements */
@property (nonatomic, strong) NSNumber * DayOfMonth;
@end
@interface t_NonEmptyArrayOfFolderNamesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_SyncFolderHierarchyDeleteType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SyncFolderHierarchyDeleteType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_FolderIdType * FolderId;
@end
@interface t_ArrayOfUserIdType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ArrayOfAttachmentsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_WeeklyRecurrencePatternType : t_IntervalRecurrencePatternBaseType
/* elements */
@property (nonatomic, strong) NSString * DaysOfWeek;
@property (nonatomic) t_DayOfWeekTypeEnum FirstDayOfWeek;
@end
@interface t_PeriodType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PeriodType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;


/* attributes */
@property (nonatomic, strong) NSDate * Bias;
@property (nonatomic, strong) NSString * Name;
@property (nonatomic, strong) NSString * Id_;
@end
@interface t_ReplyAllToItemType : t_SmartResponseType
@end
@interface t_ArrayOfBaseItemIdsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
typedef enum t_SharingDataTypeEnum {
	t_SharingDataType_none = 0,
	t_SharingDataType_Calendar,
	t_SharingDataType_Contacts,
} t_SharingDataTypeEnum;

@interface t_SharingDataType : NSObject
+ (t_SharingDataTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_SharingDataTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_SharingDataTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_SharingDataTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_SharingDataTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_SharingDataTypeEnum)value;
@end
@interface t_DistinguishedFolderIdType : t_BaseFolderIdType
/* elements */
@property (nonatomic, strong) t_EmailAddressType * Mailbox;

/* attributes */
@property (nonatomic) t_DistinguishedFolderIdNameTypeEnum Id_;
@property (nonatomic, strong) NSString * ChangeKey;
@end
@interface t_ArrayOfPermissionsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_NonEmptyArrayOfPropertyValuesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ExtendedPropertyType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ExtendedPropertyType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_PathToExtendedFieldType * ExtendedFieldURI;
@property (nonatomic, strong) NSString * Value;
@property (nonatomic, strong) NSArray * Values;
@end
@interface t_InternetHeaderType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_InternetHeaderType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* content */
@property (nonatomic, strong) NSString * _content;


/* attributes */
@property (nonatomic, strong) NSString * HeaderName;
@end
@interface t_ArrayOfSuggestionDayResult : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_UserConfigurationDictionaryEntryType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserConfigurationDictionaryEntryType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_UserConfigurationDictionaryObjectType * DictionaryKey;
@property (nonatomic, strong) t_UserConfigurationDictionaryObjectType * DictionaryValue;
@end
@interface t_MeetingResponseMessageType : t_MeetingMessageType
@end
@interface t_SubscriptionIdType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
@interface t_PhoneNumberDictionaryEntryType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhoneNumberDictionaryEntryType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* content */
@property (nonatomic, strong) NSString * _content;


/* attributes */
@property (nonatomic) t_PhoneNumberKeyTypeEnum Key;
@end
@interface t_TooBigGroupAttendeeConflictData : t_AttendeeConflictData
@end
@interface t_NotificationType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_NotificationType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * SubscriptionId;
@property (nonatomic, strong) NSString * PreviousWatermark;
@property (nonatomic, strong) NSNumber * MoreEvents;
@property(nonatomic, strong) NSArray *CopiedEvent; // Array of *MovedCopiedEventType
@property(nonatomic, strong) NSArray *CreatedEvent; // Array of *BaseObjectChangedEventType
@property(nonatomic, strong) NSArray *DeletedEvent; // Array of *BaseObjectChangedEventType
@property(nonatomic, strong) NSArray *ModifiedEvent; // Array of *ModifiedEventType
@property(nonatomic, strong) NSArray *MovedEvent; // Array of *MovedCopiedEventType
@property(nonatomic, strong) NSArray *NewMailEvent; // Array of *BaseObjectChangedEventType
@property(nonatomic, strong) NSArray *StatusEvent; // Array of *BaseNotificationEventType
@property(nonatomic, strong) NSArray *FreeBusyChangedEvent; // Array of *BaseObjectChangedEventType
@end
@interface t_IsGreaterThanOrEqualToType : t_TwoOperandExpressionType
@end
@interface t_ArrayOfMailboxData : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_AlternatePublicFolderIdType : t_AlternateIdBaseType

/* attributes */
@property (nonatomic, strong) NSString * FolderId;
@end
@interface t_Duration : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_Duration *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSDate * StartTime;
@property (nonatomic, strong) NSDate * EndTime;
@end
typedef enum t_ExternalAudienceEnum {
	t_ExternalAudience_none = 0,
	t_ExternalAudience_All,
	t_ExternalAudience_Known,
	t_ExternalAudience_None,
} t_ExternalAudienceEnum;

@interface t_ExternalAudience : NSObject
+ (t_ExternalAudienceEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ExternalAudienceEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ExternalAudienceEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ExternalAudienceEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ExternalAudienceEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ExternalAudienceEnum)value;
@end
@interface t_UserOofSettings : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserOofSettings *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic) t_OofStateEnum OofState;
@property (nonatomic) t_ExternalAudienceEnum ExternalAudience;
@property (nonatomic, strong) t_Duration * Duration;
@property (nonatomic, strong) t_ReplyBody * InternalReply;
@property (nonatomic, strong) t_ReplyBody * ExternalReply;
@end
@interface t_FreeBusyViewOptionsType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FreeBusyViewOptionsType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_Duration * TimeWindow;
@property (nonatomic, strong) NSNumber * MergedFreeBusyIntervalInMinutes;
@property (nonatomic, strong) NSString * RequestedView;
@end
@interface t_AcceptSharingInvitationType : t_ReferenceItemResponseType
@end
@interface t_TasksFolderType : t_FolderType
@end
@interface t_BasePermissionType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_BasePermissionType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_UserIdType * UserId;
@property (nonatomic, strong) NSNumber * CanCreateItems;
@property (nonatomic, strong) NSNumber * CanCreateSubFolders;
@property (nonatomic, strong) NSNumber * IsFolderOwner;
@property (nonatomic, strong) NSNumber * IsFolderVisible;
@property (nonatomic, strong) NSNumber * IsFolderContact;
@property (nonatomic) t_PermissionActionTypeEnum EditItems;
@property (nonatomic) t_PermissionActionTypeEnum DeleteItems;
@end
@interface t_PermissionType : t_BasePermissionType
/* elements */
@property (nonatomic) t_PermissionReadAccessTypeEnum ReadItems;
@property (nonatomic) t_PermissionLevelTypeEnum PermissionLevel;
@end
@interface t_NonEmptyArrayOfApplyConversationActionType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_TimeZoneType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_TimeZoneType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSDate * BaseOffset;

/* attributes */
@property (nonatomic, strong) NSString * TimeZoneName;
@end
typedef enum t_CompleteActionTypeEnum {
	t_CompleteActionType_none = 0,
	t_CompleteActionType_Abandon,
	t_CompleteActionType_Commit,
} t_CompleteActionTypeEnum;

@interface t_CompleteActionType : NSObject
+ (t_CompleteActionTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_CompleteActionTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_CompleteActionTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_CompleteActionTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CompleteActionTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_CompleteActionTypeEnum)value;
@end
@interface t_NonEmptyArrayOfOccurrenceInfoType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ArrayOfSmtpAddressType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
typedef enum t_ContainmentComparisonTypeEnum {
	t_ContainmentComparisonType_none = 0,
	t_ContainmentComparisonType_Exact,
	t_ContainmentComparisonType_IgnoreCase,
	t_ContainmentComparisonType_IgnoreCaseAndNonSpacingCharacters,
	t_ContainmentComparisonType_IgnoreNonSpacingCharacters,
	t_ContainmentComparisonType_Loose,
	t_ContainmentComparisonType_LooseAndIgnoreCase,
	t_ContainmentComparisonType_LooseAndIgnoreCaseAndIgnoreNonSpace,
	t_ContainmentComparisonType_LooseAndIgnoreNonSpace,
} t_ContainmentComparisonTypeEnum;

@interface t_ContainmentComparisonType : NSObject
+ (t_ContainmentComparisonTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_ContainmentComparisonTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_ContainmentComparisonTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_ContainmentComparisonTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ContainmentComparisonTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_ContainmentComparisonTypeEnum)value;
@end
@interface t_UserConfigurationPropertyType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
@interface t_SyncFolderItemsCreateOrUpdateType : NSObject
+ (id)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(id)value;
@end
@interface t_PhoneCallIdType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PhoneCallIdType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;


/* attributes */
@property (nonatomic, strong) NSString * Id_;
@end
@interface t_ElementRequestServerVersion : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ElementRequestServerVersion *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;


/* attributes */
@property (nonatomic) t_ExchangeVersionTypeEnum Version;
@end
@interface t_FolderIdType : t_BaseFolderIdType

/* attributes */
@property (nonatomic, strong) NSString * Id_;
@property (nonatomic, strong) NSString * ChangeKey;
@end
@interface t_WeeklyRegeneratingPatternType : t_RegeneratingPatternBaseType
@end
typedef enum t_CalendarPermissionLevelTypeEnum {
	t_CalendarPermissionLevelType_none = 0,
	t_CalendarPermissionLevelType_Author,
	t_CalendarPermissionLevelType_Contributor,
	t_CalendarPermissionLevelType_Custom,
	t_CalendarPermissionLevelType_Editor,
	t_CalendarPermissionLevelType_FreeBusyTimeAndSubjectAndLocation,
	t_CalendarPermissionLevelType_FreeBusyTimeOnly,
	t_CalendarPermissionLevelType_None,
	t_CalendarPermissionLevelType_NoneditingAuthor,
	t_CalendarPermissionLevelType_Owner,
	t_CalendarPermissionLevelType_PublishingAuthor,
	t_CalendarPermissionLevelType_PublishingEditor,
	t_CalendarPermissionLevelType_Reviewer,
} t_CalendarPermissionLevelTypeEnum;

@interface t_CalendarPermissionLevelType : NSObject
+ (t_CalendarPermissionLevelTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_CalendarPermissionLevelTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_CalendarPermissionLevelTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_CalendarPermissionLevelTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarPermissionLevelTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_CalendarPermissionLevelTypeEnum)value;
@end
@interface t_CalendarPermissionType : t_BasePermissionType
/* elements */
@property (nonatomic) t_CalendarPermissionReadAccessTypeEnum ReadItems;
@property (nonatomic) t_CalendarPermissionLevelTypeEnum CalendarPermissionLevel;
@end
@interface t_ProtectionRuleType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ProtectionRuleType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) id Condition;
@property (nonatomic, strong) t_ProtectionRuleActionType * Action;

/* attributes */
@property (nonatomic, strong) NSString * Name;
@property (nonatomic, strong) NSNumber * UserOverridable;
@property (nonatomic, strong) NSNumber * Priority;
@end
@interface t_ItemChangeType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ItemChangeType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_ItemIdType * ItemId;
@property (nonatomic, strong) t_OccurrenceItemIdType * OccurrenceItemId;
@property (nonatomic, strong) t_RecurringMasterItemIdType * RecurringMasterItemId;
@property (nonatomic, strong) NSArray * Updates;
@end
@interface t_AttachmentResponseShapeType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_AttachmentResponseShapeType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSNumber * IncludeMimeContent;
@property (nonatomic) t_BodyTypeResponseTypeEnum BodyType;
@property (nonatomic, strong) NSNumber * FilterHtmlContent;
@property (nonatomic, strong) NSArray * AdditionalProperties;
@end
@interface t_AlternatePublicFolderItemIdType : t_AlternatePublicFolderIdType

/* attributes */
@property (nonatomic, strong) NSString * ItemId;
@end
@interface t_UserMailboxType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserMailboxType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;


/* attributes */
@property (nonatomic, strong) NSString * Id_;
@property (nonatomic, strong) NSNumber * IsArchive;
@end
@interface t_IsLessThanType : t_TwoOperandExpressionType
@end
@interface t_RestrictionType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_RestrictionType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_SearchExpressionType * SearchExpression;
@property (nonatomic, strong) t_ExistsType * Exists;
@property (nonatomic, strong) t_ExcludesType * Excludes;
@property (nonatomic, strong) t_IsEqualToType * IsEqualTo;
@property (nonatomic, strong) t_IsNotEqualToType * IsNotEqualTo;
@property (nonatomic, strong) t_IsGreaterThanType * IsGreaterThan;
@property (nonatomic, strong) t_IsGreaterThanOrEqualToType * IsGreaterThanOrEqualTo;
@property (nonatomic, strong) t_IsLessThanType * IsLessThan;
@property (nonatomic, strong) t_IsLessThanOrEqualToType * IsLessThanOrEqualTo;
@property (nonatomic, strong) t_ContainsExpressionType * Contains;
@property (nonatomic, strong) t_NotType * Not;
@property (nonatomic, strong) t_AndType * And;
@property (nonatomic, strong) t_OrType * Or;
@end
@interface t_AbsoluteDateTransitionType : t_TransitionType
/* elements */
@property (nonatomic, strong) NSDate * DateTime;
@end
@interface t_PostItemType : t_ItemType
/* elements */
@property (nonatomic, strong) NSData * ConversationIndex;
@property (nonatomic, strong) NSString * ConversationTopic;
@property (nonatomic, strong) id From;
@property (nonatomic, strong) NSString * InternetMessageId;
@property (nonatomic, strong) NSNumber * IsRead;
@property (nonatomic, strong) NSDate * PostedTime;
@property (nonatomic, strong) NSString * References;
@property (nonatomic, strong) id Sender;
@end
@interface t_FieldOrderType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_FieldOrderType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_BasePathToElementType * Path;
@property (nonatomic, strong) t_PathToUnindexedFieldType * FieldURI;
@property (nonatomic, strong) t_PathToIndexedFieldType * IndexedFieldURI;
@property (nonatomic, strong) t_PathToExtendedFieldType * ExtendedFieldURI;

/* attributes */
@property (nonatomic) t_SortDirectionTypeEnum Order;
@end
@interface t_UserConfigurationNameType : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_UserConfigurationNameType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;


/* attributes */
@property (nonatomic, strong) NSString * Name;
@end
@interface t_UnifiedMessageServiceConfiguration : t_ServiceConfiguration
/* elements */
@property (nonatomic, strong) NSNumber * UmEnabled;
@property (nonatomic, strong) NSString * PlayOnPhoneDialString;
@property (nonatomic, strong) NSNumber * PlayOnPhoneEnabled;
@end
@interface t_FolderClassType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
@interface t_YearlyRegeneratingPatternType : t_RegeneratingPatternBaseType
@end
@interface t_GroupedItemsType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_GroupedItemsType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSString * GroupIndex;
@property (nonatomic, strong) NSArray * Items;
@end
@interface t_PostReplyItemType : t_PostReplyItemBaseType
/* elements */
@property (nonatomic, strong) t_BodyType * NewBodyContent;
@end
typedef enum t_CalendarItemTypeTypeEnum {
	t_CalendarItemTypeType_none = 0,
	t_CalendarItemTypeType_Exception,
	t_CalendarItemTypeType_Occurrence,
	t_CalendarItemTypeType_RecurringMaster,
	t_CalendarItemTypeType_Single,
} t_CalendarItemTypeTypeEnum;

@interface t_CalendarItemTypeType : NSObject
+ (t_CalendarItemTypeTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_CalendarItemTypeTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_CalendarItemTypeTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_CalendarItemTypeTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_CalendarItemTypeTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_CalendarItemTypeTypeEnum)value;
@end
@interface t_NonEmptyArrayOfDeletedOccurrencesType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_CalendarItemType : t_ItemType
/* elements */
@property (nonatomic, strong) NSString * UID;
@property (nonatomic, strong) NSDate * RecurrenceId;
@property (nonatomic, strong) NSDate * DateTimeStamp;
@property (nonatomic, strong) NSDate * Start;
@property (nonatomic, strong) NSDate * End;
@property (nonatomic, strong) NSDate * OriginalStart;
@property (nonatomic, strong) NSNumber * IsAllDayEvent;
@property (nonatomic) t_LegacyFreeBusyTypeEnum LegacyFreeBusyStatus;
@property (nonatomic, strong) NSString * Location;
@property (nonatomic, strong) NSString * When;
@property (nonatomic, strong) NSNumber * IsMeeting;
@property (nonatomic, strong) NSNumber * IsCancelled;
@property (nonatomic, strong) NSNumber * IsRecurring;
@property (nonatomic, strong) NSNumber * MeetingRequestWasSent;
@property (nonatomic, strong) NSNumber * IsResponseRequested;
@property (nonatomic) t_CalendarItemTypeTypeEnum CalendarItemType;
@property (nonatomic) t_ResponseTypeTypeEnum MyResponseType;
@property (nonatomic, strong) id Organizer;
@property (nonatomic, strong) NSArray * RequiredAttendees;
@property (nonatomic, strong) NSArray * OptionalAttendees;
@property (nonatomic, strong) NSArray * Resources;
@property (nonatomic, strong) NSNumber * ConflictingMeetingCount;
@property (nonatomic, strong) NSNumber * AdjacentMeetingCount;
@property (nonatomic, strong) NSArray * ConflictingMeetings;
@property (nonatomic, strong) NSArray * AdjacentMeetings;
@property (nonatomic, strong) NSString * Duration;
@property (nonatomic, strong) NSString * TimeZone;
@property (nonatomic, strong) NSDate * AppointmentReplyTime;
@property (nonatomic, strong) NSNumber * AppointmentSequenceNumber;
@property (nonatomic, strong) NSNumber * AppointmentState;
@property (nonatomic, strong) t_RecurrenceType * Recurrence;
@property (nonatomic, strong) t_OccurrenceInfoType * FirstOccurrence;
@property (nonatomic, strong) t_OccurrenceInfoType * LastOccurrence;
@property (nonatomic, strong) NSArray * ModifiedOccurrences;
@property (nonatomic, strong) NSArray * DeletedOccurrences;
@property (nonatomic, strong) t_TimeZoneType * MeetingTimeZone;
@property (nonatomic, strong) t_TimeZoneDefinitionType * StartTimeZone;
@property (nonatomic, strong) t_TimeZoneDefinitionType * EndTimeZone;
@property (nonatomic, strong) NSNumber * ConferenceType;
@property (nonatomic, strong) NSNumber * AllowNewTimeProposal;
@property (nonatomic, strong) NSNumber * IsOnlineMeeting;
@property (nonatomic, strong) NSString * MeetingWorkspaceUrl;
@property (nonatomic, strong) NSString * NetShowUrl;
@end
@interface t_TaskType : t_ItemType
/* elements */
@property (nonatomic, strong) NSNumber * ActualWork;
@property (nonatomic, strong) NSDate * AssignedTime;
@property (nonatomic, strong) NSString * BillingInformation;
@property (nonatomic, strong) NSNumber * ChangeCount;
@property (nonatomic, strong) NSArray * Companies;
@property (nonatomic, strong) NSDate * CompleteDate;
@property (nonatomic, strong) NSArray * Contacts;
@property (nonatomic) t_TaskDelegateStateTypeEnum DelegationState;
@property (nonatomic, strong) NSString * Delegator;
@property (nonatomic, strong) NSDate * DueDate;
@property (nonatomic, strong) NSNumber * IsAssignmentEditable;
@property (nonatomic, strong) NSNumber * IsComplete;
@property (nonatomic, strong) NSNumber * IsRecurring;
@property (nonatomic, strong) NSNumber * IsTeamTask;
@property (nonatomic, strong) NSString * Mileage;
@property (nonatomic, strong) NSString * Owner;
@property (nonatomic, strong) NSNumber * PercentComplete;
@property (nonatomic, strong) t_TaskRecurrenceType * Recurrence;
@property (nonatomic, strong) NSDate * StartDate;
@property (nonatomic) t_TaskStatusTypeEnum Status;
@property (nonatomic, strong) NSString * StatusDescription;
@property (nonatomic, strong) NSNumber * TotalWork;
@end
typedef enum t_StandardGroupByTypeEnum {
	t_StandardGroupByType_none = 0,
	t_StandardGroupByType_ConversationTopic,
} t_StandardGroupByTypeEnum;

@interface t_StandardGroupByType : NSObject
+ (t_StandardGroupByTypeEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(t_StandardGroupByTypeEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (t_StandardGroupByTypeEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (t_StandardGroupByTypeEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_StandardGroupByTypeEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(t_StandardGroupByTypeEnum)value;
@end
@interface t_DistinguishedGroupByType : t_BaseGroupByType
/* elements */
@property (nonatomic) t_StandardGroupByTypeEnum StandardGroupBy;
@end
@interface t_ArrayOfRoomsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_AppendToFolderFieldType : t_FolderChangeDescriptionType
/* elements */
@property (nonatomic, strong) t_FolderType * Folder;
@property (nonatomic, strong) t_CalendarFolderType * CalendarFolder;
@property (nonatomic, strong) t_ContactsFolderType * ContactsFolder;
@property (nonatomic, strong) t_SearchFolderType * SearchFolder;
@property (nonatomic, strong) t_TasksFolderType * TasksFolder;
@end
@interface t_StreamingSubscriptionRequestType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_StreamingSubscriptionRequestType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSArray * FolderIds;
@property (nonatomic, strong) NSArray * EventTypes;

/* attributes */
@property (nonatomic, strong) NSNumber * SubscribeToAllFolders;
@end
@interface t_CreateRuleOperationType : t_RuleOperationType
/* elements */
@property (nonatomic, strong) t_RuleType * Rule;
@end
@interface t_ProtectionRuleValueType : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
@interface t_SetRuleOperationType : t_RuleOperationType
/* elements */
@property (nonatomic, strong) t_RuleType * Rule;
@end
@interface t_ContainsExpressionType : t_SearchExpressionType
/* elements */
@property (nonatomic, strong) t_BasePathToElementType * Path;
@property (nonatomic, strong) t_PathToUnindexedFieldType * FieldURI;
@property (nonatomic, strong) t_PathToIndexedFieldType * IndexedFieldURI;
@property (nonatomic, strong) t_PathToExtendedFieldType * ExtendedFieldURI;
@property (nonatomic, strong) t_ConstantValueType * Constant;

/* attributes */
@property (nonatomic) t_ContainmentModeTypeEnum ContainmentMode;
@property (nonatomic) t_ContainmentComparisonTypeEnum ContainmentComparison;
@end
@interface t_ItemIdType : t_BaseItemIdType

/* attributes */
@property (nonatomic, strong) NSString * Id_;
@property (nonatomic, strong) NSString * ChangeKey;
@end
@interface t_ElementServerVersionInfo : NSObject
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_ElementServerVersionInfo *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;


/* attributes */
@property (nonatomic, strong) NSNumber * MajorVersion;
@property (nonatomic, strong) NSNumber * MinorVersion;
@property (nonatomic, strong) NSNumber * MajorBuildNumber;
@property (nonatomic, strong) NSNumber * MinorBuildNumber;
@property (nonatomic, strong) NSString * Version;
@end
@interface t_MailTips : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_MailTips *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) t_EmailAddressType * RecipientAddress;
@property (nonatomic, strong) NSString * PendingMailTips;
@property (nonatomic, strong) t_OutOfOfficeMailTip * OutOfOffice;
@property (nonatomic, strong) NSNumber * MailboxFull;
@property (nonatomic, strong) NSString * CustomMailTip;
@property (nonatomic, strong) NSNumber * TotalMemberCount;
@property (nonatomic, strong) NSNumber * ExternalMemberCount;
@property (nonatomic, strong) NSNumber * MaxMessageSize;
@property (nonatomic, strong) NSNumber * DeliveryRestricted;
@property (nonatomic, strong) NSNumber * IsModerated;
@property (nonatomic, strong) NSNumber * InvalidRecipient;
@end
@interface t_ArrayOfSearchItemKindsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
@interface t_ForwardItemType : t_SmartResponseType
@end
@interface t_PermissionSetType : NSObject
- (void)addElementsToNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(t_PermissionSetType *)value;
+ (instancetype)deserializeNode:(xmlNodePtr)cur;

/* elements */
@property (nonatomic, strong) NSArray * Permissions;
@property (nonatomic, strong) NSArray * UnknownEntries;
@end
@interface t_MeetingRequestMessageType : t_MeetingMessageType
/* elements */
@property (nonatomic) t_MeetingRequestTypeTypeEnum MeetingRequestType;
@property (nonatomic) t_LegacyFreeBusyTypeEnum IntendedFreeBusyStatus;
@property (nonatomic, strong) NSDate * Start;
@property (nonatomic, strong) NSDate * End;
@property (nonatomic, strong) NSDate * OriginalStart;
@property (nonatomic, strong) NSNumber * IsAllDayEvent;
@property (nonatomic) t_LegacyFreeBusyTypeEnum LegacyFreeBusyStatus;
@property (nonatomic, strong) NSString * Location;
@property (nonatomic, strong) NSString * When;
@property (nonatomic, strong) NSNumber * IsMeeting;
@property (nonatomic, strong) NSNumber * IsCancelled;
@property (nonatomic, strong) NSNumber * IsRecurring;
@property (nonatomic, strong) NSNumber * MeetingRequestWasSent;
@property (nonatomic) t_CalendarItemTypeTypeEnum CalendarItemType;
@property (nonatomic) t_ResponseTypeTypeEnum MyResponseType;
@property (nonatomic, strong) id Organizer;
@property (nonatomic, strong) NSArray * RequiredAttendees;
@property (nonatomic, strong) NSArray * OptionalAttendees;
@property (nonatomic, strong) NSArray * Resources;
@property (nonatomic, strong) NSNumber * ConflictingMeetingCount;
@property (nonatomic, strong) NSNumber * AdjacentMeetingCount;
@property (nonatomic, strong) NSArray * ConflictingMeetings;
@property (nonatomic, strong) NSArray * AdjacentMeetings;
@property (nonatomic, strong) NSString * Duration;
@property (nonatomic, strong) NSString * TimeZone;
@property (nonatomic, strong) NSDate * AppointmentReplyTime;
@property (nonatomic, strong) NSNumber * AppointmentSequenceNumber;
@property (nonatomic, strong) NSNumber * AppointmentState;
@property (nonatomic, strong) t_RecurrenceType * Recurrence;
@property (nonatomic, strong) t_OccurrenceInfoType * FirstOccurrence;
@property (nonatomic, strong) t_OccurrenceInfoType * LastOccurrence;
@property (nonatomic, strong) NSArray * ModifiedOccurrences;
@property (nonatomic, strong) NSArray * DeletedOccurrences;
@property (nonatomic, strong) t_TimeZoneType * MeetingTimeZone;
@property (nonatomic, strong) t_TimeZoneDefinitionType * StartTimeZone;
@property (nonatomic, strong) t_TimeZoneDefinitionType * EndTimeZone;
@property (nonatomic, strong) NSNumber * ConferenceType;
@property (nonatomic, strong) NSNumber * AllowNewTimeProposal;
@property (nonatomic, strong) NSNumber * IsOnlineMeeting;
@property (nonatomic, strong) NSString * MeetingWorkspaceUrl;
@property (nonatomic, strong) NSString * NetShowUrl;
@end
@interface t_NumberedRecurrenceRangeType : t_RecurrenceRangeBaseType
/* elements */
@property (nonatomic, strong) NSNumber * NumberOfOccurrences;
@end
@interface t_ExistsType : t_SearchExpressionType
/* elements */
@property (nonatomic, strong) t_BasePathToElementType * Path;
@property (nonatomic, strong) t_PathToUnindexedFieldType * FieldURI;
@property (nonatomic, strong) t_PathToIndexedFieldType * IndexedFieldURI;
@property (nonatomic, strong) t_PathToExtendedFieldType * ExtendedFieldURI;
@end
@interface t_MeetingCancellationMessageType : t_MeetingMessageType
@end
@interface t_SetItemFieldType : t_ItemChangeDescriptionType
/* elements */
@property (nonatomic, strong) t_ItemType * Item;
@property (nonatomic, strong) t_MessageType * Message;
@property (nonatomic, strong) t_CalendarItemType * CalendarItem;
@property (nonatomic, strong) t_ContactItemType * Contact;
@property (nonatomic, strong) t_DistributionListType * DistributionList;
@property (nonatomic, strong) t_MeetingMessageType * MeetingMessage;
@property (nonatomic, strong) t_MeetingRequestMessageType * MeetingRequest;
@property (nonatomic, strong) t_MeetingResponseMessageType * MeetingResponse;
@property (nonatomic, strong) t_MeetingCancellationMessageType * MeetingCancellation;
@property (nonatomic, strong) t_TaskType * Task;
@property (nonatomic, strong) t_PostItemType * PostItem;
@end
@interface t_ArrayOfInvalidRecipientsType : NSObject
+ (NSArray *)deserializeNode:(xmlNodePtr)cur;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSArray *)value;
@end
