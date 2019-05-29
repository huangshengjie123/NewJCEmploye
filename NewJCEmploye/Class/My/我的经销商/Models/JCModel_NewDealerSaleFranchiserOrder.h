//
//  JCModel_NewDealerSaleFranchiserOrder.h
//
//  Created by   on 2018/9/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_NewDealerSaleFranchiserOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *franchiserOrderIdentifier;
@property (nonatomic, strong) NSString *guide;
@property (nonatomic, strong) NSString *getamount;
@property (nonatomic, strong) NSArray *orderCosts;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) NSArray *orderPresents;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
