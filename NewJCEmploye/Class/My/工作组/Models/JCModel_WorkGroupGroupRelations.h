//
//  JCModel_WorkGroupGroupRelations.h
//
//  Created by   on 2018/6/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_WorkGroupGroupRelations : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double groupRelationsIdentifier;
@property (nonatomic, assign) double number;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
