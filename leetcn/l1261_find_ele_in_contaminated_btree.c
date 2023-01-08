/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */

#define bool int
  struct TreeNode {
      int val;
      struct TreeNode *left;
      struct TreeNode *right;
  };


typedef struct {
    struct TreeNode* tree;
} FindElements;

void adjustTree(struct TreeNode* n) {
    if(!n) { return ; }
    
    if(n->left) {
        n->left->val = n->val * 2 + 1;
        adjustTree(n->left);
    }
    if(n->right) {
        n->right->val = n->val * 2 + 2;
        addustTree(n->right);
    }
}

FindElements* findElementsCreate(struct TreeNode* root) {
    FindElements* obj = malloc(sizeof(FindElements));
    obj->tree = root;
    obj->tree->val = 0;
    
    adjustTree(obj->tree);
    return obj;
}

bool findTree(struct TreeNode* n, int target) {
    if(!n) { return false; }
    
    if(n->val == target) { return true; }
    
    if(n->left) {
        bool find = findTree(n->left, target);
        if (find) { return true; }
    }
    
    if(n->right) {
        return findTree(n->right, target);
    }
    
    return false;
}
bool findElementsFind(FindElements* obj, int target) {
    struct TreeNode* root = obj->tree;
    return findTree(root, target);  
}

void findElementsFree(FindElements* obj) {
    free(obj);
}

/**
 * Your FindElements struct will be instantiated and called as such:
 * FindElements* obj = findElementsCreate(root);
 * bool param_1 = findElementsFind(obj, target);
 
 * findElementsFree(obj);
*/
