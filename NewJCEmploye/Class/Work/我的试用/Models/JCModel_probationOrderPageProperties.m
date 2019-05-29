//
//  JCModel_probationOrderPageProperties.m
//
//  Created by   on 2018/10/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_probationOrderPageProperties.h"


NSString *const kJCModel_probationOrderPagePropertiesSize = @"size";
NSString *const kJCModel_probationOrderPagePropertiesStart = @"start";
NSString *const kJCModel_probationOrderPagePropertiesEnd = @"end";
NSString *const kJCModel_probationOrderPagePropertiesCount = @"count";
NSString *const kJCModel_probationOrderPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_probationOrderPagePropertiesPageNum = @"pageNum";


@interface JCModel_probationOrderPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_probationOrderPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_probationOrderPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_probationOrderPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_probationOrderPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_probationOrderPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_probationOrderPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_probationOrderPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_probationOrderPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_probationOrderPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_probationOrderPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_probationOrderPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_probationOrderPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_probationOrderPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_probationOrderPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_probationOrderPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_probationOrderPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_probationOrderPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_probationOrderPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_probationOrderPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_probationOrderPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_probationOrderPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_probationOrderPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_probationOrderPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_probationOrderPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_probationOrderPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_probationOrderPageProperties *copy = [[JCModel_probationOrderPageProperties alloc] init];
    
    
    
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
