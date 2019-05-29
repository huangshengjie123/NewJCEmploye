//
//  JCModel_message2List.h
//
//  Created by   on 2019/3/16
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_message2List : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, assign) double cus;
@property (nonatomic, strong) NSString *cusName;
@property (nonatomic, strong) NSString *toCom;
@property (nonatomic, strong) NSString *updaterName;
@property (nonatomic, assign) double from;
@property (nonatomic, strong) NSString *fromName;
@property (nonatomic, strong) NSString *fromComName;
@property (nonatomic, strong) NSString *toComName;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *cusMobile;
@property (nonatomic, assign) double updater;
@property (nonatomic, strong) NSString *fromCom;
@property (nonatomic, strong) NSString *toName;
@property (nonatomic, assign) double to;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
