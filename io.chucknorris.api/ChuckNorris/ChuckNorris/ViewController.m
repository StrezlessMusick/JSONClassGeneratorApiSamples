//
//  ViewController.m
//  ChuckNorris
//
//  Created by Nikolas Mayr on 2017-07-15.
//  Copyright © 2017 Lifted Software. All rights reserved.
//

#import "ViewController.h"

#import "Api.h"


@interface ViewController ()

@property (nonatomic, weak) IBOutlet NSTextView *textView;
@property (nonatomic, weak) IBOutlet NSButton *button;

@property (nonatomic) BOOL isLoadingJoke;
@property (nonatomic, strong) Joke *joke;

@end


@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    if ((self = [super initWithCoder:coder])) {
        _joke = [[Joke alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadJoke];
}

- (void)viewWillAppear {
    [super viewWillAppear];
    [self updateView];
}

- (void)updateView {
    self.textView.string = self.joke.value;
    self.button.enabled = !self.isLoadingJoke;
}

- (IBAction)loadJokeButtonTouched:(id)sender {
    [self loadJoke];
}

- (void)loadJoke {
    if (self.isLoadingJoke) {
        return;
    }
    self.isLoadingJoke = YES;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://api.chucknorris.io/jokes/random"]];
        
        // Here we make use of the generated Joke Class (and a category method on NSDictionary)
        Joke *joke = data ? [Joke jokeWithDict:[NSDictionary api_dictionaryWithJson:data]] : self.joke;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.joke = joke;
            self.isLoadingJoke = NO;
            [self updateView];
        });
    });
    [self updateView];
}

@end
