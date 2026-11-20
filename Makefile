CC := nvcc
CFLAGS := -g

TARGET := fractal-stack
SOURCES := main.c compute.cu colorize.c
HEADERS := colorize.h

all: $(TARGET)

$(TARGET): $(SOURCES) $(HEADERS) Makefile
	$(CC) $(CFLAGS) -o fractal-stack $(SOURCES)

clean:
	rm -f fractal-stack

zip:
	@echo "Generating fractal-stack.zip file to submit to Gradescope..."
	@zip -q -r fractal-stack.zip . -x .git/\* .vscode/\* .clang-format .gitignore fractal-stack fractal-stack.zip
	@echo "Done. Please upload fractal-stack.zip to Gradescope."

format:
	@echo "Reformatting source code."
	@clang-format -i --style=file $(wildcard *.c) $(wildcard *.h) $(wildcard *.cu)
	@echo "Done."

.PHONY: all clean zip format

