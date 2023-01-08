
#define MAX_C 26
typedef struct {
    struct MapSum* next[MAX_C];
    bool end;
    int val;
} MapSum;

/** Initialize your data structure here. */

MapSum* mapSumCreate() {
    return (MapSum*)calloc(1, sizeof(MapSum));
}

void mapSumInsert(MapSum* obj, char * key, int val) {
    for(int i = 0; i < strlen(key); i++) {
        char c = key[i];
        if(!obj->next[c - 'a']) {
            obj->next[c - 'a'] = (MapSum*)calloc(1, sizeof(MapSum));
        }
        obj = obj->next[c - 'a'];
    }
    obj->end = true;
    obj->val = val;
}

int helperSum(MapSum* obj) {
    if(!obj) { return 0; }
    
    int sum = 0;
    if(obj->end) {
        sum += obj->val;
    }
    for(int i = 0; i < MAX_C; i++) {
        if(obj->next[i]) {
           sum += helperSum(obj->next[i]); 
        }
    }
    return sum;  
}
int mapSumSum(MapSum* obj, char * prefix) {
    int sum = 0;
    for(int i = 0; i < strlen(prefix); i++) {
        char c = prefix[i];
        if(!obj->next[c - 'a']){
            return sum;
        }
        obj = obj->next[c - 'a'];
        if(!obj) {
            return sum;
        }
    }
    
    // 
    return helperSum(obj);
}

void mapSumFree(MapSum* obj) {
    if(!obj) { return ; }
    for(int i = 0; i < MAX_C; i++) {
        if(!obj->next[i]) {
            mapSumFree(obj->next[i]);
            obj->next[i] = NULL;
        }
    }
    free(obj);
}

/**
 * Your MapSum struct will be instantiated and called as such:
 * MapSum* obj = mapSumCreate();
 * mapSumInsert(obj, key, val);
 
 * int param_2 = mapSumSum(obj, prefix);
 
 * mapSumFree(obj);
*/
