//
//  JNNodeCellSectionHeader.m
//  Jones
//
//  Created by Daniel Sundström on 2012-07-23.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JNNodeCellSectionHeader.h"

@implementation JNNodeCellSectionHeader
@synthesize sectionTitle;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"section_bg.png"]];
        CGRect f = bg.frame;
        f.origin = CGPointMake(0, 19.0f);
        bg.frame = f;
        [self addSubview:bg];
        
        self.sectionTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, 19, 120, 19)];
        self.sectionTitle.textColor = [UIColor whiteColor];
        self.sectionTitle.backgroundColor = [UIColor clearColor];
        self.sectionTitle.shadowColor = [UIColor blackColor];
        self.sectionTitle.shadowOffset = CGSizeMake(1.0, 1.0);

        self.sectionTitle.font   = [UIFont fontWithName:@"Futura-CondensedMedium" size:16.0f];
        [self addSubview:self.sectionTitle];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
