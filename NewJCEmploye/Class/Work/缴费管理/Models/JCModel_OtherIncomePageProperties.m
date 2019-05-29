//
//  JCModel_OtherIncomePageProperties.m
//
//  Created by   on 2019/3/12
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_OtherIncomePageProperties.h"


NSString *const kJCModel_OtherIncomePagePropertiesSize = @"size";
NSString *const kJCModel_OtherIncomePagePropertiesPageNum = @"pageNum";
NSString *const kJCModel_OtherIncomePagePropertiesEnd = @"end";
NSString *const kJCModel_OtherIncomePagePropertiesCount = @"count";
NSString *const kJCModel_OtherIncomePagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_OtherIncomePagePropertiesStart = @"start";


@interface JCModel_OtherIncomePageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_OtherIncomePageProperties

@synthesize size = _size;
@synthesize pageNum = _pageNum;
@synthesize endProperty = _endProperty;
@synthesize count = _count;
@synthesize totalPage = _totalPage;
@synthesize start = _start;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.size = [[self objectOrNilForKey:kJCModel_OtherIncomePagePropertiesSize fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_OtherIncomePagePropertiesPageNum fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_OtherIncomePagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_OtherIncomePagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_OtherIncomePagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_OtherIncomePagePropertiesStart fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_OtherIncomePagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_OtherIncomePagePropertiesPageNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_OtherIncomePagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_OtherIncomePagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_OtherIncomePagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_OtherIncomePagePropertiesStart];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_OtherIncomePagePropertiesSize];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_OtherIncomePagePropertiesPageNum];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_OtherIncomePagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_OtherIncomePagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_OtherIncomePagePropertiesTotalPage];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_OtherIncomePagePropertiesStart];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_OtherIncomePagePropertiesSize];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_OtherIncomePagePropertiesPageNum];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_OtherIncomePagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_OtherIncomePagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_OtherIncomePagePropertiesTotalPage];
    [aCoder encodeDouble:_start forKey:kJCModel_OtherIncomePagePropertiesStart];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_OtherIncomePageProperties *copy = [[JCModel_OtherIncomePageProperties alloc] init];
    
    
    
    if (copy) {

        copy.size = self.size;
        copy.pageNum = self.pageNum;
        copy.endProperty = self.endProperty;
        copy.count = self.count;
        copy.totalPage = self.totalPage;
        copy.start = self.start;
    }
    
    return copy;
}


@end
