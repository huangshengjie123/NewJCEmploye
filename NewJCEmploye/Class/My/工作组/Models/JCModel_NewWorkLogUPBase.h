//
//  JCModel_NewWorkLogUPBase.h
//
//  Created by   on 2018/8/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_NewWorkLogUPDailyLog;

@interface JCModel_NewWorkLogUPBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_NewWorkLogUPDailyLog *dailyLog;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
