//
//  main.c
//  HashMap
//
//  Created by mayee on 16/6/19.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#include <stdio.h>
#include "hashMap.h"
int main(int argc, const char * argv[]) {
    hashMap *map = hashMapCreate();
    hashMapPut(map,"hello1", "hi1");
    hashMapPut(map,"hello1", "say hi1");
    hashMapPut(map,"hello2", "hi2");
    hashMapPut(map,"hello3", "hi3");
    
    Node *find = hashMapGet(map, "hello1");
    if (find) {
        printf("find the Map is [%s :%s]\n",find->key_,find->value_);
    }
  
    
    Node *find1 = hashMapGet(map, "hello");
    if (find1) {
        printf("find the Map is [%s :%s]\n",find1->key_,find1->value_);

    }
    
    hashMapRemove(map, "hello3");
    
    hashMapRemove(map, "hello");
  
    hashMaoPrint(map);
    
    HashMapDestory(map);
    return 0;
}
