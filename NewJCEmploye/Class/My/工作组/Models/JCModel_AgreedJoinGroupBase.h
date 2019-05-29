//
//  JCModel_AgreedJoinGroupBase.h
//
//  Created by   on 2018/10/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_AgreedJoinGroupWorkGroup;

@interface JCModel_AgreedJoinGroupBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_AgreedJoinGroupWorkGroup *workGroup;
@property (nonatomic, strong) NSString *taskId;
@property (nonatomic, strong) NSString *isJoinCheckPass;
@property (nonatomic, strong) NSString *type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
