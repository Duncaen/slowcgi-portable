include Makefile.configure

PROG=	slowcgi
SRCS=	slowcgi.c
SRCS+=	compats.c
CFLAGS+= -Wall
CFLAGS+= -Wstrict-prototypes -Wmissing-prototypes
CFLAGS+= -Wmissing-declarations
CFLAGS+= -Wshadow -Wpointer-arith -Wcast-qual
CFLAGS+= -Wsign-compare
LDADD=	-levent
DPADD=	${LIBEVENT}
MAN=	slowcgi.8

OBJS=	${SRCS:.c=.o}

LDFLAGS=${LDADD}

all: ${PROG}

${PROG}: ${OBJS}

clean:
	rm -f ${PROG} ${OBJS}

install:
	mkdir -p ${DESTDIR}${SBINDIR}
	mkdir -p ${DESTDIR}${MANDIR}/man8
	${INSTALL_PROGRAM} ${PROG} ${DESTDIR}${SBINDIR}
	${INSTALL_MAN} slowcgi.8 ${DESTDIR}${MANDIR}/man8
