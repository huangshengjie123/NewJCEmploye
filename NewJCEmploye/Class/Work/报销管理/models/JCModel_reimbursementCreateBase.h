//
//  JCModel_reimbursementCreateBase.h
//
//  Created by   on 2019/3/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_reimbursementCreateBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *faOrdrerId;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSArray *reimbursementItems;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
