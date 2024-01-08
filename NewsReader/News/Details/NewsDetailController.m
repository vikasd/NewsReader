//
//  NewsDetailController.m
//  NewsReader
//
//  Created by vikas dalvi on 07/01/24.
//

#import "NewsDetailController.h"
#import "SDWebImage.h"

@interface NewsDetailController ()

@end

@implementation NewsDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    
    [self.imageView sd_setImageWithURL:_articleViewModel.image];
    self.dateLabel.text = _articleViewModel.date;
    self.titleLabel.text = _articleViewModel.title;
    self.contentLabel.text = _articleViewModel.content;
    
    [self.urlButton.titleLabel setNumberOfLines:0];
    [self.urlButton.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    
    if (_articleViewModel.url != nil) {
        [self.urlButton setHidden:NO];
        [self.urlButton setTitle:_articleViewModel.url.absoluteString forState:UIControlStateNormal];
    } else {
        [self.urlButton setHidden:YES];
        [self.urlButton setTitle:nil forState:UIControlStateNormal];
    }
    
    
}

- (IBAction)urlTapped:(UIButton *)sender {
    
    if (_articleViewModel.url != nil
        && [[UIApplication sharedApplication] canOpenURL:_articleViewModel.url]) {
        [[UIApplication sharedApplication] openURL:_articleViewModel.url
                                           options:@{}
                                 completionHandler:^(BOOL success) {
            
        }];
    }
}

@end
