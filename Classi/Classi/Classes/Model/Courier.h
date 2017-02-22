//
//  Courier.h
//  Classi
//
//  Created by Mattia Contin  on 08/02/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Package.h"

@interface Courier : NSObject

-(id) initWithVolume:(NSInteger)volume;

-(bool) fits:(__strong Package *[static 100])packs;

@property (nonatomic, readonly) NSInteger volume;

@end
