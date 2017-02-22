//
//  ViewController.h
//  TableViewExampleObjC
//
//  Created by Mattia Contin  on 21/02/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScoreTableViewDelegate <NSObject>

@end

@interface ViewController : UITableViewController

@property (nonatomic, strong) NSArray *myData;

// legame finchè uno dei due non muore, posso distruggere uno dei due quando voglio per evitare memory leak
// il delegate è astratto ma è conforme all'interfaccia tra parentesi <>
@property (nonatomic, unsafe_unretained) id <ScoreTableViewDelegate> delegate;

@end

