//
//  JCModel_UpCommonInOutInOutOrder.h
//
//  Created by   on 2018/7/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_UpCommonInOutInOutOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *reason;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, assign) double storeHouse;
@property (nonatomic, assign) double applicant;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) double checker;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
