//
//  JCModel_startReturnGoodsRefundment.h
//
//  Created by   on 2019/1/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_startReturnGoodsRefundment : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *oid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
