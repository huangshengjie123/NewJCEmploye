//
//  JCModel_InAndOutStoreHouseInfo.h
//
//  Created by   on 2019/2/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_InAndOutStoreHouseInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double storeHouseInfoIdentifier;
@property (nonatomic, assign) id org;
@property (nonatomic, assign) id userExtInfoStaffVOList;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) id storeHouseInfoDescription;
@property (nonatomic, assign) id type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
