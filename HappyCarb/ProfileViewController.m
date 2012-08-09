//
//  ProfileViewController.m
//  HappyCarb
//
//  Created by Hong on 7/29/12.
//
//

#import "ProfileViewController.h"
#import "ProfileStatsCell.h"
#import "FeedCell.h"
#import "Todo.h"
#import "Thing.h"
#import "SVPullToRefresh.h"




//ref: http://cocoamatic.blogspot.com/2010/07/uicolor-macro-with-hex-values.html
//RGB color macro
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//RGB color macro with alpha
#define UIColorFromRGBWithAlpha(rgbValue,a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]



@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize Feeds;
@synthesize page= _page;



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _page = 1;
    
    Feeds = [Thing findAllRemote: _page];
    
    
    
    //https://github.com/samvermette/SVPullToRefresh
    // setup the pull-to-refresh view
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        self.page = self.page + 1;
        self.Feeds=   [Thing findAllRemote: _page];
        
        [self.tableView reloadData];
        
        [self.tableView.infiniteScrollingView performSelector:@selector(stopAnimating) withObject:nil afterDelay:1];
    }];
    
    


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return     [Feeds count] + 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==0)
    {
    return 88;
    }
    else
    {
        return 368;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"profilecell";
    
    
    
   // UIView* backgroundView =  [ [ UIView alloc ] initWithFrame:CGRectZero ]  ;
    
    
    
   // backgroundView.backgroundColor =  UIColorFromRGB(0x57A30D); //HappyGreen;
    
    if (indexPath.row == 0)
    {
        
        ProfileStatsCell *cell = (ProfileStatsCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
          cell = [[ProfileStatsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        return cell;
       // cell.backgroundColor = [UIColor redColor];
     //   cell.backgroundView = backgroundView;
    }
    else
        
    {
        FeedCell * cell = (FeedCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        
        Thing * thing = ((Thing *)[Feeds objectAtIndex:(indexPath.row - 1)]);  //[[Thing alloc] init];
        
       // if(cell == nil) {
            
            cell = [[FeedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier thing:thing show_avatar:false];
            
           
      //  }
        return cell;
        
    }
    
    // Configure the cell...
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end