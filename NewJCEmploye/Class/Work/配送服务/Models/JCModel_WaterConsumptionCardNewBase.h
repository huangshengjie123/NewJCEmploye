//
//  JCModel_WaterConsumptionCardNewBase.h
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_WaterConsumptionCardNewDistribution, JCModel_WaterConsumptionCardNewWaterCardChange;

@interface JCModel_WaterConsumptionCardNewBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_WaterConsumptionCardNewDistribution *distribution;
@property (nonatomic, strong) JCModel_WaterConsumptionCardNewWaterCardChange *waterCardChange;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
