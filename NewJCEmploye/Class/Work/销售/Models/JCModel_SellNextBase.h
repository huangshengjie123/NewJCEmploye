//
//  JCModel_SellNextBase.h
//
//  Created by   on 2018/6/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_SellNextOrder;

@interface JCModel_SellNextBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *waterCardId;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, assign) BOOL needBindCard;
@property (nonatomic, strong) JCModel_SellNextOrder *order;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
