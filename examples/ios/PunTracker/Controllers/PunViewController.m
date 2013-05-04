//
//  PunViewController.m
//  PunTracker
//
//  Created by Max Woolf on 02/05/2013.
//  Copyright (c) 2013 Max Woolf. All rights reserved.
//

#import "PunViewController.h"
#import "AppDelegate.h"
#import "NewPunViewController.h"

@interface PunViewController ()

@end

@implementation PunViewController
@synthesize table;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [fetchedObjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    NSManagedObject *currentPun = [fetchedObjects objectAtIndex:indexPath.row];
    cell.textLabel.text = [currentPun valueForKey:@"text"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self viewDidLoad];
    [table reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Pun"
                                              inManagedObjectContext:[appDelegate managedObjectContext]];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    fetchedObjects = [NSMutableArray arrayWithArray:[[appDelegate managedObjectContext] executeFetchRequest:request error:nil]];
    for (NSManagedObject *pun in fetchedObjects) {
        NSLog(@"%@", [pun valueForKey:@"text"]);
    }
    
    // Add barbuttonitem
    UIBarButtonItem *addPunBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didPressAddButton)];
    [[[[self navigationController] navigationBar] topItem] setRightBarButtonItem:addPunBtn];
    
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        NSManagedObject *selectedObject = [fetchedObjects objectAtIndex:[indexPath row]];
        [[appDelegate managedObjectContext] deleteObject:selectedObject];
        
        [fetchedObjects removeObjectAtIndex:[indexPath row]];
        [[appDelegate managedObjectContext] save:nil];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
}

- (void)didPressAddButton
{
    NewPunViewController *newPunVC = [[NewPunViewController alloc] init];
    [self presentViewController:newPunVC animated:YES completion:^(){}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
