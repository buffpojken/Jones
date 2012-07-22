//
//  JNNodeCell.h
//  Jones
//
//  Created by Daniel Sundström on 2012-07-22.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JNNodeCell : UITableViewCell{
    IBOutlet UIImageView *image; 
    IBOutlet UILabel *name; 
    IBOutlet UILabel *date;
    IBOutlet UILabel *progress;
}

@property (nonatomic, retain) IBOutlet UIImageView *image;
@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic, retain) IBOutlet UILabel *date;
@property (nonatomic, retain) IBOutlet UILabel *progress;


@end
