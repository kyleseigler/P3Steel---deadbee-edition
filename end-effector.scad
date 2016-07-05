//=====================================//
// end-effector.scad                   //
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

$fn=100;

// Variables
mountingHoleSpacing=                      22.5; // 22.5mm default
mountingHoleDiameter=                     4.1;
mountingHoleNutDiameter=                  6;

baseplateThickness=                       5;  // 5mm default
baseplateSide=                            mountingHoleSpacing+18;

e3dCarrierWidth=                          baseplateSide/2;
e3dCarrierThickness=                      14;
e3dCarrierDistanceFromCarriage=           32;
e3dv6HolderInnerDiameter=                 12; // 12.02mm measured
e3dv6HolderOuterDiameter=                 16; // 16.03mm measured
e3dv6DistanceFromBaseplate=               34;
e3dCarrierLength=                         e3dCarrierDistanceFromCarriage+(e3dv6HolderOuterDiameter)/2+6;
e3dv6ClampingHoleDiameter=                3.4;
e3dv6ClampingHoleNutDiameter=             5.5;
e3dv6ClampingHoleNutDepth=                 4;
e3dv6HeatsinkDiameter=                    22; // 22mm measured
e3dv6HeatsinkHeight=                      26; // 25.92mm measured
e3dv6HeatsinkDistanceFromThroat=          4.2; // 4.17mm measured
e3dv6DistanceFromMiddleToBottomOfThroat=  6; // 6mm measured
e3dv6HeatsinkCoolingDuctDiameter=         8; // This is the channel where air passes through the hotend carrier arm.
e3dv6HeatsinkCoolingDuctChannelDiameter=  16; // This is the channel behind the heatsink area itself, not the one through the carrier arm.
hotendCoolingDuctMountingHolesDiameter=   2.8;

inductiveProbeCarrierThickness=           6;
inductiveProbeOpeningDiameter=            12; // 12mm measured
inductiveProbeCarrierWidth=               inductiveProbeOpeningDiameter+10;
inductiveProbeCarrierLength=              12+baseplateThickness;
inductiveProbeCarrierDrop=                16; // How much farther down the inductive probe carrier has to be to reach the bed

// Variables and connectingTube() module pulled from filastruder_toroidal_duct.scad
connectingTubeLength=                     10;
toroidOuter=                              8;
fanOutletLength=                          17.5;
fanOutletDepth=                           4;
fanOutletWidth=                           12.25;
toroidInner=                              6.5;

// Complete end-effector

difference(){
  union(){
    baseplate();
    baseplateNutLocks();
    e3dCarrier();
    e3dv6CarrierClamp();
    translate([0,-inductiveProbeCarrierDrop,0]){
      inductiveProbeCarrier();
    }
    hotendCoolingDuctExterior();
    connectingTube();
  }
  baseplateHoles();
  e3dv6HolderCutout();
  e3dv6CarrierClampHoles();
  hotendCoolingDuctInterior();
  hotendCoolingDuctMountingHoles();
}

/*
difference(){
  hotendCoolingDuctExterior();
  hotendCoolingDuctInterior();
  e3dv6HolderCutout();
  e3dCarrier();
}
*/


