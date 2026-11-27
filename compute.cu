#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

// input restrictions
#define MAX_T 8

// set of functions
#define V_0(coord) (coord)

enum {
    V_LIN,
    V_SIN,
    V_SPH,
    V_SWL,
};

typedef struct coord {
    float x;
    float y;
    float c;
} coord_t;

typedef struct transform {
    int variation;  // 1=linear, 2=sinusoidal, 3=spherical, 4=swirl
    float weight;
    float color;
    float coefs[6];  // x1, x2, x3, y1, y2, y3
} transform_t;


// void read_config() {
//     // read in .config file, update function params

// }

// render_fractal()


int main(int argc, char** argv) {
    // check argc count

    // credit: sudoku lab starter code (written by Charlie Curtsinger) for input file reading
    // try to open .config input file
    FILE* fp = fopen(argv[1], "r");
    if (fp == NULL) {
        fprintf(stderr, "Failed to open config file %s.\n", argv[1]);
        perror(NULL);
        exit(2);
    }

    // jump to user table input in config file and read in params
    char line[128];
    char* p;
    int n = 0;
    transform_t transforms[MAX_T] = {0};

    // skip table header and separator line
    fgets(line, sizeof(line), fp);
    fgets(line, sizeof(line), fp);

    // read in table of params
    while (fgets(line, sizeof(line), fp)) {
        // tokenize row info
        char *tok = strtok(line, "|");
        if (line[0] != '|' || !tok) break;  // table ended

        float cells[8];
        for (int i = 0; i < 8; i++) {
            tok = strtok(NULL, "|");
            cells[i] = tok ? strtof(tok, NULL) : 0;  // read empty cells as 0
        }

        transforms[n].weight = cells[0];
        transforms[n].color = cells[1];
        memcpy(transforms[n].coefs, &cells[2], 6*sizeof(float));
        n++;
    }

    // read in the variation associated with each transform
    int id;
    char var[16];
    while (fgets(line, sizeof(line), fp)) {
        if ((sscanf(line, " T%d affine --> %16s", &id, var) == 2)
            && id >= 1 && id <= n) {  // check that we only have Ts with read params
                int v;
                if (!strcmp(var, "linear")) { v = V_LIN; }
                else if (!strcmp(var, "sinusoidal")) { v = V_SIN; }
                else if (!strcmp(var, "spherical")) { v = V_SPH; }
                else if (!strcmp(var, "swirl")) { v = V_SWL; }

                transforms[id-1].variation = v;
        }
    }
}