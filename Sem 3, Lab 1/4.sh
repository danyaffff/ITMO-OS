if [[ "$PWD" == "$HOME" ]]; then
    echo "$HOME"
else
    echo "Wrong path"
    exit 1
fi
