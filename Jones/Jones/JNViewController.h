//
//  JNViewController.h
//  Jones
//
//  Created by Daniel Sundström on 2012-07-22.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JNViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    UIToolbar *tb;
    UILabel *titleLabel;
}

@property (nonatomic, retain) UILabel *titleLabel;

-(void)connectWithNode;
-(void)configure:(UITapGestureRecognizer*)tpg;


// Misc setup
-(void)setupBasicGUI;
-(void)setupTableView;


@end
