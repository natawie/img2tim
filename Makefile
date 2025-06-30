LIBS = -lfreeimage
CFLAGS = -g -Wall -Wextra -O3

.PHONY: default all clean

default: img2tim
all: img2tim

OBJECTS := $(patsubst %.cpp,%.o,$(wildcard *.cpp))
HEADERS := $(wildcard *.h)

%.o: %.cpp $(HEADERS)
	$(CXX) $(CFLAGS) -c $< -o $@

.PRECIOUS: img2tim $(OBJECTS)

img2tim: $(OBJECTS)
	$(CXX) $(CFLAGS) -o $@ $^ $(LIBS)

clean:
	-rm -f $(OBJECTS) img2tim
