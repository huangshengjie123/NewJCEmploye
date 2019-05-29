//
//  JCModel_CreatCustomer2CustomerAddressList.h
//
//  Created by   on 2019/1/4
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_CreatCustomer2CustomerAddressList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *deliveryTime;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *address;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
