//
//  ViewController.m
//  SingleViewApplication
//
//  Created by Mattia Contin  on 11/01/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    int tapCount;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NSLog(@"2");
    NSString *stringa = @"Test";
    int test = 10;
    // NSLog(@"Hello world! %@, %i \n %@ \n intero da stampare: %i", @"madonna puttana", 123, stringa, test);
    // Do any additional setup after loading the view, typically from a nib.
    
    [self updateText:@"updated text"];
    
    for (int i = 0; i < 10; i++) {
        NSString *string = [NSString stringWithFormat:@"%i", i];
        [self updateText:string];
    }
    
    NSArray *array = @[@"primo", @"secondo", @123, @2.12];
    NSLog(@"%@", array);
    
    [self.inputField setText:@"Mario"];
    
    
    
    tapCount = 0;
}

// col carattere + si identifica una funzione statica
- (void)viewDidAppear:(BOOL)animated {
    // NSLog(@"4");
}

- (void)updateText:(NSString *)newText {
    [self.helloWorldLabel setText:newText];
}

- (void)viewWillAppear:(BOOL)animated {
    // NSLog(@"3");
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // NSLog(@"1");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(IBAction)usernameTextFieldDidEndOnExit:(id)sender {
    NSLog(@"usernameTextFieldDidEndOnExit");
}

-(IBAction)usernameTextFieldEditingDidEnd:(UITextField *)sender {
    NSLog(@"usernameTextFieldEditingDidEnd");

    NSLog(@"\nInput utente: %@", sender.text);
}

-(IBAction)buttonPressed:(id)sender{
    tapCount++;
    NSLog(@"Hai premuto %i volte", tapCount);
    [self.helloWorldLabel setText:[NSString stringWithFormat:@"%i", tapCount] ];
}




@end
