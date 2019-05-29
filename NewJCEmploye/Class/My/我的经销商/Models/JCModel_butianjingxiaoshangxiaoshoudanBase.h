//
//  JCModel_butianjingxiaoshangxiaoshoudanBase.h
//
//  Created by   on 2019/4/3
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_butianjingxiaoshangxiaoshoudanFranchiserOrder;

@interface JCModel_butianjingxiaoshangxiaoshoudanBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *command;
@property (nonatomic, assign) BOOL isPre;
@property (nonatomic, strong) JCModel_butianjingxiaoshangxiaoshoudanFranchiserOrder *franchiserOrder;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
