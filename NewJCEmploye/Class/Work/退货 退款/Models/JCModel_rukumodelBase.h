//
//  JCModel_rukumodelBase.h
//
//  Created by   on 2019/2/12
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_rukumodelInOutOrder;

@interface JCModel_rukumodelBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_rukumodelInOutOrder *inOutOrder;
@property (nonatomic, strong) NSString *command;
@property (nonatomic, assign) BOOL isStoreInputCheckPass;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
