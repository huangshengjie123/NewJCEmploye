//
//  JCModel_CustomerPageProperties.m
//
//  Created by   on 2018/4/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CustomerPageProperties.h"


NSString *const kJCModel_CustomerPagePropertiesSize = @"size";
NSString *const kJCModel_CustomerPagePropertiesPageNum = @"pageNum";
NSString *const kJCModel_CustomerPagePropertiesEnd = @"end";
NSString *const kJCModel_CustomerPagePropertiesCount = @"count";
NSString *const kJCModel_CustomerPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_CustomerPagePropertiesStart = @"start";


@interface JCModel_CustomerPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CustomerPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_CustomerPagePropertiesSize fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_CustomerPagePropertiesPageNum fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_CustomerPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_CustomerPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_CustomerPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_CustomerPagePropertiesStart fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_CustomerPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_CustomerPagePropertiesPageNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_CustomerPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_CustomerPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_CustomerPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_CustomerPagePropertiesStart];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_CustomerPagePropertiesSize];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_CustomerPagePropertiesPageNum];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_CustomerPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_CustomerPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_CustomerPagePropertiesTotalPage];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_CustomerPagePropertiesStart];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_CustomerPagePropertiesSize];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_CustomerPagePropertiesPageNum];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_CustomerPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_CustomerPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_CustomerPagePropertiesTotalPage];
    [aCoder encodeDouble:_start forKey:kJCModel_CustomerPagePropertiesStart];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CustomerPageProperties *copy = [[JCModel_CustomerPageProperties alloc] init];
    
    
    
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
