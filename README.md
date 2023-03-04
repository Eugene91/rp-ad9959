# AD9959 firmware for Red Pitay board

[Red Pitay](https://redpitaya.com/) is powerful radio frequency prototyping board. 

With a help of red pitay's  GPIO pins the board can be interfaced with 4-channels Direct Digital Synthesizer AD9959.
AD9959 is a cheap signal generator (around $100-150 USD on ebay, e.g. [here](https://www.ebay.ca/sch/i.html?_from=R40&_trksid=p2380057.m570.l1313&_nkw=ad9959&_sacat=0)) with 4 synchronized channels at 500 MSPS. 
The DDS is capable of independent frequency/phase/amplitude control between channels, 14-bit phase offset resolution, 10-bit output amplitude scaling resolution, 0.12 Hz or better frequency tuning resolution. 
The project contains simple C-language program that initialize AD9959 DDS to generate CW signal with given frequency.

## Requirements

The program uses red pitaya's libraries for interfacing GPIO pins of red pitaya FPGA. 
Hence to build the program you have to run the commands below in the red pitaya OS.

## Installation
- Connect the pins of the DDS board with GPIO pins of Red Pitay board as it is declared in src/pins.c file. 

- Connect to your to your board  over SSH (replace the IP with IP address of your board)

 `ssh root@IP` 
 
 - make a clone of the project
 
`git clone git clone https://github.com/Eugene_91/rp-ad9959.git` 

`cd  rp-ad9959`

- build the project

`make`

## Usage
To generate 15 MHz signal at channel 1 run the following command
`LD_LIBRARY_PATH=/opt/redpitaya/lib bin/rp-ad9959 -f 15000000 -c 1`

## TODO

- Add code for parsing channels interdependently .
- Add code for parsing different amplitude levels from cmd.
- Add code for parsing relative phase between the channel from cmd.



