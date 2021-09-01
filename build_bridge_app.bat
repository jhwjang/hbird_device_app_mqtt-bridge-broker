@ECHO OFF

cmake -Hmosquitto-2.0.10_src -B build/build_bridge_app -G "Visual Studio 16 2019" -A "Win32" -DCMAKE_CONFIGURATION_TYPES="DEBUG;Release" -DWITH_STATIC_LIBRARIES=ON -DOPENSSL_ROOT_DIR=third_party/openssl-OpenSSL_1_1_1i/lib/windows -DOPENSSL_INCLUDE_DIR=third_party/openssl-OpenSSL_1_1_1i/include -DSSL_EAY_DEBUG=third_party/openssl-OpenSSL_1_1_1i/lib/windows/debug/libssl.lib -DLIB_EAY_DEBUG=third_party/openssl-OpenSSL_1_1_1i/lib/windows/debug/libcrypto.lib -DSSL_EAY_RELEASE=third_party/openssl-OpenSSL_1_1_1i/lib/windows/release/libssl.lib -DLIB_EAY_RELEASE=third_party/openssl-OpenSSL_1_1_1i/lib/windows/release/libcrypto.lib -DWITH_THREADING=OFF -DWITH_APPS=OFF

cd build/build_bridge_app

msbuild mosquitto.sln /p:Configuration=Debug /p:Platform="Win32" -target:hbird-bridge_broker:Rebuild

msbuild mosquitto.sln /p:Configuration=Release /p:Platform="Win32" -target:hbird-bridge_broker:Rebuild