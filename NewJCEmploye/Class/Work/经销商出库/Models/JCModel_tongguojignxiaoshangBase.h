//
//  JCModel_tongguojignxiaoshangBase.h
//
//  Created by   on 2019/4/8
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_tongguojignxiaoshangFranchiserInOutOrder;

@interface JCModel_tongguojignxiaoshangBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *current;
@property (nonatomic, assign) BOOL isStoreOutCheckPass;
@property (nonatomic, strong) JCModel_tongguojignxiaoshangFranchiserInOutOrder *franchiserInOutOrder;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
