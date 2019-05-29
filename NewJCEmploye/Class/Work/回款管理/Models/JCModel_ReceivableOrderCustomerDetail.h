//
//  JCModel_ReceivableOrderCustomerDetail.h
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_ReceivableOrderCustomerDetail : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id qq;
@property (nonatomic, assign) id phone;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, assign) double customerDetailIdentifier;
@property (nonatomic, assign) id weChat;
@property (nonatomic, assign) id company;
@property (nonatomic, assign) id income;
@property (nonatomic, assign) id email;
@property (nonatomic, assign) id customerDetailDescription;
@property (nonatomic, assign) id sex;
@property (nonatomic, assign) id interest;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
