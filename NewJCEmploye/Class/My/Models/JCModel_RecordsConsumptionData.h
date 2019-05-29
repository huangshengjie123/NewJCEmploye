//
//  JCModel_RecordsConsumptionData.h
//
//  Created by   on 2018/10/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_RecordsConsumptionPageProperties;

@interface JCModel_RecordsConsumptionData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_RecordsConsumptionPageProperties *pageProperties;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
