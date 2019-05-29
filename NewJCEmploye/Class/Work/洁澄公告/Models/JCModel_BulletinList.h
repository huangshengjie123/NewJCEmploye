//
//  JCModel_BulletinList.h
//
//  Created by   on 2018/5/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_BulletinList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double owner;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, assign) id file;
@property (nonatomic, strong) NSString *orgId;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
