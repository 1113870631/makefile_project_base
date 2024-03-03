BUILDVERSION = V1.0.0.8

ifeq ($(MAKECMDGOALS),arm)
#compiler := arm-linux-gcc
#compiler := arm-linux-g++
#compiler := /usr/local/arm/arm-2014.05/bin/arm-none-linux-gnueabi-g++
#compiler := /usr/local/arm/arm-2011.03/bin/arm-none-linux-gnueabi-g++
compiler := arm-none-linux-gnueabi-g++
#COMPILEMACRO += COMPILER_IS_ARM_LINUX_GCC APP_ENABLE_PRE_ACT_PROTECT APP_XC8001_MIDMACHINE
#AD_TIME �ɼ�ʵ��ʱ�� AD_LIGNT �ɼ���ʽ���  AD_MORE ����??�T 
COMPILEMACRO += COMPILER_IS_ARM_LINUX_GCC APP_ENABLE_PRE_ACT_PROTECT APP_XC8001_MIDMACHINE AD_LIGNT AD_MORE #  ACT_RESULT_QUERY 
else
compiler := g++
COMPILEMACRO += COMPILER_IS_LINUX_GCC APP_ENABLE_PRE_ACT_PROTECT APP_XC8001_MIDMACHINE SIMUTEST
endif