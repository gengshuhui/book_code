/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */


struct ListNode* removeNthFromEnd(struct ListNode* head, int n){
    struct ListNode* leader = head;
    struct ListNode* follower = head;
    int count = 0;

    if(!head->next){
        free(head);
        return NULL;
    }

    while(leader->next) {
        count++;
        leader = leader->next;
        if(count > n) {
            follower = follower->next;
        }
    }

    if((follower == head) && (count == n-1)) { // first element
        leader = head->next;
        free(follower);
        return leader;
    }

    // not fisrt
    leader = follower->next;
    if (follower->next) {
       follower->next = follower->next->next;
    }
    if(leader) { free(leader); }

    return head;
}

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */


struct ListNode* removeNthFromEnd(struct ListNode* head, int n){
    struct ListNode** leader = &head;
    struct ListNode** follower = &head;

    while(n--) {
        leader = &(*leader->next);
    }

    while(*leader) {
        leader = &(*leader->next);
        follower = &(*follower->next);
    }

    struct ListNode* tmp = *follower;
    *follower = *follower->next->next;
    free(tmp);

    return head;
}
