//
//  ListViewController.m
//  
//
//  Created by rihab on 11/24/16.
//
//

#import "ListViewController.h"
#import "MatiereViewController.h"
#import "MySimpleTableCell.h"
#import "MoyenneViewController.h"
#import "AppDelegate.h"
#import "Matiere.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    
    AppDelegate* appd=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    //Matiere* mat =[appd.listMatiere];
    _moy=0;
    _somceof=0;
    _count=(int)(appd.listMatiere.count);
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//Action button add
- (IBAction)ajouterClick:(id)sender{
    
    MatiereViewController* matiereView = [self.storyboard instantiateViewControllerWithIdentifier:@"MatiereViewController"];
    [self.navigationController pushViewController:matiereView animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    AppDelegate *app =(AppDelegate*)[[UIApplication sharedApplication]delegate];
    return app.listMatiere.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* simpleTableIdentifier=@"MySimpleTableCell";
    MySimpleTableCell *cell=[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell ==nil){
        NSArray *nib=[[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
        
        cell=[nib objectAtIndex:0];
    }
    AppDelegate* appd=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    Matiere* mat =[appd.listMatiere objectAtIndex:indexPath.row];
    /* NSString* str=[NSString stringWithFormat:@"%@ %@ %@" ,mat.name,mat.coef,mat.note];
     cell.textLabel.text=str;*/
    cell.nomMt.text=mat.name;
    cell.coeff.text=mat.coef;
    cell.note.text=mat.note;
    float x=[mat.note floatValue];
    float y=[mat.coef floatValue];
    float z =x*y;
    _somceof+=[mat.coef floatValue];
    _moy=_moy+z;
   /* message.text=[NSString stringWithFormat:@"%.2f",(_moy)/(appd.listMatiere.count)];*/
    return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        AppDelegate* appd=(AppDelegate*)[[UIApplication sharedApplication]delegate];
        Matiere* mat =[appd.listMatiere objectAtIndex:indexPath.row];
        _somceof-=[mat.coef floatValue];
        _moy=_moy-([mat.note floatValue]*[mat.coef floatValue]);
        [appd.listMatiere removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
        
   
    
    }
}
- (IBAction)moyClick:(id)sender{
    
    MoyenneViewController* moyview = [self.storyboard instantiateViewControllerWithIdentifier:@"MoyenneViewController"];
    moyview.moycal=(_moy)/(_somceof);
    [self.navigationController pushViewController:moyview animated:YES];
}

@end
