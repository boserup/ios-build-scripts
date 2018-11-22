# Automatically increment the CFBundleVersion in release builds
# Credit: davedelong (https://gist.github.com/davedelong/6c56e186db172e5af5a387efeb578b3c)

config=${CONFIGURATION}

if [ "${config}" = "Release" ]; then
    buildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${PROJECT_DIR}/${INFOPLIST_FILE}")
    buildNumber=$(($buildNumber + 1))
    /usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" "${PROJECT_DIR}/${INFOPLIST_FILE}"
else
    echo "info: Skipping build number incrementation in ${config} mode"
fi