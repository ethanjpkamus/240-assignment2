#include <stdio.h>
#include <stdint.h>
//#include <iostream.h>
#include <stdlib.h>

extern long assignment2();

int main(int argc, char * argv[]){
     long pass = 0;
     int message = (rand() % 4); //generates number from 1 to 3


     //cout << "This Assignment 2 was Programmed by Ethan Kamus\n";
     printf("%s\n", "This Assignment 2 was Programmed by Ethan Kamus");

     switch(message){
          case 1:
               //cout << "I really like open source programming\n";
               printf("%s\n\n", "I really like open source programming");
               break;
          case 2:
               //cout << "I haven't got the hang of this open source programming yet, but I am still trying\n";
               printf("%s\n\n", "I haven't got the hang of this open source programming yet, but I am still trying");
               break;
          case 3:
               //cout << "I will work to pass this course but after that I'm using source proprietary programs only.\n";
               printf("%s\n\n", "I will work to pass this course but after that I'm using source proprietary programs only.");
               break;
          default:
               break;
     }

     pass = assignment2();

     //cout << "The main driver recieved " << pass << "from the assembly\n";
     //cout << "The main will now return 0. Bye.";
     printf("%s", "The main driver recieved this from the assembly: ");
     printf("%ld\n", pass);
     printf("%s\n", "The main will now return 0. Bye.");

     return 0;




}
