//
//  JCModel_CooperationList.h
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_CooperationList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *pointPhone;
@property (nonatomic, strong) NSString *guideName;
@property (nonatomic, strong) NSString *pointAddr;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, strong) NSString *lawPhone;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *law;
@property (nonatomic, assign) double isCooperation;
@property (nonatomic, strong) NSString *guidePhone;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, strong) NSString *pointName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
