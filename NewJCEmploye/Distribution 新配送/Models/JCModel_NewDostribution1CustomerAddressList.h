//
//  JCModel_NewDostribution1CustomerAddressList.h
//
//  Created by   on 2018/10/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_NewDostribution1CustomerAddressList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) double addressId;
@property (nonatomic, strong) NSString *deliveryTime;
@property (nonatomic, assign) double cusId;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *xpath;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
