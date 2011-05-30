//
//  EditorYAMLAppDelegate.m
//  EditorYAML
//
//  Created by masbog on 5/26/11.
//  Copyright 2011 masbog inc. All rights reserved.
//

#import "EditorYAMLAppDelegate.h"

@implementation EditorYAMLAppDelegate

@synthesize window;
@synthesize treeYAML;
@synthesize streamYAML, isiYAML, keyYAML, haveChild, keyOfChild;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification 
{
	keyOfChild = [[NSMutableDictionary alloc] init];
}

-(IBAction)open:(id)sender
{
	NSOpenPanel *openPanel = [NSOpenPanel openPanel];int opsi = [openPanel runModal];
	if (opsi == NSOKButton) {
		NSLog(@"AWAL!!! dengan File : %@", [openPanel filename]);
		[self ambilYAML:[NSString stringWithFormat:@"%@", [openPanel filename]]];
	}
	return;
}

-(void)ambilYAML:(NSString *)lokasiYAML
{
	streamYAML = [[NSInputStream alloc] initWithFileAtPath: lokasiYAML];
	isiYAML = [YAMLSerialization YAMLWithStream:streamYAML options:kYAMLReadOptionStringScalars error:nil];
	docYAML = [isiYAML objectAtIndex:0];
	[self checkIdYAML:docYAML];
	/*[self isArrayYAML];
	//NSLog(@"%@", (isArrayYAML ? @"YES" : @"NO"));
	if (!isArrayYAML) {
		keyYAML = [docYAML allKeys];
		NSLog(@"isi key %@", keyYAML);
		//NSLog(@"%@", [docYAML valueForKey:[keyYAML objectAtIndex:0]]);
		for(NSString *key in keyYAML)
		{
			NSLog(@"isi array dengan key : %@ , yaitu : \n%@", key, [docYAML valueForKey:key]);
		}
	}*/
	/*
	id head = [yamldoc objectForKey:@"head"];
	id hr = [yamldoc objectForKey:@"hr"];
	
	NSLog(@"%@ %@ %@ %@", [head isKindOfClass:[NSDictionary class]] ? @"YES" : @"NO", [hr class], [head objectForKey:@"name"], [hr objectAtIndex:0]);
	 */
	//NSLog(@"Format YAML : \n%@", [docYAML class]);
	//NSLog(@"isi YAML : \n%@", isiYAML);
	[streamYAML release];
	isiYAML = nil;
}

-(BOOL)isArrayYAML
{
	return ([[isiYAML objectAtIndex:0] isKindOfClass:[NSArray class]] ? YES:NO);
}

-(void)checkIdYAML:(id)doc
{
#pragma mark checkDictionary
	if ([doc isKindOfClass:[NSDictionary class]]) {
		keyYAML = [docYAML allKeys];
		NSLog(@"isi key %@", keyYAML);
		//NSLog(@"%@", [docYAML valueForKey:[keyYAML objectAtIndex:0]]);
		for(NSString *key in keyYAML)
		{
			haveChild = ([[docYAML valueForKey:key] isKindOfClass:[NSDictionary class]] ? YES:NO);
			NSLog(@"punya anak berisi Dictionary = %@", (haveChild ? @"YES" : @"NO"));
			if (haveChild) {
				NSDictionary *childYAML = [docYAML valueForKey:key];
				for(NSString *childKey in [childYAML allKeys])
				{
					[keyOfChild setObject:childKey forKey:key];
					NSLog(@"si %@ mempunyai data dengan key : %@ , bernilai : %@", key, childKey, [childYAML valueForKey:childKey]);
				}
			} else {
				NSLog(@"isi string dengan key : %@ , yaitu : %@", key, [docYAML valueForKey:key]);
			}
		}
	}
#pragma mark checkArray
	if ([doc isKindOfClass:[NSArray class]]) {
		
	}
#pragma mark checkString
	if ([doc isKindOfClass:[NSString class]]) {
		
	}
#pragma mark checkNumber
	if ([doc isKindOfClass:[NSNumber class]]) {
		
	}
}

@end
