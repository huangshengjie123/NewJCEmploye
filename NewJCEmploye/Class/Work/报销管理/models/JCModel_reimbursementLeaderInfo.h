//
//  JCModel_reimbursementLeaderInfo.h
//
//  Created by   on 2019/3/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_reimbursementLeaderInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double leaderInfoIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *mbPhone;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
