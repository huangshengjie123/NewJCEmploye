//
//  JCModel_ProabtionCustomList.h
//
//  Created by   on 2018/4/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_ProabtionCustomList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSString *listDescription;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, assign) double introducer;
@property (nonatomic, assign) double from;
@property (nonatomic, strong) NSString *weChat;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, assign) double isRegister;
@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
