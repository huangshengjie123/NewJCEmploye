//
//  JCModel_ScanCodeBase.m
//
//  Created by   on 2018/6/1
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ScanCodeBase.h"
#import "JCModel_ScanCodeInOutOrder.h"


NSString *const kJCModel_ScanCodeBaseCheckcode = @"checkcode";
NSString *const kJCModel_ScanCodeBaseCurrent = @"current";
NSString *const kJCModel_ScanCodeBaseInOutOrder = @"inOutOrder";
NSString *const kJCModel_ScanCodeBaseCommand = @"command";


@interface JCModel_ScanCodeBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ScanCodeBase

@synthesize checkcode = _checkcode;
@synthesize current = _current;
@synthesize inOutOrder = _inOutOrder;
@synthesize command = _command;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.checkcode = [self objectOrNilForKey:kJCModel_ScanCodeBaseCheckcode fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_ScanCodeBaseCurrent fromDictionary:dict];
            self.inOutOrder = [JCModel_ScanCodeInOutOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_ScanCodeBaseInOutOrder]];
            self.command = [self objectOrNilForKey:kJCModel_ScanCodeBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.checkcode forKey:kJCModel_ScanCodeBaseCheckcode];
    [mutableDict setValue:self.current forKey:kJCModel_ScanCodeBaseCurrent];
    [mutableDict setValue:[self.inOutOrder dictionaryRepresentation] forKey:kJCModel_ScanCodeBaseInOutOrder];
    [mutableDict setValue:self.command forKey:kJCModel_ScanCodeBaseCommand];

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

    self.checkcode = [aDecoder decodeObjectForKey:kJCModel_ScanCodeBaseCheckcode];
    self.current = [aDecoder decodeObjectForKey:kJCModel_ScanCodeBaseCurrent];
    self.inOutOrder = [aDecoder decodeObjectForKey:kJCModel_ScanCodeBaseInOutOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_ScanCodeBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_checkcode forKey:kJCModel_ScanCodeBaseCheckcode];
    [aCoder encodeObject:_current forKey:kJCModel_ScanCodeBaseCurrent];
    [aCoder encodeObject:_inOutOrder forKey:kJCModel_ScanCodeBaseInOutOrder];
    [aCoder encodeObject:_command forKey:kJCModel_ScanCodeBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ScanCodeBase *copy = [[JCModel_ScanCodeBase alloc] init];
    
    
    
    if (copy) {

        copy.checkcode = [self.checkcode copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.inOutOrder = [self.inOutOrder copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
