//
//  JCModel_CooperationPoiontOrderData.h
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_CooperationPoiontOrderPageProperties;

@interface JCModel_CooperationPoiontOrderData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_CooperationPoiontOrderPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
