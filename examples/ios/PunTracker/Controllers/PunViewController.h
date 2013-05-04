//
//  PunViewController.h
//  PunTracker
//
//  Created by Max Woolf on 02/05/2013.
//  Copyright (c) 2013 Max Woolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PunViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *table;
    
    NSMutableArray *fetchedObjects;
}

@property (nonatomic, retain) UITableView *table;
- (void)didPressAddButton;
@end
