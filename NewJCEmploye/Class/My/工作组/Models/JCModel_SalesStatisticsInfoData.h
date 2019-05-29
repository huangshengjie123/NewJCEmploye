//
//  JCModel_SalesStatisticsInfoData.h
//
//  Created by   on 2018/11/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_SalesStatisticsInfoData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double getPercent;
@property (nonatomic, assign) double getAmountSum;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSString *cycleUnit;
@property (nonatomic, assign) double total;
@property (nonatomic, assign) double amountSum;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
