//
//  JCModel_CreatCustomerBase.h
//
//  Created by   on 2019/1/2
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_CreatCustomerCustomerDetail;

@interface JCModel_CreatCustomerBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSArray *customerAddressList;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *curCom;
@property (nonatomic, strong) JCModel_CreatCustomerCustomerDetail *customerDetail;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
