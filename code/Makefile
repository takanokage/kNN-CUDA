.PHONY: all test

all: test

test:
	nvcc -o test -IkNN-CUDA test.cpp kNN-CUDA/knncuda.cu -lcuda -lcublas -lcudart -Wno-deprecated-gpu-targets

clean:
	rm test
