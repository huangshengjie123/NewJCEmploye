//
//  JCModel_probationOrderList.h
//
//  Created by   on 2018/10/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_probationOrderGuider, JCModel_probationOrderCustomer;

@interface JCModel_probationOrderList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) NSString *start;
@property (nonatomic, strong) NSString *processId;
@property (nonatomic, assign) double guide;
@property (nonatomic, assign) id hasOut;
@property (nonatomic, strong) NSArray *probationCosts;
@property (nonatomic, strong) JCModel_probationOrderGuider *guider;
@property (nonatomic, assign) id com;
@property (nonatomic, strong) JCModel_probationOrderCustomer *customer;
@property (nonatomic, assign) BOOL isDeal;
@property (nonatomic, assign) double preid;
@property (nonatomic, strong) NSString *endProperty;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) id cust;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
