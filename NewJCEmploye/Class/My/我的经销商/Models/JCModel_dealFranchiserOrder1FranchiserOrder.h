//
//  JCModel_dealFranchiserOrder1FranchiserOrder.h
//
//  Created by   on 2018/9/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_dealFranchiserOrder1FranchiserOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *franchiser;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
