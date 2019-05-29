//
//  JCModel_inventoryWarningData.h
//
//  Created by   on 2018/10/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_inventoryWarningData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double leader;
@property (nonatomic, assign) id franchiser;
@property (nonatomic, strong) NSString *org;
@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, assign) id organization;
@property (nonatomic, strong) NSArray *purchaserStores;
@property (nonatomic, assign) id disGroup;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) double applicant;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
