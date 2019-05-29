//
//  JCModel_searchPurchaserstabelData.h
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_searchPurchaserstabelPageProperties;

@interface JCModel_searchPurchaserstabelData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_searchPurchaserstabelPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
