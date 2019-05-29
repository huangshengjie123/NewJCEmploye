//
//  JCModel_DonationRecordsDonationRecordCosts.h
//
//  Created by   on 2018/12/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_DonationRecordsDonationRecordCosts : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double num;
@property (nonatomic, assign) id donationRecordCostsIdentifier;
@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, assign) double item;
@property (nonatomic, assign) double unit;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
