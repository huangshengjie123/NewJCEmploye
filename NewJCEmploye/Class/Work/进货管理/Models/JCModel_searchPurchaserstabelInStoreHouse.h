//
//  JCModel_searchPurchaserstabelInStoreHouse.h
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_searchPurchaserstabelInStoreHouse : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double inStoreHouseIdentifier;
@property (nonatomic, assign) id org;
@property (nonatomic, assign) id userExtInfoStaffVOList;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) id inStoreHouseDescription;
@property (nonatomic, assign) id type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
