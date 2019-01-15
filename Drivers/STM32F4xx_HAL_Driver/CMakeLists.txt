# suppress the warning "unused parameter" in HAL Driver
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unused-parameter")

include_directories(Inc)
include_directories(${CMAKE_SOURCE_DIR}/Inc)
include_directories(${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Include)
include_directories(${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Device/ST/STM32F4xx/Include)

set(SRCS 
	Src/stm32f4xx_hal_tim.c
	Src/stm32f4xx_hal_tim_ex.c
	Src/stm32f4xx_hal_rcc.c
	Src/stm32f4xx_hal_rcc_ex.c
	Src/stm32f4xx_hal_flash.c
	Src/stm32f4xx_hal_flash_ex.c
	Src/stm32f4xx_hal_flash_ramfunc.c
	Src/stm32f4xx_hal_gpio.c
	Src/stm32f4xx_hal_dma_ex.c
	Src/stm32f4xx_hal_dma.c
	Src/stm32f4xx_hal_pwr.c
	Src/stm32f4xx_hal_pwr_ex.c
	Src/stm32f4xx_hal_cortex.c
	Src/stm32f4xx_hal.c)

add_library(hal STATIC ${SRCS})
