//
//  JCModel_CarData.h
//
//  Created by   on 2018/10/19
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_CarData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *carItems;
@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, strong) NSString *plate;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
