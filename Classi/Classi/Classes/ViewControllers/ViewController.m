//
//  ViewController.m
//  Classi
//
//  Created by Mattia Contin  on 08/02/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

#import "ViewController.h"

#import "Package.h"
#import "Courier.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Package *packs[100];
    
    for(int i = 0; i < 100; i++) {
        packs[i] = [[Package alloc]initRandom];
        NSLog(@"%@", packs[i]);
    }
    
    int packsVolume;
    for(int i = 0; i < 100; i++) {
        packsVolume += [packs[i] volume];
    }
    
    Courier *courier = [[Courier alloc]initWithVolume:100];
    int neededCouriers = 1;
    while(packsVolume > [courier volume]) {
        packsVolume -= [courier volume];
        neededCouriers++;
    }
    if(![courier fits: packs]) {
        NSLog(@"troppi pacchi, servono %i corrieri", neededCouriers);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
