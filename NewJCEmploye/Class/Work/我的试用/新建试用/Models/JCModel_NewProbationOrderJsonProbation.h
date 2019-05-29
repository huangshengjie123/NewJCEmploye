//
//  JCModel_NewProbationOrderJsonProbation.h
//
//  Created by   on 2018/5/24
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_NewProbationOrderJsonProbation : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id status;
@property (nonatomic, assign) id endProperty;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, assign) id probationIdentifier;
@property (nonatomic, assign) id processId;
@property (nonatomic, assign) id start;
@property (nonatomic, strong) NSArray *costs;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSArray *costsSelf;
@property (nonatomic, assign) double preid;
@property (nonatomic, assign) id cust;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
