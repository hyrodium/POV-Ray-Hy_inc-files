//Hyrodium's POV-Ray format
//20160924

//Axis inc

#version 3.7;
global_settings{assumed_gamma 1.0}

//#declare Step=1/pow(2,5);
//#declare NDStep=1/512;
//#declare Iota=0.001;

#include "Hy_constants.inc"
#include "Hy_functions.inc"
#include "Hy_transformations.inc"
#include "Hy_colors.inc"
#include "Hy_objects.inc"



//#declare Time=1;
#declare N_Time=5;
#declare Dir_Time=1;
//#include "Hy_Clock.inc"
#ifndef(Time) #declare Time=clock; #end


#declare AspectRatio=16/9;
#declare Lng=30;
#declare Lat=30;
#declare Pers=0.1;
#declare Zoom=1/3;
#declare LookAt=<0,0,0>;

#include "Hy_camera.inc"





//#include "Hy_Axis.inc"
#declare r_axis=0.02;
#declare I=3;
#declare fontsize=0.5;
#declare axis_color=rgb<0,0,0>;
#declare x_min=-I;
#declare y_min=-I;
#declare z_min=-I;
#declare x_max=I;
#declare y_max=I;
#declare z_max=I;
#if(0)
	object{Arrow(<x_min,0,0>,<x_max,0,0>,r_axis)pigment{axis_color}}
	object{Arrow(<0,y_min,0>,<0,y_max,0>,r_axis)pigment{axis_color}}
	object{Arrow(<0,0,z_min>,<0,0,z_max>,r_axis)pigment{axis_color}}
#end
#if(0)
	//x
	object{Textit("x",fontsize,<-0.6,-0.8,0>,1)translate<x_max,0,0>}
	//y
	object{Textit("y",fontsize,<0.2,-0.3,0>,1)translate<0,y_max,0>}
	//z
	object{Textit("z",fontsize,<-0.2,0.2,0>,1)translate<0,0,z_max>}
	//Re
	//object{Textrm("Re",fontsize,0,<-0.6,0.1,0>,1)translate<x_max,0,0>}
	//Im
	//object{Textrm("Im",fontsize,0,<0.1,-0.4,0>,1)translate<0,y_max,0>}
	//O
	//object{Textrm("O",fontsize,<-0.75,-0.8,0>,1)}
#end

//Unit Sphere
//object{sphere{0,1}pigment{rgbft<0.5,0.5,0.5,0,0.7>}}

//Unit Circle
#if(0)
	//x
	object{Torus(0,x,1,r_axis)pigment{Black}}
	//y
	object{Torus(0,y,1,r_axis)pigment{Black}}
	//z
	object{Torus(0,z,1,r_axis)pigment{Black}}
#end



//Rotate Arrows around Axises
#declare i=0;
#while(i<0)
	object{Arrow3(Exp(<0,tau/6>)/2,Exp(<0,tau/2>)/2,Exp(<0,tau/12>)/2,0.03)  translate <0,0,I/2> RotateMatrix(<1,1,1>,i*tau/3,0)}
	object{Tile(2,0) RotateMatrix(<1,1,1>,i*tau/3,0) pigment{Yellow}}
	object{Tile(2,1) RotateMatrix(<1,1,1>,i*tau/3,0) pigment{Cyan}}
	#declare i=i+1;
#end

///////////////////////////////////////////////////////////////
#debug "\nHeader Completed\n\n"
///////////////////////////////////////////////////////////////

/*
#declare p1=<1,-1,0>;
#declare p2=<-1,1,0>;
#declare r1=1/3;
#declare r2=-1/2;

object{Sphere(p1,r1) pigment{Red}}
object{Sphere(p2,r2) pigment{Red}}
object{Cone2(p1,r1,p2,r2) pigment{Red}}
*/
#declare axis=union{
	Sphere(<0,0,0>,0.05)
	object{Arrow(<0,0,0>,<1,0,0>,0.02) pigment{rgb<1,0,0>}}
	object{Arrow(<0,0,0>,<0,1,0>,0.02) pigment{rgb<0,1,0>}}
	object{Arrow(<0,0,0>,<0,0,1>,0.02) pigment{rgb<0,0,1>}}
}
axis

#declare a=<1.1,0.2,0.1>;
#declare b=<-0.1,0.8,0.3>;
#declare c=<0.5,0.1,1.4>;
#declare d=<1,1,1>;

object{Sphere(a,0.03) pigment{Red}}
object{Sphere(b,0.03) pigment{Green}}
object{Sphere(c,0.03) pigment{Blue}}
object{Sphere(d,0.03) pigment{Black}}

//object{UnitSphericalTriangularPrism(a,b,c) pigment{rgbft<1,1,1,0.1,0.1>}}

//#declare p=CircumCenter4(a,b,c,d);

//object{Sphere(p,vlength(a-p))  pigment{rgbft<1,1,1,0.1,0.1>}}

object{Arc3(a,b,c,0.01)}
object{Torus3(b,c,d,0.01)}
object{Torus3(c,d,a,0.01)}
object{Torus3(d,a,b,0.01)}

object{Sphere4(a,b,c,d) pigment{GrayTr}}


/*
#if(Time=0) #declare Time=0.001; #end

#declare i=-5;
#while(i<=5)
	#declare j=-5;
	#while(j<=5)
		object{sphere{SGP(<i,j,0>,Time*tau/4),0.05}}
		#declare j=j+1;
	#end
	object{Arc3(SGP(<i,-5,0>,Time*tau/4),SGP(<i,0,0>,Time*tau/4),SGP(<i,5,0>,Time*tau/4),0.03)}
	object{Arc3(SGP(<-5,i,0>,Time*tau/4),SGP(<0,i,0>,Time*tau/4),SGP(<5,i,0>,Time*tau/4),0.03)}
	#declare i=i+1;
#end

*/

//object{Sphere(CircumCenter4(a,b,c,d),0.1) pigment{rgbft<1,1,1,0.1,0.1>}}
