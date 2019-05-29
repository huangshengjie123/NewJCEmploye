//
//  JCModel_AllOutInputOrderParams.h
//
//  Created by   on 2018/6/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_AllOutInputOrderInOutOrder;

@interface JCModel_AllOutInputOrderParams : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL cancel;
@property (nonatomic, strong) JCModel_AllOutInputOrderInOutOrder *inOutOrder;
@property (nonatomic, strong) NSString *reason;
@property (nonatomic, assign) BOOL needLeaderCheck;
@property (nonatomic, strong) NSString *outputer;
@property (nonatomic, strong) NSString *checkcode;
@property (nonatomic, assign) BOOL isStoreOutCheckPass;
@property (nonatomic, strong) NSString *storeHourse;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
