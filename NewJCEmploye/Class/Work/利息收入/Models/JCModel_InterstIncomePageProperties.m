//
//  JCModel_InterstIncomePageProperties.m
//
//  Created by   on 2019/3/13
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InterstIncomePageProperties.h"


NSString *const kJCModel_InterstIncomePagePropertiesSize = @"size";
NSString *const kJCModel_InterstIncomePagePropertiesStart = @"start";
NSString *const kJCModel_InterstIncomePagePropertiesEnd = @"end";
NSString *const kJCModel_InterstIncomePagePropertiesCount = @"count";
NSString *const kJCModel_InterstIncomePagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_InterstIncomePagePropertiesPageNum = @"pageNum";


@interface JCModel_InterstIncomePageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InterstIncomePageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_InterstIncomePagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_InterstIncomePagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_InterstIncomePagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_InterstIncomePagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_InterstIncomePagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_InterstIncomePagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_InterstIncomePagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_InterstIncomePagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_InterstIncomePagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_InterstIncomePagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_InterstIncomePagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_InterstIncomePagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomePagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomePagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomePagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomePagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomePagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomePagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_InterstIncomePagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_InterstIncomePagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_InterstIncomePagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_InterstIncomePagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_InterstIncomePagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_InterstIncomePagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InterstIncomePageProperties *copy = [[JCModel_InterstIncomePageProperties alloc] init];
    
    
    
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
