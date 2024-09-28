/*--------------------------------------------------------------
 * Name:    Test.c
 * Purpose: usage of SVC function calls for STM32
*----------------------------------------------------------------------------*/

#include <stm32f4xx.h>                       /* STM32F103 definitions         */
#define THREAD_MODE_IS_UNPRIVILIGED 1
/*----------------------------------------------------------------------------
  Note:
       Software Interrupt Function accept up to four parameters
       and run in Supervisor Mode (Interrupt protected)
 *----------------------------------------------------------------------------*/
  int __svc(0) add (int i1, int i2); // function prototype
 
 int __SVC_0      (int i1, int i2) // function defination
	 { 
  return (i1 + i2);
  }
 
 int __svc(1) mul4(int i);
 
	int __SVC_1      (int i) 
	{
 return (i << 2);
  }

int __svc(2) div (int i1, int i2);
int __SVC_2      (int i1, int i2) {
  return (i1 / i2);
}

int __svc(3) mod (int i1, int i2);
int __SVC_3      (int i1, int i2) {
  return (i1 % i2);
}

int res;


/*----------------------------------------------------------------------------
  MAIN function
 *----------------------------------------------------------------------------*/
int main (void) {
	
/*----------------------------------------------------------------------------
  Test Function
 *----------------------------------------------------------------------------*/
__set_CONTROL( THREAD_MODE_IS_UNPRIVILIGED);// CMSIS function
	res  = add (74,  27);                           /* Call SWI Functions       */
	res += mul4(res);
  
	res  = div (res, 10);                           /* Call SWI Functions       */
  res  = mod (res,  3);

  while (1) ;
}
