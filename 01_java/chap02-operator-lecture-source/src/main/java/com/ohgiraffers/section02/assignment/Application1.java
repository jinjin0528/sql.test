package com.ohgiraffers.section02.assignment;

public class Application1 {
    public static void main(String[] args) {

        /* 수업목표. 복합대입 연산자를 이해하고 활용할 수 있다. */
        /* 필기.
        *   대입 연산자와 산술 복합 대입 연산자
        *   '=','+=','-=','*=','/=','%=' */

        int num = 12;
        System.out.println("num = " + num);

        num = num + 3;
        System.out.println("num = " + num);

        num += 3;
        System.out.println("num = " + num);

        num -= 5;
        System.out.println("num = " + num);

        num *= 2;
        System.out.println("num = " + num);

        num /= 3;
        System.out.println("num = " + num);

        num %= 10;
        System.out.println("num = " + num);
    }
}
