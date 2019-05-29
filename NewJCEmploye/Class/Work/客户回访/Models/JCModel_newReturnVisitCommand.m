//
//  JCModel_newReturnVisitCommand.m
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newReturnVisitCommand.h"
#import "JCModel_newReturnVisitInOutOrder.h"


NSString *const kJCModel_newReturnVisitCommandCommand = @"command";
NSString *const kJCModel_newReturnVisitCommandCurrent = @"current";
NSString *const kJCModel_newReturnVisitCommandInOutOrder = @"inOutOrder";


@interface JCModel_newReturnVisitCommand ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newReturnVisitCommand

@synthesize command = _command;
@synthesize current = _current;
@synthesize inOutOrder = _inOutOrder;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_newReturnVisitCommandCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_newReturnVisitCommandCurrent fromDictionary:dict];
            self.inOutOrder = [JCModel_newReturnVisitInOutOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_newReturnVisitCommandInOutOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_newReturnVisitCommandCommand];
    [mutableDict setValue:self.current forKey:kJCModel_newReturnVisitCommandCurrent];
    [mutableDict setValue:[self.inOutOrder dictionaryRepresentation] forKey:kJCModel_newReturnVisitCommandInOutOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_newReturnVisitCommandCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_newReturnVisitCommandCurrent];
    self.inOutOrder = [aDecoder decodeObjectForKey:kJCModel_newReturnVisitCommandInOutOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_newReturnVisitCommandCommand];
    [aCoder encodeObject:_current forKey:kJCModel_newReturnVisitCommandCurrent];
    [aCoder encodeObject:_inOutOrder forKey:kJCModel_newReturnVisitCommandInOutOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newReturnVisitCommand *copy = [[JCModel_newReturnVisitCommand alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.inOutOrder = [self.inOutOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
