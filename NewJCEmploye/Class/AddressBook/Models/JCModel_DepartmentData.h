//
//  JCModel_DepartmentData.h
//
//  Created by   on 2018/4/20
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_DepartmentState;

@interface JCModel_DepartmentData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_DepartmentState *state;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSArray  *nodes;
@property (nonatomic, assign) id       tags;
@property (nonatomic, assign) double   type;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *orgId;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, assign) double   orgLevel;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, assign) id       parentId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
