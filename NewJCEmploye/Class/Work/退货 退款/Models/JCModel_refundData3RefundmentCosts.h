//
//  JCModel_refundData3RefundmentCosts.h
//
//  Created by   on 2019/1/31
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_refundData3RefundmentCosts : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double unit;
@property (nonatomic, assign) double num;
@property (nonatomic, assign) id refundmentCostsIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) id price;
@property (nonatomic, assign) double item;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
