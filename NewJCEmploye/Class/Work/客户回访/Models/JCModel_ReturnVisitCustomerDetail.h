//
//  JCModel_ReturnVisitCustomerDetail.h
//
//  Created by   on 2019/2/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_ReturnVisitCustomerDetail : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double customerDetailIdentifier;
@property (nonatomic, assign) id customerDetailDescription;
@property (nonatomic, assign) id phone;
@property (nonatomic, assign) id sex;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, assign) id company;
@property (nonatomic, assign) id weChat;
@property (nonatomic, assign) id income;
@property (nonatomic, assign) id birthday;
@property (nonatomic, assign) id qq;
@property (nonatomic, assign) id email;
@property (nonatomic, assign) id interest;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
