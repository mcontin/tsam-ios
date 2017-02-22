//
//  Courier.m
//  Classi
//
//  Created by Mattia Contin  on 08/02/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

#import "Courier.h"

#import "Package.h"

@implementation Courier

-(id)initWithVolume:(NSInteger)volume {
    _volume = volume;
    return self;
}

-(bool)fits:(__strong Package *[static 100])pacchi {
    NSInteger totalWeight = 0;
    for(int i = 0; i < 100; i++) {
        totalWeight += [pacchi[i] volume];
    }
    return totalWeight < _volume;
}

@end
