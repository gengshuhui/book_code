typedef struct {
    int *data;
    int len;
    int head;
    int tail;
} MyQueue;
bool myQueueIsEmpty(MyQueue*);
bool myQueueIsFull(MyQueue*);
MyQueue* myQueueCreate(int k) {
    if (k <= 0) {
        return NULL;
    }
    MyQueue* obj = calloc(1, sizeof(MyQueue));
    obj->data = calloc(k, sizeof(int));
    obj->len = k;
    obj->head = -1;
    obj->tail = -1;
    return obj;
}
bool myQueueEnQueue(MyQueue* obj, int value) {
    if (myQueueIsFull(obj)) {
        return false;
    }
    obj->tail = (obj->tail + 1) % obj->len;
    obj->data[obj->tail] = value;
    if (obj->head == -1) {
        obj->head++;
    }
    return true;
}
bool myQueueDeQueue(MyQueue* obj, int* value) {
    if (myQueueIsEmpty(obj)) {
       return false;
    }
    if (obj->tail == obj->head) { // become empty
        *value = obj->data[obj->head];
        obj->head = -1;
        obj->tail = -1;
        return true;
    }
    *value = obj->data[obj->head];
    obj->head = (obj->head + 1) % obj->len;
    return true;
}
bool myQueueFront(MyQueue* obj, int* value) {
    if (myQueueIsEmpty(obj)) {
        return false;
    }
    *value = obj->data[obj->head]; 
    return true;
}
bool myQueueRear(MyQueue* obj, int* value) {
    if (myQueueIsEmpty(obj)) {
        return -1;
    }
    *value = obj->data[obj->tail]; 
    return true;
}
int myQueueSize(MyQueue* obj) {
    return (obj->head == -1) ? 0 : (((obj->len + obj->tail - obj->head) % obj->len) + 1);
}
bool myQueueIsEmpty(MyQueue* obj) {
    return obj->head == -1 || obj->tail == -1;
}
bool myQueueIsFull(MyQueue* obj) {
    return (obj->tail + 1) % obj->len == obj->head;
}
void myQueueFree(MyQueue* obj) {
    free(obj->data);
    free(obj);
}
