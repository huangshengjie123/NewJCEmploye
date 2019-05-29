//
//  JCModel_ProabtionCustomPageProperties.m
//
//  Created by   on 2018/4/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ProabtionCustomPageProperties.h"


NSString *const kJCModel_ProabtionCustomPagePropertiesSize = @"size";
NSString *const kJCModel_ProabtionCustomPagePropertiesStart = @"start";
NSString *const kJCModel_ProabtionCustomPagePropertiesEnd = @"end";
NSString *const kJCModel_ProabtionCustomPagePropertiesCount = @"count";
NSString *const kJCModel_ProabtionCustomPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_ProabtionCustomPagePropertiesPageNum = @"pageNum";


@interface JCModel_ProabtionCustomPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ProabtionCustomPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_ProabtionCustomPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_ProabtionCustomPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_ProabtionCustomPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_ProabtionCustomPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_ProabtionCustomPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_ProabtionCustomPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_ProabtionCustomPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_ProabtionCustomPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_ProabtionCustomPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_ProabtionCustomPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_ProabtionCustomPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_ProabtionCustomPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_ProabtionCustomPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_ProabtionCustomPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_ProabtionCustomPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_ProabtionCustomPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_ProabtionCustomPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_ProabtionCustomPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_ProabtionCustomPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_ProabtionCustomPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_ProabtionCustomPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_ProabtionCustomPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_ProabtionCustomPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_ProabtionCustomPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ProabtionCustomPageProperties *copy = [[JCModel_ProabtionCustomPageProperties alloc] init];
    
    
    
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
