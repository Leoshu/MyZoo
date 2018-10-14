//
//  QTTopLevel.m
//  MyZoo
//
//  Created by Leo_hsu on 2018/10/14.
//  Copyright © 2018年 Leo. All rights reserved.
//

// QTTopLevel.m

#import "QTTopLevel.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
#define NSNullify(x) ([x isNotEqualTo:[NSNull null]] ? x : [NSNull null])

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Private model interfaces

@interface QTTopLevel (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTTopLevelResult (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTResultResult (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

static id map(id collection, id (^f)(id value)) {
    id result = nil;
    if ([collection isKindOfClass:[NSArray class]]) {
        result = [NSMutableArray arrayWithCapacity:[collection count]];
        for (id x in collection) [result addObject:f(x)];
    } else if ([collection isKindOfClass:[NSDictionary class]]) {
        result = [NSMutableDictionary dictionaryWithCapacity:[collection count]];
        for (id key in collection) [result setObject:f([collection objectForKey:key]) forKey:key];
    }
    return result;
}

#pragma mark - JSON serialization

QTTopLevel *_Nullable QTTopLevelFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [QTTopLevel fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

QTTopLevel *_Nullable QTTopLevelFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return QTTopLevelFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable QTTopLevelToData(QTTopLevel *topLevel, NSError **error)
{
    @try {
        id json = [topLevel JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable QTTopLevelToJSON(QTTopLevel *topLevel, NSStringEncoding encoding, NSError **error)
{
    NSData *data = QTTopLevelToData(topLevel, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation QTTopLevel
+(NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"result": @"result",
    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return QTTopLevelFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTTopLevelFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTTopLevel alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _result = [QTTopLevelResult fromJSONDictionary:(id)_result];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTTopLevel.properties.allValues] mutableCopy];

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
        @"result": [_result JSONDictionary],
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return QTTopLevelToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTTopLevelToJSON(self, encoding, error);
}
@end

@implementation QTTopLevelResult
+(NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"limit": @"limit",
        @"offset": @"offset",
        @"count": @"count",
        @"sort": @"sort",
        @"results": @"results",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTTopLevelResult alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _results = map(_results, λ(id x, [QTResultResult fromJSONDictionary:x]));
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTTopLevelResult.properties.allValues] mutableCopy];

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
        @"results": map(_results, λ(id x, [x JSONDictionary])),
    }];

    return dict;
}
@end

@implementation QTResultResult
+(NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"A_Behavior": @"aBehavior",
        @"A_Distribution": @"aDistribution",
        @"A_Voice03_URL": @"aVoice03URL",
        @"A_POIGroup": @"aPOIGroup",
        @"A_Code": @"aCode",
        @"A_Pic04_ALT": @"aPic04ALT",
        @"A_Voice03_ALT": @"aVoice03ALT",
        @"A_Theme_URL": @"aThemeURL",
        @"A_Summary": @"aSummary",
        @"A_Update": @"aUpdate",
        @"A_Pic02_URL": @"aPic02URL",
        @"A_pdf01_ALT": @"aPdf01ALT",
        @"A_Keywords": @"aKeywords",
        @"A_Theme_Name": @"aThemeName",
        @"A_pdf02_ALT": @"aPdf02ALT",
        @"A_Family": @"aFamily",
        @"A_Adopt": @"aAdopt",
        @"A_Voice01_ALT": @"aVoice01ALT",
        @"A_Pic02_ALT": @"aPic02ALT",
        @"A_Vedio_URL": @"aVedioURL",
        @"A_Pic04_URL": @"aPic04URL",
        @"A_Order": @"aOrder",
        @"A_pdf01_URL": @"aPdf01URL",
        @"A_Voice02_ALT": @"aVoice02ALT",
        @"A_Diet": @"aDiet",
        @"A_Name_Latin": @"aNameLatin",
        @"A_Feature": @"aFeature",
        @"A_Habitat": @"aHabitat",
        @"A_Phylum": @"aPhylum",
        @"A_Class": @"aClass",
        @"A_Pic03_ALT": @"aPic03ALT",
        @"A_AlsoKnown": @"aAlsoKnown",
        @"A_Voice02_URL": @"aVoice02URL",
        @"A_Name_En": @"aNameEn",
        @"A_Name_Ch": @"aNameCh",
        @"A_Pic03_URL": @"aPic03URL",
        @"A_Location": @"aLocation",
        @"A_Voice01_URL": @"aVoice01URL",
        @"A_pdf02_URL": @"aPdf02URL",
        @"A_CID": @"aCid",
        @"A_Interpretation": @"aInterpretation",
        @"A_Pic01_URL": @"aPic01URL",
        @"A_Conservation": @"aConservation",
        @"A_Pic01_ALT": @"aPic01ALT",
        @"_id": @"id",
        @"A_Geo": @"aGeo",
        @"A_Crisis": @"aCrisis",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTResultResult alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

-(void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTResultResult.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTResultResult.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in QTResultResult.properties) {
        id propertyName = QTResultResult.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    return dict;
}
@end

NS_ASSUME_NONNULL_END

