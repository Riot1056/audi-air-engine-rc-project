// Single-cylinder slider-crank with flywheel: printable, hand-turned study model.
// NOT a pressure engine. Do not connect to compressed air.
// The printed bore, piston, crank, shaft, pins, and flywheel are for geometry/fit
// exploration only. Powered testing requires a teacher-reviewed design using
// commercial pressure-rated hardware and suitable metal rotating components.
// Units: mm. Change `part` to export individual pieces from OpenSCAD.

$fn = 48;
part = "assembly"; // assembly, all_prints, cylinder, piston, rod, crank, flywheel, base, bearings, handle
crank_angle = 35;  // Preview motion by changing 0..360 degrees, then press F5.

bore = 24;
stroke = 26;
crank_r = stroke/2;
rod_len = 55;
crank_z = 25;
barrel_bottom = 44;
barrel_h = 73;
barrel_od = 34;
piston_d = 22.8;   // Illustrative clearance only; tune for your printer for a hand-fit model.
piston_h = 10;
shaft_d = 5;
shaft_len = 112;
flywheel_d = 70;
flywheel_t = 6;

theta = crank_angle;
function pin_y() = crank_r*sin(theta);
function pin_z() = crank_z + crank_r*cos(theta);
function piston_pin_z() = crank_z + crank_r*cos(theta) + sqrt(rod_len*rod_len - pow(crank_r*sin(theta),2));

module x_cylinder(x,y,z,len,d) {
    translate([x,y,z]) rotate([0,90,0]) cylinder(h=len,d=d,center=true);
}

module cylinder_body(cutaway=false) {
    translate([0,0,barrel_bottom])
      difference() {
        difference() {
          cylinder(h=barrel_h,d=barrel_od);
          translate([0,0,-0.1]) cylinder(h=barrel_h+0.2,d=bore);
        }
        if (cutaway)
          translate([-barrel_od,-barrel_od,barrel_h*0.15])
            cube([2*barrel_od,barrel_od,barrel_h*0.72]);
      }
}

module piston() {
    difference() {
      translate([0,0,piston_pin_z()]) cylinder(h=piston_h,d=piston_d,center=true);
      // Decorative ring grooves only; no O-ring or pressure seal is specified.
      for (zoff=[-2.8,2.8])
        translate([0,0,piston_pin_z()+zoff]) difference() {
          cylinder(h=1.2,d=piston_d+0.2,center=true);
          cylinder(h=1.4,d=piston_d-1.0,center=true);
        }
      x_cylinder(0,0,piston_pin_z(),piston_d+2,3.2);
    }
}

module rod() {
    upper=[0,0,piston_pin_z()];
    lower=[0,pin_y(),pin_z()];
    difference() {
      hull() {
        x_cylinder(0,upper[1],upper[2],5,9);
        x_cylinder(0,lower[1],lower[2],5,10);
      }
      x_cylinder(0,upper[1],upper[2],8,3.2);
      x_cylinder(0,lower[1],lower[2],8,3.2);
    }
}

module crank() {
    union() {
      x_cylinder(0,0,crank_z,shaft_len,shaft_d);
      // Two crank cheeks and the offset crank pin, all visual/hand-turn parts.
      for (x=[-12,12])
        hull() {
          x_cylinder(x,0,crank_z,5,22);
          x_cylinder(x,pin_y(),pin_z(),5,18);
        }
      x_cylinder(0,pin_y(),pin_z(),20,3.0);
    }
}

module flywheel() {
    difference() {
      x_cylinder(48,0,crank_z,flywheel_t,flywheel_d);
      x_cylinder(48,0,crank_z,flywheel_t+2,shaft_d+0.5);
      for (a=[0:120:240])
        translate([48,22*cos(a),crank_z+22*sin(a)])
          rotate([0,90,0]) cylinder(h=flywheel_t+2,d=8,center=true);
    }
}

module bearing_block(x) {
    difference() {
      union() {
        translate([x,0,crank_z]) cube([15,28,28],center=true);
        translate([x,0,8]) cube([22,36,6],center=true);
      }
      x_cylinder(x,0,crank_z,18,shaft_d+1.0);
      for (y=[-12,12]) translate([x,y,8]) cylinder(h=8,d=3.4,center=true);
    }
}

module cylinder_mounts() {
    for (z=[barrel_bottom+10,barrel_bottom+barrel_h-10])
      difference() {
        union() {
          translate([0,0,z]) difference() {
            cylinder(h=7,d=barrel_od+10,center=true);
            cylinder(h=8,d=barrel_od+0.5,center=true);
          }
          translate([0,0,z/2]) cube([barrel_od+10,8,z],center=true);
          translate([0,0,5]) cube([barrel_od+22,30,6],center=true);
        }
        translate([0,0,5]) for (y=[-10,10]) cylinder(h=8,d=3.4,center=true);
      }
}

module base() {
    union() {
      translate([0,0,2.5]) cube([122,88,5],center=true);
      // Engine shell foot and bearing pedestals connect to the base plate.
      translate([0,0,10]) cube([46,12,15],center=true);
      for (x=[-32,32]) translate([x,0,crank_z/2]) cube([16,34,crank_z],center=true);
    }
}

module handle() {
    union() {
      x_cylinder(-59,0,crank_z,14,9);
      translate([-59,0,crank_z]) rotate([0,90,0]) cylinder(h=8,d=16,center=true);
      translate([-63,0,crank_z-24]) rotate([0,90,0]) cylinder(h=8,d=9,center=true);
      translate([-63,0,crank_z-34]) sphere(d=14);
    }
}

module assembly() {
    color("#6d7884") base();
    color("#9aa7b2") cylinder_mounts();
    color("#bcc5cc") cylinder_body(true);
    color("#e1a64c") piston();
    color("#b9c2ca") rod();
    color("#657d91") crank();
    color("#d3654f") flywheel();
    color("#778c9c") bearing_block(-32);
    color("#778c9c") bearing_block(32);
    color("#d3654f") handle();
}

module all_prints() {
    // Approximate layout for preview only. Export one part at a time for printing.
    translate([-75,0,0]) cylinder_body(false);
    translate([-25,0,0]) piston();
    translate([10,0,0]) rod();
    translate([50,0,0]) crank();
    translate([115,0,flywheel_d/2]) flywheel();
    translate([0,60,0]) base();
    translate([0,-65,0]) bearing_block(0);
    translate([45,-65,0]) bearing_block(0);
    translate([90,-65,0]) handle();
}

if (part=="assembly") assembly();
else if (part=="all_prints") all_prints();
else if (part=="cylinder") cylinder_body(false);
else if (part=="piston") piston();
else if (part=="rod") rod();
else if (part=="crank") crank();
else if (part=="flywheel") flywheel();
else if (part=="base") base();
else if (part=="bearings") { bearing_block(-32); bearing_block(32); }
else if (part=="handle") handle();
