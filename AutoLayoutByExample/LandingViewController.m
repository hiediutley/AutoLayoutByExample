//
//  LandingViewController.m
//  AutoLayoutByExample
//
//  Created by Hiedi Utley on 4/25/16.
//  Copyright © 2016 Hiedi Utley. All rights reserved.
//

#import "LandingViewController.h"
#import "ManualLayout1ViewController.h"
#import "ManualLayout2ViewController.h"
#import "AutoLayout1ViewController.h"
#import "AutoLayout2ViewController.h"
#import "AutoLayout3ViewController.h"
#import "AutoLayout4ViewController.h"
#import "AutoLayout5ViewController.h"

@interface Demo : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) Class class;
@end

@implementation Demo

+ (instancetype)demoWithTitle:(NSString*)title class:(Class)class
{
    Demo *demo = [Demo new];
    demo.title = title;
    demo.class = class;
    return demo;
}
@end
@interface LandingViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic ,strong) NSArray *demos;
@end

@implementation LandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AutoLayout Demo";
    self.demos = @[[Demo demoWithTitle:@"Manual Layout" class:[ManualLayout1ViewController class]],
                   [Demo demoWithTitle:@"Manual Layout - Adjusted" class:[ManualLayout2ViewController class]],
                   [Demo demoWithTitle:@"Auto Layout - Suggested Constraints" class:[AutoLayout1ViewController class]],
                   [Demo demoWithTitle:@"Auto Layout - Constraint Collections" class:[AutoLayout2ViewController class]],
                   [Demo demoWithTitle:@"Auto Layout - Edit Constants" class:[AutoLayout3ViewController class]],
                   [Demo demoWithTitle:@"Auto Layout - Trait Collections" class:[AutoLayout4ViewController class]],
                   [Demo demoWithTitle:@"Auto Layout - Parus Library" class:[AutoLayout5ViewController class]]
                   ];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _demos.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DemoCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DemoCell"];
    }
    Demo *demo = _demos[indexPath.row];
    cell.textLabel.text = demo.title;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Demo *demo = _demos[indexPath.row];
    UIViewController *vc = [[demo.class alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
