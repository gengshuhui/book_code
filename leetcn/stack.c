#define MAX_STACK 1024
typedef struct {
    int data[MAX_STACK];
    int bottom;
} Stack;
void myStackInit(Stack* s) {
    s->bottom = -1;
}
bool myStackPush(Stack* s, int x) {
    if(s->bottom <= (MAX_STACK - 1)) {
        s->data[++s->bottom] = x;
        return true;
    }
    return false;
}
bool myStackPop(Stack* s, int* x) {
    if(s->bottom > -1) {
        *x = s->data[s->bottom--];
        return true;
    }
    return false;
}
bool myStackPeek(Stack* s, int* x) {
    if(s->bottom > -1) {
        *x = s->data[s->bottom];
        return true;
    }
    return false;
}
bool myStackEmpty(Stack* s) {
    return s->bottom == -1;
}
