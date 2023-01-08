/*
 * 1.5 seconds
[[5,0,1,1,2,1,0,1,3,6,3,0,7,3,3,3,1],[1,4,1,8,5,5,5,6,8,7,0,4,3,9,9,6,0],[2,8,3,3,1,6,1,4,9,0,9,2,3,3,3,8,4],[3,5,1,9,3,0,8,3,4,3,4,6,9,6,8,9,9],[3,0,7,4,6,6,4,6,8,8,9,3,8,3,9,3,4],[8,8,6,8,3,3,1,7,9,3,3,9,2,4,3,5,1],[7,1,0,4,7,8,4,6,4,2,1,3,7,8,3,5,4],[3,0,9,6,7,8,9,2,0,4,6,3,9,7,2,0,7],[8,0,8,2,6,4,4,0,9,3,8,4,0,4,7,0,4],[3,7,4,5,9,4,9,7,9,8,7,4,0,4,2,0,4],[5,9,0,1,9,1,5,9,5,5,3,4,6,9,8,5,6],[5,7,2,4,4,4,2,1,8,4,8,0,5,4,7,4,7],[9,5,8,6,4,4,3,9,8,1,1,8,7,7,3,6,9],[7,2,3,1,6,3,6,6,6,3,2,3,9,9,4,4,8]]

int minPathSum(int** grid, int gridSize, int* gridColSize){
    //printf("%d x %d: \n", gridSize, *gridColSize);
    if(gridSize == 1) {
        int sum = 0;
        for(int i=0; i< *gridColSize; i++){
            sum += grid[0][i];
        }
        return sum;
    }
    if(*gridColSize == 1){
        int sum = 0;
        for(int i=0; i < gridSize; i++){
            sum += grid[i][0];
        }
        return sum;
    }

    int me = grid[gridSize-1][*gridColSize-1];

    int tgridColSize = *gridColSize - 1;
    int l = minPathSum(grid, gridSize, &tgridColSize);
    int u = minPathSum(grid, gridSize - 1, gridColSize);
    int min = u < l ? u : l;

    return me + min;
}
*/

/*
采用从左上到右下扩散计算到此节点的最少距离，既右上到左下方斜线上的元素为一轮。
*/

#define min(a,b) ((a)<(b) ? (a) : (b))

int calMin(int** grid, int gridSize, int gridColSize) {
    for(int i=0; i <= gridSize + gridColSize - 2; i++) {
        for(int row=0; row < gridSize; row++){
            int col = i-row;
            if(col < 0 || col >=gridColSize) { continue; }

            //printf("%d-%d\n", row, col);
            unsigned int l = 0xffffffff;
            if(col >0){
                l = grid[row][col-1];
            }

            unsigned int u = 0xffffffff;
            if(row>0) {
                u = grid[row-1][col];
            }
            unsigned int m = min(u,l);
            if(m != 0xFFFFFFFF) {
                grid[row][col] += m; 
            }
        }
    }
    return grid[gridSize-1][gridColSize-1];
}
int minPathSum(int** grid, int gridSize, int* gridColSize){
    //printf("%d x %d: \n", gridSize, *gridColSize);

    return calMin(grid, gridSize, *gridColSize);
}
