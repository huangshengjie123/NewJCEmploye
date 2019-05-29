//
//  JCModel_ItemsItemsList.h
//
//  Created by   on 2018/5/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_ItemsItemsList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double owner;
@property (nonatomic, assign) id storer;
@property (nonatomic, assign) id probater;
@property (nonatomic, assign) id cus;
@property (nonatomic, assign) double itemSerial;
@property (nonatomic, assign) double meta;
@property (nonatomic, assign) id state;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
