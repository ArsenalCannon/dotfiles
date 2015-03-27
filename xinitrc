exec i3

# If you wish to log to a file
exec i3 -V >> ~/.i3/i3log 2>&1

xset +fp $HOME/.fonts    # Prepend a custom font path to Xorg's list of known font paths
