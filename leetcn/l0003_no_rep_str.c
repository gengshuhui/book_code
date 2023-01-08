int lengthOfLongestSubstring(char * s){
    #define MAX 512
    char flags[MAX]= {-1};
    memset(flags, -1, MAX);
    int left = 0;
    int count = 0;
    int maxLen = 0;
    printf("%d\n\n", strlen(s));
    for (int i=0; i< strlen(s); i++){
        char t = s[i];
        int orgIdx = flags[t];
        printf("%i:%c:%i\t", i, t, orgIdx);
        if(orgIdx ==-1) {
            flags[t] = i;
            count++;
        } else {
            if(count > maxLen) {
                maxLen = count;
            }   

            for(int j=left; j <= orgIdx; j++) {
                printf("%i=%c", j, s[j]);
                flags[s[j]] = -1; 
            }   
            left = orgIdx + 1;
            count = i - left ;
            flags[t] = i;
        }   
        printf("\n");
    }   
    if(count > maxLen) {
        maxLen = count;
    }   

    printf("%d", maxLen);
    return maxLen;
}
