//
//  JCModel_BulletinPageProperties.h
//
//  Created by   on 2018/5/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_BulletinPageProperties : NSObject <NSCoding, NSCopying>

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
