

/**
 * Return an array of arrays of size *returnSize.
 * The sizes of the arrays are returned as *returnColumnSizes array.
 * Note: Both returned array and *columnSizes array must be malloced, assume caller calls free().
 */
void shiftOnce(int** grid, int n, int m) {
    // [0,m-1,m] -> [m,0,m-1]
    
    for(int r = 0; r < n; r++) {
        if(m <= 1) { break ;}
        
        int t = grid[r][m-1];
        for(int c = m - 1; c > 0; c--) {
            grid[r][c] = grid[r][c - 1];
        }
        grid[r][0] = t;
    }
    int t = grid[n-1][0];
    for(int r = n - 1; r > 0; r--) {
        grid[r][0] = grid[r-1][0];
    }
    grid[0][0] = t;
}
int** shiftGrid(int** grid, int gridSize, int* gridColSize, int k, int* returnSize, int** returnColumnSizes){
    int n = gridSize;
    int m = gridColSize[0];
    for (int i = 0; i < k; i++) {
        shiftOnce(grid, n, m);
    }
    
    // printf("a\n");
    int** ret = (int**)malloc(sizeof(int*) * n);
    for(int i = 0; i < n; i ++) {
        ret[i] = malloc(sizeof(int) * m);
        for(int j = 0; j < m; j++) {
            ret[i][j] = grid[i][j];
        }
    }
    
    // printf("b\n");
    *returnSize = n;
    *returnColumnSizes = (int*)malloc(sizeof(int) * n);
    for(int i = 0; i < n; i++) {
        (*returnColumnSizes)[i] = m;
    }
    
    return ret;
}


