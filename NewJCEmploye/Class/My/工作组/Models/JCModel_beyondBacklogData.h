//
//  JCModel_beyondBacklogData.h
//
//  Created by   on 2018/10/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_beyondBacklogData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *processId;
@property (nonatomic, strong) NSString *processDefinitionKey;
@property (nonatomic, strong) NSString *processBusinessId;
@property (nonatomic, assign) id params;
@property (nonatomic, assign) id assignee;
@property (nonatomic, strong) NSString *processName;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *taskId;
@property (nonatomic, strong) NSString *processStartTime;
@property (nonatomic, assign) id businessId;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
