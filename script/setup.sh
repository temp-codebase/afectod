#!/bin/bash

echo "Afectod - Movie Discovery App"

echo "Flutter dependencies are being installed"
flutter pub get

if [ $? -ne 0 ]; then
    echo "❌ Flutter pub get failed!"
    exit 1
fi

echo "✅ Flutter dependencies are installed successfully!"

echo "Code generation is starting..."
./script/build_runner.sh

if [ $? -ne 0 ]; then
    echo "Code generation failed!"
    exit 1
fi

echo "✅ Code generation completed successfully!"
echo "Setup completed! You can now run the application."
