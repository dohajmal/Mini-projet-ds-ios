//
//  ListViewController.h
//  
//
//  Created by rihab on 11/24/16.
//
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
    IBOutlet UITableView *matiereTableView;
   
   }
@property(assign,nonatomic)float moy;
@property(assign,nonatomic)float somceof;
@property(assign,nonatomic)int count;

@end
