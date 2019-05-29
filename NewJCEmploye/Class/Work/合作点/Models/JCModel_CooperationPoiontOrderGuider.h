//
//  JCModel_CooperationPoiontOrderGuider.h
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_CooperationPoiontOrderGuider : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double guiderIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *mbPhone;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
