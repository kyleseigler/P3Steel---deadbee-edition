//=====================================//
// filastruder_toroidal_duct.scad      //
//=====================================//
// Designed by Kyle Seigler and        //
// released under the MIT license,     //
// available at:                       //
// https://opensource.org/licenses/MIT //
//=====================================//

/*The MIT License (MIT)

Copyright (c) 2016 Kyle Seigler

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

// all dimensions in mm
// designed for M5 bolts and M5 nuts

$fn=30; // 200 default

// Dimensional settings (all measurements in mm)
// WARNING: Some of these scale, some don't (this is a WIP).
// Default values in comments--these should work properly.

toroidOuter=										8;								// 8 default
toroidInner=										6.5;							// 6.5 default
toroidRadius=										30;								// 25 default (this is the rotational width)
toroidDuctWidth=								2*toroidOuter+toroidRadius;
elbowRadius=                    45;               // toroidRadius default
ventHoleWidth=									3;								// 3 default
ventHoleHeight=									9;								// 9 default
ventHoleOffset=									-ventHoleHeight/2-(toroidInner-ventHoleHeight);
connectingTubeLength=						10;
fanOutletLength=                17.5;             // 17.5mm measured
fanOutletWidth=                 12.25;            // 12.25mm measured
fanOutletDepth=                 4;                // 4mm measured

spacerHeight=                   12.5;             // 10mm default
zipTieCylinderRadius=           toroidOuter+4;    // toroidOuter+4 default

//=======================//
// Completed components: //
//=======================//

// Filastruder toroidal cooling duct
completeCoolingDuct();

// Filastruder mounting bracket
*difference(){
  translate([-elbowRadius-5,-elbowRadius-10,elbowRadius-22]){
    rotate([90,0,90]){
      mountingBracket();
    }
  }
  completeCoolingDuct();
}

// Modules
module completeCoolingDuct(){
  // exterior components
  union(){
    centralToroid();
    // fan 1 exterior
    translate([toroidRadius,0,elbowRadius]){
      rotate([0,90,0]){
        rightAngleElbowExterior();
      }
    }
    // fan 2 exterior
    translate([-toroidRadius,0,elbowRadius]){
      rotate([0,90,180]){
        rightAngleElbowExterior();
      }
    }
    translate([toroidRadius,elbowRadius,elbowRadius-.01]){
      connectingTube();
    }
    translate([-toroidRadius,-elbowRadius,elbowRadius-.01]){
      connectingTube();
    }
  }
  // interior components
  union(){
    centralToroidInteriorAndVents();
    // fan 1 interior
    translate([toroidRadius,0,elbowRadius]){
      rotate([0,90,0]){
        rightAngleElbowInterior();
      }
    }
    // fan 2 interior
    translate([-toroidRadius,0,elbowRadius]){
      rotate([0,90,180]){
        rightAngleElbowInterior();
      }
    }
  }
}
module mountingBracket(){
  difference(){
    spacer();
    translate([0,5,-1]){
      zipTieHole();
    }
    translate([0,-5,-1]){
      zipTieHole();
    }
    fastenerHole();
  }
}
module fastenerHole(){
  translate([30,10,2.5]){
    cylinder(center=true,h=5.01,r=2);
  }
  translate([40,10,2.5]){
    cylinder(center=true,h=5.01,r=2);
  }
}
module screwHole(){
  union(){
    translate([0,0,0]){
      cylinder(center=true,h=20.01,r=3);
    }
    translate([0,0,0]){
      cylinder(center=true,h=20.01,r=3);
    }
  }
}
module zipTieHole(){
  translate([10,10,spacerHeight+zipTieCylinderRadius]){
    rotate([90,0,0]){
      difference(){
        cylinder(center=true,h=3.5,r=zipTieCylinderRadius+4);
        cylinder(center=true,h=3.6,r=zipTieCylinderRadius+2);
      }
    }
  }
}
module ductRecess(){
  translate([10,10,spacerHeight+toroidOuter]){
    rotate([90,0,0]){
      cylinder(center=true,h=20.01,r=8);
    }
  }
}
module spacer(){
  union(){
    translate([0,0,0]){
      cube(center=false,[20,20,spacerHeight+5]);
    }
    translate([0,0,0]){
      cube(center=false,[50,20,5]);
    }
  }
}
module connectingTube(){
  difference(){
    union(){
      cylinder(h=connectingTubeLength,r=toroidOuter);
      translate([0,0,connectingTubeLength/2]){
        cylinder(h=connectingTubeLength/2,r1=toroidOuter,r2=fanOutletLength/2+3);
      }
    }
    difference(){
      translate([0,0,connectingTubeLength-fanOutletDepth/2]){
        cube(center=true,[fanOutletLength*2,fanOutletWidth*2,fanOutletDepth+0.01]);
      }
      translate([0,0,connectingTubeLength-(fanOutletDepth-0.01)/2]){
        cube(center=true,[fanOutletLength,fanOutletWidth,fanOutletDepth+0.02]);
      }
    }

    translate([0,0,-0.005]){
      cylinder(h=connectingTubeLength+.01,r=toroidInner);
    }
  }
}
module rightAngleElbow(){
  difference(){
    rightAngleElbowExterior();
    rightAngleElbowInterior();
  }
}
module rightAngleElbowInterior(){
  difference(){
    translate([0,0,0]){
      rotate_extrude(convexity=10){
        translate([elbowRadius,0,0]){
          circle(r=toroidInner);
        }
      }
    }
    difference(){
      translate([0,0,0]){
        cube(center=true,[2*(elbowRadius+toroidOuter),2*(elbowRadius+toroidOuter),2*(elbowRadius+toroidOuter)]);
      }
      translate([elbowRadius,elbowRadius,0]){
        cube(center=true,[2*elbowRadius+.01,2*elbowRadius+.01,2*elbowRadius+.01]);
      }
    }
  }
}
module rightAngleElbowExterior(){
  difference(){
    translate([0,0,0]){
      rotate_extrude(convexity=10){
        translate([elbowRadius,0,0]){
          circle(r=toroidOuter);
        }
      }
    }
    difference(){
      translate([0,0,0]){
        cube(center=true,[2*(elbowRadius+toroidOuter),2*(elbowRadius+toroidOuter),2*(elbowRadius+toroidOuter)]);
      }
      translate([elbowRadius,elbowRadius,0]){
        cube(center=true,[2*elbowRadius,2*elbowRadius,2*elbowRadius]);
      }
    }
  }
}
module centralToroid(){
	difference(){
		// central toroid with vent holes -- nozzle tip should be at [0,0,0] (maybe slightly lower, like [0,0,-3]?
		translate([0,0,0]){
			difference(){
				rotate_extrude(convexity=10){
					translate([toroidRadius,0,0]){
						circle(r=toroidOuter);
					}
				}
			}
		}
	}
}
module centralToroidInteriorAndVents(){
	difference(){
		union(){
			// toroid interior
			translate([0,0,0]){
				rotate_extrude(convexity=10){
					translate([toroidRadius,0,0]){
						circle(r=toroidInner);
					}
				}
				// vent holes
				translate([0,0,ventHoleOffset-.1]){
					for(rotation=[0,30,60,90,120,150,180,210,240,270,300,330]){
						rotate([0,0,rotation]){
							translate([toroidRadius/2,0,0]){
								cube(center=true,[toroidRadius,ventHoleWidth,ventHoleHeight]);
							}
						}
					}
				}
			}
		}
	}
}

