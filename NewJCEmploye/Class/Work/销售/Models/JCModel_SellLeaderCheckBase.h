//
//  JCModel_SellLeaderCheckBase.h
//
//  Created by   on 2018/7/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_SellLeaderCheckOrder;

@interface JCModel_SellLeaderCheckBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_SellLeaderCheckOrder *order;
@property (nonatomic, assign) BOOL leaderPass;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
