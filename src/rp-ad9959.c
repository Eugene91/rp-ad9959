#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <unistd.h>
#include "rp.h"
#include "dropt.h"
#include "pins.c"

 //-----------------------------------------------------
// //initialization for AD9959
void ad9959_init(void)
{
    unsigned int i;
    rp_DpinSetState(MASTER_RESET, RP_LOW);
    usleep(10);
    rp_DpinSetState(CS, RP_HIGH);  
    rp_DpinSetState(SCLK, RP_LOW);
    rp_DpinSetState(SDIO3, RP_HIGH); 
    rp_DpinSetState(MASTER_RESET, RP_HIGH);
    usleep(10);
    rp_DpinSetState(MASTER_RESET, RP_LOW);
    usleep(10);
 }
//-----------------------------------------------------
void write_a_byte(unsigned char w_data)
{
 unsigned char i;
 for(i=0;i<8;i++)
  {
   if(w_data & 0x80)
   {
     rp_DpinSetState(SDIO0, RP_HIGH); 
   }
   else
   {
     rp_DpinSetState(SDIO0, RP_LOW); //read  instruction bit
   }
   w_data<<=1;
   rp_DpinSetState(SCLK, RP_HIGH); 
   usleep(10);
   rp_DpinSetState(SCLK, RP_LOW); 
  }
}
//-----------------------------------------------------
// Channel Select Register
void write_CSR(unsigned char w_data)
{
	rp_DpinSetState(SDIO3, RP_LOW); 
    rp_DpinSetState(CS, RP_LOW); 
    write_a_byte(0x00);   
    write_a_byte(w_data);
    rp_DpinSetState(CS, RP_HIGH); 
    rp_DpinSetState(SDIO3, RP_HIGH); 
}
//-----------------------------------------------------
// Channel Function register
void write_CFR(unsigned char w_data1,unsigned char w_data2,unsigned char w_data3)
{
 rp_DpinSetState(SDIO3, RP_LOW); 
 rp_DpinSetState(CS, RP_LOW);
 write_a_byte(0x03); //address 3
 write_a_byte(w_data1);
 write_a_byte(w_data2);
 write_a_byte(w_data3);
 rp_DpinSetState(CS, RP_HIGH);    
 rp_DpinSetState(SDIO3, RP_HIGH); 
}
//----------------------------------------------------- 
void write_FR1(unsigned char w_data1,unsigned char w_data2,unsigned char w_data3)
{
  rp_DpinSetState(SDIO3, RP_LOW); 
  rp_DpinSetState(CS, RP_LOW); 
  write_a_byte(0x01);   
  write_a_byte(w_data1);
  write_a_byte(w_data2);
  write_a_byte(w_data3);
  rp_DpinSetState(CS, RP_HIGH); 
  rp_DpinSetState(SDIO3, RP_HIGH); 
}

//-----------------------------------------------------
void write_FR2(unsigned char w_data1,unsigned char w_data2)
{

 rp_DpinSetState(SDIO3, RP_LOW); 
 rp_DpinSetState(CS, RP_LOW); 
 write_a_byte(0x02);    //write address 2
 write_a_byte(w_data1);
 write_a_byte(w_data2);
 rp_DpinSetState(CS, RP_HIGH); 
 rp_DpinSetState(SDIO3, RP_HIGH); 
}
//-----------------------------------------------------
void write_CFTW0(unsigned long int F_word)  //Channel Frequency Tuning Word  (CTW0)
{
  
 rp_DpinSetState(SDIO3, RP_LOW); 
 rp_DpinSetState(CS, RP_LOW); 
 write_a_byte(0x04); //Address is 4
 write_a_byte(((unsigned char *)(&F_word))[3]);//all 32 bits, write byte to byte from MSB to LSB 
 write_a_byte(((unsigned char *)(&F_word))[2]);
 write_a_byte(((unsigned char *)(&F_word))[1]);
 write_a_byte(((unsigned char *)(&F_word))[0]);
 rp_DpinSetState(CS, RP_HIGH);
 rp_DpinSetState(SDIO3, RP_HIGH);
}
//-----------------------------------------------------


//for converting binary to decimal
void set_frequency(unsigned long int f)
{
 unsigned long int temp;
 temp=(unsigned long int)f*(0xFFFFFFFF/(float)SYS_FREQ);
 write_CFTW0(temp);
}
//-----------------------------------------------------
void update(void)
{
   rp_DpinSetState(IOUPDATE, RP_LOW); 
   usleep(10); //delay in case DDS fail to catch
   rp_DpinSetState(IOUPDATE, RP_HIGH); 
   
}






