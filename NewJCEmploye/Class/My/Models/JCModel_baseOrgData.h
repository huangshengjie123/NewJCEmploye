//
//  JCModel_baseOrgData.h
//
//  Created by   on 2019/1/2
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_baseOrgState;

@interface JCModel_baseOrgData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, strong) JCModel_baseOrgState *state;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, assign) id leader;
@property (nonatomic, strong) NSArray *nodes;
@property (nonatomic, assign) id tags;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) id xpath;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *orgId;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, assign) double orgLevel;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, assign) id distPhone;
@property (nonatomic, assign) id parentId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
