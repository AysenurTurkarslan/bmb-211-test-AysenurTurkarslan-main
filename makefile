CXX := g++ 
CXXFLAGS := -Wall -g
FILEBASES := $(basename $(wildcard src/*.cpp))
SOURCES := $(subst src/, , $(FILEBASES))
TESTBASES := $(basename $(wildcard bin/*.o))
TESTS := $(subst bin/, , $(TESTBASES))

all:$(SOURCES)

$(SOURCES):
	@$(CXX) $(CXXFLAGS) -c src/$@.cpp -o obj/$@.obj 
	@$(CXX) $(CXXFLAGS) -c test/$@_test.cpp -o obj/$@_test.obj
	@$(CXX) $(CXXFLAGS) -o bin/$@_test.o obj/$@.obj obj/$@_test.obj
	@echo "$@ and related files were compiled."

$(TESTS):
	@./bin/$@.o


clean:
	@rm -rf bin/*.o obj/*.obj

