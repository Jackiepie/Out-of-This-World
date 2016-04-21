//
//  OTWTableViewController.m
//  Out of This World
//
//  Created by Jackie Lee on 16/2/5.
//  Copyright © 2016年 LFW. All rights reserved.
//

#import "OTWTableViewController.h"
#import "AstronomicalData.h"
#import "OTWSpaceObject.h"
#import "OTWViewController.h"
#import "OTWSpaceDataViewController.h"

@interface OTWTableViewController ()

@end

@implementation OTWTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.planets =[[NSMutableArray alloc] init];
    
    //列出了由0-7的排序的Dictionary
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets])
    {
        NSString *imageName     = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]]; // [NSSting stringWithFormat:@"星球名.jpg"]得到8个字符串:星球名.jpg
        
        //由0-7的Dictionary得到0-7序列的OTWSpaceObject object：planet
        OTWSpaceObject *planet  = [[OTWSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        
        //把0-7序列的8个objects存入array：planets
        [self.planets addObject:planet];
        
    }
    
}
// pass spaceObject of this class to next class(controller)
// this method is automaitically called when we segue to a new view controller
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        if ([segue.destinationViewController isKindOfClass: [OTWViewController class]]) {
            OTWViewController *nextViewController = segue.destinationViewController;
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            OTWSpaceObject *selectedObjectPicture = self.planets[path.row];
            nextViewController.spaceObject = selectedObjectPicture;
        }
    }
    if ([sender isKindOfClass:[NSIndexPath class]]) {
        if ([segue.destinationViewController isKindOfClass:[OTWSpaceDataViewController class]]) {
            OTWSpaceDataViewController *spaceDataViewController = segue.destinationViewController;
            NSIndexPath *path = sender;
            OTWSpaceObject *selectedObjectData = self.planets[path.row];
            spaceDataViewController.spaceObject = selectedObjectData;
        } 
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.planets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell"; //要在Storyboard里找到对应的tableView下的cell，在右边栏的identifer里填入此Cell的名字。
    
    //下面这条是让在屏幕显示范围的cell刷新以显示新的内容
    UITableViewCell *cell           = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    // indexPath.row是指由0-7序列的cells得出各自cell的序列，就是0-7共8个号码。应该是每个cell各自call一次以下过程。planets是Array
    OTWSpaceObject *planet          = [self.planets objectAtIndex:indexPath.row];
    cell.textLabel.text             = planet.name;
    cell.detailTextLabel.text       = planet.nickname;
    cell.imageView.image            = planet.spaceImage;
    
    cell.backgroundColor            = [UIColor clearColor];
    cell.textLabel.textColor        = [UIColor whiteColor];
    cell.detailTextLabel.textColor  = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    return cell;
}

#pragma mark UITableView Delegate

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"push to space data" sender:indexPath];
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
