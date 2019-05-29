//
//  JCModel_NewCooperationBase.h
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_NewCooperationBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *lawPhone;
@property (nonatomic, strong) NSString *pointPhone;
@property (nonatomic, strong) NSString *pointAddr;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *pointName;
@property (nonatomic, strong) NSString *law;
@property (nonatomic, assign) double isCooperation;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
