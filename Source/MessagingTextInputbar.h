//
//  MessagingTextInputbar.h
//  TrunkClub
//
//  Created by Matt Bush on 7/19/16.
//  Copyright © 2016 Trunk Club. All rights reserved.
//

#import <SlackTextViewController/SLKTextInputbar.h>
#import <SlackTextViewController/ToolbarAction.h>
#import <SlackTextViewController/ToolbarActionView.h>

@interface MessagingTextInputbar : SLKTextInputbar

@property (nonatomic, assign) CGFloat addedHeight;
@property (nonatomic, readonly) ToolbarActionView *customToolbarView;

@end
