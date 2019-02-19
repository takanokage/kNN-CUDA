.PHONY: all test

all: test

test:
	mkdir -p build/bin
	nvcc -o build/bin/test -IkNN-CUDA test.cpp kNN-CUDA/knncuda.cu -lcuda -lcublas -lcudart -Wno-deprecated-gpu-targets

clean:
	rm -rf build/
