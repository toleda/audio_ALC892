#!/bin/sh
# Maintained by: toleda for: github.com/toleda/audio_cloverALC
# File: audio_cloverALC892-90_patch.sh_v1.0
# Credit: THeKiNG, VCH888, .:ErmaC:., bcc9, RevoGirl, Alex Auditore
#
# OS X Clover Realtek ALC Onboard Audio
# Clover Patched AppleHDA Method
# github.com/toleda/audio_cloverALC
#
# Enables OS X Realtek CloverALC onboard audio in Mavericks 10.9 and newer
# 1. Verify native System/Library/Extensions/AppleHDA.kext
# 2. Verify Downloads/audio_ALC892-master present
# 3. cloverALC/audio_cloverALC892-90-patch
#    1. Verify Clover/config.plist/Devices/Audio/Inject/(Audio ID: 1, 2 or 3)
#    2. Verify Clover/config.plist/KernelAndKextPatches/KextsToPatch/AppleHDA/ALC892
#    3. Verify Clover/config.plist/HernelAndKextPatches/KextsToPatch/AppleHDA/xml>zml
#    4. Verify EFI/Clover/kexts/10.9/realtekALC.kext
#
# Installation
# 1. Downloads/audio_ALC892-master/cloverALC/audio_cloverALC892-90_patch.command
# 2. Double click audio_cloverALC892-90_patch.command (Do not move folder or file)
# 3. Enter password at prompt
# 4. Restart
#
echo " "
echo "Agreement"
echo "The audio_cloverALC892-90_patch is for personal use only. Do not" 
echo "distribute the patch, any or all of the enclosed files or the resulting" 
echo "patched AppleHDA.kext for any reason without permission. The" 
echo "audio_cloverALC892-90_patch is provided as is and without any warranty."
echo " "
 
echo "Backup AppleHDA.kext to Desktop"
rm -rf Desktop/AppleHDA-orig.kext
cp -R /System/Library/Extensions/AppleHDA.kext Desktop/AppleHDA-orig.kext
sudo rm -f /System/Library/Extensions/AppleHDA.kext/Contents/Resources/*zml.zlib
cd Downloads/audio_ALC892-master 
unzip -q 892.zip
cd 892

sudo install -m 644 -o root -g wheel Platforms.xml.zlib  /System/Library/Extensions/AppleHDA.kext/Contents/Resources/Platforms.zml.zlib

sudo install -m 644 -o root -g wheel layout1.xml.zlib  /System/Library/Extensions/AppleHDA.kext/Contents/Resources/layout1.zml.zlib

sudo install -m 644 -o root -g wheel layout2.xml.zlib  /System/Library/Extensions/AppleHDA.kext/Contents/Resources/layout2.zml.zlib

sudo install -m 644 -o root -g wheel layout3.xml.zlib  /System/Library/Extensions/AppleHDA.kext/Contents/Resources/layout3.zml.zlib

cd ..
zip -rq 892 892/ -x "*.DS_Store"
rm -R 892

echo "Permissions..."
sudo chown -R root:wheel /System/Library/Extensions/AppleHDA.kext

echo "Kernel cache..."
sudo touch /System/Library/Extensions

echo "Finished."
