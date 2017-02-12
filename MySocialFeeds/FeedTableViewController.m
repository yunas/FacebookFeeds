//
//  FeedTableViewController.m
//  MySocialFeeds
//
//  Created by Yunas Qazi on 9/9/14.
//  Copyright (c) 2014 AppsFoundry. All rights reserved.
//

#import "FeedTableViewController.h"
#import "ServiceManager.h"
#import "Feed.h"
#import "DLFeed.h"
#import "FeedTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "NSDate+MySocialFeeds.h"
#import "UITableView+wave.h"
#import "MBProgressHUD.h"
#import "GTScrollNavigationBar.h"



@interface FeedTableViewController (){

    NSMutableArray *socialFeeds;
    NSMutableArray *filteredFeeds;
    UISearchBar *searchBar;
}
@end

@implementation FeedTableViewController

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    [self.navigationController.scrollNavigationBar resetToDefaultPositionWithAnimation:NO];
}

#pragma mark - SERVICE PROVIDER METHODS

-(void) getSocialFeeds{

    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    

    [MBProgressHUD showHUDAddedTo:window animated:YES];
    
    ServiceManager *manager = [ServiceManager new];
    [manager getSocialFeeds:^(NSArray *feedsArr) {
        socialFeeds = [[NSMutableArray alloc]initWithArray:feedsArr];
        filteredFeeds = [[NSMutableArray alloc]initWithArray:feedsArr];
        [self.tableView reloadDataAnimateWithWave:LeftToRightWaveAnimation];
        [MBProgressHUD hideHUDForView:window animated:YES];
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUDForView:window animated:YES];
        NSLog(@"%@",error.localizedDescription);
    }];
}



-(void) getDigialLogixFeeds{
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    [MBProgressHUD showHUDAddedTo:window animated:YES];
    
    ServiceManager *manager = [ServiceManager new];
    [manager getDigitalLogixFeeds:^(NSArray *feedsArr) {
        //code
        socialFeeds = [[NSMutableArray alloc]initWithArray:feedsArr];
        filteredFeeds = [[NSMutableArray alloc]initWithArray:feedsArr];
        [self.tableView reloadDataAnimateWithWave:LeftToRightWaveAnimation];
        [MBProgressHUD hideHUDForView:window animated:YES];

    } failure:^(NSError *error) {
        [MBProgressHUD hideHUDForView:window animated:YES];
        NSLog(@"%@",error.localizedDescription);
    }];
}



#pragma mark - CUSTOM UI MODIFICATION


-(void) initContentView{
    searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(20, 10, 280, 25)];
    [searchBar setDelegate:self];
    [self.navigationController.navigationBar addSubview:searchBar];
    self.navigationController.scrollNavigationBar.scrollView = self.tableView;
//    [self.navigationController.scrollNavigationBar setScrollView:self.tableView];
}

#pragma mark - Standard Methods


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

    [self initContentView];

//    [self getSocialFeeds];
    [self getDigialLogixFeeds];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - SEARCH BAR HELPER METHODS

-(void) searchText:(NSString*)text{
    if (!socialFeeds.count) {
        [searchBar setText:@""];
        [self.view setUserInteractionEnabled:YES];
        return;
    }
    
    
    
    text = [text stringByReplacingOccurrencesOfString:@"'" withString:@"\\'"];
    NSString *strPredicate = [NSString stringWithFormat:@"event contains [c] '%@' ",text];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:strPredicate];
    [filteredFeeds removeAllObjects];
    
//    NSArray *tmpArray = [[NSArray alloc]initWithArray:];
    [filteredFeeds addObjectsFromArray:[socialFeeds filteredArrayUsingPredicate:predicate]];
    [self.tableView reloadDataAnimateWithWave:RightToLeftWaveAnimation];
}

#pragma mark - SEARCH BAR DELEGATE METHODS

- (void)searchBarTextDidBeginEditing:(UISearchBar *)sb{
    [sb setShowsCancelButton:YES];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)_searchBar{
    
    
    [_searchBar setText:@""];
    [filteredFeeds removeAllObjects];
    [filteredFeeds addObjectsFromArray:socialFeeds];
    [self.tableView reloadDataAnimateWithWave:LeftToRightWaveAnimation];
    [self.view setUserInteractionEnabled:YES];
    [searchBar setShowsCancelButton:NO];
    [_searchBar resignFirstResponder];
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)_searchBar{
    [_searchBar resignFirstResponder];
    
    if (_searchBar.text.length) {
        [_searchBar setShowsCancelButton:NO];
        [self performSelector:@selector(searchText:) withObject:_searchBar.text afterDelay:0.1];
        [self.view setUserInteractionEnabled:NO];
    }
    
}






#pragma mark - Table view Helper methods


-(void) setCellData:(FeedTableViewCell*)cell WithObject:(DLFeed*)feed{
    
    
    
//    if (feed.event.length > 200) {
//        [cell.lblEventName setText:[NSString stringWithFormat:@"%@...",[feed.event substringFromIndex:200]]];
//    }
//    else{
    [cell.lblEventName setText:feed.event];
    [cell.lblCategory setText:feed.category];
    [cell.lblLocation setText:feed.location];
    [cell.lblDate setText:[feed.date toStringWithFormat:DATEFORMAT_MYSOCIALFEEDS_DIGITAL_LOGIX]];
    
//    }
    
    [cell.imgViewFeed setImageWithURL:[NSURL URLWithString:feed.imageLink]];
    
}

//-(void) setCellData:(FeedTableViewCell*)cell WithObject:(Feed*)feed{
//    
//    [cell.lblDate setText:[feed.dateCreated toStringWithFormat:DATEFORMAT_MYSOCIALFEEDS_DIGITAL_LOGIX]];
//    
//    if (feed.title.length > 200) {
//        [cell.lblDetail setText:[NSString stringWithFormat:@"%@...",[feed.title substringFromIndex:200]]];
//    }
//    else{
//        [cell.lblDetail setText:feed.title];
//    }
//    
//    [cell.imgViewFeed setImageWithURL:[NSURL URLWithString:feed.imageLink]];
//
//}


-(CGFloat) calculateHeightForCell:(FeedTableViewCell*)cell {
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}

#pragma mark - Table view data source



- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 90;
    
    static FeedTableViewCell *feedCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        feedCell = [self.tableView dequeueReusableCellWithIdentifier:@"FeedTableViewCell"];
    });
    
    [self setCellData:feedCell WithObject:filteredFeeds[indexPath.row]];
    height = [self calculateHeightForCell:feedCell];
    
    return height;
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return filteredFeeds.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedTableViewCell" forIndexPath:indexPath];
    
    [self setCellData:cell WithObject:[filteredFeeds objectAtIndex:indexPath.row]];
    // Configure the cell...
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DLFeed *feed = socialFeeds[indexPath.row];
    
    NSLog(@"%@",feed.imageLink);
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:feed.imageLink]];

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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
