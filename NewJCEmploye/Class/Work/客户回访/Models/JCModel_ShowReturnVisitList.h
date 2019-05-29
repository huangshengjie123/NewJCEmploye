//
//  JCModel_ShowReturnVisitList.h
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_ShowReturnVisitCustomer;

@interface JCModel_ShowReturnVisitList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *myItem;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, strong) NSString *outStatus;
@property (nonatomic, strong) NSString *inOutId;
@property (nonatomic, assign) double guide;
@property (nonatomic, assign) double cusId;
@property (nonatomic, assign) double vtype;
@property (nonatomic, strong) JCModel_ShowReturnVisitCustomer *customer;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSArray *items;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
