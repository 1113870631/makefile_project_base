#引用其他文件
include srcpathconfig.mk

#时间信息
tmpbuildtm := `date |sed 's/ /_/g'`
TMPBUILDTM = $(tmpbuildtm)

#软件版本
APPVERSION = 1.0.0.0


#不同的目标采用不同的宏定义
ifeq ($(MAKECMDGOALS),arm)
COMPILEMACRO += COMPILER_IS_ARM_LINUX_GCC
else
COMPILEMACRO += COMPILER_IS_LINUX_GCC MACRO_DEF
endif


#循环获取源文件和中间件
SRCFILE := $(foreach d,$(SRCCODEDIRS),$(wildcard $(addprefix $(d)/*,.c)))
OBJFILE := $(patsubst %.c,%.o,$(SRCFILE))

#宏定义,源文件路径，头文件路径
CURCMPLMACRO   := $(addprefix -D ,$(COMPILEMACRO))
CURSRCHEADDIRS := $(addprefix -I ,$(SRCHEADDIRS))
CURLIBHEADDIRS := $(addprefix -I ,$(LIBHEADDIRS))

#程序输出路径
OUTPUTDIR := ../output

#编译器及选项
CC := gcc
CFLAGS := -Wall -c

RM := rm
RMFLAGS := -rf

#目标文件	
TARGETNAME = app

$(TARGETNAME):$(OBJFILE)
	@mkdir -p $(OUTPUTDIR)
	@echo ""
	@echo "all files have been compiled , now begin to link every obj for excutable file"
	@echo ""
	@echo "linking............"
	@echo $(OBJFILE)
	@$(CC)  -o $(OUTPUTDIR)/$(TARGETNAME).$(APPVERSION) $(OBJFILE) -L$(LIBFILEDIRS) $(LIBFILE)
	@echo ""
	@echo "linked ok," $(TARGETNAME) "has been created"
	@echo ""
	@echo $(TMPBUILDTM)
	
%.o: %.c
	$(CC) $(CURCMPLMACRO) $(CFLAGS) $(CURSRCHEADDIRS) $(CURLIBHEADDIRS) $< -o $@


.PHONY: arm clean

arm:$(TARGETNAME)

clean:
	@-$(RM) $(RMFLAGS) $(TARGETNAME) $(OBJFILE) $(OUTPUTDIR)