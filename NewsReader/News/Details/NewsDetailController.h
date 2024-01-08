//
//  NewsDetailController.h
//  NewsReader
//
//  Created by vikas dalvi on 07/01/24.
//

#import <UIKit/UIKit.h>
#import "NewsArticle.h"
#import "NewsArticleViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *urlButton;

@property (nonatomic, strong) NewsArticleViewModel *articleViewModel;

@end

NS_ASSUME_NONNULL_END
