//
//  JCModel_HomeToNewGroupBase.h
//
//  Created by   on 2018/11/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_HomeToNewGroupWorkGroup;

@interface JCModel_HomeToNewGroupBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) NSString *taskId;
@property (nonatomic, strong) JCModel_HomeToNewGroupWorkGroup *workGroup;
@property (nonatomic, strong) NSString *command;
@property (nonatomic, assign) BOOL isCreateCheckPass;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
