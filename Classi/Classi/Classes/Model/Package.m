//
//  Package.m
//  Classi
//
//  Created by Mattia Contin  on 08/02/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

#import "Package.h"

#import "Utils.h"

@implementation Package

-(id)initWithCodice:(NSString *)codice
           mittente:(NSString *)mittente
          lunghezza:(NSInteger)lunghezza
            altezza:(NSInteger)altezza
          larghezza:(NSInteger)larghezza
       andMateriale:(Materiale)materiale {
    self = [super init];
    
    if(self) {
        // farò qualcosa
        _codice = codice;
        _mittente = mittente;
        _lunghezza = lunghezza;
        _altezza = altezza;
        _larghezza = larghezza;
        _materiale = materiale;
    }
    
    return self;
}

-(id)initRandom {
    _codice = [NSString stringWithFormat:@"%d",arc4random_uniform(10000)];
    _mittente = [NSString stringWithFormat:@"%d",arc4random_uniform(10000)];
    _destinatario = [NSString stringWithFormat:@"%d",arc4random_uniform(10000)];
    _lunghezza = arc4random_uniform(10);
    _altezza = arc4random_uniform(10);
    _larghezza = arc4random_uniform(10);
    _materiale = arc4random_uniform(2);
    return self;
}

#pragma mark - Overrides

-(NSString *)description {
    NSString *newDescription = [NSString stringWithFormat:
                                @"%@\nCodice: %@\nMittente: %@\nDestinatario: %@\nLunghezza: %li\nAltezza: %li\nLarghezza: %li\nMateriale: %li\n", [super description], self.codice, self.mittente, self.destinatario, self.lunghezza, self.altezza, self.larghezza, self.materiale];
    
    return newDescription;
}

#pragma mark - Getters

-(NSInteger)volume {
    return [self lunghezza] * [self altezza] * [self larghezza];
}

-(NSInteger)peso {
    switch(_materiale) {
        case MaterialeFerro:
            return [self volume] * PesoSpecificoFerro;
            break;
        case MaterialeCarta:
            return [self volume] * PesoSpecificoCarta;
            break;
        case MaterialePlastica:
            return [self volume] * PesoSpecificoPlastica;
            break;
    }
}

@end
