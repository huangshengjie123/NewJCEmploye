//
//  JCModel_InAndOutPageProperties.h
//
//  Created by   on 2019/2/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_InAndOutPageProperties : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double size;
@property (nonatomic, assign) double pageNum;
@property (nonatomic, assign) double endProperty;
@property (nonatomic, assign) double count;
@property (nonatomic, assign) double totalPage;
@property (nonatomic, assign) double start;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
