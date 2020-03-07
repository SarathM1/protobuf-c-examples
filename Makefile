
# 
# compile tool
# compile param
# link    param
# exe file
# *.o file
# compile command 
# link command
#

CC = gcc
CFLAGS = -Wall -O2 -I/usr/local/include
LDFLAGS = /usr/local/lib/libprotobuf-c.a
TARGET = pack_unpack
OBJS = amessage.pb-c.o test4.o 
COMPILE  = $(CC) $(CFLAGS) -MD -c -o $@ $<
LINK = $(CC) $(OBJS) $(LDFLAGS) -o $@

ALL:$(TARGET)

$(TARGET):$(OBJS)
	$(LINK)

%.o:%.c
	$(COMPILE)
%.pb-c.c:%.proto
	protoc-c amessage.proto --c_out=./

-include $(OBJS:.o=.d)

clean:
	rm -f $(OBJS) *~ *.d *.o $(TARGET) *pb-c.[ch]
