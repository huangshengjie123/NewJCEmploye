//
//  JCModel_NewWorkLogUPDailyLog.h
//
//  Created by   on 2018/8/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_NewWorkLogUPDailyLog : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSArray *logRows;
@property (nonatomic, strong) NSString *nextPlan;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
