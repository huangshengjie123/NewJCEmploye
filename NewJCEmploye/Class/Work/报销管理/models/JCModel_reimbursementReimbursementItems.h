//
//  JCModel_reimbursementReimbursementItems.h
//
//  Created by   on 2019/3/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_reimbursementReimbursementItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double amount;
@property (nonatomic, assign) id reimbursementItemsIdentifier;
@property (nonatomic, strong) NSString *typeName;
@property (nonatomic, strong) NSString *type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
