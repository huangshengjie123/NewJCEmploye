//
//  JCModel_FinanceCheckBase.h
//
//  Created by   on 2018/8/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_FinanceCheckPurchaserOrder;

@interface JCModel_FinanceCheckBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_FinanceCheckPurchaserOrder *purchaserOrder;
@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) NSString *financeCheck;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
