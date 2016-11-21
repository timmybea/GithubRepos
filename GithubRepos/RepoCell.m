//
//  RepoCell.m
//  GithubRepos
//
//  Created by Tim Beals on 2016-11-21.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "RepoCell.h"

@implementation RepoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configureCell:(Repo *)repo
{
    self.nameLabel.text = repo.name;
    self.identifierLabel.text = repo.identifier;
}

@end
