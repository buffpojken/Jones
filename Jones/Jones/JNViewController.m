//
//  JNViewController.m
//  Jones
//
//  Created by Daniel Sundström on 2012-07-22.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JNViewController.h"
#import "GradientButton.h"
#import "JNNodeCell.h"
#import "JNNode.h"
#import "JNNodeCellSectionHeader.h"

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
    
    [self setupBasicGUI];
    [self setupTableView];

    UITapGestureRecognizer *tpG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(configure:)];
    tpG.numberOfTapsRequired = 5;
    [self.view addGestureRecognizer:tpG];
    [tpG release];
}

-(void)configure:(UITapGestureRecognizer*)tpg{
    NSLog(@"Configure...");
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

#pragma UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"NodeCell";
    JNNodeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        NSArray *topObject = [[NSBundle mainBundle] loadNibNamed:@"JNNodeCellView" owner:self options:nil];
        cell = [topObject objectAtIndex:0];
    }
    
    NSDictionary *data;
    if(indexPath.section == 0){
        data = [[JNNode nodesInDecryptQueue] objectAtIndex:indexPath.row];
    }else{
        data = [[JNNode archivedNodes] objectAtIndex:indexPath.row];
    }
    cell.name.text = [data objectForKey:@"name"];
    cell.date.text = [data objectForKey:@"connected_at"];
    cell.progress.text = [NSString stringWithFormat:@"%@ %%", [[data objectForKey:@"progress"] stringValue]];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return [[JNNode nodesInDecryptQueue] count];
    }else if(section == 1){
        return [[JNNode archivedNodes] count];
    }else{
        return 0;
    }
}

#pragma UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Bongo...");
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 38.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JNNodeCellSectionHeader *header = [[[JNNodeCellSectionHeader alloc] initWithFrame:CGRectMake(0, 0, 165, 38)] autorelease];
    if(section == 0){
        header.sectionTitle.text = @"DECRYPTION JOBS";
    }else if(section == 1){
        header.sectionTitle.text = @"ARCHIVES";     
    }
    return header;
}

#pragma Misc
// Misc

-(void)setupTableView{
    UITableView *mainView = [[[UITableView alloc] initWithFrame:CGRectMake(5.0f, 120.0f, 310, 345)] autorelease];
    mainView.delegate = self;
    mainView.dataSource = self;
    mainView.backgroundColor = [UIColor clearColor];
    mainView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mainView];
}


-(void)setupBasicGUI{
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
    self.titleLabel.shadowColor = [UIColor blackColor];
    self.titleLabel.shadowOffset = CGSizeMake(0.0, -1.0);

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
    cnt.titleLabel.shadowColor = [UIColor blackColor];
    cnt.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
    [cnt addTarget:self action:@selector(connectWithNode) forControlEvents:UIControlEventTouchUpInside];
    [cnt useBlackStyle];
    
    [self.view addSubview:cnt];
}

@end
