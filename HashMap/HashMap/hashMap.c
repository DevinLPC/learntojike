//
//  hashMap.c
//  HashMap
//
//  Created by mayee on 16/6/19.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#include "hashMap.h"
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
hashMap * hashMapCreate() {
    hashMap* map = malloc(sizeof(hashMap));
    map->capacity_ = 512;
    map->load_factor_ = 0.75;
    map->size_ = 0;
    map->table_ = (Node**)malloc(sizeof(Node*)*map->capacity_);
    return map;
}

void hashMapPut(hashMap* map,char *key,char *value) {
    bool keyInMap = false;
    unsigned int hash = BKDRHash(key);
    int index = BKDRHash(key)%map->capacity_;
    Node *node = nodeNew(hash,key,value);
    
    Node *old = map->table_[index];
    for (Node* head = old; head != NULL; head = head->next_) {
        
        if (head->hash_ == node->hash_) {
            head->value_ = node->value_;
            printf("in map have this \"key\" change the value:%s,index = %d,hash = %d\n",((Node *)(map->table_[index]))->value_ ,index,hash);
            keyInMap = true;
        }
    }

    if(!keyInMap) {
        if (map->size_ >= map->capacity_*map->load_factor_) {
            map->capacity_ *= 2;
            Node** oldTable = map->table_;
            map->table_ = malloc(sizeof(Node*)*map->capacity_);
            memcpy(map->table_, oldTable, sizeof(Node*)*map->capacity_);
            free(oldTable);
        }
        node->next_ = old;
        map->table_[index] = node;
        printf("put [%s : %s] in map,index = %d,hash = %d\n",((Node*)(map->table_[index]))->key_,((Node*)(map->table_[index]))->value_,index,hash);
//        map->size_++;
        map->size_ = map->size_ > index ? map->size_:index;
        
    }

 //   RETAIN((Node*)(map->table_[index]));
    
}

Node* hashMapGet(hashMap* map,char *key) {

    unsigned int hash = BKDRHash(key);
    int index = BKDRHash(key)%map->capacity_;
    for (Node* head = map->table_[index]; head != NULL; head = head->next_) {
        if (head->hash_ == hash) {
            printf("find the key:%s's Map,index = %d,hash = %d \n",key,index,hash);
            return head;
        }
    }
    printf("Not find the tey:%s'Map\n",key);
    return NULL;
}

void hashMapRemove(hashMap* map,char *key){
    unsigned int hash = BKDRHash(key);
    int index = BKDRHash(key)%map->capacity_;

    
    Node *head = (Node *)(map->table_[index]);
    if (!head) {
        printf("No this key:%s's Map\n",key);
        return;
    }
    if (!head->next_) {
        RELEASE(head);
  
        map->table_[index] = NULL;
        printf("removed first\n");
        return;
    }

    for (Node *node = head,*prev = head; node != NULL; node = node->next_) {
        if(node->hash_ == hash) {
    
            if (node->next_) {
                RELEASE(node);

                *node = *(node->next_);
                printf("removed\n");
            }else{
                (*prev).next_ = NULL;
                printf("removed last\n");
            }
            break;
        }

    }

}

void hashMaoPrint(hashMap *map) {
    
    printf("\n{\n");
    for (int i = 0; i < map->capacity_; i++){
        if (map->table_[i] != NULL) {
            Node *head = (Node *)(map->table_[i]);
            for (Node *node = head; node != NULL; node = node->next_) {
                printf(" \t%s:%s;\n",node->key_,node->value_);
                
            }

        }
    }
    printf("}\n");
}


void HashMapDestory(hashMap * map) {
    for (int i = 0; i < map->capacity_; i++) {
        if (map->table_[i] != NULL) {
            Node *node = (Node *)(map->table_[i]);
            Node *next = NULL;
            for (; node != NULL; node = next) {
                next = node->next_;
                RELEASE(node);
            }
        }
    }
    map->size_ =0;
    free(map->table_);
    
    free(map);
    
}

unsigned int BKDRHash(char *str) {
    
    unsigned int seed = 131;
    unsigned int hash = 0;
    while(*str) {
        hash = hash * seed +(*str ++);
    }
    return (hash&0x7FFFFFFF);
}

unsigned int SDBMHash(char *str) {
    unsigned int hash = 0;
    while(*str) {
        hash = (*str++) + (hash << 6) + (hash << 16) - hash;
    }
    return (hash &0x7FFFFFFF);
}

