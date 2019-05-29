//
//  JCModel_searchOrg2PurchaserStores.h
//
//  Created by   on 2018/12/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_searchOrg2PurchaserStores : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double unit;
@property (nonatomic, assign) double warnpoint;
@property (nonatomic, assign) id purchaserStoresIdentifier;
@property (nonatomic, assign) double rnum;
@property (nonatomic, assign) double num;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double item;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
