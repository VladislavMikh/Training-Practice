vsim -gui work.tb1_b27s -t ns
add wave DUT/*
run -all
view wave
wave zoom full