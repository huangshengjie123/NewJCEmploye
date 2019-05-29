//
//  JCModel_WorkGroupList.h
//
//  Created by   on 2018/6/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_WorkGroupList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double owner;
@property (nonatomic, strong) NSString *org;
@property (nonatomic, assign) id parent;
@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, assign) id level;
@property (nonatomic, strong) NSString *listDescription;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *groupRelations;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
