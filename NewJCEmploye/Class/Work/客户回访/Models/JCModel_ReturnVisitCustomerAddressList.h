//
//  JCModel_ReturnVisitCustomerAddressList.h
//
//  Created by   on 2019/2/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_ReturnVisitCustomerAddressList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id phone;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) double addressId;
@property (nonatomic, assign) id deliveryTime;
@property (nonatomic, assign) id linkman;
@property (nonatomic, assign) double cusId;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *xpath;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
