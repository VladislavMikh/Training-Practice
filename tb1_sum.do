vsim -gui work.tb1_sum -t ns
add wave DUT/*
run -all
view wave
wave zoom full