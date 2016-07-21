//
//  TCTextViewController.m
//  TrunkClub
//
//  Created by Matt Bush on 7/19/16.
//  Copyright © 2016 Trunk Club. All rights reserved.
//

#import "TCTextViewController.h"
#import "MessagingTextInputBar.h"

@interface TCTextViewController ()

@end

@implementation TCTextViewController

@synthesize textInputbar = _textInputbar;
@synthesize verticalPanGesture = _verticalPanGesture;

- (SLKTextInputbar *)textInputbar
{
    if (!_textInputbar) {
        _textInputbar = [[MessagingTextInputbar alloc] initWithTextViewClass:self.textViewClass];
        _textInputbar.translatesAutoresizingMaskIntoConstraints = NO;
        [_textInputbar.leftButton addTarget:self action:@selector(didPressLeftButton:) forControlEvents:UIControlEventTouchUpInside];
        [_textInputbar.rightButton addTarget:self action:@selector(didPressRightButton:) forControlEvents:UIControlEventTouchUpInside];
        [_textInputbar.editorLeftButton addTarget:self action:@selector(didCancelTextEditing:) forControlEvents:UIControlEventTouchUpInside];
        [_textInputbar.editorRightButton addTarget:self action:@selector(didCommitTextEditing:) forControlEvents:UIControlEventTouchUpInside];
        
        _textInputbar.textView.delegate = self;
        
        _verticalPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(slk_didPanTextInputBar:)];
        _verticalPanGesture.delegate = self;
        
        [_textInputbar addGestureRecognizer:self.verticalPanGesture];
    }
    return _textInputbar;
}

@end
