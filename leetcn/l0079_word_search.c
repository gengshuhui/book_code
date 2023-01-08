bool dfs(char** board, int maxRow, int maxCol, int r, int c, char* p) {
    if (*p == '\0') {   // bug: 只有一个字符时的边界情况 judge this first
        return true;
    }
    if (r < 0 || r >= maxRow || c < 0 || c >= maxCol) {
        return false;
    }

    if (board[r][c] != *p) {
        return false;
    }
    board[r][c] = '@';  // temp change to none word in case duplicate
    if (dfs(board, maxRow, maxCol, r - 1, c, p + 1)) {
        return true;
    }
    if (dfs(board, maxRow, maxCol, r + 1, c, p + 1)) {
        return true;
    }
    if (dfs(board, maxRow, maxCol, r, c - 1, p + 1)) {
        return true;
    }
    if (dfs(board, maxRow, maxCol, r, c + 1, p + 1)) {
        return true;
    }
    board[r][c] = *p;   // restore
    return false;
}

bool exist(char** board, int boardSize, int* boardColSize, char * word){
    int row = boardSize;
    int col = boardColSize[0];

    for (int r = 0; r < row; r++) {
        for (int c = 0; c < col; c++) {
            if (dfs(board, row, col, r, c, word)) {
                return true;
            }
        }
    }
    return false;
}
