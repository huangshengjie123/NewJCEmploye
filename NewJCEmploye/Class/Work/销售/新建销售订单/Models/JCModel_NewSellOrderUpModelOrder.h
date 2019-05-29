//
//  JCModel_NewSellOrderUpModelOrder.h
//
//  Created by   on 2018/7/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_NewSellOrderUpModelOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) NSArray *pCosts;
@property (nonatomic, strong) NSString *orderIdentifier;
@property (nonatomic, strong) NSString *getamount;
@property (nonatomic, assign) id processId;
@property (nonatomic, strong) NSArray *costs;
@property (nonatomic, assign) id guide;
@property (nonatomic, strong) NSString *customerId;
@property (nonatomic, strong) NSArray *costsSelf;
@property (nonatomic, strong) NSArray *pCostsSelf;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
