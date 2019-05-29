//
//  JCModel_AddressSelectedData.h
//
//  Created by   on 2018/6/6
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_AddressSelectedData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id dataDescription;
@property (nonatomic, strong) NSString *areaName;
@property (nonatomic, assign) double level;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *parentId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
