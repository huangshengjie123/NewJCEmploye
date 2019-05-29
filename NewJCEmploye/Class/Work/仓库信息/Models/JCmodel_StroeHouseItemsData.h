//
//  JCmodel_StroeHouseItemsData.h
//
//  Created by   on 2018/5/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCmodel_StroeHouseItemsPageProperties;

@interface JCmodel_StroeHouseItemsData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCmodel_StroeHouseItemsPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
