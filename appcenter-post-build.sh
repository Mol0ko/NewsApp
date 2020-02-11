echo "Running tests..."
xcodebuild \
    -workspace NewsApp.xcworkspace \
    -scheme NewsApp \
    -sdk iphonesimulator \
    -destination 'platform=iOS Simulator,name=iPhone 11,OS=13.3' \
    test | xcpretty --test --color
