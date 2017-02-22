//
//  Package.h
//  Classi
//
//  Created by Mattia Contin  on 08/02/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Materiale) {
    MaterialeFerro = 0,
    MaterialeCarta = 1,
    MaterialePlastica = 2
};

@interface Package : NSObject

-(id) initWithCodice:(NSString *)codice mittente:(NSString *)mittente lunghezza:(NSInteger *)lunghezza
             altezza:(NSInteger *)altezza larghezza:(NSInteger *)larghezza andMateriale:(Materiale)materiale;

-(id) initRandom;

/// Il codice identificativo del pacco
@property (nonatomic, strong, readonly) NSString *codice;

/// il mittente che ha spedito il pacco
@property (nonatomic, strong, readonly) NSString *mittente;

/// il destinatario che riceve il pacco
@property (nonatomic, strong) NSString *destinatario;

/// le dimensioni del pacco
@property (nonatomic, readonly) NSInteger lunghezza;
@property (nonatomic, readonly) NSInteger altezza;
@property (nonatomic, readonly) NSInteger larghezza;

/// il volume del pacco
@property (nonatomic, readonly) NSInteger volume;

/// il peso del pacco
@property (nonatomic, readonly) NSInteger peso;

/// materiale contenuto
@property (nonatomic) Materiale materiale;

@end
