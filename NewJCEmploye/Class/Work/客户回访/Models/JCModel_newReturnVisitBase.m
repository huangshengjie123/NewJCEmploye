//
//  JCModel_newReturnVisitBase.m
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newReturnVisitBase.h"
#import "JCModel_newReturnVisitVisit.h"
#import "JCModel_newReturnVisitCommand.h"


NSString *const kJCModel_newReturnVisitBaseVisit = @"visit";
NSString *const kJCModel_newReturnVisitBaseCommand = @"command";


@interface JCModel_newReturnVisitBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newReturnVisitBase

@synthesize visit = _visit;
@synthesize command = _command;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.visit = [JCModel_newReturnVisitVisit modelObjectWithDictionary:[dict objectForKey:kJCModel_newReturnVisitBaseVisit]];
            self.command = [JCModel_newReturnVisitCommand modelObjectWithDictionary:[dict objectForKey:kJCModel_newReturnVisitBaseCommand]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.visit dictionaryRepresentation] forKey:kJCModel_newReturnVisitBaseVisit];
    [mutableDict setValue:[self.command dictionaryRepresentation] forKey:kJCModel_newReturnVisitBaseCommand];

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

    self.visit = [aDecoder decodeObjectForKey:kJCModel_newReturnVisitBaseVisit];
    self.command = [aDecoder decodeObjectForKey:kJCModel_newReturnVisitBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_visit forKey:kJCModel_newReturnVisitBaseVisit];
    [aCoder encodeObject:_command forKey:kJCModel_newReturnVisitBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newReturnVisitBase *copy = [[JCModel_newReturnVisitBase alloc] init];
    
    
    
    if (copy) {

        copy.visit = [self.visit copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
