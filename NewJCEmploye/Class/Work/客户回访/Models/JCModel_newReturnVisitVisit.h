//
//  JCModel_newReturnVisitVisit.h
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_newReturnVisitVisit : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *myItem;
@property (nonatomic, assign) double guide;
@property (nonatomic, assign) double vtype;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, assign) double cusId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
