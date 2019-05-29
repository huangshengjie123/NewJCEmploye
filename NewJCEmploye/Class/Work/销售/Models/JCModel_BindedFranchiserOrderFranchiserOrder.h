//
//  JCModel_BindedFranchiserOrderFranchiserOrder.h
//
//  Created by   on 2018/9/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_BindedFranchiserOrderFranchiserOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *franchiserOrderIdentifier;
@property (nonatomic, strong) NSString *getamount;
@property (nonatomic, strong) NSString *type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
