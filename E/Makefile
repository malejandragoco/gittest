#
CC=gcc
LIBS += -lpthread -lbcm2835
SRCS = SerialENB.c
OBJS = $(SRCS:.c=.o)
MAIN = SerialENB
INCLUDES += -I/usr/include

all: $(MAIN)
	@echo "<<Creado programa serial1>>"
$(MAIN): $(OBJS)
	$(CC) $(INCLUDES) -o $(MAIN) $(OBJS) $(LIBS)
clean:
	rm -rf *.o
