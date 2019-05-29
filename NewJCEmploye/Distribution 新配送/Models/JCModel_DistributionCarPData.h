//
//  JCModel_DistributionCarPData.h
//
//  Created by   on 2018/10/19
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_DistributionCarPData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double owner;
@property (nonatomic, strong) NSString *org;
@property (nonatomic, strong) NSString *parent;
@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *groupRelations;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
