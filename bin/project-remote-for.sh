project_remote_for() {
    if [ $# -ne 1 ]
    then
        project_help "remote-for"
        exit 1
    fi
    PROJECT="$1"
    if find_project "${PROJECT}"
    then
        case ${REMOTE} in
        github)
            echo "git@github.com:${USER}/${PROJECT}.git"
            ;;
        burn)
            if [ "${USER}" = "$(whoami)" ]
            then
                echo "burn:/data/git/${PROJECT}.git"
            else
                echo "${USER}@burn:/data/git/${PROJECT}.git"
            fi
            ;;
        *)
            echo "Invalid remote: ${REMOTE}" >/dev/stderr
            exit 1
            ;;
        esac
    fi
}

project_remote_for_help() {
    cat <<EOF
Usage: project remote-for PROJECT
  Print the git remote
EOF
}
