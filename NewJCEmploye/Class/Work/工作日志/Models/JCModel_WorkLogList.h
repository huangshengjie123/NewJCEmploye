//
//  JCModel_WorkLogList.h
//
//  Created by   on 2018/8/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_WorkLogDailyLog;

@interface JCModel_WorkLogList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *phone;
@property (nonatomic, assign) id content;
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *orgId;
@property (nonatomic, strong) NSString *mbPhone;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) JCModel_WorkLogDailyLog *dailyLog;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
