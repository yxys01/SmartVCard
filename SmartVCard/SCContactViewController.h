//
//  SCContactViewController.h
//  SmartVCard
//
//  Created by 夏天 on 16/7/12.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCContactViewController : UIViewController
{
    //对象
    NSDictionary *list;
    NSArray *ff;
    NSMutableArray *listOfMovies;
    NSMutableArray *searchResult;
    //插座变量
    IBOutlet UITableView *tv;
    IBOutlet UISearchBar *searchBar;
    //实例变量
    BOOL isSearchOn;
    BOOL canSelectRow;
}

-(void)searchMoviesTableView; //方法

@end
