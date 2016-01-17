// raspberry_pi_model_b_mounting_plate_for_p3steel.scad
$fn=100;

difference(){
  union(){
    // base dimensions of the pcb
    difference(){
      translate([0,-15,0]){
        cube([85,86,3]);
      }
      // hex holes removed for material savings
      translate([-5,-15,0]){
        translate([10,10,-.1]){
          for(a=[17,34,51,68]){
            for(b=[0,10,20,30,40,50,60]){
              translate([a,b,0]){
                cylinder($fn=6,h=5,r=5);
              }
            }
          }
        }
        translate([18.5,15,-.1]){
          for(a=[0,17,34,51]){
            for(b=[0,10,20,30,40,50,60]){
              translate([a,b,0]){
                cylinder($fn=6,h=5,r=5);
              }
            }
          }
        }
      }
    }
    
    // cylindrical support around each hole (pcb holes)
    translate([4.7,13,0]){
      cylinder(h=5,r=7);
    }
    translate([59,38.4,0]){
      cylinder(h=5,r=7);
    }
    
    // cylindrical support around each hole (p3steel frame holes)
    translate([42.5,-9.5,0]){
      cylinder(h=5,r=7);
    }
    translate([42.5,65.5,0]){
      cylinder(h=5,r=7);
    }

  }
  
  // the pcb holes
  translate([4.7,13,-.1]){
    cylinder(h=5.2,r=1.7);
  }
  translate([59,38.4,-.1]){
    cylinder(h=5.2,r=1.7);
  }

  // hex holes for nuts
  translate([4.7,13,-.1]){
    cylinder($fn=6,h=3,r=3.5);
  }
  translate([59,38.4,-.1]){
    cylinder($fn=6,h=3,r=3.5);
  }
  
  // p3steel frame holes
  translate([42.5,-9.5,-.1]){
    cylinder(h=5.2,r=1.7);
  }
  translate([42.5,65.5,-.1]){
    cylinder(h=5.2,r=1.7);
  }
  
  // hex holes for p3steel frame holes
  translate([42.5,-9.5,2]){
    cylinder($fn=6,h=3.1,r=3.5);
  }
  translate([42.5,65.5,2]){
    cylinder($fn=6,h=3.1,r=3.5);
  }

}
