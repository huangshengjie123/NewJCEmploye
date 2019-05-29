//
//  JCModel_NewWorkingGroupBase.h
//
//  Created by   on 2018/11/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_NewWorkingGroupWorkGroup;

@interface JCModel_NewWorkingGroupBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) JCModel_NewWorkingGroupWorkGroup *workGroup;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
