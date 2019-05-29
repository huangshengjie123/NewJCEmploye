//
//  JCModel_businessTripPageProperties.m
//
//  Created by   on 2019/3/20
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_businessTripPageProperties.h"


NSString *const kJCModel_businessTripPagePropertiesSize = @"size";
NSString *const kJCModel_businessTripPagePropertiesStart = @"start";
NSString *const kJCModel_businessTripPagePropertiesEnd = @"end";
NSString *const kJCModel_businessTripPagePropertiesCount = @"count";
NSString *const kJCModel_businessTripPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_businessTripPagePropertiesPageNum = @"pageNum";


@interface JCModel_businessTripPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_businessTripPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_businessTripPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_businessTripPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_businessTripPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_businessTripPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_businessTripPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_businessTripPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_businessTripPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_businessTripPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_businessTripPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_businessTripPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_businessTripPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_businessTripPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_businessTripPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_businessTripPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_businessTripPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_businessTripPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_businessTripPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_businessTripPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_businessTripPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_businessTripPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_businessTripPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_businessTripPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_businessTripPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_businessTripPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_businessTripPageProperties *copy = [[JCModel_businessTripPageProperties alloc] init];
    
    
    
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
