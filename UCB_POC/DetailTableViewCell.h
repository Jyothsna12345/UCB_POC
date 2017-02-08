//
//  DetailTableViewCell.h
//  UCB_POC
//
//  Created by vmoksha on 03/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewCell : UITableViewCell<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *detaillbl;
@property (strong, nonatomic) IBOutlet UIImageView *detailimg;
@end
