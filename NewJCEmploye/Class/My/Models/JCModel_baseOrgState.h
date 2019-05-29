//
//  JCModel_baseOrgState.h
//
//  Created by   on 2019/1/2
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_baseOrgState : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL checked;
@property (nonatomic, assign) BOOL expanded;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) BOOL disabled;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
