//
//  JCmodel_newCustomer2PageProperties.m
//
//  Created by   on 2019/3/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCmodel_newCustomer2PageProperties.h"


NSString *const kJCmodel_newCustomer2PagePropertiesSize = @"size";
NSString *const kJCmodel_newCustomer2PagePropertiesStart = @"start";
NSString *const kJCmodel_newCustomer2PagePropertiesEnd = @"end";
NSString *const kJCmodel_newCustomer2PagePropertiesCount = @"count";
NSString *const kJCmodel_newCustomer2PagePropertiesTotalPage = @"totalPage";
NSString *const kJCmodel_newCustomer2PagePropertiesPageNum = @"pageNum";


@interface JCmodel_newCustomer2PageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCmodel_newCustomer2PageProperties

@synthesize size = _size;
@synthesize start = _start;
@synthesize endProperty = _endProperty;
@synthesize count = _count;
@synthesize totalPage = _totalPage;
@synthesize pageNum = _pageNum;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.size = [[self objectOrNilForKey:kJCmodel_newCustomer2PagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCmodel_newCustomer2PagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCmodel_newCustomer2PagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCmodel_newCustomer2PagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCmodel_newCustomer2PagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCmodel_newCustomer2PagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCmodel_newCustomer2PagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCmodel_newCustomer2PagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCmodel_newCustomer2PagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCmodel_newCustomer2PagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCmodel_newCustomer2PagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCmodel_newCustomer2PagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCmodel_newCustomer2PagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCmodel_newCustomer2PagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCmodel_newCustomer2PagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCmodel_newCustomer2PagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCmodel_newCustomer2PagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCmodel_newCustomer2PagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCmodel_newCustomer2PagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCmodel_newCustomer2PagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCmodel_newCustomer2PagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCmodel_newCustomer2PagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCmodel_newCustomer2PagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCmodel_newCustomer2PagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCmodel_newCustomer2PageProperties *copy = [[JCmodel_newCustomer2PageProperties alloc] init];
    
    
    
    if (copy) {

        copy.size = self.size;
        copy.start = self.start;
        copy.endProperty = self.endProperty;
        copy.count = self.count;
        copy.totalPage = self.totalPage;
        copy.pageNum = self.pageNum;
    }
    
    return copy;
}


@end
