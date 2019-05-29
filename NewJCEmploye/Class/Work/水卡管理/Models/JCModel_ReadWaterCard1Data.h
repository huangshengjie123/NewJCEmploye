//
//  JCModel_ReadWaterCard1Data.h
//
//  Created by   on 2018/10/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_ReadWaterCard1Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id leader;
@property (nonatomic, strong) NSString *parentId;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, strong) NSString *orgId;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) id xpath;
@property (nonatomic, assign) id distPhone;
@property (nonatomic, assign) double orgLevel;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
