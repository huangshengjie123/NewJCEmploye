//
//  MessageDetailsTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/2.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "MessageDetailsTableViewCell.h"
#import "Macro.h"
@implementation MessageDetailsTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
        self.backgroundColor = JCColorWithe;
    }
    return self;
}

-(void)addViews {
    
}

@end
