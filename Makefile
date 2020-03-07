
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
TARGET1 = amessage_serialize
TARGET2 = amessage_deserialize

OBJS_1 = amessage.pb-c.o serialize.o 
OBJS_2 = amessage.pb-c.o deserialize.o 

COMPILE  = $(CC) $(CFLAGS) -MD -c -o $@ $<

LINK_1 = $(CC) $(OBJS_1) $(LDFLAGS) -o $@
LINK_2 = $(CC) $(OBJS_2) $(LDFLAGS) -o $@

ALL:$(TARGET1) $(TARGET2)

$(TARGET1):$(OBJS_1)
	$(LINK_1)

$(TARGET2):$(OBJS_2)
	$(LINK_2)

%.o:%.c
	$(COMPILE)

%.pb-c.c:%.proto
	protoc-c amessage.proto --c_out=./

-include $(OBJS_1:.o=.d)

clean:
	rm -f $(OBJS_1) $(OBJS_2) *~ *.d *.o $(TARGET1) $(TARGET2) *pb-c.[ch]
