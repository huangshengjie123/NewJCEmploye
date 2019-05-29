//
//  JCModel_NewProbationOrderJsonBase.m
//
//  Created by   on 2018/5/24
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewProbationOrderJsonBase.h"
#import "JCModel_NewProbationOrderJsonProbation.h"


NSString *const kJCModel_NewProbationOrderJsonBaseIsOutStore = @"isOutStore";
NSString *const kJCModel_NewProbationOrderJsonBaseStoreHourse = @"storeHourse";
NSString *const kJCModel_NewProbationOrderJsonBaseProbation = @"probation";
NSString *const kJCModel_NewProbationOrderJsonBaseCommand = @"command";


@interface JCModel_NewProbationOrderJsonBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewProbationOrderJsonBase

@synthesize isOutStore = _isOutStore;
@synthesize storeHourse = _storeHourse;
@synthesize probation = _probation;
@synthesize command = _command;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.isOutStore = [[self objectOrNilForKey:kJCModel_NewProbationOrderJsonBaseIsOutStore fromDictionary:dict] boolValue];
            self.storeHourse = [self objectOrNilForKey:kJCModel_NewProbationOrderJsonBaseStoreHourse fromDictionary:dict];
            self.probation = [JCModel_NewProbationOrderJsonProbation modelObjectWithDictionary:[dict objectForKey:kJCModel_NewProbationOrderJsonBaseProbation]];
            self.command = [self objectOrNilForKey:kJCModel_NewProbationOrderJsonBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.isOutStore] forKey:kJCModel_NewProbationOrderJsonBaseIsOutStore];
    [mutableDict setValue:self.storeHourse forKey:kJCModel_NewProbationOrderJsonBaseStoreHourse];
    [mutableDict setValue:[self.probation dictionaryRepresentation] forKey:kJCModel_NewProbationOrderJsonBaseProbation];
    [mutableDict setValue:self.command forKey:kJCModel_NewProbationOrderJsonBaseCommand];

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

    self.isOutStore = [aDecoder decodeBoolForKey:kJCModel_NewProbationOrderJsonBaseIsOutStore];
    self.storeHourse = [aDecoder decodeObjectForKey:kJCModel_NewProbationOrderJsonBaseStoreHourse];
    self.probation = [aDecoder decodeObjectForKey:kJCModel_NewProbationOrderJsonBaseProbation];
    self.command = [aDecoder decodeObjectForKey:kJCModel_NewProbationOrderJsonBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_isOutStore forKey:kJCModel_NewProbationOrderJsonBaseIsOutStore];
    [aCoder encodeObject:_storeHourse forKey:kJCModel_NewProbationOrderJsonBaseStoreHourse];
    [aCoder encodeObject:_probation forKey:kJCModel_NewProbationOrderJsonBaseProbation];
    [aCoder encodeObject:_command forKey:kJCModel_NewProbationOrderJsonBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewProbationOrderJsonBase *copy = [[JCModel_NewProbationOrderJsonBase alloc] init];
    
    
    
    if (copy) {

        copy.isOutStore = self.isOutStore;
        copy.storeHourse = [self.storeHourse copyWithZone:zone];
        copy.probation = [self.probation copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
