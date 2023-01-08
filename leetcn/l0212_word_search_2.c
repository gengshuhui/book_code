/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
#define MAX_C 26
typedef struct Node {
    int end;
    struct Node* data[MAX_C];
}Node;

Node* trieNewNode() {
    return (Node*)calloc(1, sizeof(struct Node));
}

void trieAddWord(Node* t, char* word) {
    for (int i = 0; i < strlen(word); i++) {
        char c = word[i];
        if (!t->data[c - 'a']) {
            t->data[c - 'a'] = trieNewNode();
        }
        t = t->data[c - 'a'];
    }
    t->end = true;
}

void trieFree(Node* t) {
    for(int i = 0; i < MAX_C; i++) {
        if (t->data[i]) {
            trieFree(t->data[i]);
        }
    }
    free(t);
}

#define MAX_BUF 1024
char gBuf[MAX_BUF];
int gBufLen;

void dfs(char** board, int maxRow, int maxCol, int r, int c, char*** words, int* returnSize, Node* node) {
    if (!node) {
        return;
    }
    if (r < 0 || r >= maxRow || c < 0 || c >= maxCol) {
        return;
    }
    char cc = board[r][c];
    if (board[r][c] == '@' || !node->data[cc - 'a']) {  // BUG: 忘了@
        return;
    }

    // 移动到本字符节点指针（不管是不是还有后续后缀）
    node = node->data[cc - 'a'];

    // save cur char
    if(gBufLen >= MAX_BUF) {
        printf("buffer not enough");
        return;
    }
    gBuf[gBufLen++] = cc;
    // printf("buf:%i-%c\n", gBufLen, cc);

    if (node->end) {    // 保存word
        //gBuf[gBufLen++] = '\0'; // BUG: 这里不能加null，干扰后续，比如字典有aa aab，结果中b前面多了\0了
        (*words)[*returnSize] = (char*)calloc(gBufLen + 1, sizeof(char));   // 注意:要多分一个\0
        memcpy((*words)[*returnSize], gBuf, gBufLen);
        (*returnSize)++;

        node->end = false; // 找到word以后就改标识，防止重复而导致结果words溢出，如：[["a","a"]] 字典是 ["a"] 
    }

    char tmp = board[r][c]; // 保存本字符
    board[r][c] = '@';      // 标识本字符已经不能被再次使用了，小技巧，改变了原内容
    int tBufLen = gBufLen;

    dfs(board, maxRow, maxCol, r - 1, c, words, returnSize, node);
    gBufLen = tBufLen;  // 恢复buf长度
    dfs(board, maxRow, maxCol, r + 1, c, words, returnSize, node);
    gBufLen = tBufLen;
    dfs(board, maxRow, maxCol, r, c - 1, words, returnSize, node);
    gBufLen = tBufLen;
    dfs(board, maxRow, maxCol, r, c + 1, words, returnSize, node);
    gBufLen = tBufLen;
    
    board[r][c] = tmp;  // 恢复本字符
}
char ** findWords(char** board, int boardSize, int* boardColSize, char ** words, int wordsSize, int* returnSize){
    // add all words to trie
    Node* t = trieNewNode();
    for (int i = 0; i < wordsSize; i++) {
        trieAddWord(t, words[i]);
    }

    int maxRow = boardSize;
    int maxCol = boardColSize[0];
    *returnSize = 0;
    words = (int**)calloc(wordsSize, sizeof(char*));

    for (int r = 0; r < maxRow; r++) {
        for (int c = 0; c < maxCol; c++) {
            // printf("--rc:%i-%i\n", r, c);
            gBufLen = 0;
            dfs(board, maxRow, maxCol, r, c, &words, returnSize, t);
        }
    }

    trieFree(t);
    return words;
}
