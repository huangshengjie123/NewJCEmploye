//
//  JCModel_NewWorkingGroupBase.m
//
//  Created by   on 2018/11/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewWorkingGroupBase.h"
#import "JCModel_NewWorkingGroupWorkGroup.h"


NSString *const kJCModel_NewWorkingGroupBaseCommand = @"command";
NSString *const kJCModel_NewWorkingGroupBaseWorkGroup = @"workGroup";


@interface JCModel_NewWorkingGroupBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewWorkingGroupBase

@synthesize command = _command;
@synthesize workGroup = _workGroup;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_NewWorkingGroupBaseCommand fromDictionary:dict];
            self.workGroup = [JCModel_NewWorkingGroupWorkGroup modelObjectWithDictionary:[dict objectForKey:kJCModel_NewWorkingGroupBaseWorkGroup]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_NewWorkingGroupBaseCommand];
    [mutableDict setValue:[self.workGroup dictionaryRepresentation] forKey:kJCModel_NewWorkingGroupBaseWorkGroup];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_NewWorkingGroupBaseCommand];
    self.workGroup = [aDecoder decodeObjectForKey:kJCModel_NewWorkingGroupBaseWorkGroup];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_NewWorkingGroupBaseCommand];
    [aCoder encodeObject:_workGroup forKey:kJCModel_NewWorkingGroupBaseWorkGroup];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewWorkingGroupBase *copy = [[JCModel_NewWorkingGroupBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.workGroup = [self.workGroup copyWithZone:zone];
    }
    
    return copy;
}


@end
