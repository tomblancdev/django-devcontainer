cd /workspace/scripts

# map into files
find . -type f -exec sed -i 's/\r$//' {} \;

exit 0
