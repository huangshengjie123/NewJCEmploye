//
//  JCModel_SimpleOutboundBase.h
//
//  Created by   on 2018/7/7
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_SimpleOutboundBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double storeHouseId;
@property (nonatomic, assign) double distributor;
@property (nonatomic, strong) NSArray *itemXNums;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
