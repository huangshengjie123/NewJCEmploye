//
//  JCModel_getStoreHouseComStoreHouseStaffList.h
//
//  Created by   on 2018/8/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_getStoreHouseComStoreHouseStaffList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double storeHouseStaffListIdentifier;
@property (nonatomic, assign) double number;
@property (nonatomic, assign) double staff;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
