//
//  JCModel_getStoreHouseFacList.h
//
//  Created by   on 2018/9/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_getStoreHouseFacList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, strong) NSString *org;
@property (nonatomic, strong) NSArray *userExtInfoStaffVOList;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *listDescription;
@property (nonatomic, assign) double type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
