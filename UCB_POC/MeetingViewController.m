//
//  MeetingViewController.m
//  UCB_POC
//
//  Created by Saurabh on 8/9/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "MeetingViewController.h"
#import "RoomManager.h"
#import "Constant.h"
#import "MyEventModel.h"
#import <MBProgressHUD/MBProgressHUD.h>
@interface MeetingViewController ()<RoomManagerDelegate>
{
    RoomManager *roomManager;
    NSMutableArray *meetingListArr;
    NSString *userName;
    NSString *password;
    UIAlertController * alert;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *todayDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *noMeetingPlaceHolder;

@end

@implementation MeetingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationController.navigationBarHidden = NO;
    self.title = @"Meeting";
    self.tableView.estimatedRowHeight =45;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    meetingListArr =[[NSMutableArray alloc]init];
    roomManager =[[RoomManager alloc]init];
    roomManager.delegate = self;
    self.todayDateLabel.text = [self dateFormetterMethod:[NSDate date]];
    //[self getAllRoomList];
    [self AskingUserNameAndPassword];
    
   // [self callExchangeServerApiForTodayMeeting];


}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.noMeetingPlaceHolder.hidden = YES;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



-(void)AskingUserNameAndPassword
{
       alert=   [UIAlertController
                                  alertControllerWithTitle:@"Alert !!"
                                  message:@"Please Enter MicroSoft ExchangeServer User Credentials"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action) {
                                                   //Do Some action here
                                                   [self okButtonActionFromAlertView];
                                               }];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       
                                                       
                                                       [self.navigationController popViewControllerAnimated:YES];
                                                       
                                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                                   }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Username";
        textField.text = @"user1@vmexchange.com";
        userName = textField.text;
    
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Password";
        textField.secureTextEntry = YES;
        textField.text = @"Power@1234";
        password = textField.text;
   
    }];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)okButtonActionFromAlertView
{
    UITextField *alertTextField1 = alert.textFields.firstObject;
    UITextField *alertTextField2 = alert.textFields.lastObject;
    userName = alertTextField1.text;
    password = alertTextField2.text;
    if (![self validateLoginFields])
    {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:EWS_REQUSET_USERID_KEY];
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:EWS_USERS_PASSWORD_KEY];
    NSLog(@"And the text is... %@! and %@",userName,password);
    [self callExchangeServerApiForTodayMeeting];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return meetingListArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cellidentifier" forIndexPath:indexPath];
    MyEventModel *eventModel =meetingListArr[indexPath.row];
    UIView *circleView = (UIView *)[cell viewWithTag:98];
    UILabel *subject = (UILabel *)[cell viewWithTag:99];
    UILabel *meetingTiming = (UILabel *)[cell viewWithTag:101];
    UILabel *location = (UILabel *)[cell viewWithTag:103];
    UILabel *conflictShow = (UILabel *)[cell viewWithTag:10];
    
    meetingTiming.text = [self dateFormetterMethod:eventModel.startTime and:eventModel.endTime];
    subject.text = eventModel.meetingTitle;
    location.text = eventModel.location;
    conflictShow.text =[NSString stringWithFormat:@"%lu",(unsigned long)eventModel.conflictMeeting.count];
    circleView.layer.cornerRadius = 13;
   
    if (eventModel.conflictMeeting.count==0) {
        circleView.hidden = YES;
        conflictShow.hidden = YES;
    }else
    {
    circleView.hidden = NO;
    conflictShow.hidden = NO;
    }
    
    return cell;
    
}

-(NSString *)dateFormetterMethod:(NSDate *)startTime and:(NSDate*)endTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *start = [dateFormatter stringFromDate:startTime];
    NSString *end = [dateFormatter stringFromDate:endTime];
    NSString *timingString = [NSString stringWithFormat:@"%@ - %@",start,end];
    return timingString;
}


-(NSString *)dateFormetterMethod:(NSDate *)date
{
    NSString *dateString ;
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"dd MMMM yyyy";
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
     dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

-(void)callExchangeServerApiForTodayMeeting
{
   [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDate *startTime = [calender dateBySettingHour:0 minute:0 second:1 ofDate:[NSDate date] options:kNilOptions];
    NSTimeInterval secondsInEightHours = (24 * 60 * 60)-60;
   NSDate *endTime = [startTime dateByAddingTimeInterval:secondsInEightHours];
   NSArray *currentUserEmail = @[userName];
   [roomManager getAllMyEvents:currentUserEmail forStart:startTime toEnd:endTime];
    
}

-(void)getAllRoomList
{
    [roomManager getRoomsForRoomList:EWS_REQUSET_EMAIL_ID];

}

// Method for camparing meeting And find out colapse Meeting

-(void)comparingMeetingandfindOutColaspeTimegetCalenderEvents:(NSMutableArray *)calenderEvents{
    for (int i = 0; i< calenderEvents.count;i++) {
        MyEventModel *firstmeetingModel = meetingListArr[i];
              for (int j = i+1;j< calenderEvents.count; j++) {
         MyEventModel *nextmeetingModel = meetingListArr[j];
            if ([firstmeetingModel.endTime compare:nextmeetingModel.startTime ] == NSOrderedDescending) {
                [firstmeetingModel.conflictMeeting addObject:nextmeetingModel];
                [nextmeetingModel.conflictMeeting addObject:firstmeetingModel];
            }
        }
    }
}



#pragma RoomManager Delegate

- (void)roomManager:(RoomManager *)manager getCalenderEvents:(NSMutableArray *)calenderEvents
{
     meetingListArr = calenderEvents;
    [self.tableView reloadData];
    [self comparingMeetingandfindOutColaspeTimegetCalenderEvents:calenderEvents];
    
    if (meetingListArr.count==0) {
        self.noMeetingPlaceHolder.hidden = NO;
    } else {
        self.noMeetingPlaceHolder.hidden = YES;
    }
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}



- (void)roomManager:(RoomManager *)manager failedWithError:(NSError *)error
{
    NSLog(@"%@",error);

 [MBProgressHUD hideHUDForView:self.view animated:YES];
}




- (BOOL)validateLoginFields
{
    BOOL goodToGo = YES;
    NSMutableString *mutableString = [[NSMutableString alloc] init];
    if (userName.length == 0)
    {
        goodToGo = NO;
        [mutableString appendString:@"Email Id is required"];
    }
    if (password.length == 0)
    {
        goodToGo = NO;
        if (mutableString.length>0) {
            [mutableString appendString:@"\nPassword is required"];
        }
        else
        {
            [mutableString appendString:@"Password is required"];
        }
    }
    
//    else if (![self stringIsValidEmail:password]&&userName.length!=0)
//    {
//        goodToGo = NO;
//        [mutableString appendString:@"Please enter a valid Email Id"];
//    }
//    
    
    if (!goodToGo)
    {
        [self mbProgress:mutableString];
    }
    return goodToGo;
    
}
-(BOOL)stringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (void)mbProgress:(NSString*)message
{
    MBProgressHUD *hubHUD=[MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hubHUD.mode=MBProgressHUDModeText;
    hubHUD.detailsLabelText = message;
    hubHUD.detailsLabelFont=[UIFont systemFontOfSize:15];
    hubHUD.margin=20.f;
    hubHUD.yOffset=150.f;
    hubHUD.removeFromSuperViewOnHide = YES;
    [hubHUD hide:YES afterDelay:2];
}





@end
