#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

// input restrictions
#define MAX_COEF_LEN 2
#define MAX C_LEN

// set of functions
#define V_0(coord) (coord)

typedef struct coord {
    float x;
    float y;
    float c;
} coord_t;

typedef struct config {
} config_t;

// .config hardcode



// read_config()
void read_config() {
    // read in .config file, update function params
    int x_coef = 3;
    int y_coef = 5;
    // int c = read in, no coefficient

}

// render_fractal()


int main(int argc, char** argv) {
    // check argc count

    // credit: sudoku lab starter code (written by Charlie Curtsinger) for input file reading
    // try to open .config input file
    FILE* input = fopen(argv[1], "r");
    if (input == NULL) {
        fprintf(stderr, "Failed to open config file %s.\n", argv[1]);
        perror(NULL);
        exit(2);
    }

    int x_coef;
    int y_coef;

    // read in config file line-by-line
    char* line = NULL;  // free later
    // size_t line_capacity = 0;
    // while (getline(&line, &line_capacity, input) > 0) {
    //     if (sscanf(line, "%*[^0-9]%d", &x_coef) != 1) {
    //         perror("sscanf");
    //     }
    // } 
    if (sscanf(line, "%*[^0-9]%d\n%*[^0-9]%d", &x_coef, &y_coef) != 1) {
        perror("sscanf");
    }
    // scan in c as well, then check for [0,1] range

}