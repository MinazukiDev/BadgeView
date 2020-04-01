#import <libcolorpicker.h>

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.minazuki.badgeview.plist"

@interface SBIconBadgeView : UIView
@end

static BOOL enabled;
static int borderWidth = 1;
static NSString *borderColor = nil;

static void loadPrefs()
{

     NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];

     enabled = [[prefs objectForKey:@"enabled"] boolValue];
     borderWidth = [[prefs objectForKey:@"borderWidth"] intValue];
     borderColor = [prefs objectForKey:@"borderColor"];

}

void updateSettings(CFNotificationCenterRef center,
                    void *observer,
                    CFStringRef name,
                    const void *object,
                    CFDictionaryRef userInfo) {
    loadPrefs();
}

%hook SBIconBadgeView
- (void)layoutSubviews
{
        if (enabled) {

            %orig;
            self.clipsToBounds = YES;
            self.layer.cornerRadius = self.frame.size.height/2;
            self.layer.borderColor = [(LCPParseColorString(borderColor, @"#ffffff")) CGColor];

            if (borderWidth <= 3) {
                self.layer.borderWidth = borderWidth;
            }
	} else {
		return %orig;
	} 
}
%end


%ctor 
{

CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), 
        NULL, &updateSettings, 
        CFSTR("com.minazuki.badgeview/preferencesChanged"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);

    @autoreleasepool {
        loadPrefs();
        %init;
    }
}