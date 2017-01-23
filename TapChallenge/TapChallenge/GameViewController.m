//
//  ViewController.m
//  TapChallenge
//
//  Created by Mattia Contin  on 13/01/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

#import "GameViewController.h"
#import "ScoreTableViewController.h"

#define GameTime 30 // secondi
#define TickTime 1
#define FirstLaunch @"FirstLaunch"
#define UserDefaults [NSUserDefaults standardUserDefaults]
#define Results @"UserScore"

@interface GameViewController () {
    int _tapsCount;
    int _timeCount;
    NSTimer *_gameTimer;
}
@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeGame];
    
    self.title = @"Tap challenge";
    
    // creo una nuova label e la inserisco nell'interfaccia da codice
    UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 100, 40)];
    [newLabel setText:@"gneee"];
    [newLabel setBackgroundColor:[UIColor blueColor]];
    [newLabel setTextColor:[UIColor yellowColor]];
    [newLabel setFont:[UIFont systemFontOfSize: 20]];
    
    [self.view addSubview:newLabel];
}

- (void)viewDidAppear:(BOOL)animated {
    if([self firstAppLaunch] == true) {
        // app appena installata
        [UserDefaults setBool:true forKey:FirstLaunch];
        [UserDefaults synchronize];
    } else {
        /*
        NSMutableArray *array = [UserDefaults objectForKey:Results];
        if(array.count > 0) {
            NSNumber *lastResult = array.firstObject;
            [self showLastResult:lastResult.intValue];
        }
         */
    }
    
    // creo il pulsante per vedere la lista di punteggi
    UIBarButtonItem *scoresButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(scoresButtonPressed)];
    // posiziono il pulsante con peso a destra della navigation bar
    self.navigationItem.rightBarButtonItem = scoresButton;
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
        _gameTimer = nil;
        
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

- (void)viewWillDisappear:(BOOL)animated {
    
}

- (void)pauseGame {
    
}

- (void)resumeGame {
    
}

#pragma mark - Actions

- (IBAction)buttonPressed:(UIButton *)sender {
}

- (IBAction)tapGestureRecognizerDidRecognizeTap:(id)sender {
    if(_gameTimer == nil) {
        _gameTimer = [NSTimer scheduledTimerWithTimeInterval:TickTime target:self selector:@selector(timerTick) userInfo:nil repeats:true];
    }
    
    _tapsCount++;
    [_tapsCountLabel setText:[NSString stringWithFormat:@"%i", _tapsCount]];
}

- (void)scoresButtonPressed {
    // un view controller si può creare anche da codice
    // UIViewController *viewController = [[UIViewController alloc] init];
    // viewController.title = @"creato da codice";
    // viewController.view.backgroundColor = [UIColor redColor];

    ScoreTableViewController *scoresViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ScoresTableViewController"];
    
    // collego il controller dei risultati con questo (delegate)
    scoresViewController.delegate = self;
    
    [self.navigationController pushViewController:scoresViewController animated:true];
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
    
    NSArray *arrayToSave = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        int value1 = obj1.intValue;
        int value2 = obj2.intValue;
        
        if(value1 == value2) {
            return NSOrderedSame;
        }
        
        if(value1 < value2) {
            return NSOrderedAscending;
        }
        
        return NSOrderedDescending;
    }];
    
    [UserDefaults setObject:arrayToSave forKey:Results];
    [UserDefaults synchronize];
    
    NSLog(@"%@", arrayToSave);
}

- (NSArray *)getResults {
    return [UserDefaults objectForKey:Results];
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

#pragma mark - ScoreTableViewDelegate

/// Fetch dei dati
-(NSArray *)scoreTableViewFetchResults {
    return [self getResults];
}

@end
