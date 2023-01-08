#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>
#include <string.h>

char * longestPalindrome(char * s){
    char* h = s;
    int len = strlen(s);
    if (len <= 1) { return s; }
    char* tail = h + len - 1;
    char* p = s;
    char* pmax = h;
    int max_len = 0;

    while((p>=h) && (p<tail)){
        if(*p ==*(p+1)){
            int count = 0;
            while((p-count) >=h && ((p+1+count) <= tail) &&
                (*(p-count) ==  *(p+1+count))) {
                count++;
            }
            if(count*2 > max_len) { max_len = count*2; pmax = p-count+1; }
        } 
        if((p - 1 >= h) && (p <= tail)){
            int count = 0;
            while ((p - 1 - count) >= h && ((p + 1 + count) <= tail) &&
                (*(p -1 - count) == *(p + 1 + count))) {
                count++;
            }
            int tlen = count*2+1;
            if ( (tlen >= 3) && tlen > max_len) { max_len = tlen; pmax = p - count; }
        }
        p++;
    }
    //char* r = malloc(max_len+1);
    //strncpy(r, pmax, max_len);
    if(max_len >= 2) {
        *(pmax+max_len) = '\0';
    } else if(len == 2 || max_len ==0){
        *(pmax+1) = '\0';
    }
    printf("%d:%s\n", max_len, pmax);

    return pmax;
}



int main() {
    char* r = NULL;
    char s[] = "babad";
    r = longestPalindrome(s);
    assert(r);
    assert(strcmp("aba", r) == 0 || strcmp("bab", r) == 0);

    char s1[] = "";
    r = longestPalindrome(s1);
    assert(r);
    assert(strcmp("", r) == 0  );


    char s2[] = "bb";
    r = longestPalindrome(s2);
    assert(r);
    assert(strcmp("bb", r) == 0 );

    char s3[] = "b";
    r = longestPalindrome(s3);
    assert(r);
    assert(strcmp("b", r) == 0 );

    char s4[] = "ab";
    r = longestPalindrome(s4);
    assert(r);
    assert(strcmp("a", r) == 0 );

    char s5[] = "ccc";
    r = longestPalindrome(s5);
    assert(r);
    assert(strcmp("ccc", r) == 0 );

    char s6[] = "abcda";
    r = longestPalindrome(s6);
    assert(r);
    assert(strcmp("a", r) == 0 );
    return 0;
}
