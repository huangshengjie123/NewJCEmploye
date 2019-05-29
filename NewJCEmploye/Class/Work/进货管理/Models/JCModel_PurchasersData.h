//
//  JCModel_PurchasersData.h
//
//  Created by   on 2018/8/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_PurchasersPageProperties;

@interface JCModel_PurchasersData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_PurchasersPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
