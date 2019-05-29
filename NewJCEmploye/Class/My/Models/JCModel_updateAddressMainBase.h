//
//  JCModel_updateAddressMainBase.h
//
//  Created by   on 2019/4/3
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_updateAddressMainBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *cusId;
@property (nonatomic, strong) NSString *addressId;
@property (nonatomic, strong) NSString *type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
