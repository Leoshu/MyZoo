//
//  QTTopLevel.h
//  MyZoo
//
//  Created by Leo_hsu on 2018/10/14.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QTTopLevel;
@class QTTopLevelResult;
@class QTResultResult;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface QTTopLevel : NSObject
@property (nonatomic, strong) QTTopLevelResult *result;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface QTTopLevelResult : NSObject
@property (nonatomic, assign) NSInteger limit;
@property (nonatomic, assign) NSInteger offset;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, copy) NSArray<QTResultResult *> *results;
@end

@interface QTResultResult : NSObject
@property (nonatomic, copy, nullable) NSString *aBehavior;
@property (nonatomic, copy) NSString *aDistribution;
@property (nonatomic, copy) NSString *aVoice03URL;
@property (nonatomic, copy) NSString *aPOIGroup;
@property (nonatomic, copy) NSString *aCode;
@property (nonatomic, copy) NSString *aPic04ALT;
@property (nonatomic, copy) NSString *aVoice03ALT;
@property (nonatomic, copy) NSString *aThemeURL;
@property (nonatomic, copy) NSString *aSummary;
@property (nonatomic, copy) NSString *aUpdate;
@property (nonatomic, copy) NSString *aPic02URL;
@property (nonatomic, copy) NSString *aPdf01ALT;
@property (nonatomic, copy) NSString *aKeywords;
@property (nonatomic, copy) NSString *aThemeName;
@property (nonatomic, copy) NSString *aPdf02ALT;
@property (nonatomic, copy) NSString *aFamily;
@property (nonatomic, copy) NSString *aAdopt;
@property (nonatomic, copy) NSString *aVoice01ALT;
@property (nonatomic, copy) NSString *aPic02ALT;
@property (nonatomic, copy) NSString *aVedioURL;
@property (nonatomic, copy) NSString *aPic04URL;
@property (nonatomic, copy) NSString *aOrder;
@property (nonatomic, copy) NSString *aPdf01URL;
@property (nonatomic, copy) NSString *aVoice02ALT;
@property (nonatomic, copy) NSString *aDiet;
@property (nonatomic, copy) NSString *aNameLatin;
@property (nonatomic, copy) NSString *aFeature;
@property (nonatomic, copy) NSString *aHabitat;
@property (nonatomic, copy) NSString *aPhylum;
@property (nonatomic, copy) NSString *aClass;
@property (nonatomic, copy) NSString *aPic03ALT;
@property (nonatomic, copy) NSString *aAlsoKnown;
@property (nonatomic, copy) NSString *aVoice02URL;
@property (nonatomic, copy) NSString *aNameEn;
@property (nonatomic, copy) NSString *aNameCh;
@property (nonatomic, copy) NSString *aPic03URL;
@property (nonatomic, copy) NSString *aLocation;
@property (nonatomic, copy) NSString *aVoice01URL;
@property (nonatomic, copy) NSString *aPdf02URL;
@property (nonatomic, copy) NSString *aCid;
@property (nonatomic, copy) NSString *aInterpretation;
@property (nonatomic, copy) NSString *aPic01URL;
@property (nonatomic, copy) NSString *aConservation;
@property (nonatomic, copy) NSString *aPic01ALT;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy) NSString *aGeo;
@property (nonatomic, copy) NSString *aCrisis;
@end

NS_ASSUME_NONNULL_END

