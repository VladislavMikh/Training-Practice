vsim -gui work.tb1_b2bd -t ns
add wave DUT/*
run -all
view wave
wave zoom full