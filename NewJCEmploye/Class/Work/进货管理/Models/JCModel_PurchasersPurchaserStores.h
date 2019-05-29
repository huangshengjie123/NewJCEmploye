//
//  JCModel_PurchasersPurchaserStores.h
//
//  Created by   on 2018/8/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_PurchasersPurchaserStores : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double num;
@property (nonatomic, strong) NSString *purchaserStoresIdentifier;
@property (nonatomic, assign) double item;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double rnum;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
