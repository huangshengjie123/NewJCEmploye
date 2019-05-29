//
//  JCModel_distribute_checkBase.h
//
//  Created by   on 2018/9/6
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_distribute_checkPurchaserOrder;

@interface JCModel_distribute_checkBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) NSString *distributeCheck;
@property (nonatomic, strong) JCModel_distribute_checkPurchaserOrder *purchaserOrder;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
