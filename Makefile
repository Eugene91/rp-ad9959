# Red Pitay model
MODEL ?= Z10 
CC := gcc
SRCDIR := src
BUILDDIR := build
TARGET := bin/rp-ad9959
SRCEXT := c
#SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
SOURCES :=  src/rp-ad9959-dds.c
OBJECTS :=  build/rp-ad9959-dds.o
#OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
LIB += lib/libdropt.a
INC := -I include
# Red Pitay specific header and libraries
CFLAGS += -I/opt/redpitaya/include -D$(MODEL)
LIB += -L/opt/redpitaya/lib
LIB += -static -lrp 
LIB += -lrp-hw -lm -lstdc++ -lpthread

ifeq ($(MODEL),Z20_250_12)
INC += -I/opt/redpitaya/include/api250-12
LIB += -lrp-gpio -lrp-i2c
endif


$(TARGET): $(OBJECTS)
	@echo " Linking..."
	@echo " $(CC) $^ -o $(TARGET) $(LIB) " ; $(CC) $^ -o $(TARGET) $(LIB) -O3

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@echo " Building..."
	@mkdir -p $(BUILDDIR)
	@echo " $(CC) $(CFLAGS) $(INC) -c -o $@ $<"; $(CC) $(CFLAGS) $(INC) -c -o $@ $< -save-temps -O3

clean:
	@echo " Cleaning..."; 
	@echo " $(RM) -r $(BUILDDIR) $(TARGET)"; $(RM) -r $(BUILDDIR) $(TARGET)



.PHONY: clean
