//
//  JCModel_MyFranchiserGrantOrdersPageProperties.m
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyFranchiserGrantOrdersPageProperties.h"


NSString *const kJCModel_MyFranchiserGrantOrdersPagePropertiesSize = @"size";
NSString *const kJCModel_MyFranchiserGrantOrdersPagePropertiesStart = @"start";
NSString *const kJCModel_MyFranchiserGrantOrdersPagePropertiesEnd = @"end";
NSString *const kJCModel_MyFranchiserGrantOrdersPagePropertiesCount = @"count";
NSString *const kJCModel_MyFranchiserGrantOrdersPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_MyFranchiserGrantOrdersPagePropertiesPageNum = @"pageNum";


@interface JCModel_MyFranchiserGrantOrdersPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyFranchiserGrantOrdersPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_MyFranchiserGrantOrdersPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MyFranchiserGrantOrdersPageProperties *copy = [[JCModel_MyFranchiserGrantOrdersPageProperties alloc] init];
    
    
    
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
