

#import "RootViewController.h"


#import "RaceTrackViewController.h"
#import "ButtonActionsViewController.h"

@implementation RootViewController

+ (NSString*)titleForType:(CALayerAnimTestType)type {
	switch (type) {
		
		case CALayerAnimTestTypeRaceTrack:
			return @"Distance to Moon";
		default:
			return @"Other awesome data Viz";
	}
}

+ (Class)classForType:(CALayerAnimTestType)type {
	switch (type) {
		
		case CALayerAnimTestTypeRaceTrack:
			return [RaceTrackViewController class];
		default:
			return nil;
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.navigationItem.title = @"Demos";
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.textLabel.text = [RootViewController titleForType:indexPath.row];

    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	CALayerAnimTestType type = indexPath.row;
	
	Class controllerClass = [RootViewController classForType:type];
	if (!controllerClass)
		return;
	
    UIViewController *controller = [(UIViewController*)[controllerClass alloc] initWithNibName:nil bundle:nil];
	controller.title = [RootViewController titleForType:type];
	
	if (controller != nil) {
		[self.navigationController pushViewController:controller animated:YES];
		[controller release];
	}
}

@end

