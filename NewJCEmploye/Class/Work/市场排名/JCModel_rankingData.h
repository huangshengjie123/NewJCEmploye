//
//  JCModel_rankingData.h
//
//  Created by   on 2019/3/26
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_rankingData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double amount;
@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
