clang++ -O3 nvim_run.cpp -o nvim_run
if [ $? -ne 0 ]; then
    g++ -O3 nvim_run.cpp -o nvim_run
fi
