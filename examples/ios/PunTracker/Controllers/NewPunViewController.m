//
//  NewPunViewController.m
//  PunTracker
//
//  Created by Max Woolf on 04/05/2013.
//  Copyright (c) 2013 Max Woolf. All rights reserved.
//

#import "NewPunViewController.h"
#import "AppDelegate.h"
#import "PunViewController.h"

@interface NewPunViewController ()

@end

@implementation NewPunViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didPressCancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^(){}];
}

- (void)didPressSaveButton:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *pun = [NSEntityDescription insertNewObjectForEntityForName:@"Pun"
                                                             inManagedObjectContext:context];
    [pun setValue:[input text] forKey:@"text"];
    [context save:nil];
    [self dismissViewControllerAnimated:YES completion:^(){}];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // This is a modal view, so I'll add the buttons in Interface Builder rather than in code.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
