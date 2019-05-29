//
//  JCModel_suprrotDealFranchiserGrantOrderBase.h
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_suprrotDealFranchiserGrantOrderFranchiserOrder;

@interface JCModel_suprrotDealFranchiserGrantOrderBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *waterCardId;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_suprrotDealFranchiserGrantOrderFranchiserOrder *franchiserOrder;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
