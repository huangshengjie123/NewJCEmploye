//
//  JCModel_searchDetailsOutputFItems.h
//
//  Created by   on 2019/3/4
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_searchDetailsOutputFItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double num;
@property (nonatomic, strong) NSString *itemsIdentifier;
@property (nonatomic, assign) double item;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double unit;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
