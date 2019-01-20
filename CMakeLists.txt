cmake_minimum_required(VERSION 3.0.2)

project(stm32_cmake)

enable_language(ASM)

set(CMAKE_C_FLAGS_DEBUG "-O0 -DDEBUG")
set(CMAKE_C_FLAGS_RELEASE "-O2")

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -DDEBUG")
set(CMAKE_CXX_FLAGS_RELEASE "-O2")


add_subdirectory(Drivers/STM32F4xx_HAL_Driver)
add_subdirectory(TestLibrary)

include_directories(
		Inc
		Drivers/CMSIS/Include
		Drivers/CMSIS/Device/ST/STM32F4xx/Include
		Drivers/STM32F4xx_HAL_Driver/Inc
		TestLibrary)


file(GLOB SRCS 
	Src/*.c
	Src/*.cpp
	startup_stm32f407xx.s)


# to link cmsis dsp libray, add a path to the static library
link_directories(${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Lib/GCC)


set(EXECTABLE_NAME ${CMAKE_PROJECT_NAME}.elf)
add_executable(${EXECTABLE_NAME} ${SRCS})


target_link_libraries(${EXECTABLE_NAME}
		hal
		testlibrary
		libarm_cortexM4lf_math.a)
		

# display the size of the output binary after a build is finished
add_custom_command(TARGET ${EXECTABLE_NAME} POST_BUILD
    COMMAND arm-none-eabi-size --format=berkeley "${EXECTABLE_NAME}")
