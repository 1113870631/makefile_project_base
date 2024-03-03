#���������ļ�
include srcpathconfig.mk

#ʱ����Ϣ
tmpbuildtm := `date |sed 's/ /_/g'`
TMPBUILDTM = $(tmpbuildtm)

#�����汾
APPVERSION = 1.0.0.0


#��ͬ��Ŀ����ò�ͬ�ĺ궨��
ifeq ($(MAKECMDGOALS),arm)
COMPILEMACRO += COMPILER_IS_ARM_LINUX_GCC
else
COMPILEMACRO += COMPILER_IS_LINUX_GCC MACRO_DEF
endif


#ѭ����ȡԴ�ļ����м��
SRCFILE := $(foreach d,$(SRCCODEDIRS),$(wildcard $(addprefix $(d)/*,.c)))
OBJFILE := $(patsubst %.c,%.o,$(SRCFILE))

#�궨��,Դ�ļ�·����ͷ�ļ�·��
CURCMPLMACRO   := $(addprefix -D ,$(COMPILEMACRO))
CURSRCHEADDIRS := $(addprefix -I ,$(SRCHEADDIRS))
CURLIBHEADDIRS := $(addprefix -I ,$(LIBHEADDIRS))

#�������·��
OUTPUTDIR := ../output

#��������ѡ��
CC := gcc
CFLAGS := -Wall -c

RM := rm
RMFLAGS := -rf

#Ŀ���ļ�	
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
	@echo ""
	@echo "start " $< "......compiling"
	@$(CC) $(CURCMPLMACRO) $(CFLAGS) $(CURSRCHEADDIRS) $(CURLIBHEADDIRS) $< -o $@
	@echo "created " $@
	@echo "end   " $< "......compiled ok"
	@echo ""

.PHONY: arm clean

arm:$(TARGETNAME)

clean:
	@-$(RM) $(RMFLAGS) $(TARGETNAME) $(OBJFILE) $(OUTPUTDIR)