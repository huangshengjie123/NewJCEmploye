//
//  JCModel_SellNextOrder.h
//
//  Created by   on 2018/6/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_SellNextOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *orderIdentifier;
@property (nonatomic, strong) NSString *type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
