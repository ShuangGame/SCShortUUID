#SCShortUUID

##Purpose
Convert Apple UUID (something like `40256F2F-3211-49CD-BC1F-DD5197D2F0F9`)  
to Base32 coded **Short String** (like `IASW6LZSCFE43PA73VIZPUXQ7E`)  


About Base32 read  [http://en.wikipedia.org/wiki/Base32](http://en.wikipedia.org/wiki/Base32 "wiki")



##How to use:  

Drag `SCShortUUID.h` and `SCShortUUID.m` files into your project.

```
NSString *uuid32=[SCShortUUID UUIDString];
```

##Supported OS & SDK Versions
*  Earliest supported deployment target - iOS 6.0

There will be an error while build, if  ```__IPHONE_OS_VERSION_MIN_REQUIRED <__IPHONE_6_0```

##Reference
[UUIDを少し短くするUUIDShortener](http://d.hatena.ne.jp/KishikawaKatsumi/20131031/1383235295)
