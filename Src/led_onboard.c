/*
 * led_onboard.c
 *
 *  Created on: Dec 4, 2025
 *      Author: tirth.patel
 */


#include <stdio.h>
#include<stdint.h>
#include "led_onboard.h"

void  led_init_all(void){
	uint32_t *pRccahb1enr = RCCAHB1ENREG;
	uint32_t *pGpiodmoder = GPIOD_MODEREG;

	*pRccahb1enr   |= (1 << 3);
	*pGpiodmoder |= (1 << (2*LED_BLUE));
	*pGpiodmoder |= (1 << (2*LED_GREEN));
	*pGpiodmoder |= (1 << (2*LED_ORANGE));
	*pGpiodmoder |= (1 << (2*LED_RED));

	led_off(LED_BLUE);
	led_off(LED_GREEN);
	led_off(LED_RED);
	led_off(LED_ORANGE);
}


void led_on(uint8_t led_num){
	uint32_t *pGpioodr = GPIOD_ODRREG;
	*pGpioodr  |= (1<< led_num);
}

void led_off(uint8_t led_num){
	uint32_t *pGpioodr = GPIOD_ODRREG;
	*pGpioodr   &=  ~(1<< led_num);
}
