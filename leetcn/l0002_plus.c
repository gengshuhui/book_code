/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

struct ListNode* reverseList(struct ListNode* l) {
    struct ListNode* p = NULL;
    struct ListNode* c = l;
    if (!c) {
        return l;
    }
    struct ListNode* n = c->next;

    while(n) {
        //printf("%d", c->val);
        c->next = p;
        p = c;
        c = n;
        n = n->next;
    }
    c->next = p;
    //printf("%d\n", c->val);
    return c;
}

struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2){
    struct ListNode* l3 = NULL;
    struct ListNode* tail3 = NULL;

    struct ListNode* t1 = l1;
    struct ListNode* t2 = l2;

    int carry = 0;
    while(t1 || t2) {
        int sum = carry;
        if (t1) { 
            sum += t1->val;
            t1 = t1->next;
        }

        if (t2) {
            sum += t2->val;
            t2 = t2->next;
        }

        if (sum >= 10) {
            carry = 1;
            sum = sum % 10;
        } else {
            carry = 0;
        }

        struct ListNode* t3 = malloc(sizeof(struct ListNode));
        t3->val = sum;
        t3->next = NULL;

        if(l3) {
            tail3->next = t3;
            tail3 = t3;
        } else {
            l3 = t3;
            tail3 = l3;
        }
    }

    if (carry) {
        struct ListNode* t3 = malloc(sizeof(struct ListNode));
        t3->val = carry;
        t3->next = NULL;
        tail3->next = t3;
    }

    return l3;
}
