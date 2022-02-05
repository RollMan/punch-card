# Punch Card Processor
## What is this?
This is a processor that uses a card (a piece of paper) as an instruction memory. This is not an emulator but really circuit! A HDL, NSL, is used for this circuit and DE10-Lite board is employed.

## Screenshots
![IMG_20190323_161827](https://user-images.githubusercontent.com/3908541/54863127-f651f200-4d87-11e9-98b1-531b7a5cf5e0.jpg)

## Wiring Diagram
![wiring_diagram](https://user-images.githubusercontent.com/3908541/61350177-b0261e80-a8a1-11e9-888d-b6831c93ec30.jpg)

## How to Build
### Prerequisite
- make
- quartus
- nsl2vl
- (for simulation) iverilog
- (for simulation) gtkwave

### Generate .sof and .pof and Configure Your FPGA by .sof
- `cd src`
- Connect the FPGA to a host PC.
- `make`
- `make download`

#### Trouble Shooting
##### `make download` fails (1)
- Execute `jtagconfig` and note a cable name.
- Edit a variable `CABLE` in `src/Makefile` to the cable name.

#### `make download` fails (2)
- `killall jtagd`
- Try `make download` again

### Configure the FPGA by .pof
- Launch Quartus
- "Tools" --> "Programmer" --> "Hardware Setup" --> Select FPGA --> "Add File" --> TBD

### Conduct Simulation
TBD
