//
//  JCModel_DepartmentState.h
//
//  Created by   on 2018/4/20
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_DepartmentState : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL checked;
@property (nonatomic, assign) BOOL expanded;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) BOOL disabled;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
