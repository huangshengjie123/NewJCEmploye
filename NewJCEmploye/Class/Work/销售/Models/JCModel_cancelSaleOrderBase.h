//
//  JCModel_cancelSaleOrderBase.h
//
//  Created by   on 2018/12/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_cancelSaleOrderOrder;

@interface JCModel_cancelSaleOrderBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL rollBack;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_cancelSaleOrderOrder *order;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
