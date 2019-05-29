//
//  JCModel_NewDostribution1PageProperties.m
//
//  Created by   on 2018/10/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDostribution1PageProperties.h"


NSString *const kJCModel_NewDostribution1PagePropertiesSize = @"size";
NSString *const kJCModel_NewDostribution1PagePropertiesStart = @"start";
NSString *const kJCModel_NewDostribution1PagePropertiesEnd = @"end";
NSString *const kJCModel_NewDostribution1PagePropertiesCount = @"count";
NSString *const kJCModel_NewDostribution1PagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_NewDostribution1PagePropertiesPageNum = @"pageNum";


@interface JCModel_NewDostribution1PageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDostribution1PageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_NewDostribution1PagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_NewDostribution1PagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_NewDostribution1PagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_NewDostribution1PagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_NewDostribution1PagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_NewDostribution1PagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_NewDostribution1PagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_NewDostribution1PagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_NewDostribution1PagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_NewDostribution1PagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_NewDostribution1PagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_NewDostribution1PagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1PagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1PagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1PagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1PagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1PagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1PagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_NewDostribution1PagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_NewDostribution1PagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_NewDostribution1PagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_NewDostribution1PagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_NewDostribution1PagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_NewDostribution1PagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDostribution1PageProperties *copy = [[JCModel_NewDostribution1PageProperties alloc] init];
    
    
    
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
