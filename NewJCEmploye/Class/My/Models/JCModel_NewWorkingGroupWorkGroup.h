//
//  JCModel_NewWorkingGroupWorkGroup.h
//
//  Created by   on 2018/11/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_NewWorkingGroupWorkGroup : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *org;
@property (nonatomic, strong) NSString *owner;
@property (nonatomic, strong) NSString *workGroupDescription;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *parent;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
