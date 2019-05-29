//
//  JCModel_zhipancusBase.m
//
//  Created by   on 2019/3/16
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_zhipancusBase.h"


NSString *const kJCModel_zhipancusBaseId = @"id";
NSString *const kJCModel_zhipancusBaseTo = @"to";


@interface JCModel_zhipancusBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_zhipancusBase

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize to = _to;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kJCModel_zhipancusBaseId fromDictionary:dict];
            self.to = [[self objectOrNilForKey:kJCModel_zhipancusBaseTo fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kJCModel_zhipancusBaseId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.to] forKey:kJCModel_zhipancusBaseTo];

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

    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kJCModel_zhipancusBaseId];
    self.to = [aDecoder decodeDoubleForKey:kJCModel_zhipancusBaseTo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kJCModel_zhipancusBaseId];
    [aCoder encodeDouble:_to forKey:kJCModel_zhipancusBaseTo];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_zhipancusBase *copy = [[JCModel_zhipancusBase alloc] init];
    
    
    
    if (copy) {

        copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
        copy.to = self.to;
    }
    
    return copy;
}


@end
