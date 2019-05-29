//
//  JCModel_ScrapApprovalBase.h
//
//  Created by   on 2019/4/11
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_ScrapApprovalInOutOrder;

@interface JCModel_ScrapApprovalBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_ScrapApprovalInOutOrder *inOutOrder;
@property (nonatomic, strong) NSString *command;
@property (nonatomic, assign) BOOL isCheck;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
