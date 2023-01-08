typedef struct Element{
     int index;
     int data;
 }Element;
 typedef struct HashTable {
     Element* elements;
     int cap;
     int counts;
 }HashTable;

int HashInit(HashTable* table, int cap){
    table->elements = (Element*)malloc(sizeof(Element)* cap);
    if(table->elements == NULL){
        return -1;
    }
    table->cap = cap;
    table->counts = 0;
    for(int i=0; i < table->cap; i++){
        table->elements[i].index = -1;
        table->elements[i].data = -1;
    }
    return 0;
}
void HashFree(HashTable* table){
    free(table->elements);
    table->elements = 0;
}
int HashAddr(int data, int cap){
    int addr = (data == 0 ? 0 : (data^(data>>16)) &(cap - 1 ));
    //int addr = data&(cap-1);
    return addr;
}

int HashAdd(HashTable* table, int data, int idx){
    if(table->counts >= table->cap){
        return -1;
    }
    int pkey = HashAddr(data, table->cap);
    int addr = pkey;
    while (table->elements[addr].index != -1) {
        addr = (addr + 1) % table->cap;
    }
    table->elements[addr].index = idx;
    table->elements[addr].data = data;
    table->counts++;

    return 0;
}
Element* HashFind(HashTable* table, int data){
    int pkey = HashAddr(data, table->cap);
    //printf("key:%d", pkey);
    int addr = pkey;
    do {
        if(table->elements[addr].index == -1) {
            return NULL;
        }
        if(table->elements[addr].data == data){
            return &table->elements[addr];
        }
        addr = (addr + 1) % table->cap;
        //printf("addr:%d", addr);
    }while(addr != pkey);

    return NULL;
}

int* twoSum(int* nums, int numsSize, int target, int* returnSize){
    HashTable table;
    HashInit(&table, numsSize+numsSize/4);
    //printf("aaa");
    for(int i=0; i < numsSize; i++ ) {
        //printf("bbb%d", i);
        Element* e;
        
        if((e = HashFind(&table, target - nums[i])) != NULL) {
            int* ret = (int*)malloc(sizeof(int)*2);
            ret[1] = i;
            ret[0] = e->index;
            *returnSize = 2;
            HashFree(&table);
            return ret;
        }
        HashAdd(&table, nums[i], i);
    }
    HashFree(&table);

    return NULL;
}


