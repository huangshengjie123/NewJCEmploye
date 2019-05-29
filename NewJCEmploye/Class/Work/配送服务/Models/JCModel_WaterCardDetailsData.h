//
//  JCModel_WaterCardDetailsData.h
//
//  Created by   on 2018/7/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_WaterCardDetailsData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, assign) id phone;
@property (nonatomic, strong) NSString *mbPhone;
@property (nonatomic, strong) NSString *creater;
@property (nonatomic, assign) double owner;
@property (nonatomic, strong) NSString *staffMbPhone;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) id uowner;
@property (nonatomic, assign) double level;
@property (nonatomic, assign) id waterCardRecords;
@property (nonatomic, strong) NSArray *waterCardItems;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *staffName;
@property (nonatomic, strong) NSArray *customerAddresses;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
