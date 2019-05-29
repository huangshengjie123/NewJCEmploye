//
//  JCModel_MyWarehouseData.h
//
//  Created by   on 2018/5/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_MyWarehouseData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, strong) NSString *org;
@property (nonatomic, assign) id userExtInfoStaffVOList;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, assign) double type;
@property (nonatomic, copy)   NSString  *price;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
