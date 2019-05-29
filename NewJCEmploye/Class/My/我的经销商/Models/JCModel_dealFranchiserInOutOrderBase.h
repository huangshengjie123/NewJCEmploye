//
//  JCModel_dealFranchiserInOutOrderBase.h
//
//  Created by   on 2018/9/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_dealFranchiserInOutOrderFranchiserInOutOrder;

@interface JCModel_dealFranchiserInOutOrderBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) JCModel_dealFranchiserInOutOrderFranchiserInOutOrder *franchiserInOutOrder;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
