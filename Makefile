.PHONY: all test

all: test

test:
	mkdir -p build/bin
	nvcc -o build/bin/test-kNN-CUDA -Isrc test.cpp src/knncuda.cu -lcuda -lcublas -lcudart -Wno-deprecated-gpu-targets

clean:
	rm -rf build/
