//
//  JCModel_WaterCardWaterCardRecords.h
//
//  Created by   on 2018/6/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_WaterCardWaterCardRecords : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *waterCardRecordsIdentifier;
@property (nonatomic, assign) id num;
@property (nonatomic, assign) id createTime;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) id item;
@property (nonatomic, assign) id name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
