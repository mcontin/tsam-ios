//
//  ViewController.m
//  DemoCrispyBacon
//
//  Created by Mattia Contin  on 25/01/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (IBAction)buttonPressed:(UIButton *)sender {
    NSLog(@"Button pressed: %@", sender.currentTitle);
}

@end
