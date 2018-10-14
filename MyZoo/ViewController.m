//
//  ViewController.m
//  MyZoo
//
//  Created by Leo_hsu on 2018/10/14.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "ViewController.h"

static NSString *CELL = @"cell";
static float TableHeaderHeight = 300.0;

@interface ViewController () {
    NSArray *tableData;
    UIImageView *imageView;
    UIVisualEffectView *blurEffectView;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *ContaintTwoLabel;
@property (weak, nonatomic) IBOutlet UIView *ContaintOneLabel;
@property (weak, nonatomic) IBOutlet UIView *TopContaint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
    self.tableView.estimatedRowHeight = 50;
    self.tableView.contentInset = UIEdgeInsetsMake(TableHeaderHeight - self.view.safeAreaInsets.top, 0, 0, 0);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateHeader:(CGPoint)contentOffset {
//    NSLog(@"contentOffset.y = %f", contentOffset.y);
    float y = TableHeaderHeight - (contentOffset.y + TableHeaderHeight + self.view.safeAreaInsets.top);
    float height = MIN(MAX(y, 60), 400);
//    NSLog(@"height = %f", height);
    self.TopContaint.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, height);
    
    float y2 = -(contentOffset.y + self.view.safeAreaInsets.top + 60);
//    NSLog(@"y2 = %f", y2);
    y2 = MAX(y2, 0);
    self.ContaintOneLabel.frame = CGRectMake(0, y2, UIScreen.mainScreen.bounds.size.width, 60);
    
    if (height > TableHeaderHeight) {
        self.ContaintTwoLabel.alpha = 1.0f;
        self.ContaintOneLabel.alpha = 0.0f;
    } else if (contentOffset.y > -(TableHeaderHeight + self.view.safeAreaInsets.top) && contentOffset.y <= -(60+ self.view.safeAreaInsets.top)) {
        CGFloat rate = (contentOffset.y + TableHeaderHeight + self.view.safeAreaInsets.top) / (TableHeaderHeight - 60);
//        NSLog(@"rate = %f", rate);
        self.ContaintTwoLabel.alpha = 1 - rate;
        self.ContaintOneLabel.alpha = rate;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateHeader:scrollView.contentOffset];
}

@end
