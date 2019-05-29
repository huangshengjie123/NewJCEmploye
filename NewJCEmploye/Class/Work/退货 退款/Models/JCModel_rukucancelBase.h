//
//  JCModel_rukucancelBase.h
//
//  Created by   on 2019/2/12
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_rukucancelInOutOrder;

@interface JCModel_rukucancelBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_rukucancelInOutOrder *inOutOrder;
@property (nonatomic, assign) BOOL isStoreInputCheckPass;
@property (nonatomic, strong) NSString *backReason;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
