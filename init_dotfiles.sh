
create_dotfile () {

    # Ensure file exists
    echo "Update $1"
    [ ! -f "~/$1" ] && touch ~/$1

    # Check if is empty
    if [[ -s ~/$1 ]]; then
        echo "~/$1 is not empty. Want to overwrite? (y/N)"
        read OVERWRITE
        if [ $OVERWRITE == "y" ]; then
            cp $1 ~/$1
        else
            echo "Want to append instead? (y/N)"
            read APPEND
            if [ $APPEND == "y" ]; then
                cat $1 >> ~/$1
            fi
        fi
    else
        # Create file from template
        cp $1 ~/$1
    fi
}

create_dotfile ".vimrc"
create_dotfile ".gitconfig"
create_dotfile ".zshrc"
