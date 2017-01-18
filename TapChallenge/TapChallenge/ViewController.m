//
//  ViewController.m
//  TapChallenge
//
//  Created by Mattia Contin  on 13/01/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

#import "ViewController.h"

#define GameTime 5 // secondi
#define TickTime 1
#define FirstLaunch @"FirstLaunch"
#define UserDefaults [NSUserDefaults standardUserDefaults]
#define Results @"UserScore"

@interface ViewController () {
    int _tapsCount;
    int _timeCount;
    NSTimer *_gameTimer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeGame];
}

- (void)viewDidAppear:(BOOL)animated {
    if([self firstAppLaunch] == true) {
        // app appena installata
        [UserDefaults setBool:true forKey:FirstLaunch];
        [UserDefaults synchronize];
    } else {
        NSMutableArray *array = [UserDefaults objectForKey:Results];
        if(array.count > 0) {
            NSNumber lastResult = array.firstObject;
            [self showLastResult:lastResult.intValue];
        }
    }
}

- (void)initializeGame {
    _tapsCount = 0;
    _timeCount = GameTime;

    [self.tapsCountLabel setText:@"Tap to play"];
    [self.timeLabel setText:[NSString stringWithFormat:@"%i", GameTime]];
}

- (void)timerTick {
    NSLog(@"tick");
    _timeCount--;
    
    [_timeLabel setText:[NSString stringWithFormat:@"%i", _timeCount]];
    
    if(_timeCount == 0) {
        [_gameTimer invalidate];
        
        UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"Game over" message:[NSString stringWithFormat:@"Your score: %i", _tapsCount] preferredStyle:NULL];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"OK premuto");
            [self saveResult];
            [self initializeGame];
        }];
        
        [alertViewController addAction:okAction];
        
        [self presentViewController:alertViewController animated: true completion: nil];
    }
}

#pragma mark - Actions

- (IBAction)buttonPressed:(UIButton *)sender {
    if(_gameTimer == nil) {
        _gameTimer = [NSTimer scheduledTimerWithTimeInterval:TickTime target:self selector:@selector(timerTick) userInfo:nil repeats:true];
    }
    
    _tapsCount++;
    [_tapsCountLabel setText:[NSString stringWithFormat:@"%i", _tapsCount]];
}

#pragma mark - Persistence

- (void)saveResult {
    NSMutableArray *array = [[UserDefaults objectForKey:Results] mutableCopy];
    if(array == nil) {
        // VECCHIO METODO
        // array = [[NSMutableArray alloc] init].mutableCopy;
        
        // NUOVO METODO
        array = @[].mutableCopy;
    }
    
    // @() crea un oggetto NSNumber
    [array addObject:@(_tapsCount)];
    
    NSLog(@"array -> %@", array);
    
    NSArray arrayToSave = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        int value1 = obj1.intValue;
        int value2 = obj2.intValue;
        
        if(value1 == value2) {
            return NSOrderedSame;
        }
        if(value1 < value2) {
            return NSOrderedAscending;
        }
        if(value1 > value2) {
            return NSOrderedDescending;
        }
    }];
    
    [UserDefaults setObject:array forKey:Results];
    [UserDefaults synchronize];
}

#pragma mark - UI
- (void)showLastResult:(int)previousResult {
    NSLog(@"dio stronzo");
    // mostra un popup col risultato precedente
    NSString *message = [NSString stringWithFormat:@"%i", previousResult];
        
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"Last score" message:message preferredStyle:NULL];
        
    [self presentViewController:alertViewController animated: true completion: nil];
}

- (bool) firstAppLaunch {
    return ![[NSUserDefaults standardUserDefaults]boolForKey:FirstLaunch];
}

@end
