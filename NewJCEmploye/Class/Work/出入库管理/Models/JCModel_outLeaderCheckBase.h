//
//  JCModel_outLeaderCheckBase.h
//
//  Created by   on 2018/7/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_outLeaderCheckInOutOrder;

@interface JCModel_outLeaderCheckBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *current;
@property (nonatomic, assign) BOOL isLeaderCheck;
@property (nonatomic, strong) JCModel_outLeaderCheckInOutOrder *inOutOrder;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
