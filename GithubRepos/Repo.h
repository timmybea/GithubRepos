//
//  Repo.h
//  GithubRepos
//
//  Created by Tim Beals on 2016-11-21.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Repo : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *repoDescription;
@property (nonatomic) NSNumber *size;


- (instancetype)initWithResponse:(NSDictionary *)repo;



/*
 "login": "timmybea",
 "id": 21972121,
 "html_url": "https://github.com/timmybea/1.6Readings",
 "description": "Answer questions about MVC, NSObject protocol and inheritance.",
 size
 */

@end
