//
//  JCModel_WaterCardData.h
//
//  Created by   on 2018/6/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_WaterCardData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double owner;
@property (nonatomic, assign) id uowner;
@property (nonatomic, strong) NSArray *waterCardItems;
@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, assign) double level;
@property (nonatomic, strong) NSString *creater;
@property (nonatomic, strong) NSArray *waterCardRecords;
@property (nonatomic, assign) double type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
