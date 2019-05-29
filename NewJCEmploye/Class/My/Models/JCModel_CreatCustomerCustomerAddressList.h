//
//  JCModel_CreatCustomerCustomerAddressList.h
//
//  Created by   on 2018/6/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_CreatCustomerCustomerAddressList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *deliveryTime;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *address;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
