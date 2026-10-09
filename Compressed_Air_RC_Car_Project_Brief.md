# Project Brief: Compressed-Air RC Car

**Project goal:** Design, build, and test a 3D-printed compressed-air engine that can power a small RC car.

**Preferred engine reference:** Audi Sport quattro S1 (E2) Group B inline-five. Audi documents the S1 (E2) as a 2.1-liter five-cylinder engine; Audi describes the inline-five firing sequence as 1-2-4-5-3. This build should reproduce the five-cylinder layout and, if feasible, that firing sequence with compressed-air admission. It will not reproduce the original turbocharged combustion process.

**Design choice to resolve:** Decide whether “model” means (A) a visible, moving five-cylinder crank mechanism, or (B) a functional four-stroke-style miniature with timed air admission and exhaust. B is much harder.

**Why this project:** A hands-on engineering challenge in mechanism design, CAD, 3D printing, pneumatics, measurement, and iteration. Treat it as a learning and demonstration project first; compressed air is unlikely to beat a battery for practical RC-car runtime, weight, or simplicity.

## Initial performance targets

- **Total mass:** under 10 lb (4.54 kg), including the air reservoir and all controls.
- **Top speed:** at least 10 mph (4.47 m/s), with speed prioritized.
- **Runtime:** at least 10 minutes on smooth asphalt, with an estimated 5–7 minutes of cumulative full-power equivalent; the balance may be part throttle, coasting, or stopped. Define and measure the drive cycle.
- **Appearance:** Audi Sport quattro S1 inspired for nostalgic reasons.
- **Manufacturing:** mostly 3D printed on a standard desktop printer; split body and frame into modules that fit the actual printer build volume.
- **Reality check:** These targets are aggressive together. Keep them as stretch goals while first proving a safe, repeatable engine.

## The hard questions to answer early

1. What is your printer’s build volume, and what CAD software can you use?
2. Do you want a faithful four-stroke-style mechanism, or a simpler five-piston crank engine that runs on timed compressed air?
3. What safe, commercially rated air source and regulator can you access, and who can review the pressure setup before it is used?

## Build sequence and proof points

### 0. Define the test
- Define the printer build volume and an overall scale/footprint that can be assembled from printable modules.
- Use the current targets above; write a repeatable asphalt drive cycle with total run time and full-power-equivalent time.
- Record available printer, filament, tools, CAD software, budget, and experience.
- Reserve metal shafts, bearings, fasteners, and seals for parts that need reliable rotation or sealing; use a rated commercial air reservoir and compatible rated fittings.
- Sketch the system: rated air reservoir → regulator → control valve/timing system → inline-five engine → reduction gearing/differential → wheels.

**Proof:** A one-page requirements sheet with numbers and constraints.

### Current resources and CAD learning path

- **Printer access:** School Bambu Lab printers; exact model and build volume not yet known.
- **CAD experience:** Beginner.
- **Suggested route:** Use Tinkercad for a quick first sketch of simple solids, then move to Onshape for dimensioned parts and assemblies. Onshape offers a free education plan for eligible students and runs in a browser; Tinkercad is a free web app for introductory 3D design.
- **First CAD exercise:** Model a simple piston, cylinder, and connecting rod as separate parts, then make an assembly that demonstrates the piston moving. Do not begin with the full five-cylinder engine.

## Starting from zero: first design tasks
1. Make a side-view package sketch showing the body, five-cylinder engine, air reservoir, drivetrain, wheels, and the 10 lb mass limit.
2. Pick the engine fidelity target: a working 4-stroke-style inline-five with timed air admission, or a simpler pneumatic engine arranged to look and move like an inline-five.
3. Design a single-cylinder test mule around the same piston, seal, and valve concept planned for the final engine. This lets you prove sealing and air timing before reproducing the mechanism five times.
4. Only after those decisions, set scale, dimensions, and CAD parts. Split long parts into printer-sized modules; do not guess dimensions before knowing the printer build volume.

### 1. Prove one engine mechanism on a bench
- Choose one simple mechanism to investigate (for example, a piston-crank or vane-style motor).
- CAD and print the non-pressure-bearing parts; use suitable purchased seals, bearings, shafts, and fasteners where needed.
- Demonstrate repeatable rotation on a controlled, reviewed pneumatic setup before adding a vehicle.

**Measure:** Start reliability, shaft speed, torque if you have a safe way to measure it, air consumption if measurable, leaks, and failures.

### 2. Improve the engine
- Change one design variable per iteration: sealing, friction, port timing, valve arrangement, or gearing.
- Keep a dated change log and compare each version against the same test.

**Proof:** A version that starts reliably and produces enough measured output for the chosen drivetrain test.

### 3. Couple it to a chassis
- First test the engine driving wheels with the car raised or restrained in a safe fixture.
- Then run on a short, clear course with a remote shutoff/air-isolation plan.
- Record total system mass, runtime, distance, speed, and whether it can restart.

**Proof:** Repeatable runs that meet the targets defined in Phase 0.

## Safety boundary

Compressed air stores energy. Use only a commercially manufactured, pressure-rated reservoir and fittings that are rated for the system and compatible with one another. **Do not 3D print or modify an air tank, cylinder, or other pressure vessel.** Do not test an improvised pressure vessel. Have a knowledgeable adult or qualified pneumatics mentor review the setup, containment, and test area before pressurized tests. OSHA describes pressure-vessel rupture as potentially catastrophic and stresses safe design, installation, operation, and maintenance: https://www.osha.gov/pressure-vessels

## Risks and likely failure points

- **Not enough runtime:** the air supply may be heavy relative to usable energy.
- **Leaks and friction:** small losses can dominate a tiny printed engine.
- **Low starting torque:** the motor may spin freely but fail to start the car from rest.
- **Control complexity:** throttle, direction, and safe shutoff add parts and mass.
- **Print variation:** layer direction, tolerances, and material affect fit and durability; printed parts should not contain stored high-pressure air.

## Progress update for Uncle

**This week I worked on:** [specific task]

**Evidence / result:** [drawing, CAD revision, photo, measurement, or test result]

**What did not work yet:** [specific issue]

**What I learned:** [lesson supported by evidence]

**Next milestone and date:** [one concrete task]

**Question or help I need:** [specific ask]

## First milestone

Before printing a full engine, complete Phase 0: write down the target mass, speed, runtime, budget, tools, and a safe air-source plan. Then choose the simplest engine mechanism to test.


