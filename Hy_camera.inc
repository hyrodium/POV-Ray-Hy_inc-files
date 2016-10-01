//Hyrodium's POV-Ray format
//Hy_transformations.inc

//#include "Hy_camera.inc"
#ifndef(AspectRatio) #declare AspectRatio=1; #end
#ifndef(Lng) #declare Lng=-90; #end
#ifndef(Lat) #declare Lat=90; #end
#ifndef(Pers) #declare Pers=0; #end
#ifndef(Zoom) #declare Zoom=1; #end
#ifndef(LookAt) #declare LookAt=<0,0,0>; #end

#if(Lat=90)
	#declare Sky=-<cos(radians(Lng)),sin(radians(Lng)),0>;
#elseif(Lat=-90)
	#declare Sky=<cos(radians(Lng)),sin(radians(Lng)),0>;
#elseif(cos(radians(Lat))<0)
	#declare Sky=<0,0,-1>;
#else
	#declare Sky=<0,0,1>;
#end
#if(Pers)
	#declare Loc=LookAt+SCS(Lng,Lat)/(Zoom*Pers);
	camera{
		perspective
		location Loc
		direction Loc
		right <-2*sqrt(AspectRatio)/(Zoom),0,0>
		up <0,2/(sqrt(AspectRatio)*Zoom),0>
	 	sky Sky
		look_at LookAt
	}
	light_source{
		Loc
		color rgb<1,1,1>
	}
#else
	#declare Loc=SCS(Lng,Lat);
	camera{
		orthographic
		location Loc*100
		right <-2*sqrt(AspectRatio)/(Zoom),0,0>
		up <0,2/(sqrt(AspectRatio)*Zoom),0>
	 	sky Sky
		look_at LookAt
	}
	light_source{
		SCS(Lng,Lat)
		color rgb<1,1,1>
		parallel
		point_at 0
	}
#end
background{rgb<1,1,1>}

/*
#declare AspectRatio=4/3;
#declare Lng=0;
#declare Lat=30;
#declare Pers=0.2;
#declare Zoom=0.8;
#declare LookAt=<0,0,0>;
#local loc=LookAt+<cos(radians(Lat))*cos(radians(Lng)),cos(radians(Lat))*sin(radians(Lng)),sin(radians(Lat))>/(Zoom*Pers);
camera{
	location loc
	right <-AspectRatio,0,0>
	sky <0,0,1>
	look_at LookAt
	angle 180*Pers
}
*/
