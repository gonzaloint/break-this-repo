function check-changes() {
    variable_name="$1"
    path="$2"

    # Check if any changes were made to the specified path
    if git diff --name-only HEAD^ HEAD -- "$path" | grep -q "$path"; then
        echo "$variable_name=true" >> $GITHUB_OUTPUT
    else
        echo "$variable_name=false" >> $GITHUB_OUTPUT
    fi
}

check-changes diff_auth auth_server
check-changes diff_data data_server
check-changes diff_frontend frontend
check-changes diff_jitsi jitsi
check-changes diff_aws_lambda aws/lambda
check-changes diff_compose_file docker-compose.yml
echo "diff_installers=false" >> $GITHUB_OUTPUT
diff_global=true


echo "diff_global=$diff_global" >> $GITHUB_OUTPUT
