//
//  NewsListController.m
//  NewsReader
//
//  Created by vikas dalvi on 06/01/24.
//

#import "NewsListController.h"
#import "NewsItemTableViewCell.h"
#import "NewsDetailController.h"
#import "NewsListViewModel.h"
#import "NewsArticleViewModel.h"
#import "SDWebImage.h"

@interface NewsListController() <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation NewsListController {
    NewsListViewModel *viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initModels];
    [self getData];
    [self setupUI];
}

// MARK: Init Models
- (void)initModels {
    viewModel = [[NewsListViewModel alloc] init];
}

- (void)getData {
    
    __block NewsListController *weakSelf = self;
    [viewModel getData:^(NSError * _Nullable error) {
    
        if (error == nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf->_tableview reloadData];
            });
        }
    }];
}

// MARK: Setup UI
- (void) setupUI {
    [self registerCell];
}

- (void) registerCell {
    NSString *className = NSStringFromClass([NewsItemTableViewCell class]);
    
    UINib *nib = [UINib nibWithNibName:className
                                bundle:[NSBundle mainBundle]];
    
    [_tableview registerNib:nib forCellReuseIdentifier:className];
}

// MARK: Tableview Delegate & Datasource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return viewModel.totalArticles;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NewsItemTableViewCell class])];
    
    NewsArticleViewModel *articleViewModel = [viewModel getArticle:indexPath.row];
    
    if (articleViewModel != nil) {
        cell.titleLabel.text = articleViewModel.title;
        cell.dateLabel.text = articleViewModel.date;
        cell.contentLabel.text = articleViewModel.content;
        [cell.thumnailImageView sd_setImageWithURL:articleViewModel.image];
    } else {
        cell.titleLabel.text = nil;
        cell.dateLabel.text = nil;
        cell.contentLabel.text = nil;
        cell.thumnailImageView.image = nil;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self showDetailNews: [viewModel getArticle:indexPath.row]];
}

// MARK: Show Details
- (void)showDetailNews:(NewsArticleViewModel *) newsArticle {
    
    NewsDetailController *detailController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([NewsDetailController class])];
    if (detailController != nil) {
        detailController.articleViewModel = newsArticle;
        [[self navigationController] pushViewController:detailController animated:YES];
    }
}

@end


