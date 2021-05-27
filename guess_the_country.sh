



while [ 1 ]; do
    current_ws=$(i3-msg -t get_workspaces | jq ".[] | select(.focused!=false) | .name")
    clear
    length=10000
    success=0
    i=1
    echo "WELCOME TO GUESS THE COUNTRY V1 (10500 images)"
    cat stats_one_line
    while [ $i -le 10 ]; do
        r=$(($RANDOM % 10000))
        image_metadata=$(cat metadata | jq -r [.[$r]])
        
        url=$(echo $image_metadata | jq -r "[.[].photo_url][0]")
        country=$(echo $image_metadata | jq -r "[.[].country][0]")
        firefox $url
        i3-msg workspace $current_ws > /dev/null

        printf "Country: "
        read res
        if [[ $res = $country ]]; then
            success=$((success + 1))
        else
            echo "ECHEC --> $country"
        fi
        
        ((i++))
    done

    #echo "*****************************"
    echo "SCORE: $success/10"
    #echo "*****************************"

    echo ""
    echo "Hit enter for a new Game..."
    read
done
