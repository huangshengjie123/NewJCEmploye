//
//  JCModel_QueryPersonalInfoBase.h
//
//  Created by   on 2018/8/14
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_QueryPersonalInfoBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *cycle;
@property (nonatomic, strong) NSString *groupId;
@property (nonatomic, strong) NSString *cycleNum;
@property (nonatomic, assign) double uid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
