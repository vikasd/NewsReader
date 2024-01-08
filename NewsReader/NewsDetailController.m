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
}

@end
