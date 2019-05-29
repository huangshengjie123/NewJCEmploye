//
//  JCModel_inAndOutTotalData.h
//
//  Created by   on 2018/11/1
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_inAndOutTotalData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double total;
@property (nonatomic, assign) id endTime;
@property (nonatomic, assign) double storeHouse;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) double ptype;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
