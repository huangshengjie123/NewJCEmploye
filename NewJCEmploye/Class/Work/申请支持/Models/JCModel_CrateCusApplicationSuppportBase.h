//
//  JCModel_CrateCusApplicationSuppportBase.h
//
//  Created by   on 2018/12/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_CrateCusApplicationSuppportFranchiserOrder;

@interface JCModel_CrateCusApplicationSuppportBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *command;
@property (nonatomic, assign) BOOL isPre;
@property (nonatomic, strong) JCModel_CrateCusApplicationSuppportFranchiserOrder *franchiserOrder;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
