//
//  ScheduleFirstVC.m
//  UCB_POC
//
//  Created by Vmoksha on 28/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "ScheduleFirstVC.h"
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>
#import "ContactModel.h"
#import "DetailView.h"
#import <MessageUI/MessageUI.h>
#import "HexColors.h"
@interface ScheduleFirstVC ()<UIPickerViewDelegate,CNContactPickerDelegate,UITableViewDelegate,UITableViewDataSource,alphaViewDelegate,MFMessageComposeViewControllerDelegate>
{
    NSMutableArray *contactArray;
    NSMutableArray *holderArray;
    DetailView*detail;
    ContactModel *contactModel;
    MFMessageComposeViewController* messageComposeVC;

}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;


@end

@implementation ScheduleFirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    contactArray = [[NSMutableArray alloc]init];
    holderArray =[[NSMutableArray alloc]init];
    self.title = @"Schedule Call";
  

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
  
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)selectContactClicked:(id)sender
{
    [self openContactList];
    
}
- (IBAction)confirmButtonAction:(id)sender {

    [self openMessageComposer];


}


-(void)stateChangeofConfirmButton
{
    if (contactArray.count) {
        self.confirmButton.enabled = YES;
        [self.confirmButton setBackgroundColor:[UIColor colorWithHexString:@"55B952"]];
        NSLog(@"button enable");
    
    
    }else
    {
        self.confirmButton.enabled = NO;
        [self.confirmButton setBackgroundColor:[UIColor grayColor]];
        NSLog(@"button disable");

    }
    
   

}


-(void)openMessageComposer
{
    
    if (messageComposeVC == nil) {
        messageComposeVC = [[MFMessageComposeViewController alloc] init];
        messageComposeVC.messageComposeDelegate = self;
    }
    //Configure the fields of the interface.
    messageComposeVC.recipients = @[@"9066523486"];
    messageComposeVC.body = @"Hello from California! Hello from California!Hello from California!Hello from California!";
    //Present the view controller modally.
    [self presentViewController:messageComposeVC animated:YES completion:nil];

}




-(void)openContactList
{
    CNContactPickerViewController *contactPic = [[CNContactPickerViewController alloc]init];
    contactPic.delegate = self;
    [self presentViewController:contactPic animated:YES completion:NULL];
}

#pragma mark - MFMessage composer Delegate
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller
                 didFinishWithResult:(MessageComposeResult)result {
    // Check the result or perform other tasks.
    
    // Dismiss the mail compose view controller.
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
     [self stateChangeofConfirmButton];
    return contactArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    ContactModel  *contactModel1 = contactArray[indexPath.row];
    UILabel *namelabel = (UILabel *)[cell viewWithTag:100];
    namelabel.text = [NSString stringWithFormat:@"%@ %@",contactModel1.contactName,contactModel1.middleName];
         UILabel *phonenumberlabel = (UILabel *)[cell viewWithTag:101];
         phonenumberlabel.text =contactModel1.phoneNumber;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContactModel *cModel = contactArray[indexPath.row];

}





-(void)callingAlphaViewforchossingcontactnumber:(NSArray *)cnContact withContantObject:(CNContact*)contactObject{
    
    if (detail==nil) {
        detail=[[DetailView alloc]initWithFrame:CGRectMake(10, 10, 300, 300)];
        detail.delegate = self;
        
    }
    detail.parentViewHeigh=self.view.frame.size.height;
    detail.contactArr = cnContact;
    detail.cnContact=contactObject;
    [detail alphaintialiseview];
}


- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContacts:(NSArray<CNContact*> *)contacts
{
    NSArray *nArray = contacts;
    NSLog(@"%@",nArray);
    for (int i = 0; i <nArray.count; i++) {
        CNContact *contactObject = contacts[i];
        if (contactObject.phoneNumbers.count>1) {
            [self callingAlphaViewforchossingcontactnumber:contacts withContantObject:contactObject];
        }
        else
        {
            if (contactObject.phoneNumbers.count==0) {
                NSLog(@"ther is no contact list");
            }
            else
            {
                contactModel = [[ContactModel alloc]init];
                contactModel.phoneNumberArr=contactObject.phoneNumbers;
                contactModel .contactName =contactObject.givenName;
                contactModel .middleName = contactObject.familyName;
                contactModel.phoneNumber = [self retriveContactnumberFromPhoneNumberArray:contactObject];
                NSPredicate*predicateNumber=[NSPredicate predicateWithFormat:@"phoneNumber == %@",contactModel.phoneNumber];
                NSArray*filteredArray=[contactArray filteredArrayUsingPredicate: predicateNumber];
                if (filteredArray.count==0) {
                    [contactArray addObject:contactModel];
                }
                else{
                    
                    UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Phone Number  all ready added" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                    [alt show];
                }
            }
        }
        [self.tableView reloadData];
    }

}
-(void)choseContactNumber:(NSIndexPath *)indexpath andmodel:(CNContact *)contactObject{
  ContactModel  *contactModel1= [[ContactModel alloc]init];
    contactModel1.phoneNumberArr= contactObject.phoneNumbers;
    contactModel1 .contactName = contactObject.givenName;
    contactModel1 .middleName = contactObject.familyName;
        CNLabeledValue * phonelabel =contactObject.phoneNumbers[indexpath.row-1];
        CNPhoneNumber * phoneNo = phonelabel.value;
    contactModel1.phoneNumber=[phoneNo stringValue];
    NSPredicate*predicateNumber=[NSPredicate predicateWithFormat:@"phoneNumberArr == %@ AND contactName == %@"  ,contactModel1.phoneNumberArr, contactModel1.contactName];
    NSArray*filteredArray=[contactArray filteredArrayUsingPredicate: predicateNumber];
    if (filteredArray.count==0) {
        [contactArray addObject:contactModel1];
    }
    else{
        
        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Phone Number  all ready added" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alt show];
    }
   [_tableView reloadData];
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
            contactModel.phoneNumberArr = userPHONE_NO;
     return phone;

}





@end
