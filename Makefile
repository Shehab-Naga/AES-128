################################ Makefile for AES-128 Project
# =============================================================================
# Project Paths
rtl_path  = "D:/Spring 2022/Discrete (MATH 203)/CourseProject/AES-128/rtl"
tb_path   = "D:/Spring 2022/Discrete (MATH 203)/CourseProject/AES-128/tb"
work_path = "../questa_project"
# =============================================================================
# FLAGS
SHOW_WAVEFORM_FLAG =0
# =============================================================================
compile_all: 
	@vlog -work $(work_path)/work -vopt -v +incdir+$(rtl_path)/+$(tb_path)/ -stats=none $(rtl_path)/AES_128Core.v $(tb_path)/*.v

compile_rtl: 
	@vlog -work $(work_path)/work -vopt -v +incdir+$(rtl_path)/+$(tb_path)/ -stats=none $(rtl_path)/AES_128Core.v

compile:
	
run:	
########################## pass module_name from the command line. Ex. make module_name=AES_128Core run
ifeq ($(SHOW_WAVEFORM_FLAG), 1)
	@vsim $(work_path)/work.$(module_name) -voptargs=+acc -l $(work_path)/transcript_vsim.txt -do "run -all"
else
	@vsim -c $(work_path)/work.$(module_name) -voptargs=+acc -l $(work_path)/transcript_vsim.txt -do "run -all"
endif


################## Target for Makefile help
help:
	@echo ============================================================================ 
	@echo  " ------------------------- Test TARGETS -------------------------------- "
	@echo  " compile_all_rtl => Compile TB and DUT files                             "
	@echo  " run             => Compile TB and DUT files and run the simulation      "
	@echo  "                                                                         "
	@echo  " -------------------- ADMINISTRATIVE TARGETS --------------------------- "
	@echo  " help       => Displays this message                                     "
	@echo  " clean      => Remove all intermediate simv and log files                "
	@echo  "								         "
	@echo  " ---------------------- EMBEDDED SETTINGS ------------------------------ "
	@echo  " -timescale=\"1ns/100ps\"                                                "
	@echo  " -debug_all                                                              "
	@echo ============================================================================  
