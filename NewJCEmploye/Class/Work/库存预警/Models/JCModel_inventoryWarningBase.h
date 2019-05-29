//
//  JCModel_inventoryWarningBase.h
//  NewJCEmploye
//
//  Created by 张晓光 on 2019/5/23.
//  Copyright © 2019 洁澄水业科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_inventoryWarningData;

@interface JCModel_inventoryWarningBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *result;
@property (nonatomic, assign) id num;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, assign) id msg;
@property (nonatomic, strong) JCModel_inventoryWarningData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
