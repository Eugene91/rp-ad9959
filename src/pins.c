#include "rp.h"
int unsigned MASTER_RESET=RP_DIO1_P; // gpio #5
int unsigned SDIO2 = RP_DIO1_N; // gpio #6
int unsigned SDIO3 = RP_DIO2_P; // gpio #7 
int unsigned SDIO1 = RP_DIO2_N; // gpio #8
int unsigned SDIO0 = RP_DIO3_P; //gpio #9
int unsigned SCLK = RP_DIO3_N; // gpio #10
int unsigned CS = RP_DIO4_P; // gpio #11
int unsigned DINP0 = RP_DIO4_N; // gpio #12
int unsigned DINP1 = RP_DIO5_P; // gpio #13
int unsigned DINP2 = RP_DIO5_N; //gpio #14
int unsigned DINP3 = RP_DIO6_P; // gpio #15
int unsigned IOUPDATE = RP_DIO6_N; // gpio #16
const unsigned long int SYS_FREQ =25*1000000*20;// system clock 
