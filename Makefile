## make file for rq-blacklist.

all: rq-blacklist

DEBUG_LIBS=
#DEBUG_LIBS=-lefence -lpthread


ARGS=-Wall -O2 -g
LIBS=-lrq-service -lrispbuf -lrisp -levent_core -lexpbufpool -lexpbuf -lrq -llinklist -lrq-blacklist -lcsv $(DEBUG_LIBS)
OBJS=event-compat.o rq-blacklist.o


rq-blacklist: $(OBJS)
	gcc -o $@ $(OBJS) $(LIBS) $(ARGS)

rq-blacklist.o: rq-blacklist.c event-compat.h
	gcc -c -o $@ rq-blacklist.c $(ARGS)


event-compat.o: event-compat.c event-compat.h
	gcc -c -o $@ event-compat.c $(ARGS)


install: rq-blacklist
	@cp rq-blacklist /usr/bin

clean:
	@-rm rq-blacklist
	@-rm $(OBJS)
