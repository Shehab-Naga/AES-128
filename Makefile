################################ Makefile for AES-128 Project
# Project Paths
rtl_path  = "D:/Spring 2022/Discrete (MATH 203)/CourseProject/AES-128/rtl"
tb_path   = "D:/Spring 2022/Discrete (MATH 203)/CourseProject/AES-128/tb"
work_path = "../questa_project/work"


compile_all: 
	@vlog -work $(work_path) -vopt -v +incdir+$(rtl_path)/+$(tb_path)/ -stats=none $(rtl_path)/AES_128Core.v $(tb_path)/*.v

compile_rtl: 
	@vlog -work $(work_path) -vopt -v +incdir+$(rtl_path)/+$(tb_path)/ -stats=none $(rtl_path)/AES_128Core.v

compile:
	
run:
	@vsim -c $(work_path).$(module_name) -voptargs=+acc -l transcript_vsim.txt

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
