//
//  JCModel_CooperationPoiontOrderCooPointSimp.h
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_CooperationPoiontOrderCooPointSimp : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double cooPointSimpIdentifier;
@property (nonatomic, strong) NSString *pointAddr;
@property (nonatomic, strong) NSString *pointName;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, strong) NSString *pointPhone;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
