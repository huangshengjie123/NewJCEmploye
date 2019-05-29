//
//  JCModel_NewPayBackUpBase.h
//
//  Created by   on 2019/1/23
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_NewPayBackUpOrder;

@interface JCModel_NewPayBackUpBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_NewPayBackUpOrder *order;
@property (nonatomic, strong) NSString *command;
@property (nonatomic, assign) BOOL isFinanceCheck;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
