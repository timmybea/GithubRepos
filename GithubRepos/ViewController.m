//
//  ViewController.m
//  GithubRepos
//
//  Created by Tim Beals on 2016-11-21.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *repoArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/users/timmybea/repos"]; // 1
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url]; // 2
                  
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration]; // 3
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration]; // 4
                  
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) { //5
            
            if (error) { // 6
                // Handle the error
                NSLog(@"error: %@", error.localizedDescription);
                return;
            }
            
            NSError *jsonError = nil;
            NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError]; // 7
            
            if (jsonError) { // 8
                // Handle the error
                NSLog(@"jsonError: %@", jsonError.localizedDescription);
                return;
            }
            
            // If we reach this point, we have successfully retrieved the JSON from the API
        
            self.repoArray = [[NSMutableArray alloc] init];
        
            for (NSDictionary *repo in repos)
            { // 9
                Repo *newRepo = [[Repo alloc] initWithResponse:repo];
                //NSLog(@"repo: %@", newRepo.identifier);
                [self.repoArray addObject:newRepo];
            }
        [self.tableView reloadData];
        }];
                  
    [dataTask resume]; // 11

}

#pragma  - table view delegate methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.repoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RepoCell *cell = (RepoCell *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Repo *currentRepo = [self.repoArray objectAtIndex:indexPath.row];
    [cell configureCell:currentRepo];
    return cell;
}

@end
