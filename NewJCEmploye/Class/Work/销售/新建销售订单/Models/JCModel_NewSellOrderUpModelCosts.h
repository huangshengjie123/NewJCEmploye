//
//  JCModel_NewSellOrderUpModelCosts.h
//
//  Created by   on 2018/7/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_NewSellOrderUpModelCosts : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *num;
@property (nonatomic, strong) NSString *item;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
