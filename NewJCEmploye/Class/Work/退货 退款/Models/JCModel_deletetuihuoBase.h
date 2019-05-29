//
//  JCModel_deletetuihuoBase.h
//
//  Created by   on 2019/3/28
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_deletetuihuoRefundment;

@interface JCModel_deletetuihuoBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_deletetuihuoRefundment *refundment;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
