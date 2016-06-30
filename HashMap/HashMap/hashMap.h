//
//  hashMap.h
//  HashMap
//
//  Created by mayee on 16/6/19.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#ifndef hashMap_h
#define hashMap_h

#include <stdio.h>
#include "node.h"


typedef struct HashMap_ {
    int capacity_;
    int size_;
    float load_factor_;
    Node** table_;
}hashMap;

hashMap * hashMapCreate();
void hashMapPut(hashMap* map,char *key,char *value);
Node* hashMapGet(hashMap* map,char *key);
void hashMapRemove(hashMap* map,char *key);
void hashMaoPrint(hashMap *map);
void HashMapDestory(hashMap * map);

unsigned int BKDRHash(char *str);
unsigned int SDBMHash(char *str);


#endif /* hashMap_h */
