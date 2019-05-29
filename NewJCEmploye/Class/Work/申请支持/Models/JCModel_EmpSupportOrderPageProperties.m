//
//  JCModel_EmpSupportOrderPageProperties.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpSupportOrderPageProperties.h"


NSString *const kJCModel_EmpSupportOrderPagePropertiesSize = @"size";
NSString *const kJCModel_EmpSupportOrderPagePropertiesStart = @"start";
NSString *const kJCModel_EmpSupportOrderPagePropertiesEnd = @"end";
NSString *const kJCModel_EmpSupportOrderPagePropertiesCount = @"count";
NSString *const kJCModel_EmpSupportOrderPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_EmpSupportOrderPagePropertiesPageNum = @"pageNum";


@interface JCModel_EmpSupportOrderPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpSupportOrderPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_EmpSupportOrderPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_EmpSupportOrderPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_EmpSupportOrderPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_EmpSupportOrderPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_EmpSupportOrderPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_EmpSupportOrderPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_EmpSupportOrderPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_EmpSupportOrderPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_EmpSupportOrderPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_EmpSupportOrderPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_EmpSupportOrderPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_EmpSupportOrderPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_EmpSupportOrderPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_EmpSupportOrderPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_EmpSupportOrderPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_EmpSupportOrderPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_EmpSupportOrderPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_EmpSupportOrderPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpSupportOrderPageProperties *copy = [[JCModel_EmpSupportOrderPageProperties alloc] init];
    
    
    
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
