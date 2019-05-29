//
//  JCModel_newbusinesstripBase.h
//
//  Created by   on 2019/3/20
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_newbusinesstripBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSString *endProperty;
@property (nonatomic, strong) NSString *to;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *start;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
