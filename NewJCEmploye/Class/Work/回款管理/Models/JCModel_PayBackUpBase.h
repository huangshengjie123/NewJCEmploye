//
//  JCModel_PayBackUpBase.h
//
//  Created by   on 2018/6/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_PayBackUpOrder;

@interface JCModel_PayBackUpBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_PayBackUpOrder *order;
@property (nonatomic, strong) NSString *command;
@property (nonatomic, assign) BOOL isFinanceCheck;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
