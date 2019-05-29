//
//  JCModel_updateFranchiserDoBase.h
//
//  Created by   on 2019/4/9
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_updateFranchiserDoBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double balance;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
