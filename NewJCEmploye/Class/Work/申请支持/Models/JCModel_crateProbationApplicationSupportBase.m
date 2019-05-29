//
//  JCModel_crateProbationApplicationSupportBase.m
//
//  Created by   on 2018/12/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_crateProbationApplicationSupportBase.h"
#import "JCModel_crateProbationApplicationSupportFranchiserOrder.h"


NSString *const kJCModel_crateProbationApplicationSupportBaseCommand = @"command";
NSString *const kJCModel_crateProbationApplicationSupportBaseIsPre = @"isPre";
NSString *const kJCModel_crateProbationApplicationSupportBaseFranchiserOrder = @"franchiserOrder";


@interface JCModel_crateProbationApplicationSupportBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_crateProbationApplicationSupportBase

@synthesize command = _command;
@synthesize isPre = _isPre;
@synthesize franchiserOrder = _franchiserOrder;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_crateProbationApplicationSupportBaseCommand fromDictionary:dict];
            self.isPre = [[self objectOrNilForKey:kJCModel_crateProbationApplicationSupportBaseIsPre fromDictionary:dict] boolValue];
            self.franchiserOrder = [JCModel_crateProbationApplicationSupportFranchiserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_crateProbationApplicationSupportBaseFranchiserOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_crateProbationApplicationSupportBaseCommand];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPre] forKey:kJCModel_crateProbationApplicationSupportBaseIsPre];
    [mutableDict setValue:[self.franchiserOrder dictionaryRepresentation] forKey:kJCModel_crateProbationApplicationSupportBaseFranchiserOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_crateProbationApplicationSupportBaseCommand];
    self.isPre = [aDecoder decodeBoolForKey:kJCModel_crateProbationApplicationSupportBaseIsPre];
    self.franchiserOrder = [aDecoder decodeObjectForKey:kJCModel_crateProbationApplicationSupportBaseFranchiserOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_crateProbationApplicationSupportBaseCommand];
    [aCoder encodeBool:_isPre forKey:kJCModel_crateProbationApplicationSupportBaseIsPre];
    [aCoder encodeObject:_franchiserOrder forKey:kJCModel_crateProbationApplicationSupportBaseFranchiserOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_crateProbationApplicationSupportBase *copy = [[JCModel_crateProbationApplicationSupportBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.isPre = self.isPre;
        copy.franchiserOrder = [self.franchiserOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
