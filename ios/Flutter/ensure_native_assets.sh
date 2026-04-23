#!/bin/sh

set -eu

PROJECT_ROOT="${SOURCE_ROOT}/.."
FLUTTER_BUILD_ROOT="${PROJECT_ROOT}/${FLUTTER_BUILD_DIR:-build}"
MANIFEST_PATH="${FLUTTER_BUILD_ROOT}/ios/${CONFIGURATION}${EFFECTIVE_PLATFORM_NAME}/App.framework/flutter_assets/NativeAssetsManifest.json"
NATIVE_ASSETS_ROOT="${FLUTTER_BUILD_ROOT}/native_assets/ios"
OBJECTIVE_C_FRAMEWORK_DIR="${NATIVE_ASSETS_ROOT}/objective_c.framework"
OBJECTIVE_C_BINARY_PATH="${OBJECTIVE_C_FRAMEWORK_DIR}/objective_c"
HOOKS_RUNNER_ROOT="${PROJECT_ROOT}/.dart_tool/hooks_runner/shared/objective_c/build"

if [ ! -f "${MANIFEST_PATH}" ]; then
  exit 0
fi

if ! grep -q 'package:objective_c/objective_c.dylib' "${MANIFEST_PATH}"; then
  exit 0
fi

if [ -f "${OBJECTIVE_C_BINARY_PATH}" ]; then
  exit 0
fi

SOURCE_DYLIB_PATH=$(find "${HOOKS_RUNNER_ROOT}" -name objective_c.dylib -print | head -n 1 || true)

if [ -z "${SOURCE_DYLIB_PATH}" ]; then
  echo "error: Objective-C native asset was requested, but no built objective_c.dylib was found under ${HOOKS_RUNNER_ROOT}." >&2
  exit 1
fi

mkdir -p "${OBJECTIVE_C_FRAMEWORK_DIR}"
cp "${SOURCE_DYLIB_PATH}" "${OBJECTIVE_C_BINARY_PATH}"

cat > "${OBJECTIVE_C_FRAMEWORK_DIR}/Info.plist" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>en</string>
	<key>CFBundleExecutable</key>
	<string>objective_c</string>
	<key>CFBundleIdentifier</key>
	<string>io.flutter.flutter.native-assets.objective-c</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>objective_c</string>
	<key>CFBundlePackageType</key>
	<string>FMWK</string>
	<key>CFBundleShortVersionString</key>
	<string>1.0</string>
	<key>CFBundleSignature</key>
	<string>????</string>
	<key>CFBundleVersion</key>
	<string>1.0</string>
	<key>MinimumOSVersion</key>
	<string>13.0</string>
</dict>
</plist>
EOF