//
//  JCModel_StoreHouseInfoData.h
//
//  Created by   on 2018/5/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_StoreHouseInfoData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double   dataIdentifier;
@property (nonatomic, strong) NSString *org;
@property (nonatomic, strong) NSArray  *userExtInfoStaffVOList;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, assign) double   type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
