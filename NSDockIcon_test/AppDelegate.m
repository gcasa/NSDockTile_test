//
//  AppDelegate.m
//  NSDockIcon_test
//
//  Created by Gregory Casamento on 5/29/23.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
  NSDockTile *_dockTile;
  NSUInteger _value;
}

@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSButton *check;

@end

@implementation AppDelegate

- (IBAction) up: (id)sender
{
  _value++;
  NSNumber *n = [NSNumber numberWithUnsignedInteger: _value];
  [_dockTile setBadgeLabel: [n stringValue]];
}

- (IBAction) down: (id)sender
{
  if (_value > 0)
    {
      _value--;
      NSNumber *n = [NSNumber numberWithUnsignedInteger: _value];
      [_dockTile setBadgeLabel: [n stringValue]];
    }
}

- (IBAction) icon: (id)sender
{
  NSImage *image = [NSImage imageNamed: @"Test"];
  [NSApp setApplicationIconImage:image];
}

- (IBAction) view: (id)sender
{
  [_dockTile setContentView: self.check];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  // Insert code here to initialize your application
  _dockTile = [[NSDockTile alloc] init];
  NSLog(@"view = %@", [_dockTile contentView]);
  NSLog(@"owner = %@", [_dockTile owner]);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
  return YES;
}


@end
