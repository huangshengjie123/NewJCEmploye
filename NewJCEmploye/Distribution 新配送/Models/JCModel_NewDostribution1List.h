//
//  JCModel_NewDostribution1List.h
//
//  Created by   on 2018/10/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_NewDostribution1Customer, JCModel_NewDostribution1Cars;

@interface JCModel_NewDostribution1List : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, assign) double staff;
@property (nonatomic, strong) NSString *processId;
@property (nonatomic, assign) double leader;
@property (nonatomic, assign) double addrId;
@property (nonatomic, strong) JCModel_NewDostribution1Customer *customer;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, assign) id userExtInfo;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, assign) double carId;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) id cardId;
@property (nonatomic, strong) JCModel_NewDostribution1Cars *cars;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) double cusId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
