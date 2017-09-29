.globl _start

_start:
	//// ����GPJ2CON��bit[0:15]������GPJ2_0/1/2/3����Ϊ�������
	// ����GPJ0CON��bit[12:23]������GPJ0_3/4/5����Ϊ�������
	ldr r1, =0xE0200240 					
	ldr r0, =0x00111000
	str r0, [r1]

	mov r2, #0x1000
	
led_blink:
	//// ����GPJ2DAT��bit[0:3]��ʹGPJ2_0/1/2/3��������͵�ƽ��LED��
	// ����GPJ0DAT��bit[3:5]��ʹGPJ0_3/4/5��������͵�ƽ��LED��
	ldr r1, =0xE0200244 					
	mov r0, #0
	str r0, [r1]

	// ��ʱ
	bl delay							

	//// ����GPJ2DAT��bit[0:3]��ʹGPJ2_0/1/2/3��������ߵ�ƽ��LED��
	// ����GPJ0DAT��bit[3:5]��ʹGPJ0_3/4/5��������ߵ�ƽ��LED��
	ldr r1, =0xE0200244 					
	mov r0, #0x38
	str r0, [r1]

	// ��ʱ
	bl delay	

	sub r2, r2, #1
	cmp r2,#0
	bne led_blink


halt:
	b halt


delay:
	mov r0, #0x900000
delay_loop:
	cmp r0, #0
	sub r0, r0, #1
	bne delay_loop
	mov pc, lr
