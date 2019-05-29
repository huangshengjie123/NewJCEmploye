//
//  JCModel_supportCreateOrderBase.h
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_supportCreateOrderFranchiserOrder;

@interface JCModel_supportCreateOrderBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) NSString *storeHourse;
@property (nonatomic, strong) JCModel_supportCreateOrderFranchiserOrder *franchiserOrder;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
