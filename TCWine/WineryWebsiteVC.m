//
//  WineryWebsiteVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/14/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "WineryWebsiteVC.h"

@interface WineryWebsiteVC ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WineryWebsiteVC

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *URL = [NSURL URLWithString:_wineryWebsiteURLString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:URL];
    [_webView loadRequest:urlRequest];
    
}

-(void)viewWillAppear:(BOOL)animated {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissWebView:(id)sender {
    
    [self dismissViewControllerAnimated:TRUE completion:nil];
    
}

@end
