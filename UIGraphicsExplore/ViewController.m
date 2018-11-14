//
//  ViewController.m
//  UIGraphicsExplore
//
//  Created by 丁玉松 on 2018/11/9.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSArray *dataSourceArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Graphics";
    
    self.dataSourceArray = @[
                             @{
                                 @"title":@"自定义View-复写drawRect",
                                 @"page":@"DYSDemo01ViewController"
                                 },
                             @{
                                 @"title":@"自己创建context-UIGraphicsBeginImageContextWithOptions",
                                 @"page":@"DYSDemo02ViewController"
                                 },
                             @{
                                 @"title":@"自己创建context-CGBitmapContextCreate",
                                 @"page":@"DYSDemo03ViewController"
                                 },
                             @{
                                 @"title":@"绘图过程总结",
                                 @"page":@"DYSDemo04ViewController"
                                 },];
    
    self.tableView.rowHeight = 50;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    }
    
    NSDictionary *dict = [self.dataSourceArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"title"];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = [self.dataSourceArray objectAtIndex:indexPath.row];
    NSString *classString = [dict objectForKey:@"page"];
    UIViewController *vc = [NSClassFromString(classString) new];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
