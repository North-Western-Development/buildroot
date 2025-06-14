if [ -z "$MICROPYPATH" ]; then
    export MICROPYPATH="/mnt/builtin/lib/micropython"
else
    export MICROPYPATH="$MICROPYPATH:/mnt/builtin/lib/micropython"
fi
