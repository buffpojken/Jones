//
//  JNNodeCell.m
//  Jones
//
//  Created by Daniel Sundström on 2012-07-22.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JNNodeCell.h"

@implementation JNNodeCell
@synthesize image,name,date,progress;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib{
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bg.png"]];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    name.textColor  = [UIColor whiteColor];
    name.font       = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:16.0f];
    
    date.textColor = [UIColor whiteColor];
    
    progress.textColor          = [UIColor whiteColor];
    progress.textAlignment      = UITextAlignmentCenter; 
    progress.font               = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:24.0f];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
