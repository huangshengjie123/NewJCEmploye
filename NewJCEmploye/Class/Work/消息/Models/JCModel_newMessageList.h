//
//  JCModel_newMessageList.h
//
//  Created by   on 2019/4/10
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_newMessageList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *formId;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *sendTime;
@property (nonatomic, assign) double tag;
@property (nonatomic, assign) double msgId;
@property (nonatomic, assign) double to;
@property (nonatomic, assign) id path;
@property (nonatomic, strong) NSString *type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
