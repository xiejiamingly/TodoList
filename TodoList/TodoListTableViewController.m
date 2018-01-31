//
//  TodoListTableViewController.m
//  TodoList
//
//  Created by Mani Sedighi on 30/01/2018.
//  Copyright © 2018 Mani Sedighi. All rights reserved.
//

#import "TodoListTableViewController.h"
#import "AddNoteViewController.h"
#import "Model.h"

@interface TodoListTableViewController ()


@property (weak, nonatomic) IBOutlet UIBarButtonItem *addNote;
@property (nonatomic) Model *model;


@end

@implementation TodoListTableViewController



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return @"Important";
    }
    else if(section == 1)
    {
        return @"To-Do";
    }
    else
    {
        return @"Done";
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[Model alloc] init];
    
    
    // init-metoden för Model kan ladda från NSUserDefaults
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [self.model importantAmount];
    }else if(section == 1){
        return [self.model todosAmount];
    }else{
        return [self.model didAmount];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodosCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (indexPath.row == 0) {
        cell.textLabel.text = self.model.importantTodos[indexPath.row];
    }else if(indexPath.row == 1){
        cell.textLabel.text = self.model.todos[indexPath.row];
    }else{
        cell.textLabel.text = self.model.didDos[indexPath.row];
    }
   

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/
 

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.model removeNotes:(int)indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"read"]) {
        UIViewController *personalNote = [segue destinationViewController];
        UITableViewCell *cell = sender;
        personalNote.title = cell.textLabel.text;
    }else if([segue.identifier isEqualToString:@"write"]){
        AddNoteViewController *add = [segue destinationViewController];
        add.model = self.model;
     }
  
    
    
    
}


@end
