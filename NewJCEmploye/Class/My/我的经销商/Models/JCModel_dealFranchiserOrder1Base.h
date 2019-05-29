//
//  JCModel_dealFranchiserOrder1Base.h
//
//  Created by   on 2018/9/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_dealFranchiserOrder1FranchiserOrder;

@interface JCModel_dealFranchiserOrder1Base : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *isPre;
@property (nonatomic, assign) double preId;
@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) JCModel_dealFranchiserOrder1FranchiserOrder *franchiserOrder;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
