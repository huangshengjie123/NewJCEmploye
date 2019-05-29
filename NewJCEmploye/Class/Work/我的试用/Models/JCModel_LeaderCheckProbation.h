//
//  JCModel_LeaderCheckProbation.h
//
//  Created by   on 2018/7/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_LeaderCheckProbation : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *probationIdentifier;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
