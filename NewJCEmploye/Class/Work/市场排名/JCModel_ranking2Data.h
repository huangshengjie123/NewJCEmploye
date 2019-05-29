//
//  JCModel_ranking2Data.h
//
//  Created by   on 2019/3/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_ranking2Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, assign) double resale;
@property (nonatomic, assign) double coo;
@property (nonatomic, assign) id groupAmount;
@property (nonatomic, assign) id comName;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, assign) double franSale;
@property (nonatomic, assign) double madeWater;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, assign) double franNonlocalSale;
@property (nonatomic, assign) id comCoo;
@property (nonatomic, assign) double referral;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, assign) double reNonlocalSale;
@property (nonatomic, assign) double userAmount;
@property (nonatomic, assign) double franStock;
@property (nonatomic, strong) NSString *groupId;
@property (nonatomic, assign) id groupName;
@property (nonatomic, assign) id comAmount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
