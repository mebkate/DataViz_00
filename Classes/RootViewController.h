

#import <UIKit/UIKit.h>

typedef enum {
	
	CALayerAnimTestTypeRaceTrack
} CALayerAnimTestType;

@interface RootViewController : UITableViewController {
}

+ (NSString*)titleForType:(CALayerAnimTestType)type;
+ (Class)classForType:(CALayerAnimTestType)type;

@end
