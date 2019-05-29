//
//  JCModel_updateWorklogLogRows.h
//
//  Created by   on 2018/8/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_updateWorklogLogRows : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *row;
@property (nonatomic, strong) NSString *time;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
