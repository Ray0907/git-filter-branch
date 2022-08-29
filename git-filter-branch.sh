name=$1;
email=$2;
if [ "$#" -ne 2 ]; then
    echo -e "\n"
    echo -e "[Usuage]: ./git-filter-branch.sh '[author name]' '[author email]'"
    echo -e "\tDon't forget to place single quote in author name and author email prefix and suffix.\n"
    exit 0
else
    git config user.name "$name";
    git config user.email "$email";
    git filter-branch -f --env-filter "
        GIT_AUTHOR_NAME='$name'
        GIT_AUTHOR_EMAIL='$email'
        GIT_COMMITTER_NAME='$name'
        GIT_COMMITTER_EMAIL='$email'
    " HEAD
    git push origin main -f
fi
