//
//  JCModel_getStoreHouseComData.h
//
//  Created by   on 2018/8/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_getStoreHouseComData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, strong) NSString *org;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *storeHouseStaffList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
