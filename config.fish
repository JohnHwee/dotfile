# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Theme
Theme 'robbyrussell'

# All built-in plugins can be found at ~/.oh-my-fish/plugins/
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Enable plugins by adding their name separated by a space to the line below.
Plugin "theme" 
Plugin "brew" 
Plugin "django"
Plugin "emoji-clock" 
Plugin "fish-spec" 
Plugin "python" 
Plugin "z" 
Plugin "vundle"
Plugin "ssh"

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish
# For thefuck
function __thefuck_repl -d 'Replace operators into fish-compatible'
    set -l tmp (echo $argv | sed 's/ && / ; and /g')
    echo $tmp | sed 's/ || / ; or /g'
end

function fuck -d 'Correct your previous console command'
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    thefuck $history[1] > $eval_script
    eval (__thefuck_repl (cat $eval_script))
    rm $eval_script
end
