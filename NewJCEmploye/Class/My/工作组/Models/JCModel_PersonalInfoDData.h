//
//  JCModel_PersonalInfoDData.h
//
//  Created by   on 2018/11/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_PersonalInfoDData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double probationSum;
@property (nonatomic, assign) double dealSum;
@property (nonatomic, strong) NSString *cycleUnit;
@property (nonatomic, assign) double dealPercent;
@property (nonatomic, assign) double probationOnSum;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
