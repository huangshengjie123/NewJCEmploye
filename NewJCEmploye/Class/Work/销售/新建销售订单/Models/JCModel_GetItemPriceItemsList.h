//
//  JCModel_GetItemPriceItemsList.h
//
//  Created by   on 2018/11/14
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_GetItemPriceItemsList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double owner;
@property (nonatomic, assign) double storer;
@property (nonatomic, assign) id probater;
@property (nonatomic, assign) id cus;
@property (nonatomic, assign) double itemSerial;
@property (nonatomic, assign) double meta;
@property (nonatomic, assign) id state;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
