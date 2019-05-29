//
//  JCModel_ReturnVisitList.h
//
//  Created by   on 2019/2/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_ReturnVisitCustomer;

@interface JCModel_ReturnVisitList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *myItem;
@property (nonatomic, assign) id comments;
@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, strong) NSString *outStatus;
@property (nonatomic, strong) NSString *inOutId;
@property (nonatomic, assign) double guide;
@property (nonatomic, assign) double cusId;
@property (nonatomic, assign) double vtype;
@property (nonatomic, strong) JCModel_ReturnVisitCustomer *customer;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSArray *items;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
