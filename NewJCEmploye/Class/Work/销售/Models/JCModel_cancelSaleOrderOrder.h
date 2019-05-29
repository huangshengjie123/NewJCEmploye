//
//  JCModel_cancelSaleOrderOrder.h
//
//  Created by   on 2018/12/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_cancelSaleOrderOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *orderIdentifier;
@property (nonatomic, assign) double getamount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
