//
//  node.h
//  HashMap
//
//  Created by mayee on 16/6/19.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#ifndef node_h
#define node_h

#include <stdio.h>

#define RETAIN(node)  nodeRetain(node)
#define RELEASE(node) nodeRelease(node)
#define RETAIN_COUNT(node) nodeRetainCount(node)


typedef struct  node_ {
    int retainCount_;
    unsigned int hash_;
    char *key_;
    char *value_;
    struct node_ *next_;
}Node;
Node* nodeNew(unsigned int hash,char *key,char *value);

void nodeRetain(Node *node);
void nodeRelease(Node *node);
int nodeRetainCount(Node *node);




#endif /* node_h */
