//
//  JCModel_WorkLogDailyLog.h
//
//  Created by   on 2018/8/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_WorkLogDailyLog : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *logRows;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *nextPlan;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
