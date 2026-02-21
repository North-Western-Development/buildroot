# Save history on each command, instead of on shell exit.
# Especially important if this is the default shell, because `poweroff` does not
# run the usual history-saving exit functionality.
PROMPT_COMMAND='history -a'
