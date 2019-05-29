//
//  JCModel_DonationRecordsList.h
//
//  Created by   on 2018/12/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_DonationRecordsList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) NSString *toCardId;
@property (nonatomic, strong) NSString *toCusName;
@property (nonatomic, strong) NSString *fromCusName;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSArray *donationRecordCosts;
@property (nonatomic, assign) double toCusId;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, assign) double updater;
@property (nonatomic, strong) NSString *fromCardId;
@property (nonatomic, assign) double fromCusId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
