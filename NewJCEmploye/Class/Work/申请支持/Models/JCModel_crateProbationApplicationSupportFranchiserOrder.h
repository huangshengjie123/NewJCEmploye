//
//  JCModel_crateProbationApplicationSupportFranchiserOrder.h
//
//  Created by   on 2018/12/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_crateProbationApplicationSupportFranchiserOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double preId;
@property (nonatomic, strong) NSString *comments;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
