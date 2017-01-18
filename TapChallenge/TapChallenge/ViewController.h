//
//  ViewController.h
//  TapChallenge
//
//  Created by Mattia Contin  on 13/01/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *tapsCountLabel;

@property (nonatomic, weak) IBOutlet UILabel *timeLabel;

-(void)initializeGame;

-(IBAction)buttonPressed:(id)sender;

@end

