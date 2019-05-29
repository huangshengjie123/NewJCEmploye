//
//  JCModel_crateProbationApplicationSupportFranchiserOrder.m
//
//  Created by   on 2018/12/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_crateProbationApplicationSupportFranchiserOrder.h"


NSString *const kJCModel_crateProbationApplicationSupportFranchiserOrderPreId = @"preId";
NSString *const kJCModel_crateProbationApplicationSupportFranchiserOrderComments = @"comments";


@interface JCModel_crateProbationApplicationSupportFranchiserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_crateProbationApplicationSupportFranchiserOrder

@synthesize preId = _preId;
@synthesize comments = _comments;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.preId = [[self objectOrNilForKey:kJCModel_crateProbationApplicationSupportFranchiserOrderPreId fromDictionary:dict] doubleValue];
            self.comments = [self objectOrNilForKey:kJCModel_crateProbationApplicationSupportFranchiserOrderComments fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.preId] forKey:kJCModel_crateProbationApplicationSupportFranchiserOrderPreId];
    [mutableDict setValue:self.comments forKey:kJCModel_crateProbationApplicationSupportFranchiserOrderComments];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.preId = [aDecoder decodeDoubleForKey:kJCModel_crateProbationApplicationSupportFranchiserOrderPreId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_crateProbationApplicationSupportFranchiserOrderComments];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_preId forKey:kJCModel_crateProbationApplicationSupportFranchiserOrderPreId];
    [aCoder encodeObject:_comments forKey:kJCModel_crateProbationApplicationSupportFranchiserOrderComments];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_crateProbationApplicationSupportFranchiserOrder *copy = [[JCModel_crateProbationApplicationSupportFranchiserOrder alloc] init];
    
    
    
    if (copy) {

        copy.preId = self.preId;
        copy.comments = [self.comments copyWithZone:zone];
    }
    
    return copy;
}


@end
