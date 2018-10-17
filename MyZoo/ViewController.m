//
//  ViewController.m
//  MyZoo
//
//  Created by Leo_hsu on 2018/10/14.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
#import "TableViewCell.h"

static NSString *CELL = @"cell";
static float TableHeaderHeight = 300.0;

@interface ViewController () <ViewModelCallback> {
    NSArray<ViewItem *> *tableData;
    UIImageView *imageView;
    UIVisualEffectView *blurEffectView;
    ViewModel *vm;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *ContaintTwoLabel;
@property (weak, nonatomic) IBOutlet UIView *ContaintOneLabel;
@property (weak, nonatomic) IBOutlet UIView *TopContaint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tableData = [[NSArray<ViewItem *> alloc] init];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 163;
    self.tableView.contentInset = UIEdgeInsetsMake(TableHeaderHeight - self.view.safeAreaInsets.top, 0, 0, 0);
    
    vm = [[ViewModel alloc] init];
    vm.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateHeader:(CGPoint)contentOffset {
//    NSLog(@"contentOffset.y = %f", contentOffset.y);
    float y = TableHeaderHeight - (contentOffset.y + TableHeaderHeight);
    float height = MIN(MAX(y, 60), 400);
//    NSLog(@"height = %f", height);
    self.topHeight.constant = height;
    
    
    if (height > TableHeaderHeight) {
        self.ContaintTwoLabel.alpha = 1.0f;
        self.ContaintOneLabel.alpha = 0.0f;
    } else if (contentOffset.y > -TableHeaderHeight && contentOffset.y <= -60) {
        CGFloat rate = (contentOffset.y + TableHeaderHeight) / (TableHeaderHeight - 60);
        NSLog(@"rate = %f", rate);
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
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL];
    
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL];
    }
    
    cell.item = [tableData objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateHeader:scrollView.contentOffset];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGFloat currentOffset = scrollView.contentOffset.y;
    CGFloat maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
    
    if (maximumOffset - currentOffset <= 10.0) {
        [vm requestMore];
    }
}

#pragma mark - ViewModelCallback
-(void)viewItemDidRefesh:(NSArray<ViewItem *> *)items {
    tableData = items;
    [self.tableView reloadData];
}

@end
