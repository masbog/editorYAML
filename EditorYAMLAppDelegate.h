//
//  EditorYAMLAppDelegate.h
//  EditorYAML
//
//  Created by masbog on 5/26/11.
//  Copyright 2011 masbog inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <YAML/YAMLSerialization.h>

@interface EditorYAMLAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	NSInputStream *streamYAML;
	NSMutableArray *isiYAML;
	NSMutableDictionary *keyOfChild;
	NSArray *keyYAML;
	IBOutlet NSTreeController *treeYAML;
	BOOL isArrayYAML;
	BOOL haveChild;
	id docYAML ;
}

@property (assign) IBOutlet NSWindow *window;
@property (readwrite) BOOL haveChild;
@property (nonatomic, retain) NSTreeController *treeYAML;
@property (nonatomic, retain) NSInputStream *streamYAML;
@property (nonatomic, retain) NSMutableArray *isiYAML;
@property (nonatomic, retain) NSMutableDictionary *keyOfChild;
@property (nonatomic, retain) NSArray *keyYAML;

-(void)ambilYAML:(NSString *)lokasiYAML;
-(void)checkIdYAML:(id)doc;

-(BOOL)isArrayYAML;

-(IBAction)open:(id)sender;


@end
