//
//  ViewController.m
//  Navigation
//
//  Created by Mattia Contin  on 07/02/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:1 repeats:false block:^(NSTimer * _Nonnull timer) {
        [self doSegue];
    }];
    [timer fire];
}

- (void)doSegue {
    [self performSegueWithIdentifier:@"controllerSegue" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIColor *color;
    if ([sender isKindOfClass:[UIButton class]]) {
        color = [UIColor blueColor];
        NSLog(@"Segue bottone");
    }
    if ([segue.identifier isEqualToString:@"controllerSegue"]) {
        color = [UIColor redColor];
        NSLog(@"Segue controller");
    }
    
    SecondViewController *secondVC = segue.destinationViewController;
    [secondVC setMyColor:color];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
