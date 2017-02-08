//
//  ViewController.m
//  UCB_POC
//
//  Created by Vmoksha on 28/07/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "HexColors.h"
#import "DetailView.h"

@interface ViewController ()<UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

{
    NSMutableArray *dataArray;
    DetailView*detail;
}
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIView *internalView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
   self.title = @"Home";
   
    dataArray =[[NSMutableArray alloc]init];
    [self dummyData];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     //self.navigationController.navigationBarHidden = YES;


}




- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return dataArray.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
     Model *model = [dataArray objectAtIndex:indexPath.row];
    
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
    titleLabel.text = model.titleString;
    UIImageView *img = (UIImageView *)[cell viewWithTag:101];
    img.image = [UIImage imageNamed:model.imageName];
    cell.backgroundColor = model.colourcode;
    
    return cell;
    
    
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
     NSInteger width = _internalView.frame.size.width/2-4;
     NSInteger height = _internalView.frame.size.height/2-4;

   return CGSizeMake(width, height);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self redirectingControllerAccordingTocellSeclection:indexPath];
    
    
    
}

-(void)redirectingControllerAccordingTocellSeclection:(NSIndexPath *)indexpath {

   
    
    NSInteger indexNumber = indexpath.item;
    
    switch (indexNumber) {
        case 0:
            [self performSegueWithIdentifier:@"MeetingSegua" sender:indexpath];
            
            break;
        case 1:
            [self performSegueWithIdentifier:@"ApprovalsSegue" sender:indexpath];

            break;
        case 2:
            [self performSegueWithIdentifier:@"firstSegue" sender:indexpath];

            break;
        case 3:
            [self performSegueWithIdentifier:@"fourthSegue" sender:indexpath];
            break;
            
        default:
            break;
    }


}
-(void)dummyData
{
    Model *model = [[Model alloc]init];
    model.titleString =@"Meetings";
    model.imageName = @"meeting";
    model.colourcode = [UIColor colorWithHexString:@"1CA6F8"];
    [dataArray addObject:model];
    
    model = [[Model alloc]init];
    model.titleString =@"Approvals";
    model.colourcode = [UIColor colorWithHexString:@"FAAA16"];
    model.imageName = @"icon";
    [dataArray addObject:model];
    
    model = [[Model alloc]init];
    model.titleString =@"Schedule a call";
   model.colourcode = [UIColor colorWithHexString:@"856699"];
     model.imageName = @"phone-call";
    [dataArray addObject:model];
    
    model = [[Model alloc]init];
    model.titleString =@"Yammer";
     model.colourcode = [UIColor colorWithHexString:@"55B952"];
     model.imageName = @"network";
    [dataArray addObject:model];

}


@end
