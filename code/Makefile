.PHONY: all test

all: test

test:
	mkdir bin
	nvcc -o bin/test -IkNN-CUDA test.cpp kNN-CUDA/knncuda.cu -lcuda -lcublas -lcudart -Wno-deprecated-gpu-targets

clean:
	rm -rf bin/
