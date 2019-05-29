//
//  JCModel_bindingFranchiserOrderBase.h
//
//  Created by   on 2018/9/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_bindingFranchiserOrderFranchiserOrder;

@interface JCModel_bindingFranchiserOrderBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *waterCardId;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) NSString *needBindCard;
@property (nonatomic, strong) JCModel_bindingFranchiserOrderFranchiserOrder *franchiserOrder;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
