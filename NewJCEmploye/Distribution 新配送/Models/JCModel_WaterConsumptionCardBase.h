//
//  JCModel_WaterConsumptionCardBase.h
//
//  Created by   on 2018/12/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_WaterConsumptionCardDistribution;

@interface JCModel_WaterConsumptionCardBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_WaterConsumptionCardDistribution *distribution;
@property (nonatomic, strong) NSArray *waterCardChangeList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
