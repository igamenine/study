# # 在保证Xcode为最新版的前提下，安装以下三大套件，如果中途安装依赖包时失败报错，则根据提示包名手动brew instal

# 直接下载官方的arm版
https://github.com/MichaelGDev48/citra-nightly-arm64-mac

# brew uninstall cmake
# brew uninstall qt5
# brew uninstall ffmpeg
# brew uninstall openssl
# brew uninstall clang-format

# # 安装Vulkan环境，使用citra-vulkan版本用
# brew uninstall Doxygen
# brew uninstall speexdsp
# brew uninstall glfw
# brew uninstall glm
# brew uninstall vulkan-headers

# export Qt5_DIR=$(brew --prefix)/opt/qt5
# export OPENSSL_ROOT_DIR=$(brew --prefix)/opt/openssl
# cd ~
# # git clone --recursive https://github.com/citra-emu/citra
# # git clone --recursive https://github.com/brooksytech/citra-vulkan
# git clone --recursive https://github.com/MichaelGDev48/citra-nightly-arm64-mac

# # cd citra
# cd citra-vulkan

# mkdir build
# cd build

# 使用citra标准版
# cmake .. -DCMAKE_OSX_ARCHITECTURES="arm64" -DENABLE_FFMPEG_AUDIO_DECODER=ON -DCMAKE_BUILD_TYPE=Release
# make -j4
# Citra-qt.app应用程序包现在将出现在build/bin/下。请注意，这是不可移植的，仅适用于您的机器。
# 2023年3月21日app已成功创建并且能够正常打开，但是无法运行游戏，提示不支持OpenGL4.3

