//
//  JCModel_updateWorklogBase.h
//
//  Created by   on 2018/8/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_updateWorklogDailyLog, JCModel_updateWorklogDailyLogStore;

@interface JCModel_updateWorklogBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_updateWorklogDailyLog *dailyLog;
@property (nonatomic, strong) JCModel_updateWorklogDailyLogStore *dailyLogStore;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