void add9959 (int freq, int ch) {
  

    /* Initialization of API*/
    if (rp_Init() != RP_OK) {
        fprintf(stderr, "Red Pitaya API init failed!\n");
        return EXIT_FAILURE;
    }
    
    
    /* Set outputs*/
      rp_DpinSetDirection(MASTER_RESET,RP_OUT); 
      rp_DpinSetDirection(SDIO3,RP_OUT); 
      rp_DpinSetDirection(SDIO2,RP_OUT);
      rp_DpinSetDirection(SDIO1,RP_OUT); 
      rp_DpinSetDirection(SDIO0,RP_OUT); 
      rp_DpinSetDirection(SCLK,RP_OUT); 
      rp_DpinSetDirection(CS,RP_OUT); 
      rp_DpinSetDirection(DINP0,RP_OUT);
      rp_DpinSetDirection(DINP1,RP_OUT);
      rp_DpinSetDirection(DINP2,RP_OUT);
      rp_DpinSetDirection(DINP3,RP_OUT);
      rp_DpinSetDirection(IOUPDATE,RP_OUT);
    /* main program*/
   
    ad9959_init(); // initialization of AD9959

    write_CSR(ch);  //Channel 0~3 enabled, 2-wire mode(single-bit serial), MSB first (0x00,0x10,0x20,0x30)
    write_FR1(0xd0,0x00,0x00);
    write_FR2(0x00,0x00); //default mode
    write_CFR(0x00,0x03,0x00);  //no modulation
    set_frequency(freq);
    update();

    // Releasing resources
    rp_Release();

    return EXIT_SUCCESS;
}






int main(int argc, char** argv)
{
    /* The `static` keyword is used here for compatibility with strict
     * C89 compilers.
     */
    static dropt_bool showHelp = 0;
    static int freq = 10000000; // Ten MHz
    static int ch = 0;

    int exitCode = EXIT_SUCCESS;

    /* Introduce a set of arguments for the program
     */
    dropt_option options[] = {
        { 'h',  "help", "Shows help.", NULL, dropt_handle_bool, &showHelp, dropt_attr_halt },
        { '?', NULL, NULL, NULL, dropt_handle_bool, &showHelp, dropt_attr_halt | dropt_attr_hidden },
        { 'f',  "freq", "Frequency value.", "frequency in Hz between 200 000 000", dropt_handle_int, &freq },
        {'c',"ch", "Channel value.", "from 0 to 3", dropt_handle_int, &ch },
        { 0 } /* Required sentinel value. */
    };

    dropt_context* droptContext = dropt_new_context(options);
    
    if (droptContext == NULL)
    {
        /* We failed to create the dropt context, possibly due to memory
         * allocation failure.
         * This also can happen due to logical errors (e.g. if the options
         * array is malformed).  Logical errors will trigger `DROPT_MISUSE()`
         * and will terminate the program in debug builds.
         */
        exitCode = EXIT_FAILURE;
    }
    else if (argc == 0)
    {
        printf("No arguments are provided. See help by running program with -h option ");
    }
    else
    {
        /* Parse the arguments from `argv`.
         * `argv[1]` is always safe to access since we've established that
         * `argc` > 0 and since `argv[argc]` is guaranteed to be a null
         * pointer.
         */
        char** rest = dropt_parse(droptContext, -1, &argv[1]);
        
        if (dropt_get_error(droptContext) != dropt_error_none)
        {
            fprintf(stderr, "add9959-dds-firmware: %s\n", dropt_get_error_message(droptContext));
            exitCode = EXIT_FAILURE;
        }
        else if (showHelp)
        {
            printf("Usage: add9959-dds-firmware [options] [--] [operands]\n\n"
                   "Options:\n");
            dropt_print_help(stdout, droptContext, NULL);
        }
        else
        {
            if (freq > 200000000 || freq <= 0 || ch >3 || ch <0)
            { 
               printf("Wrong parameters values \n");
               return EXIT_FAILURE; 
                
            }
            else
            {
              printf("frequency value: %d\n", freq);
              printf("channel value: %x\n", ch);
              add9959(freq, ch<<4);
                
            }
            

        }
    }

    dropt_free_context(droptContext);

    return exitCode;
}


