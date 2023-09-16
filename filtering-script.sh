
    # Run script and create a file with a name like "filtered<foldername>.txt"
    grep -rni "gpt" | sed 's/.*https/https/' > "../filtered${folder_name}.txt"
    #echo ${folder_name}
    # Change back to the original directory
    cd - || exit 1
  fi
done