#import <Foundation/Foundation.h>
#import <libxml/tree.h>
#import <objc/runtime.h>

#import "USAdditions.h"
#import "USGlobals.h"

@class xml_Attributelang;
@class xml_Attributespace;

@interface xml_Attributelang : NSObject
+ (NSString *)deserializeNode:(xmlNodePtr)node;
+ (NSString *)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(NSString *)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(NSString *)value;
@end
typedef enum xml_AttributespaceEnum {
	xml_Attributespace_none = 0,
	xml_Attributespace_default,
	xml_Attributespace_preserve,
} xml_AttributespaceEnum;

@interface xml_Attributespace : NSObject
+ (xml_AttributespaceEnum)valueFromString:(NSString *)string;
+ (NSString *)stringFromValue:(xml_AttributespaceEnum)value;

+ (NSNumber *)deserializeNode:(xmlNodePtr)node;
+ (xml_AttributespaceEnum)deserializeNodeRaw:(xmlNodePtr)node;
+ (xml_AttributespaceEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node;
+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(xml_AttributespaceEnum)value;
+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(xml_AttributespaceEnum)value;
@end
