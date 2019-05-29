//
//  JCModel_watercardRecordsList.h
//
//  Created by   on 2018/10/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_watercardRecordsList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *reason;
@property (nonatomic, assign) id reid;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, assign) double updater;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) double num;
@property (nonatomic, assign) double item;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
