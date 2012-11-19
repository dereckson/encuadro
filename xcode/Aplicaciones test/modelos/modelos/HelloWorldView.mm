//
//  HelloWorldView.m
//  modelos
//
//  Created by Pablo Flores Guridi on 01/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "HelloWorldView.h"
#include "Isgl3dPODImporter.h"

@implementation HelloWorldView

Isgl3dSkeletonNode * _model;
Isgl3dSkeletonNode * _model2;
Isgl3dNode * _container;


- (id) init {
	
	if ((self = [super init])) {

    
        
        /* Create a container node as a parent for all scene objects.*/
        _container = [self.scene createNode];
        
        // Create the primitive
        //		Isgl3dTextureMaterial * material = [Isgl3dTextureMaterial materialWithTextureFile:@"red_checker.png" shininess:0.9 precision:Isgl3dTexturePrecisionMedium repeatX:NO repeatY:NO];
        //        Isgl3dCube* cubeMesh = [Isgl3dCube  meshWithGeometry:60 height:60 depth:60 nx:40 ny:40];
        //        _cubito1 = [_container createNodeWithMesh:cubeMesh andMaterial:material];
        //        _cubito1.position = iv3(0,0,0);
        
        
        
        /*--------------|INTRODUCIMOS EL MODELO|------------------*/
        
        Isgl3dPODImporter * podImporter = [Isgl3dPODImporter podImporterWithFile:@"artigas.pod"];
        
		_model = [_container createSkeletonNode];
        _model2 = [_container createSkeletonNode];
//        _model.scaleX=0.1;
//        _model.scaleY=0.1;
//        _model.scaleZ=0.1;
        //  _model.rotationX = 90;
        

        
        [podImporter printPODInfo];
        
        
		[podImporter addMeshesToScene:_model];
        [podImporter addMeshesToScene:_model2];

		
        //		_animationController = [[Isgl3dAnimationController alloc] initWithSkeleton:_model andNumberOfFrames:[podImporter numberOfFrames]];
        //		[_animationController start];
        
        _model2.position = iv3(-75, -82, -150);
        _model2.rotationY = 90;
        
        _model.position = iv3(25, -82, -150);
        _model.rotationY = -30;

        self.camera.position=iv3(0,0,100);
        
        Isgl3dShadowCastingLight * light  = [Isgl3dLight lightWithHexColor:@"777777" diffuseColor:@"777777" specularColor:@"7777777" attenuation:0.00];
		[self.scene addChild:light];
        light.position = iv3(-2, 2, 0);
        
        //light.renderLight = YES;
        
//        Isgl3dShadowCastingLight * light2  = [Isgl3dLight lightWithHexColor:@"777777" diffuseColor:@"777777" specularColor:@"7777777" attenuation:0.00];
//		[self.scene addChild:light2];
//        light2.position = iv3(2, 2, 0);
        
        //light2.renderLight = YES;
        
        Isgl3dShadowCastingLight * light3  = [Isgl3dLight lightWithHexColor:@"777777" diffuseColor:@"777777" specularColor:@"7777777" attenuation:0.00];
		[self.scene addChild:light3];
        light3.position = iv3(-2, -2, 0);
        
        //light3.renderLight = YES;
        
        
        Isgl3dShadowCastingLight * light4  = [Isgl3dLight lightWithHexColor:@"777777" diffuseColor:@"777777" specularColor:@"7777777" attenuation:0.00];
		[self.scene addChild:light4];
        light4.position = iv3(2, -2, 0);

		
		// Schedule updates
		
		[self schedule:@selector(tick:)];
	}
	return self;
}

- (void) dealloc {

	[super dealloc];
}


- (void) tick:(float)dt {
	// Rotate the text around the y axis
	_3dText.rotationY += 2;
}


@end

