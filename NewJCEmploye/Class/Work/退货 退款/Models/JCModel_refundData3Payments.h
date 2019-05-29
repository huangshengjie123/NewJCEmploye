//
//  JCModel_refundData3Payments.h
//
//  Created by   on 2019/1/31
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_refundData3Payments : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id oid;
@property (nonatomic, assign) id type;
@property (nonatomic, assign) double amount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
