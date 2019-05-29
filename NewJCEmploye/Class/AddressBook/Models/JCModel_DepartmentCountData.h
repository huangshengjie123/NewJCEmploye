//
//  JCModel_DepartmentCountData.h
//
//  Created by   on 2018/4/24
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_DepartmentCountData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *orgId;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, assign) double num;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
