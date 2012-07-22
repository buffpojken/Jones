//
//  JNViewController.m
//  Jones
//
//  Created by Daniel Sundström on 2012-07-22.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JNViewController.h"
#import "GradientButton.h"

@interface JNViewController ()

@end

@implementation JNViewController
@synthesize titleLabel;

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imgView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]] autorelease];
    [self.view addSubview:imgView];

    tb = [UIToolbar new];
    [tb sizeToFit];
    tb.barStyle = UIBarStyleBlackTranslucent;
    
    NSMutableArray *itms = [[NSMutableArray alloc] init];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [itms addObject:spacer];
    [spacer release],
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 11.0f, 170, 21.0f)];
    self.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:22.0f];
    self.titleLabel.textAlignment = UITextAlignmentCenter;
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setTextColor:[UIColor whiteColor]];    
    self.titleLabel.text = @"SRLC BY L1N4";
    
    UIBarButtonItem *label = [[UIBarButtonItem alloc] initWithCustomView:self.titleLabel];
    [itms addObject:label];
    [label release];
    
    UIBarButtonItem *spacer2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [itms addObject:spacer2];
    [spacer2 release];
    
    tb.items = itms;
    [self.view addSubview:tb];

    GradientButton *cnt = [GradientButton buttonWithType:UIButtonTypeCustom];
    cnt.frame           = CGRectMake(5, 50, 310, 70);
    
    cnt.titleLabel.textAlignment = UITextAlignmentCenter;
    cnt.titleLabel.font = [UIFont fontWithName:@"Futura-CondensedMedium" size:18.0f];
    [cnt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cnt setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [cnt setTitle:@"Connect to Node" forState:UIControlStateNormal];
    [cnt addTarget:self action:@selector(connectWithNode) forControlEvents:UIControlEventTouchUpInside];
    [cnt useBlackStyle];
    
    [self.view addSubview:cnt];
}

-(void)connectWithNode{
    NSLog(@"Start rock and roll...");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
