# 私人密码文件,请勿擅自访问
ALERT!ALERT!ALERT!ALERT!ALERT!ALERT!ALERT!ALERT!ALERT!ALERT!ALERT!<br/>
密码存储区,请勿擅自下载密码文件<br/>
密码存储区,请勿擅自下载密码文件<br/>
密码存储区,请勿擅自下载密码文件<br/>
密码存储区,请勿擅自下载密码文件<br/>
密码存储区,请勿擅自下载密码文件<br/>
密码存储区,请勿擅自下载密码文件<br/>
密码存储区,请勿擅自下载密码文件<br/>
密码存储区,请勿擅自下载密码文件<br/>
密码存储区,请勿擅自下载密码文件<br/>
密码存储区,请勿擅自下载密码文件<br/>
密码存储区,请勿擅自下载密码文件<br/>
密码存储区,请勿擅自下载密码文件<br/>
密码存储区,请勿擅自下载密码文件<br/>
密码存储区,请勿擅自下载密码文件<br/>
密码存储区,请勿擅自下载密码文件<br/>
密码存储区,请勿擅自下载密码文件<br/>
<br/><br/><br/><br/><br/>
```
密码体系结构:
    .
    ├── delhis.txt
    ├── File
    │   ├── PhoneFile (联系人备份)
    │   │   └── ...
    │   ├── PrivateKeyBackup (私钥备份)
    │   │   ├── DO_NOT_DOWNLOAD_HERE.warning
    │   │   ├── Private_ECC_512.7z (需要紧急二维码B解密)
    │   │   ├── Private_ECC_512_with_master_KEY.7z (需要主密码和RSA4096共同解密)
    │   │   ├── Private_RSA_4096_with_ECC512.gpg.gpg (需要ECC512解密)
    │   │   └── Private_RSA_4096.7z (需要紧急二维码A解密)
    │   ├── [TelphoneNumber].gpg (手机号码文件)
    │   └── ToxAccount.tox.gpg (Tox账号文件)
    ├── Password (密码存储区)
    │   └── ...
    └── README.md

密码找回体系结构:
    一般情况下:
        子密码丢失->使用主密码+ECC512->获得子密码
            PS:子密码就是平时使用的密码,网页,qq什么的
    极端情况下:
        紧急二维码A丢失->不可能,我锁在保险柜里
        紧急二维码B丢失->RSA4096+主密码->可找回ECC512
        主密码丢失->不可能,我记在脑子里
        RSA4096丢失->紧急二维码A->可找回RSA4096
        ECC512丢失->紧急二维码B->可找回ECC512
密码存储方式:
    主密码:脑记
    紧急二维码A:保险柜
    紧急二维码B:保险柜
    个人常用密码:github
```

<br/><br/><br/><br/>
ALERT!ALERT!ALERT!ALERT!ALERT!ALERT!ALERT!ALERT!ALERT!ALERT!ALERT!<br/>
