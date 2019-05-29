//
//  JCModel_AllOutInputOrderData.h
//
//  Created by   on 2018/6/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_AllOutInputOrderParams;

@interface JCModel_AllOutInputOrderData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) id taskId;
@property (nonatomic, strong) JCModel_AllOutInputOrderParams *params;
@property (nonatomic, assign) id processId;
@property (nonatomic, assign) id processStartTime;
@property (nonatomic, assign) id processBusinessId;
@property (nonatomic, strong) NSString *assignee;
@property (nonatomic, assign) id processName;
@property (nonatomic, assign) id processDefinitionKey;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) id createTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
