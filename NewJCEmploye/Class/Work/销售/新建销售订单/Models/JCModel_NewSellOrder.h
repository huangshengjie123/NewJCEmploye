//
//  JCModel_NewSellOrder.h
//
//  Created by   on 2018/6/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_NewSellOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) NSString *orderIdentifier;
@property (nonatomic, assign) double getamount;
@property (nonatomic, assign) id processId;
@property (nonatomic, strong) NSArray *costs;
@property (nonatomic, assign) id guide;
@property (nonatomic, assign) double customerId;
@property (nonatomic, strong) NSArray *costsSelf;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
