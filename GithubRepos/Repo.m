//
//  Repo.m
//  GithubRepos
//
//  Created by Tim Beals on 2016-11-21.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "Repo.h"

@implementation Repo

- (instancetype)initWithResponse:(NSDictionary *)repo
{
    self = [super init];
    if(self)
    {
        _name = repo[@"name"];
        _identifier = [repo[@"id"] stringValue];
        _url = repo[@"html_url"];
        _repoDescription = repo[@"description"];
        _size = repo[@"size"];
        
    }
    return self;
}


@end