// Modules
module connectingTube(){
  translate([-13,0,30]){
    rotate([-90,90,0]){
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
  }
}
module hotendCoolingDuctMountingHoles(){
  translate([0,-(baseplateSide-e3dCarrierThickness)/2-e3dv6HeatsinkHeight/2-e3dv6HeatsinkDistanceFromThroat-e3dv6DistanceFromMiddleToBottomOfThroat,e3dCarrierDistanceFromCarriage-baseplateThickness-1]){
    for(z=[0,22]){
      translate([-17,e3dv6HeatsinkHeight/2+0.19,z]){
        rotate([90,0,0]){
          cylinder(center=true,h=15,r=hotendCoolingDuctMountingHolesDiameter/2);
        }
      }
    }
  }

}
module hotendCoolingDuctExterior(){
  translate([0.01,-(baseplateSide-e3dCarrierThickness)/2-e3dv6HeatsinkHeight/2-e3dv6HeatsinkDistanceFromThroat-e3dv6DistanceFromMiddleToBottomOfThroat,e3dCarrierDistanceFromCarriage+baseplateThickness]){
    scale([1.5,1,1]){
      difference(){
        translate([0,e3dv6HeatsinkDistanceFromThroat,0]){
          rotate([90,0,0]){
            cylinder(center=true,h=e3dv6HeatsinkHeight+e3dv6HeatsinkDistanceFromThroat*2,r=e3dv6HeatsinkDiameter/2+2);
          }
        }
        translate([10.99,0,0]){
          cube(center=true,[e3dv6HeatsinkDiameter,2*e3dv6HeatsinkHeight,2*e3dv6HeatsinkDiameter]);
        }
      }
    }
    translate([-20,e3dv6HeatsinkHeight/2+0.19,-14]){
      cube([6,4,27.99]);
    }
  }
}
module hotendCoolingDuctInterior(){
  translate([0.01,-(baseplateSide-e3dCarrierThickness)/2-e3dv6HeatsinkHeight/2-e3dv6HeatsinkDistanceFromThroat-e3dv6DistanceFromMiddleToBottomOfThroat,e3dCarrierDistanceFromCarriage+baseplateThickness]){
    rotate([90,0,0]){
      cylinder(center=true,h=e3dv6HeatsinkHeight+0.01,r=e3dv6HeatsinkDiameter/2);
    }
    translate([-9,0,0]){
      scale([1,1,1]){
        rotate([90,0,0]){
          cylinder(center=true,h=e3dv6HeatsinkHeight-3,r=e3dv6HeatsinkCoolingDuctChannelDiameter/2);
        }
      }
    }
  }
  translate([-12.5,-(baseplateSide-e3dCarrierThickness)/2,e3dCarrierDistanceFromCarriage+baseplateThickness]){
    rotate([90,0,0]){
      scale([1,1.5,1]){
        cylinder(center=true,h=e3dv6HeatsinkHeight+0.01,r=e3dv6HeatsinkCoolingDuctDiameter/2);
      }
    }
  }

}
module e3dCarrier(){
  translate([-(baseplateSide-e3dCarrierWidth)/2,-(baseplateSide-e3dCarrierThickness)/2,e3dCarrierLength/2+baseplateThickness]){
    cube(center=true,[e3dCarrierWidth,e3dCarrierThickness,e3dCarrierLength]);
  }  
}
module e3dv6CarrierClampHoles(){
  translate([0,-(baseplateSide-e3dCarrierThickness)/2,e3dCarrierDistanceFromCarriage-baseplateThickness]){
    rotate([0,90,0]){
      for(x=[0,-(e3dv6HolderOuterDiameter+4)]){
        translate([x,0,0]){
          cylinder(center=true,h=50,r=e3dv6ClampingHoleDiameter/2);
          translate([0,0,-e3dCarrierWidth+e3dv6ClampingHoleNutDepth/2-0.01]){
            cylinder($fn=6,center=true,h=e3dv6ClampingHoleNutDepth,r=e3dv6ClampingHoleNutDiameter/2);
          }
        }
      }
    }
  }
}
module e3dv6CarrierClamp(){
  translate([(baseplateSide-e3dCarrierWidth)/2-3,-(baseplateSide-e3dCarrierThickness)/2,baseplateThickness+e3dCarrierDistanceFromCarriage]){
    cube(center=true,[e3dCarrierWidth/2,e3dCarrierThickness,e3dv6HolderOuterDiameter+12]);
  }
}
module e3dv6HolderCutout(){
  translate([0,-(baseplateSide-e3dCarrierThickness)/2,e3dCarrierDistanceFromCarriage+baseplateThickness]){
    rotate([90,0,0]){
      union(){
        translate([0,0,8]){
          cylinder(center=true,h=10,r=e3dv6HolderOuterDiameter/2);
        }
        translate([0,0,0]){
          cylinder(center=true,h=6.01,r=e3dv6HolderInnerDiameter/2);
        }
        translate([0,0,-8]){
          cylinder(center=true,h=10,r=e3dv6HolderOuterDiameter/2);          
        }
      }
    }
  }
}
module inductiveProbeCarrier(){
  difference(){
    union(){
      translate([(baseplateSide-inductiveProbeCarrierWidth)/2,-(baseplateSide-inductiveProbeCarrierThickness)/2,(inductiveProbeCarrierLength+baseplateThickness)/2]){
        cube(center=true,[inductiveProbeCarrierWidth,inductiveProbeCarrierThickness,inductiveProbeCarrierLength+baseplateThickness]);
      }
      translate([(baseplateSide-inductiveProbeCarrierWidth)/2,-inductiveProbeCarrierDrop/2,baseplateThickness/2]){
        cube(center=true,[inductiveProbeCarrierWidth,inductiveProbeCarrierDrop,baseplateThickness]);
      }
    }
    translate([(baseplateSide-inductiveProbeCarrierWidth)/2,-(baseplateSide-inductiveProbeCarrierThickness)/2,inductiveProbeCarrierLength/2+baseplateThickness]){
      rotate([90,0,0]){
        cylinder(center=true,h=inductiveProbeCarrierThickness+0.01,r=inductiveProbeOpeningDiameter/2);
      }
    }
  }
}
module baseplateNutLocks(){
  difference(){
    translate([0,0,baseplateThickness]){
      cube(center=true,[mountingHoleSpacing+2*mountingHoleDiameter,mountingHoleSpacing+2*mountingHoleDiameter,baseplateThickness]);
    }
    translate([0,0,baseplateThickness]){
      translate([-mountingHoleSpacing/2,-mountingHoleSpacing/2,0]){
        for(mountingHolesX=[0,mountingHoleSpacing]){
          for(mountingHolesY=[0,mountingHoleSpacing]){
            translate([mountingHolesX,mountingHolesY,0]){
              cylinder($fn=6,center=true,h=baseplateThickness+0.01,r=mountingHoleNutDiameter/2);
            }
          }
        }
      }
    }    
  }
}
module baseplate(){
  translate([0,0,baseplateThickness/2]){
    difference(){
      cube(center=true,[baseplateSide,baseplateSide,baseplateThickness]);
    }
  }
}
module baseplateHoles(){
  translate([0,0,baseplateThickness/2]){
    translate([-mountingHoleSpacing/2,-mountingHoleSpacing/2,0]){
      for(mountingHolesX=[0,mountingHoleSpacing]){
        for(mountingHolesY=[0,mountingHoleSpacing]){
          translate([mountingHolesX,mountingHolesY,0]){
            cylinder(center=true,h=baseplateThickness+0.01,r=mountingHoleDiameter/2);
          }
        }
      }
    }
  }
}
