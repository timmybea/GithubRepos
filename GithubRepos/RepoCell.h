//
//  RepoCell.h
//  GithubRepos
//
//  Created by Tim Beals on 2016-11-21.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repo.h"

@interface RepoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *identifierLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

- (void)configureCell:(Repo *)repo;

@end
