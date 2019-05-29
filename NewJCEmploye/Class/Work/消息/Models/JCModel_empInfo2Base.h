//
//  JCModel_empInfo2Base.h
//
//  Created by   on 2019/4/10
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_empInfo2Data;

@interface JCModel_empInfo2Base : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *result;
@property (nonatomic, assign) id num;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, assign) id msg;
@property (nonatomic, strong) JCModel_empInfo2Data *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
