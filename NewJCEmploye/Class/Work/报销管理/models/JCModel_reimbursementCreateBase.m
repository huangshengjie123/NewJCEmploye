//
//  JCModel_reimbursementCreateBase.m
//
//  Created by   on 2019/3/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_reimbursementCreateBase.h"
#import "JCModel_reimbursementCreateReimbursementItems.h"


NSString *const kJCModel_reimbursementCreateBaseFaOrdrerId = @"faOrdrerId";
NSString *const kJCModel_reimbursementCreateBaseComment = @"comment";
NSString *const kJCModel_reimbursementCreateBaseType = @"type";
NSString *const kJCModel_reimbursementCreateBaseReimbursementItems = @"reimbursementItems";


@interface JCModel_reimbursementCreateBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_reimbursementCreateBase

@synthesize faOrdrerId = _faOrdrerId;
@synthesize comment = _comment;
@synthesize type = _type;
@synthesize reimbursementItems = _reimbursementItems;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.faOrdrerId = [self objectOrNilForKey:kJCModel_reimbursementCreateBaseFaOrdrerId fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kJCModel_reimbursementCreateBaseComment fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_reimbursementCreateBaseType fromDictionary:dict];
    NSObject *receivedJCModel_reimbursementCreateReimbursementItems = [dict objectForKey:kJCModel_reimbursementCreateBaseReimbursementItems];
    NSMutableArray *parsedJCModel_reimbursementCreateReimbursementItems = [NSMutableArray array];
    
    if ([receivedJCModel_reimbursementCreateReimbursementItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_reimbursementCreateReimbursementItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_reimbursementCreateReimbursementItems addObject:[JCModel_reimbursementCreateReimbursementItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_reimbursementCreateReimbursementItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_reimbursementCreateReimbursementItems addObject:[JCModel_reimbursementCreateReimbursementItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_reimbursementCreateReimbursementItems]];
    }

    self.reimbursementItems = [NSArray arrayWithArray:parsedJCModel_reimbursementCreateReimbursementItems];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.faOrdrerId forKey:kJCModel_reimbursementCreateBaseFaOrdrerId];
    [mutableDict setValue:self.comment forKey:kJCModel_reimbursementCreateBaseComment];
    [mutableDict setValue:self.type forKey:kJCModel_reimbursementCreateBaseType];
    NSMutableArray *tempArrayForReimbursementItems = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.reimbursementItems) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForReimbursementItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForReimbursementItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForReimbursementItems] forKey:kJCModel_reimbursementCreateBaseReimbursementItems];

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

    self.faOrdrerId = [aDecoder decodeObjectForKey:kJCModel_reimbursementCreateBaseFaOrdrerId];
    self.comment = [aDecoder decodeObjectForKey:kJCModel_reimbursementCreateBaseComment];
    self.type = [aDecoder decodeObjectForKey:kJCModel_reimbursementCreateBaseType];
    self.reimbursementItems = [aDecoder decodeObjectForKey:kJCModel_reimbursementCreateBaseReimbursementItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_faOrdrerId forKey:kJCModel_reimbursementCreateBaseFaOrdrerId];
    [aCoder encodeObject:_comment forKey:kJCModel_reimbursementCreateBaseComment];
    [aCoder encodeObject:_type forKey:kJCModel_reimbursementCreateBaseType];
    [aCoder encodeObject:_reimbursementItems forKey:kJCModel_reimbursementCreateBaseReimbursementItems];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_reimbursementCreateBase *copy = [[JCModel_reimbursementCreateBase alloc] init];
    
    
    
    if (copy) {

        copy.faOrdrerId = [self.faOrdrerId copyWithZone:zone];
        copy.comment = [self.comment copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.reimbursementItems = [self.reimbursementItems copyWithZone:zone];
    }
    
    return copy;
}


@end
