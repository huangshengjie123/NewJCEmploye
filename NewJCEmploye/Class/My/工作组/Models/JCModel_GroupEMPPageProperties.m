//
//  JCModel_GroupEMPPageProperties.m
//
//  Created by   on 2018/11/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_GroupEMPPageProperties.h"


NSString *const kJCModel_GroupEMPPagePropertiesSize = @"size";
NSString *const kJCModel_GroupEMPPagePropertiesStart = @"start";
NSString *const kJCModel_GroupEMPPagePropertiesEnd = @"end";
NSString *const kJCModel_GroupEMPPagePropertiesCount = @"count";
NSString *const kJCModel_GroupEMPPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_GroupEMPPagePropertiesPageNum = @"pageNum";


@interface JCModel_GroupEMPPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_GroupEMPPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_GroupEMPPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_GroupEMPPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_GroupEMPPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_GroupEMPPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_GroupEMPPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_GroupEMPPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_GroupEMPPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_GroupEMPPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_GroupEMPPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_GroupEMPPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_GroupEMPPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_GroupEMPPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_GroupEMPPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_GroupEMPPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_GroupEMPPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_GroupEMPPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_GroupEMPPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_GroupEMPPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_GroupEMPPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_GroupEMPPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_GroupEMPPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_GroupEMPPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_GroupEMPPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_GroupEMPPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_GroupEMPPageProperties *copy = [[JCModel_GroupEMPPageProperties alloc] init];
    
    
    
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
