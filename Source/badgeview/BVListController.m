#include "BVListController.h"

@implementation BVListController
@synthesize respringButton;

- (instancetype)init {
    self = [super init];

    if (self) {
        self.respringButton = [[UIBarButtonItem alloc] initWithTitle:@"Respring" 
                                    style:UIBarButtonItemStylePlain
                                    target:self 
                                    action:@selector(respring:)];
        self.navigationItem.rightBarButtonItem = self.respringButton;

        self.navigationItem.titleView = [UIView new];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.titleLabel.text = @"BadgeView";
        self.titleLabel.textColor = [UIColor redColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.navigationItem.titleView addSubview:self.titleLabel];

        [NSLayoutConstraint activateConstraints:@[
            [self.titleLabel.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
            [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
            [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
            [self.titleLabel.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],

        ]];

    }

    return self;
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

- (void)viewWillAppear:(BOOL)animated {
    [[UISwitch appearance] setOnTintColor:[UIColor redColor]];
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
   self.navigationController.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
self.navigationController.navigationController.navigationBar.tintColor = [UIColor redColor];
}
- (void)viewWillDisappear:(BOOL)animated {
    [[UISwitch appearance] setOnTintColor:nil];
    self.navigationController.navigationBar.tintColor =nil;
self.navigationController.navigationController.navigationBar.backgroundColor = nil;
self.navigationController.navigationController.navigationBar.tintColor = nil;
}

- (void)respring:(id)sender {
    UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {
                view = view.presentedViewController;
        }
    UIAlertController *alertController = 
    [UIAlertController alertControllerWithTitle:@"Confirmation" 
                                message:@"Do you want to respring?" 
                                preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Yes" 
                                style:UIAlertActionStyleDefault 
                                handler:^(UIAlertAction *action) {

            NSTask *t = [[NSTask alloc] init];
            [t setLaunchPath:@"/usr/bin/killall"];
            [t setArguments:[NSArray arrayWithObjects:@"backboardd", nil]];
            [t launch];    

    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"No" 
                                     style:UIAlertActionStyleDefault 
                                handler:^(UIAlertAction *action) {
        //??                                                     
    }]];
    [view presentViewController:alertController animated:YES completion:nil];
}

- (void)myInfo {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Minazuki's Info" 
        message:@"Twitter\n Discord\n Donate" 
        preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction 
        actionWithTitle:@"Twitter"
        style:UIAlertActionStyleDefault 
        handler:^(UIAlertAction *action) {
            	UIApplication *app = [UIApplication sharedApplication];
	if ([app canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=Minazuki_dev"]]) {
		[app openURL:[NSURL URLWithString:@"twitter://user?screen_name=Minazuki_dev"]];
	} else if ([app canOpenURL:[NSURL URLWithString:@"tweetbot:///user_profile/Minazuki_dev"]]) {
		[app openURL:[NSURL URLWithString:@"tweetbot:///user_profile/Minazuki_dev"]];		
	} else {
		[app openURL:[NSURL URLWithString:@"https://mobile.twitter.com/Minazuki_dev"]];
        }
                }]];

    [alert addAction:[UIAlertAction 
        actionWithTitle:@"Discord"
        style:UIAlertActionStyleDefault 
        handler:^(UIAlertAction *action) {
                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://t.co/oM555Yznij?amp=1"]];

                }]];

    [alert addAction:[UIAlertAction 
        actionWithTitle:@"Donate"
        style:UIAlertActionStyleDefault 
        handler:^(UIAlertAction *action) {
                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://donorbox.org/donate-for-minazuki"]];

                }]];

    [alert addAction:[UIAlertAction 
        actionWithTitle:@"Cancel"
        style:UIAlertActionStyleCancel 
        handler:^(UIAlertAction *action) {
            //キャンセル
                }]];

    [self presentViewController:alert animated:YES completion:nil];
}

- (void)donate {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://donorbox.org/donate-for-minazuki"]];
}

- (void)source {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/MinazukiDev/BadgeView"]];
}

- (void)openTwitter:(id)sender {
	UIApplication *app = [UIApplication sharedApplication];
	if ([app canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=Minazuki_dev"]]) {
		[app openURL:[NSURL URLWithString:@"twitter://user?screen_name=Minazuki_dev"]];
	} else if ([app canOpenURL:[NSURL URLWithString:@"tweetbot:///user_profile/Minazuki_dev"]]) {
		[app openURL:[NSURL URLWithString:@"tweetbot:///user_profile/Minazuki_dev"]];		
	} else {
		[app openURL:[NSURL URLWithString:@"https://mobile.twitter.com/Minazuki_dev"]];
	}
}

@end
