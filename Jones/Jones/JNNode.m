//
//  JNNode.m
//  Jones
//
//  Created by Daniel Sundström on 2012-07-22.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JNNode.h"

@implementation JNNode



+(NSArray*)nodesInDecryptQueue{
    NSDictionary *node1 = [NSDictionary dictionaryWithObjectsAndKeys:@"Node #12445", @"name", @"12:33:13",@"connected_at", [NSNumber numberWithInt:69], @"progress", nil];
    NSDictionary *node2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Node #12446", @"name", @"12:38:13",@"connected_at", [NSNumber numberWithInt:12], @"progress", nil];
    return [NSArray arrayWithObjects:node1, node2, nil];
}

+(NSArray*)archivedNodes{
    NSDictionary *node1 = [NSDictionary dictionaryWithObjectsAndKeys:@"Node #12447", @"name", @"12:33:13",@"connected_at", [NSNumber numberWithInt:1], @"progress", nil];
    NSDictionary *node2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Node #12448", @"name", @"12:38:13",@"connected_at", [NSNumber numberWithInt:89], @"progress", nil];
    return [NSArray arrayWithObjects:node1, node2, nil];    
}

@end
