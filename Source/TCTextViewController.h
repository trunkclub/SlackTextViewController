//
//  TCTextViewController.h
//  TrunkClub
//
//  Created by Matt Bush on 7/19/16.
//  Copyright © 2016 Trunk Club. All rights reserved.
//

#import <SlackTextViewController/SLKTextViewController.h>

@interface TCTextViewController : SLKTextViewController

@property (nonatomic, readonly) SLKTextInputbar *textInputbar;
@property (nonatomic, strong) Class textViewClass;

@end
