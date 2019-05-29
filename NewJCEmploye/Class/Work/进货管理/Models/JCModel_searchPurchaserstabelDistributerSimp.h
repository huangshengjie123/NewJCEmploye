//
//  JCModel_searchPurchaserstabelDistributerSimp.h
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_searchPurchaserstabelDistributerSimp : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double distributerSimpIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) id mbPhone;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
