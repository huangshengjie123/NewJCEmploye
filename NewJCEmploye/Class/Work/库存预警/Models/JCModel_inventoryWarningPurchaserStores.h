//
//  JCModel_inventoryWarningPurchaserStores.h
//
//  Created by   on 2018/10/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_inventoryWarningPurchaserStores : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double num;
@property (nonatomic, assign) id purchaserStoresIdentifier;
@property (nonatomic, assign) double item;
@property (nonatomic, assign) double rnum;
@property (nonatomic, assign) double warnpoint;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
