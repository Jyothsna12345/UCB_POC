//
//  DetailView.h
//  UCB_POC
//
//  Created by vmoksha on 03/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailTableViewCell.h"
#import "ContactModel.h"
#import "ContactModel.h"
#import "DetailView.h"
#import "ContactTempModel.h"
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>

@protocol alphaViewDelegate <NSObject>

//-(void)choseContactNumber:(NSIndexPath *)indexpath andmodel:(NSArray *)cModel;
-(void)choseContactNumber:(NSIndexPath *)indexpath andmodel:(CNContact *)contactObject;
-(void)heightofView:(NSInteger *)height;

@end

@interface DetailView : UIView<UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) IBOutlet DetailTableViewCell *detailcell;
-(void)alphaintialiseview;
@property (strong, nonatomic) IBOutlet UITableView *detailTableview;
@property(nonatomic,strong)NSArray *contactArr;
@property(nonatomic,strong)CNContact*cnContact;
@property(nonatomic)id<alphaViewDelegate>delegate;
@property(nonatomic,assign)CGFloat parentViewHeigh;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;
- (IBAction)doneButtonAction:(id)sender;

@end
