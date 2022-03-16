//
//  main.c
//  clang_2
//
//  Created by 황지우 on 2022/03/14.
//

#include <stdio.h>
#define MAX 100
int main() {
    /*
    int amount;
    int price = 1000;
    
    printf("수량 : %d, 가격:%d\n",amount,price);
    // 수량을 초기화 하지 않아서 임의의 값 (쓰레기값) 배정
    
    amount = 100;
    price = 2000;
    printf("수량 : %d, 가격:%d\n",amount,price);
    */
    
//    char grade = '\x41'; // 아스키코드 표현, 41 : 아스키코드값
//    int data = 0x7b; //
//    unsigned int age = 75U;
//    // unsigned : 양수값
//    // 75U : 오직 양수인 75
//    long fileSize = 1234567L;
//    // 1234567을 Long 값으로 저장한다는 의미
//    double area = 123.25;
//    double taxRate = 25e-2;
//    float temperature = 17.5F;
//    //. 17.5를 Float 값으로 저장한다는것을 의미
    
     /*
        1. short :
        2. unsigned short
        3. int :
        4. unsigned int
        5. long
        6. unsigned long
      */
//
//    printf("grade = %c\n", grade);
//    printf("data = %d, %o, %x\n", data, data, data);
//    printf("age = %u\n", age);
//    printf("filesize = %ld\n", fileSize);
//    printf("area = %f, %e, %g\n", area, area, area);
//    printf("taxrate = %f\n", taxRate);
//    printf("temperature = %f\n", temperature);
    int num1 = MAX;
    int num2 = MAX - 1;
    int num3 = -MAX;
    
    printf("num1 = %d\n", num1);
    printf("num2 = %d\n", num2);
    printf("num3 = %d\n", num3);
    printf("MAX = %d\n",MAX);
    
    
    return 0;
}
