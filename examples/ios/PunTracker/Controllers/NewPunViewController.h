//
//  NewPunViewController.h
//  PunTracker
//
//  Created by Max Woolf on 04/05/2013.
//  Copyright (c) 2013 Max Woolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewPunViewController : UIViewController
{
    IBOutlet UITextField *input;
}


- (IBAction)didPressCancelButton:(id)sender;
- (IBAction)didPressSaveButton:(id)sender;



@end
