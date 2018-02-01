//
//  DetailViewController.m
//  TodoList
//
//  Created by Mani Sedighi on 30/01/2018.
//  Copyright © 2018 Mani Sedighi. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *noteDetails;

@end

@implementation DetailViewController

- (IBAction)deleteNote:(id)sender {
        //delete note from list
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showDetails];
    // Do any additional setup after loading the view.
    
    // self.noteDetails = [NSString]
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showDetails{
    self.noteDetails.text = self.detailArray[self.detailIndex];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
