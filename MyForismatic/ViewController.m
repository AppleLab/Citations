//
//  ViewController.m
//  MyForismatic
//
//  Created by User on 21.08.14.
//  Copyright (c) 2014 AiratMulyukovIncorporated. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [self refreshQuote];
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonRefresh:(id)sender {
    [self refreshQuote];
}

-(void)refreshQuote{
    NSURL *url = [NSURL URLWithString:@"http://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=json&lang=ru"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    if (data != nil){
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString *quoteStr = [dict objectForKey:@"quoteText"];
        NSString *autorStr = [dict objectForKey:@"quoteAuthor"];
        self.quoteText.text = quoteStr;
        self.autorText.text = autorStr;
    } else {
        self.quoteText.text = @"Проблемы с соединением. Повторите попытку.";
        self.autorText.text = @"";
    }
}
@end
