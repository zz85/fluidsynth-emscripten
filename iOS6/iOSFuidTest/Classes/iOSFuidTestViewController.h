//
//  iOSFuidTestViewController.h
//  iOSFuidTest
//
//  Created by MINGFEN WANG on 11-11-21.
//  Copyright 2011 no. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iOSFuidTestViewController : UIViewController {
	UIButton *dialButton;
}

@property (nonatomic, retain) IBOutlet UIButton *dialButton;

- (IBAction)DialAction:(id)sender;

@end

