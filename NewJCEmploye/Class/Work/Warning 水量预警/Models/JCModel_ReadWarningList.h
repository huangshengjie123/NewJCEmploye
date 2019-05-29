//
//  JCModel_ReadWarningList.h
//
//  Created by   on 2018/10/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_ReadWarningList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, assign) double owner;
@property (nonatomic, strong) NSString *creater;
@property (nonatomic, assign) double total;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) id uowner;
@property (nonatomic, assign) double level;
@property (nonatomic, assign) id waterCardRecords;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, assign) id waterCardItems;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
