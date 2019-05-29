//
//  JCModel_ScanCodeBase.h
//
//  Created by   on 2018/6/1
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_ScanCodeInOutOrder;

@interface JCModel_ScanCodeBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *checkcode;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_ScanCodeInOutOrder *inOutOrder;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
