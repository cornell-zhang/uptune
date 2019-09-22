set topmodule Systolic_Array_8x8
set srcdir /work/zhang-x2/users/sx233/uptune/examples/autotune-systolic
set workdir /work/zhang-x2/users/sx233/uptune/examples/autotune-systolic/build

load_package flow

project_new $srcdir/$topmodule -overwrite
set_global_assignment -name family "Stratix 10"
set_global_assignment -name flow_enable_early_place on
set_global_assignment -name flow_disable_assembler on
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY $workdir
set_global_assignment -name SDC_FILE $srcdir/$topmodule.sdc
set_instance_assignment -name VIRTUAL_PIN ON -to *

source ./options.tcl

execute_module -tool map

execute_module -tool fit -args "--plan"
execute_module -tool sta -args "--snapshot=planned"

exec mv $workdir/$topmodule.fit.summary $workdir/$topmodule.fit.plan.summary
exec mv $workdir/$topmodule.sta.summary $workdir/$topmodule.sta.plan.summary

execute_module -tool fit -args "--early_place"
execute_module -tool sta -args "--snapshot=early_placed"

exec mv $workdir/$topmodule.fit.summary $workdir/$topmodule.fit.early_place.summary
exec mv $workdir/$topmodule.sta.summary $workdir/$topmodule.sta.early_place.summary

execute_module -tool fit -args "--place"
execute_module -tool sta -args "--snapshot=placed"

exec mv $workdir/$topmodule.fit.summary $workdir/$topmodule.fit.place.summary
exec mv $workdir/$topmodule.sta.summary $workdir/$topmodule.sta.place.summary

execute_module -tool fit -args "--route"
execute_module -tool sta -args "--snapshot=routed"

exec mv $workdir/$topmodule.fit.summary $workdir/$topmodule.fit.route.summary
exec mv $workdir/$topmodule.sta.summary $workdir/$topmodule.sta.route.summary

project_close
