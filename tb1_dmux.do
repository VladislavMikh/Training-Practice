vsim -gui work.tb1_dmux -t ns
add wave DUT/*
run -all
view wave
wave zoom full