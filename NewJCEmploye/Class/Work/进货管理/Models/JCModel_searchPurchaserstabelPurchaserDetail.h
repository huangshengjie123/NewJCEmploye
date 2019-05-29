//
//  JCModel_searchPurchaserstabelPurchaserDetail.h
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_searchPurchaserstabelPurchaserDetail : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id leader;
@property (nonatomic, assign) id franchiser;
@property (nonatomic, strong) NSString *org;
@property (nonatomic, strong) NSString *purchaserDetailIdentifier;
@property (nonatomic, assign) id applicant;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) id disGroup;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
