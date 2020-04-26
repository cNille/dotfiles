

echo "Run all init scripts"

for file in ./init_*; do
    $file
done
