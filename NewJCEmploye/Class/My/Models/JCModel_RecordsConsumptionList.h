//
//  JCModel_RecordsConsumptionList.h
//
//  Created by   on 2018/10/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_RecordsConsumptionList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double amount;
@property (nonatomic, strong) NSString *franchiser;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *oid;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *items;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
