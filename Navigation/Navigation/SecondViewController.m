//
//  SecondViewController.m
//  Navigation
//
//  Created by Mattia Contin  on 07/02/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, weak) IBOutlet UIView *colorView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", self.myColor);
    [self.colorView setBackgroundColor:self.myColor];
}

- (IBAction)OnBackButtonClicked:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:true];
}

-(IBAction)returnFromProfileViewController:(UIStoryboardSegue *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
