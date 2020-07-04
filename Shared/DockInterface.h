//
//  StatusBarController.h
//  Watchcat
//
//  Created by Takahiko Inayama on 2020/07/04.
//

#ifndef StatusBarController_h
#define StatusBarController_h

#import <Foundation/Foundation.h>

@protocol DockInterface <NSObject>

- (void) updateBadge:(NSString *)text;

@end

#endif /* StatusBarController_h */
