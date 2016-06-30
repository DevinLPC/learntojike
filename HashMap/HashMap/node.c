//
//  node.c
//  HashMap
//
//  Created by mayee on 16/6/19.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#include "node.h"
#include <stdlib.h>


Node* nodeNew(unsigned int hash, char *key,char *value){
    Node *node = malloc(sizeof(Node));
    RETAIN(node);
    node->hash_ = hash;
    node->key_ = key;
    node->value_ = value;
    node->next_ = NULL;

    return node;
}


void nodeRetain(Node *node){
    node->retainCount_++;
}

void nodeRelease(Node *node) {
    node->retainCount_--;
}
int nodeRetainCount(Node *node) {
    return node->retainCount_;
}