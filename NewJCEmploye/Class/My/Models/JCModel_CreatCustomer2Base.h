//
//  JCModel_CreatCustomer2Base.h
//
//  Created by   on 2019/1/4
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_CreatCustomer2CustomerDetail;

@interface JCModel_CreatCustomer2Base : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *guide;
@property (nonatomic, strong) NSArray *customerAddressList;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) JCModel_CreatCustomer2CustomerDetail *customerDetail;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
