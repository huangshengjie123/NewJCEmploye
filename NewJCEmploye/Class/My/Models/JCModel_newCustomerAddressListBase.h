//
//  JCModel_newCustomerAddressListBase.h
//
//  Created by   on 2018/12/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_newCustomerAddressListBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *cusId;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *address;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
