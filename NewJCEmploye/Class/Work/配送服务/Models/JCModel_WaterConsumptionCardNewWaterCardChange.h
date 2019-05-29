//
//  JCModel_WaterConsumptionCardNewWaterCardChange.h
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_WaterConsumptionCardNewWaterCardChange : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *staffCardId;
@property (nonatomic, assign) double num;
@property (nonatomic, strong) NSString *cusCardId;
@property (nonatomic, assign) double item;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
