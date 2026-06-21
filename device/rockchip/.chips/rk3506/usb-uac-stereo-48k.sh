#!/bin/sh
# RK3506 UAC 默认参数：双声道播放 + 双声道录音，48 kHz，16 bit。
# UAC1 和 UAC2 的基础参数名一致；UAC2 额外支持 c_sync。

uac1_prepare()
{
    echo 3 > p_chmask
    echo 3 > c_chmask
    echo 48000 > p_srate
    echo 48000 > c_srate
    echo 2 > p_ssize
    echo 2 > c_ssize

    for f in $(find . -name '*_feature_unit'); do
        echo 1 > "$f"
    done
}

uac2_prepare()
{
    echo adaptive > c_sync 2>/dev/null || true
    uac1_prepare
}
