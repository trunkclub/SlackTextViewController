//
//  MessagingTextInputbar.m
//  TrunkClub
//
//  Created by Matt Bush on 7/19/16.
//  Copyright © 2016 Trunk Club. All rights reserved.
//

#import "MessagingTextInputbar.h"

@implementation MessagingTextInputbar

- (CGFloat)appropriateHeight {
    CGFloat height = super.appropriateHeight;
    return height + self.addedHeight;
}

@end
