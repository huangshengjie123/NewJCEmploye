//
//  JCModel_caiwushenpiBase.h
//
//  Created by   on 2019/4/8
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_caiwushenpiRefundment;

@interface JCModel_caiwushenpiBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_caiwushenpiRefundment *refundment;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) NSString *command;
@property (nonatomic, assign) BOOL passCheck;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
