//
//  JCModel_ScanCodeInOutOrder.h
//
//  Created by   on 2018/6/1
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_ScanCodeInOutOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *inOutOrderIdentifier;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
