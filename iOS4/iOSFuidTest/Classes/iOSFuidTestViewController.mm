//
//  iOSFuidTestViewController.m
//  iOSFuidTest
//
//  Created by MINGFEN WANG on 11-11-21.
//  Copyright 2011 no. All rights reserved.
//

#import "iOSFuidTestViewController.h"
#import <fluidsynth.h>
#import <stdlib.h>
#import <string>
using namespace std;

@implementation iOSFuidTestViewController

@synthesize dialButton;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)DialAction:(id)sender {
	fluid_settings_t* settings;
	fluid_synth_t* synth;
	fluid_audio_driver_t* adriver;
	int sfont_id;
	int i, key;
	
	/* Create the settings. */
	settings = new_fluid_settings();
	
	/* Change the settings if necessary*/
	
	/* Create the synthesizer. */
	synth = new_fluid_synth(settings);
	
	/* Create the audio driver. The synthesizer starts playing as soon
     as the driver is created. */
	adriver = new_fluid_audio_driver(settings, synth);
	
	/* Load a SoundFont*/
	string filename = [[[NSBundle mainBundle] pathForResource:@"example" ofType:@"sf2"] UTF8String];
	sfont_id = fluid_synth_sfload(synth, filename.c_str(), 0);
	
	/* Select bank 0 and preset 0 in the SoundFont we just loaded on
     channel 0 */
	fluid_synth_program_select(synth, 0, sfont_id, 0, 0); 
	
	/* Initialze the random number generator */
	srand(getpid());
	
	for (i = 0; i < 12; i++) {
		
		/* Generate a random key */
		key = 60 + (int) (12.0f * rand() / (float) RAND_MAX);
		
		/* Play a note */
		fluid_synth_noteon(synth, 0, key, 80);
		
		/* Sleep for 1 second */
		sleep(1);
		
		/* Stop the note */
		fluid_synth_noteoff(synth, 0, key);
	}
	
	/* Clean up */
	delete_fluid_audio_driver(adriver);
	delete_fluid_synth(synth);
	delete_fluid_settings(settings);
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	dialButton = nil;
}


- (void)dealloc {
	[dialButton release];

    [super dealloc];
}

@end
