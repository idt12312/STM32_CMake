set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)


# tool path
set(TOOLCHAIN_PATH "/tools/toolchain")
set(TOOLCHAIN_PREFIX "arm-none-eabi")

set(TOOLCHAIN_BIN_DIR "${TOOLCHAIN_PATH}/bin")
set(TOOLCHAIN_INC_DIR "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}/include")
set(TOOLCHAIN_LIB_DIR "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}/lib")

set(CMAKE_C_COMPILER "${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN_PREFIX}-gcc" CACHE INTERNAL "C Compiler")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN_PREFIX}-g++" CACHE INTERNAL "C++ Compiler")
set(CMAKE_ASM_COMPILER "${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN_PREFIX}-gcc" CACHE INTERNAL "ASM Compiler")

set(CMAKE_OBJCOPY "${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN_PREFIX}-objcopy" CACHE INTERNAL "Objcopy")
set(CMAKE_OBJDUMP "${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN_PREFIX}-objdump" CACHE INTERNAL "Objdump")
set(CMAKE_SIZE "${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN_PREFIX}-size" CACHE INTERNAL "Size")
set(CMAKE_DEBUGER "${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN_PREFIX}-gdb" CACHE INTERNAL "Debugger")
set(CMAKE_CPPFILT "${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN_PREFIX}-c++filt" CACHE INTERNAL "C++filt")

set(CMAKE_FIND_ROOT_PATH "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}" ${EXTRA_FIND_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)


# build options
set(LINKER_SCRIPT "${PROJECT_SOURCE_DIR}/STM32F407VGTx_FLASH.ld")

set(OBJECT_GEN_FLAGS "-mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 \
                    -fsingle-precision-constant -fno-builtin -ffunction-sections -fdata-sections -fomit-frame-pointer \
                    -Wall -Wextra \
                    -DSTM32F407xx -DUSE_HAL_DRIVER -DARM_MATH_CM4")

set(CMAKE_C_FLAGS   "${OBJECT_GEN_FLAGS} -std=c11 " CACHE INTERNAL "C Compiler options")
set(CMAKE_CXX_FLAGS "${OBJECT_GEN_FLAGS} -std=c++14 -fno-use-cxa-atexit -fno-exceptions -fno-rtti" CACHE INTERNAL "C++ Compiler options")
set(CMAKE_ASM_FLAGS "${OBJECT_GEN_FLAGS} -x assembler-with-cpp " CACHE INTERNAL "ASM Compiler options")
set(CMAKE_EXE_LINKER_FLAGS "-lc -lm -Wl,--gc-sections --specs=nano.specs --specs=nosys.specs -mthumb -mabi=aapcs -Wl,-Map=${CMAKE_PROJECT_NAME}.map -T ${LINKER_SCRIPT}" CACHE INTERNAL "Linker options")

set(CMAKE_C_FLAGS_DEBUG "-O0 -g -DDEBUG" CACHE INTERNAL "C Compiler options for debug build")
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g -DDEBUG" CACHE INTERNAL "C++ Compiler options for debug build")
set(CMAKE_ASM_FLAGS_DEBUG "-g" CACHE INTERNAL "ASM Compiler options for debug build")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "" CACHE INTERNAL "Linker options for debug build")

set(CMAKE_C_FLAGS_RELEASE "-O2" CACHE INTERNAL "C Compiler options for release build")
set(CMAKE_CXX_FLAGS_RELEASE "-O2" CACHE INTERNAL "C++ Compiler options for release build")
set(CMAKE_ASM_FLAGS_RELEASE "" CACHE INTERNAL "ASM Compiler options for release build")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "" CACHE INTERNAL "Linker options for release build")

