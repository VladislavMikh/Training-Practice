vsim -gui work.tb1_mux -t ns
add wave DUT/*
run -all
view wave
wave zoom full