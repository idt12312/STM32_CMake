set(CMAKE_SYSTEM_NAME Generic)

set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
set(CMAKE_EXE_LINKER arm-none-eabi-g++)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

unset(CMAKE_C_FLAGS CACHE)
set(CMAKE_C_FLAGS "-mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 \
                    -fsingle-precision-constant -ffunction-sections -fdata-sections -mslow-flash-data \
                    -g3 -Wall -Wextra \
                    -DSTM32F407xx -DUSE_HAL_DRIVER -DARM_MATH_CM4 " CACHE STRING "" FORCE)


unset(CMAKE_AS_FLAGS CACHE)
set(CMAKE_AS_FLAGS "${CMAKE_C_FLAGS} -x assembler-with-cpp" CACHE STRING "" FORCE)


unset(CMAKE_CXX_FLAGS CACHE)
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -fno-use-cxa-atexit -fno-exceptions -fno-rtti" CACHE STRING "" FORCE)

# If you implement systemcall manually, delete "--specs=nosys.specs" option
unset(CMAKE_EXE_LINKER_FLAGS CACHE)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_CXX_FLAGS} -L ${CMAKE_SOURCE_DIR} -T STM32F407VGTx_FLASH.ld \
                        -lc -lm --specs=nosys.specs -Xlinker --gc-sections -Wl,-Map=${CMAKE_PROJECT_NAME}.map" CACHE STRING "" FORCE)
