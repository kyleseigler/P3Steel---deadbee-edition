// x-carriage.scad

$fn=100;

difference(){
  // base structure
  cube([55,70,20]);
  
  // bearing carriers
  for(bearingLocationsY=[0,45]){
    for(bearingLocationsX=[0,30.1]){
      translate([bearingLocationsX,bearingLocationsY,0]){
        translate([-0.1,12,14]){
          rotate([0,90,0]){
            cylinder(h=25.1,r=8);
          }
        }
      }
    }
  }
  // openings between bearings
  union(){
    translate([0,12,14]){
      rotate([0,90,0]){
        cylinder(h=55,r=6);
      }
    }
    translate([0,57,14]){
      rotate([0,90,0]){
        cylinder(h=55,r=6);
      }
    }
    translate([-0.1,6,14]){
      cube([55.2,12,12]);
    }
    translate([-0.1,51,14]){
      cube([55.2,12,12]);
    }
  }
  
  // opening for belt to pass through - upper
  translate([-0.1,37,8]){
    cube([55.2,4,12.1]);
  }
  
  // opening for belt to pass through - lower
  translate([-0.1,29,8]){
    cube([20.1,3,12.1]);
  }
  translate([35,29,8]){
    cube([20.1,3,12.1]);
  }
  
  // left post for x-belt
  translate([22,30.5,8]){
    difference(){
      cylinder(h=12.1,r=4);
      cylinder(h=12.1,r=2);
    }
  }
  
  // right post for x-belt
  translate([33,30.5,8]){
    difference(){
      cylinder(h=12.1,r=4);
      cylinder(h=12.1,r=2);
    }
  }  
  
  // bolt holes for the hotend carrier
  for(hotendCarrierBoltHolesX=[0,20]){
    for(hotendCarrierBoltHolesY=[0,20]){
      translate([hotendCarrierBoltHolesX,hotendCarrierBoltHolesY,0]){
        translate([17.5,25,-0.1]){
          cylinder(h=20.2,r=2.6);
        }
      }
    }
  }
  
}
