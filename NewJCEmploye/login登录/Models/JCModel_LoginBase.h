//
//  JCModel_LoginBase.h
//
//  Created by   on 2018/4/12
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_LoginBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSString *result;
@property (nonatomic, assign) id code;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
