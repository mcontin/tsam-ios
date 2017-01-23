//
//  ViewController.h
//  TapChallenge
//
//  Created by Mattia Contin  on 13/01/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreTableViewController.h"

@interface GameViewController : UIViewController <ScoreTableViewDelegate>

@property (nonatomic, weak) IBOutlet UILabel *tapsCountLabel;
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;

-(IBAction)buttonPressed:(id)sender;

-(IBAction)tapGestureRecognizerDidRecognizeTap:(id)sender;

@end

