#define MAX_C 26
typedef struct Trie {
    struct Trie* next[MAX_C];
    bool end;
} Trie;

/** Initialize your data structure here. */

Trie* trieCreate() {
    Trie* obj = (Trie*)calloc(1, sizeof(Trie));
    obj->end = false;
    return obj;
}

/** Inserts a word into the trie. */
void trieInsert(Trie* obj, char * word) {
    for(int i = 0; i < strlen(word); i ++) {
        char c = word[i];
        if(!obj->next[c - 'a']) {
            obj->next[c - 'a'] = (Trie*)calloc(1, sizeof(Trie));
        }
        obj = obj->next[c - 'a'];
    }
    obj->end = true;
}

/** Returns if the word is in the trie. */
bool trieSearch(Trie* obj, char * word) {
    for(int i = 0; i < strlen(word); i ++) {
        char c = word[i];
        if(!obj->next[c - 'a']) {
            return false;
        }
        obj = obj->next[c - 'a'];
    }
    return obj->end;
}

/** Returns if there is any word in the trie that starts with the given prefix. */
bool trieStartsWith(Trie* obj, char * prefix) {
    for(int i = 0; i < strlen(prefix); i ++) {
        char c = prefix[i];
        if(!obj->next[c - 'a']) {
            return false;
        }
        obj = obj->next[c - 'a'];
    }
    return true;
}

void trieFree(Trie* obj) {
    if(!obj) return;

    for(int i = 0; i < MAX_C; i++) {
        trieFree(obj->next[i]);
        obj->next[i] = NULL;
    }

    free(obj);
}

/**
 * Your Trie struct will be instantiated and called as such:
 * Trie* obj = trieCreate();
 * trieInsert(obj, word);
 
 * bool param_2 = trieSearch(obj, word);
 
 * bool param_3 = trieStartsWith(obj, prefix);
 
 * trieFree(obj);
*/
