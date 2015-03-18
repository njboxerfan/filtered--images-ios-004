//
//  FISViewController.m
//  filtered-images
//
//  Created by Joe Burgess on 7/23/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import <UIImage+Filters.h>
#import <MBProgressHUD.h>

@interface FISViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)vignetterTapped:(id)sender;
- (IBAction)sepiaTapped:(id)sender;
- (IBAction)invertedTapped:(id)sender;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)vignetterTapped:(id)sender
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.labelText = @"Loading";
    
    [queue addOperationWithBlock:^{
        UIImage *nonFiltered = [UIImage imageNamed:@"Mickey.jpg"];
        UIImage *filtered = [nonFiltered imageWithFilter:UIImageFilterTypeVignette];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = filtered;
            [hud hide:YES];
        }];
    }];
}

- (IBAction)sepiaTapped:(id)sender
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.labelText = @"Loading";
    
    [queue addOperationWithBlock:^{
        UIImage *nonFiltered = [UIImage imageNamed:@"Mickey.jpg"];
        UIImage *filtered = [nonFiltered imageWithFilter:UIImageFilterTypeSepia];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = filtered;
            [hud hide:YES];
        }];
    }];
}

- (IBAction)invertedTapped:(id)sender
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.labelText = @"Loading";
    
    [queue addOperationWithBlock:^{
        UIImage *nonFiltered = [UIImage imageNamed:@"Mickey.jpg"];
        UIImage *filtered = [nonFiltered imageWithFilter:UIImageFilterTypeColorInvert];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = filtered;
            [hud hide:YES];
        }];
    }];
}

@end
