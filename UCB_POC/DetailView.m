//
//  DetailView.m
//  UCB_POC
//
//  Created by vmoksha on 03/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "DetailView.h"
#import "AppDelegate.h"
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>
@implementation DetailView
{
    UIView*view;
    UIControl*alphaview;
    AppDelegate*appdelegate;
    NSMutableArray*tableData;
    ContactTempModel *tempModel;
    NSIndexPath *selectedIndex;
}
-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    view=[[NSBundle mainBundle]loadNibNamed:@"View" owner:self options:nil].lastObject;
    view.frame=self.bounds;
    [self addSubview:view];
     return self;
}
-(void)alphaintialiseview{
    if (alphaview==nil) {
        alphaview=[[UIControl alloc]initWithFrame:[UIScreen mainScreen].bounds];
        alphaview.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
        [alphaview addSubview:view];
        //[alphaview addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchDown];
    }
    view.center=alphaview.center;
    appdelegate=[UIApplication sharedApplication].delegate;
    [appdelegate.window addSubview:alphaview];
 
    tableData = [[NSMutableArray alloc]init];
    //selectedIndex=-1;
    [self gettingDataFromContactObject];
    
    
}
//-(void)hidealphaview{
//    [alphaview removeFromSuperview];
//}



- (IBAction)doneButtonAction:(id)sender {
    [alphaview removeFromSuperview];
    if (selectedIndex.row!=0) {
           [self.delegate choseContactNumber:selectedIndex andmodel:_cnContact];
    }
}

#pragma UITableview Delegate and DataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    return tempModel.phoneNumberArr.count+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"detailcell"];
    if (cell==nil) {
        [[NSBundle mainBundle]loadNibNamed:@"DetailTableViewCell" owner:self options:nil];
        cell=_detailcell;
        _detailcell=nil;
    }
    if (indexPath.row==0) {
        cell.detaillbl.text= tempModel.contactName;
        cell.detailimg.hidden=YES;
    }
    else{
        cell.detaillbl.text=  tempModel.phoneNumberArr[indexPath.row-1];
        cell.detailimg.hidden=NO;
    }
    cell.detailimg.image=[UIImage imageNamed:@"unchecked.png"];
    if (selectedIndex.row!=0) {
        if (selectedIndex.row==indexPath.row) {
            cell.detailimg.image=[UIImage imageNamed:@"checked.png"];
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailTableViewCell*cell=[tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        [[NSBundle mainBundle]loadNibNamed:@"DetailTableViewCell" owner:self options:nil];

    }
    if (selectedIndex.row==indexPath.row) {
        selectedIndex=nil;
    }
   else selectedIndex=indexPath;
    [tableView reloadData];

}

-(void)heighoftableView{
    CGFloat height;
    CGRect frame=view.frame;
    if (_detailTableview.contentSize.height+40>_parentViewHeigh) {
        height=_parentViewHeigh-60;
    }else height=_detailTableview.contentSize.height+40;
    frame.size.height=height;
    self.frame=frame;
    view.frame=self.bounds;
    view.center=alphaview.center;
    appdelegate=[UIApplication sharedApplication].delegate;
    [appdelegate.window addSubview:alphaview];
    
}





-(void)gettingDataFromContactObject
{
    NSArray *nArray = self.contactArr;
    NSLog(@"%@",nArray);
    for (int i = 0; i <nArray.count; i++) {
        CNContact *contactObject = self.contactArr[i];
                tempModel = [[ContactTempModel alloc]init];
                tempModel.phoneNumberArr=contactObject.phoneNumbers;
                tempModel .contactName =contactObject.givenName;
                tempModel .middleName = contactObject.familyName;
                tempModel.phoneNumber = [self retriveContactnumberFromPhoneNumberArray:contactObject];
        [tableData addObject:tempModel];
    }
    [_detailTableview reloadData];
    [view layoutIfNeeded];
    [self heighoftableView];
}

-(NSString *)retriveContactnumberFromPhoneNumberArray:(CNContact *)contactObject
    {
        NSString * phone = @"";
        NSMutableArray * userPHONE_NO = [[NSMutableArray alloc]init];
        for(CNLabeledValue * phonelabel in contactObject.phoneNumbers) {
            CNPhoneNumber * phoneNo = phonelabel.value;
            phone = [phoneNo stringValue];
            if (phone) {
                [userPHONE_NO addObject:phone];
            }}
        tempModel.phoneNumberArr = userPHONE_NO;
        return phone;
    }

    

    
    


@end


