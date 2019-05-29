//
//  JCModel_OrgTypeZeroData.h
//
//  Created by   on 2018/9/20
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_OrgTypeZeroData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double leader;
@property (nonatomic, assign) id parentId;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, strong) NSString *orgId;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *xpath;
@property (nonatomic, assign) id distPhone;
@property (nonatomic, assign) double orgLevel;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
