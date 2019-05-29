//
//  JCModel_UpdateCustmerInfoBase.h
//
//  Created by   on 2018/8/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_UpdateCustmerInfoCustomerDetail;

@interface JCModel_UpdateCustmerInfoBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) JCModel_UpdateCustmerInfoCustomerDetail *customerDetail;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
