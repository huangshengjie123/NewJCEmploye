//
//  JCModel_WaterConsumptionCardDistribution.h
//
//  Created by   on 2018/12/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_WaterConsumptionCardDistribution : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double cusId;
@property (nonatomic, assign) double addrId;
@property (nonatomic, strong) NSArray *items;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
