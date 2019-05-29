//
//  JCModel_WaterConsumptionCardNewDistribution.h
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_WaterConsumptionCardNewDistribution : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double cusId;
@property (nonatomic, strong) NSArray *items;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
