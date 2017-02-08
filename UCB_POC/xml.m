#import "xml.h"

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
@implementation xml_Attributelang
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
static NSString *xml_Attributespace_enumValues[] = {
    @"",
    @"default",
    @"preserve",
};

@implementation xml_Attributespace
+ (xml_AttributespaceEnum) valueFromString:(NSString *)string {
    for (size_t i = 0; i <= sizeof(xml_Attributespace_enumValues) / sizeof(xml_Attributespace_enumValues[0]); ++i) {
        if ([string isEqualToString:xml_Attributespace_enumValues[i]])
            return (xml_AttributespaceEnum)i;
    }

    return xml_Attributespace_none;
}

+ (NSString *)stringFromValue:(xml_AttributespaceEnum)value {
    return xml_Attributespace_enumValues[(int)value];
}

+ (xml_AttributespaceEnum)deserializeAttribute:(const char *)attrName ofNode:(xmlNodePtr)node {
    NSString *attrString = [NSString stringWithXmlString:xmlGetProp(node, (const xmlChar *)attrName) free:YES];
    return attrString ? [self valueFromString:attrString] : xml_Attributespace_none;
}

+ (xml_AttributespaceEnum)deserializeNodeRaw:(xmlNodePtr)node {
    return [self valueFromString:[NSString stringWithXmlString:xmlNodeListGetString(node->doc, node->children, 1) free:YES]];
}

+ (NSNumber *)deserializeNode:(xmlNodePtr)node {
    return @([self deserializeNodeRaw:node]);
}

+ (void)serializeToChildOf:(xmlNodePtr)node withName:(const char *)childName value:(xml_AttributespaceEnum)value {
    xmlNewChild(node, NULL, (const xmlChar *)childName, [[self stringFromValue:value] xmlString]);
}

+ (void)serializeToProperty:(const char *)property onNode:(xmlNodePtr)node
                      value:(xml_AttributespaceEnum)value
{
    if (value)
        xmlSetProp(node, (const xmlChar *)property, [[self stringFromValue:value] xmlString]);
}
@end
