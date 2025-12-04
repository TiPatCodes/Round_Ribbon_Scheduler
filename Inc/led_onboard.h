/*
 * led_onboard.h
 *
 *  Created on: Dec 4, 2025
 *      Author: tirth.patel
 */

#ifndef LED_ONBOARD_H_
#define LED_ONBOARD_H_

#define RCCAHB1ENREG           ((uint32_t*)0x40023830)
#define GPIOD_MODEREG         ((uint32_t*)0x40020C00)
#define GPIOD_ODRREG             ((uint32_t*)0x40020C14)

#define LED_GREEN  12
#define LED_ORANGE 13
#define LED_RED    14
#define LED_BLUE   15

// -------- Declaring the function prototype ------------
void  led_init_all(void);
void  led_on(uint8_t led_num);
void  led_off(uint8_t led_num);

#endif /* LED_ONBOARD_H_ */
