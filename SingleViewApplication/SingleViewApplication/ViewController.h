//
//  ViewController.h
//  SingleViewApplication
//
//  Created by Mattia Contin  on 11/01/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// nonatomic per codice di veloce accesso, se ho tanti accessi a una proprietà nonatomic gli accessi non sono sincronizzati
// e quindi sono indipendenti l'uno dall'altro
// weak indica la forza del puntatore, se weak quando il viewcontroller viene distrutto il sistema di occupa di liberare
// la memoria, se strong deve gestirle lo sviluppatore
@property (nonatomic, weak) IBOutlet UILabel *helloWorldLabel;
@property (nonatomic, weak) IBOutlet UITextField *inputField;

-(IBAction)usernameTextFieldDidEndOnExit:(id)sender;
-(IBAction)usernameTextFieldEditingDidEnd:(id)sender;
-(IBAction)buttonPressed:(id)sender;

@end

