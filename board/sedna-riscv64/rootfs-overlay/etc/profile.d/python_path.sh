if [ -z "$MICROPYPATH" ]; then
    # MICROPYPATH, unlike PYTHONPATH, overrides the whole path; we need to
    # append the default value (from ports/unix/mpconfigport.h)
    export MICROPYPATH="/mnt/builtin/lib/micropython:.frozen:~/.micropython/lib:/usr/lib/micropython"
else
    export MICROPYPATH="$MICROPYPATH:/mnt/builtin/lib/micropython"
fi
