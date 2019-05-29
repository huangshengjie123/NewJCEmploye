//
//  JCModel_newReturnGoods2Refundment.h
//
//  Created by   on 2019/1/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_newReturnGoods2Refundment : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *refundmentCosts;
@property (nonatomic, strong) NSString *refundmentIdentifier;
@property (nonatomic, strong) NSString *storeHouse;
@property (nonatomic, assign) double refundment;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
