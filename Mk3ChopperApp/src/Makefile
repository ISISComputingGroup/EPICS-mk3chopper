TOP=../..

include $(TOP)/configure/CONFIG

# this is defined by IBEX and causes issues with C# compiler
unexport INSTRUMENT

WindowsTargetPlatformVersion=$(subst \,,$(WindowsSDKVersion))

ifneq ($(findstring 10.0,$(VCVERSION)),)
MK3_SLN = $(TOP)/Mk3_Chopper_2010.sln
else
MK3_SLN = $(TOP)/Mk3_Chopper.sln
endif
MSBUILD_BIN = MSBuild.exe

VS_CONFIG=Release
VS_PLATFORM=Win32
MSBUILD_OUTPUT_DIR := $(TOP)
ifneq ($(findstring windows,$(EPICS_HOST_ARCH)),)
VS_PLATFORM=x64
MSBUILD_OUTPUT_DIR := $(MSBUILD_OUTPUT_DIR)/x64
endif
ifneq ($(findstring debug,$(EPICS_HOST_ARCH)),)
VS_CONFIG=Debug
endif

# passing WindowsTargetPlatformVersion=$(WindowsTargetPlatformVersion)
# is not needed for VS2019 as we can set 10.0 in the project file for "latest 10"
MSBUILD_OPTS = /p:Configuration=$(VS_CONFIG);Platform=$(VS_PLATFORM)
MSBUILD_OUTPUT_DIR := $(MSBUILD_OUTPUT_DIR)/$(VS_CONFIG)

include $(TOP)/configure/RULES

ifeq ($(findstring linux,$(EPICS_HOST_ARCH)),)

install:
	@echo Building Mk3 in $(MSBUILD_OUTPUT_DIR)
	$(MSBUILD_BIN) $(MSBUILD_OPTS) $(MK3_SLN)
	-$(MKDIR) $(TOP)/lib/$(EPICS_HOST_ARCH) $(TOP)/bin/$(EPICS_HOST_ARCH)
	$(CP) $(MSBUILD_OUTPUT_DIR)/*.lib $(TOP)/lib/$(EPICS_HOST_ARCH)
	$(CP) $(MSBUILD_OUTPUT_DIR)/*.dll $(TOP)/bin/$(EPICS_HOST_ARCH)

clean:
	@echo Cleaning Mk3 in $(MSBUILD_OUTPUT_DIR)
	$(MSBUILD_BIN) $(MSBUILD_OPTS) /t:Clean $(MK3_SLN)
	$(RMDIR) $(TOP)/bin/$(EPICS_HOST_ARCH)
	$(RMDIR) $(TOP)/lib/$(EPICS_HOST_ARCH)

endif
