//
//  JCModel_AllOutInputOrderItems.h
//
//  Created by   on 2018/6/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_AllOutInputOrderItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double num;
@property (nonatomic, strong) NSString *itemsIdentifier;
@property (nonatomic, assign) double item;
@property (nonatomic, assign) id name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
