//
//  JCModel_businessTripList.h
//
//  Created by   on 2019/3/20
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_businessTripLeaderInfo, JCModel_businessTripApprInfo;

@interface JCModel_businessTripList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *start;
@property (nonatomic, assign) double leader;
@property (nonatomic, strong) JCModel_businessTripLeaderInfo *leaderInfo;
@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, assign) id checker;
@property (nonatomic, strong) JCModel_businessTripApprInfo *apprInfo;
@property (nonatomic, strong) NSString *endProperty;
@property (nonatomic, assign) double appr;
@property (nonatomic, strong) NSString *org;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *to;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
