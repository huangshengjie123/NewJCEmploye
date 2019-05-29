//
//  JCModel_dealFranchiserInOutOrderFranchiserInOutOrder.h
//
//  Created by   on 2018/9/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_dealFranchiserInOutOrderFranchiserInOutOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id status;
@property (nonatomic, strong) NSString *franchiser;
@property (nonatomic, strong) NSString *reason;
@property (nonatomic, assign) id franchiserInOutOrderIdentifier;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) NSString *storeHouse;
@property (nonatomic, assign) double applicant;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) id createTime;
@property (nonatomic, strong) NSArray *items;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
