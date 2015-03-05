
node 'charizard.geeksoc.org' {
    
  # Message of the day
  file { '/etc/motd':
        content => "
[0;37;5;47;107m                 @[0;1;37;97;47m 8[0;37;5;47;107m                        [0;1;37;97;47m8%[0;37;5;47;107m:             [0m
[0;37;5;47;107m  .  . .  .  .;[0;1;37;97;47mX[0;1;33;93;47mX[0;33;5;41;101m;[0;1;37;97;47mX[0;37;5;47;107m   .[0;1;37;97;47m8S:[0;37;5;47;107m8XXX..  . .  . .  t[0;33;47m88[0;37;5;47;107m8; .  . .  . [0m
[0;37;5;47;107m   .     .:X[0;1;37;97;47m8:[0;37;43m@[0;1;30;90;43m8[0;1;30;90;47m8[0;37;43mX[0;1;33;93;47mS[0;37;5;47;107m;  %[0;37;43mX[0;33;5;41;101m [0;33;47m8[0;1;31;91;43m8[0;1;33;93;47m8[0;33;5;41;101m%[0;1;30;90;47mX[0;1;30;90;43m8[0;1;30;90;47m%[0;37;5;47;107m:     .    .[0;1;37;97;47m.[0;33;5;41;101m:[0;33;47m8[0;33;5;41;101m:[0;1;37;97;47mS[0;37;5;47;107m%       .  [0m
[0;37;5;47;107m     . .[0;1;37;97;47m8[0;1;33;93;47mS[0;33;47m@8[0;33;5;40;100m%;[0;35;5;40;100mt[0;36;5;40;100m%[0;35;5;40;100mX[0;33;5;40;100mt[0;33;47m8[0;37;5;47;107mS. .[0;1;37;97;47mS[0;37;5;43;103m8[0;37;5;41;101m8[0;37;43m@[0;33;5;41;101mt[0;33;47m8[0;1;31;91;43m8[0;33;47m8[0;33;5;41;101mt[0;33;47m@[0;1;37;97;47m;[0;37;5;47;107mX.     . [0;1;37;97;47m@[0;37;43m8[0;36;5;40;100m:@8[0;1;30;90;43m8[0;37;43m8[0;1;37;97;47m.[0;37;5;47;107mt.  .    [0m
[0;37;5;47;107m .    %[0;1;37;97;47m [0;1;33;93;43m.[0;1;30;90;47m8[0;35;5;40;100mX[0;36;5;40;100m%@[0;34;5;40;100mS[0;36;5;40;100m88[0;34;5;40;100m@[0;36;5;40;100m8[0;1;31;91;43m8[0;1;37;97;47m [0;37;5;47;107m.  :88[0;1;33;93;47mS[0;37;43m8[0;33;5;41;101mX[0;33;47m8[0;33;5;41;101m%[0;33;47m8[0;1;37;97;47m .[0;1;33;93;47m8[0;1;37;97;47m@[0;37;5;47;107m.  .  @[0;33;47m8[0;33;5;40;100m.[0;36;5;40;100m888[0;34;5;40;100mS[0;35;5;40;100m:[0;1;30;90;43m8[0;33;47m8[0;1;37;97;47m [0;37;5;47;107m8S   . [0m
[0;37;5;47;107m   .:[0;1;37;97;47mt[0;37;43m@[0;1;30;90;43m8[0;35;5;40;100mS;[0;36;5;40;100m88[0;1;30;90;46mtt[0;34;5;40;100mX[0;32;5;40;100mX[0;1;30;90;44m8[0;36;5;40;100m8[0;33;5;40;100m:[0;1;31;91;47m8[0;37;5;47;107mt. .::.[0;1;37;97;47m%[0;1;30;90;47m@[0;1;31;91;43m8[0;37;5;40;100m@[0;1;31;91;43m8[0;1;33;93;47mS[0;37;5;47;107m;   .   ;[0;1;37;97;47m;[0;1;30;90;43m8[0;36;5;40;100mt[0;34;5;40;100mXS[0;36;5;40;100m888[0;35;5;40;100mS[0;33;5;40;100mt@[0;1;31;91;43m8[0;1;33;93;47mX[0;1;37;97;47m%[0;37;5;47;107m.   [0m
[0;37;5;47;107m  .[0;1;37;97;47m8[0;33;47m8[0;1;30;90;43m8[0;35;5;40;100m%:[0;36;5;40;100m8[0;1;30;90;46mX%%[0;36;5;40;100m8[0;1;30;90;46m;[0;34;5;40;100mS[0;32;40m8[0;1;30;90;46mX[0;36;5;40;100m8@[0;1;31;91;43m8[0;1;33;93;47mX[0;37;5;47;107m@.  . .S[0;37;43m8[0;33;5;41;101m [0;1;33;93;47m@[0;37;5;41;101m8[0;37;5;47;107m%.    . [0;1;37;97;47m@[0;1;33;93;47m8[0;35;5;40;100m8[0;36;5;40;100m8[0;30;5;40;100mS[0;1;30;90;46m.[0;1;30;90;40m8[0;1;30;90;46mt%[0;36;5;40;100m88@S[0;35;5;40;100m%[0;37;43m@[0;37;5;47;107m8;  [0m
[0;37;5;47;107m  @[0;37;43m@[0;1;30;90;43m8[0;35;5;40;100m%[0;36;5;40;100mX[0;1;30;90;46m@SSS%t[0;36;5;40;100m8[0;34;5;40;100mS[0;36;5;40;100m8[0;34;5;40;100m@[0;36;5;40;100m8[0;34;5;40;100mS[0;33;5;40;100m;[0;37;43m8[0;1;31;91;47m8[0;1;33;93;47m@[0;1;37;97;47m:[0;37;5;47;107m@.  .[0;1;33;93;47m88[0;37;5;41;101m@[0;37;5;43;103m@[0;1;37;97;47m [0;37;5;47;107m:. .:8[0;1;37;97;47m:[0;1;31;91;5;43;103m8[0;35;5;40;100m;[0;36;5;40;100m8[0;34;5;40;100mS[0;1;30;90;40m8[0;36;5;40;100m88[0;1;30;90;46m;%t%X[0;36;5;40;100m88[0;35;5;40;100mX[0;1;31;91;43m8[0;37;5;47;107mt .[0m
[0;37;5;47;107m  [0;33;47mX[0;33;5;40;100m:[0;35;5;40;100mt[0;36;5;40;100m@[0;1;30;90;46mXSSSXS%[0;36;5;40;100m8[0;1;30;90;40m8[0;1;30;90;46m;[0;30;5;40;100mX[0;36;5;40;100m88X[0;35;5;40;100mS[0;36;5;40;100m8[0;35;5;40;100mS[0;33;5;40;100mS[0;37;43m8[0;1;33;93;47m8[0;37;5;47;107m8@ [0;1;31;91;47m@[0;1;33;93;5;41;101m8[0;1;33;93;47m8[0;37;5;41;101m8[0;1;33;93;47m8[0;37;5;47;107m:tX8[0;1;33;93;47m@[0;1;30;90;43m8[0;37;5;40;100m;[0;35;5;40;100m .[0;36;5;40;100m8[0;1;30;90;46m;[0;34;5;40;100mS[0;36;5;40;100m8[0;1;30;90;46m;[0;36;5;40;100m8[0;1;30;90;46mt[0;36;5;40;100m8[0;1;30;90;46m;S%[0;36;5;40;100m88[0;33;5;40;100m.[0;33;47m8[0;37;5;47;107mt [0m
[0;37;5;47;107m [0;1;37;97;47mX[0;1;31;91;43m8[0;36;5;40;100m 8[0;1;30;90;46mSXSSXS[0;36;5;40;100m8[0;1;30;90;46m:t[0;34;5;40;100mX[0;32;5;40;100mS[0;34;46m8[0;1;30;90;46mt%[0;36;5;40;100m8[0;1;30;90;46mt[0;30;5;40;100mS[0;36;5;40;100m8%[0;35;5;40;100m8X[0;1;31;91;43m8[0;1;33;93;47m8[0;1;31;91;47m@[0;1;33;93;47m@[0;37;5;41;101m8[0;1;33;93;5;41;101m8[0;1;31;91;47m@[0;33;5;41;101m [0;1;37;97;47mX[0;1;33;93;47m88[0;35;5;40;100mX%. [0;36;5;40;100m%8[0;1;30;90;46m%[0;36;5;40;100m8[0;1;30;90;40m8[0;1;30;90;46mt[0;36;5;40;100m8[0;1;30;90;46m.[0;36;5;40;100m8[0;1;30;90;46m.[0;36;5;40;100m8[0;1;30;90;46mt%%[0;36;5;40;100m8@[0;33;5;40;100mS[0;1;37;97;47m [0;37;5;47;107m:[0m
[0;37;5;47;107m [0;33;47m@[0;35;5;40;100m [0;36;5;40;100m8[0;1;30;90;46mSS[0;36;5;40;100m@[0;1;30;90;47mt[0;1;37;97;47m;8[0;37;5;47;107m%[0;1;37;97;47m%[0;36;5;40;100m8[0;1;30;90;46m%[0;30;5;40;100mX[0;1;30;90;46mt[0;36;5;40;100m8[0;1;30;90;46mt[0;36;5;40;100m8[0;1;30;90;46m.%%[0;36;5;40;100m8[0;34;5;40;100mX[0;32;5;40;100mX[0;36;5;40;100mX[0;33;5;40;100m:[0;33;5;41;101m [0;1;33;93;47m8[0;37;5;41;101m8[0;1;33;93;47m8[0;37;5;41;101m8[0;37;5;43;103m8[0;1;33;93;47m8[0;33;5;41;101m [0;33;47m8[0;33;5;41;101m [0;33;5;40;100m :[0;36;5;40;100m88[0;1;30;90;46mS%%%[0;34;5;40;100mX[0;36;5;40;100m8[0;1;30;90;46m.[0;36;5;40;100m;[0;1;37;97;47m%[0;1;30;90;47m:[0;1;30;90;46m8@S%%[0;36;5;40;100m@[0;35;5;40;100mS[0;1;31;91;43m8[0;37;5;47;107mS[0m
[0;1;37;97;47m8[0;1;30;90;43m8[0;36;5;40;100m:[0;1;30;90;46m8[0;1;30;90;47m:[0;37;5;47;107m8      8[0;1;30;90;46m@[0;36;5;40;100m8[0;34;5;40;100mS[0;1;30;90;46m.[0;36;5;40;100m888[0;33;5;40;100m@[0;1;31;91;43m8[0;33;47m8[0;1;31;91;43m8[0;1;33;93;47m8[0;33;5;41;101m:[0;1;33;93;47m@8[0;33;5;41;101m [0;1;33;93;47m8[0;1;33;93;5;41;101m8[0;1;33;93;47m@[0;37;5;41;101m8[0;37;5;43;103m8[0;37;5;41;101m8[0;37;5;43;103m8[0;1;33;93;47m8[0;1;33;93;5;41;101m8[0;33;47m8[0;33;5;41;101m.[0;33;47m8[0;37;43m@[0;33;47m8[0;37;5;40;100m%[0;36;5;40;100m8[0;32;5;40;100mS[0;1;30;90;46m:[0;1;30;90;47mt[0;37;5;47;107m  S[0;33;47m8[0;1;37;97;47m [0;1;30;90;47mt[0;36;5;40;100m [0;1;30;90;46mS[0;36;5;40;100m88[0;33;5;40;100m;[0;1;33;93;47mS[0m
[0;1;37;97;47m [0;33;5;40;100m:[0;36;5;40;100m [0;37;5;47;107mt .     ..[0;1;37;97;47mX[0;36;5;40;100m8[0;1;30;90;46mt[0;1;30;90;47mS[0;37;5;47;107mXX[0;33;47m8[0;37;5;43;103m8[0;37;5;41;101m8[0;33;5;40;100m [0;37;5;40;100m@8[0;36;5;40;100m@[0;1;30;90;43m8[0;37;5;41;101m8[0;1;33;93;47m8[0;37;5;41;101m8[0;1;33;93;47m8[0;37;5;41;101m8[0;37;5;43;103m8[0;37;5;41;101m8[0;1;33;93;47m8[0;37;5;41;101m8[0;1;33;93;5;41;101m8[0;1;30;90;47m8[0;35;5;40;100m [0;1;37;97;47m.[0;36;5;40;100m [0;33;5;40;100m [0;1;33;93;5;41;101m8[0;1;33;93;47m8[0;33;47m8[0;33;5;40;100mt[0;1;37;97;47m [0;37;5;47;107m: .[0;1;37;97;47m [0;33;5;41;101m [0;1;31;91;5;43;103m8[0;37;5;47;107m8 8[0;36;5;40;100m88[0;1;30;90;43m8[0;1;37;97;47m [0m
[0;1;30;90;47m;[0;33;5;40;100m:[0;37;5;47;107m:.   . .   :[0;1;37;97;47m%[0;37;5;47;107m@[0;1;37;97;47mX[0;33;47m8[0;1;31;91;5;43;103m8[0;1;31;91;47m8[0;1;33;93;5;41;101m8[0;37;5;40;100mX[0;1;30;90;47m;[0;37;5;47;107mt [0;1;30;90;47m8[0;1;31;91;5;43;103m8[0;1;33;93;47m8[0;37;5;41;101m8[0;37;5;43;103m8[0;1;33;93;47m@%[0;37;5;47;107m8[0;37;5;43;103m8[0;1;33;93;5;47;107m8[0;1;37;97;47m%[0;37;5;43;103m8[0;37;5;41;101m8[0;1;37;97;47mX[0;37;5;47;107m .[0;1;30;90;47mt[0;37;5;47;107m8[0;33;47m8[0;33;5;41;101m [0;1;33;93;47m8[0;37;5;41;101m@[0;1;33;93;47m8[0;1;37;97;47m [0;37;5;47;107m:8[0;1;33;93;5;41;101m@[0;1;33;93;47m@[0;37;5;43;103m8[0;37;5;47;107m..[0;1;37;97;47mX[0;36;5;40;100mX[0;1;31;91;43m8[0;37;5;47;107m8[0m
[0;1;37;97;47mX%[0;37;5;47;107m   .         [0;1;37;97;47m:[0;1;31;91;43m8[0;1;33;93;47m@[0;37;5;41;101m8[0;1;33;93;47m8[0;37;5;41;101m8[0;37;5;47;107m: .[0;1;37;97;47m;[0;1;31;91;5;43;103m8[0;1;31;91;47mX[0;1;33;93;5;41;101m8[0;1;33;93;47mXS%[0;1;37;97;5;43;103m8[0;37;5;43;103m8[0;37;5;47;107m8[0;37;5;43;103m8[0;1;37;97;5;43;103m8[0;1;37;97;47m;[0;37;5;43;103m8[0;33;47m8[0;37;5;47;107mt . [0;1;37;97;47m%[0;1;33;93;47m8%[0;37;5;41;101m8[0;33;47m8[0;1;37;97;47m [0;37;5;47;107mS[0;1;33;93;5;41;101m@[0;1;33;93;47m8[0;37;5;43;103m8[0;37;5;47;107m88%.[0;35;5;40;100m [0;1;30;90;47m8[0;37;5;47;107m;[0m
[0;37;5;47;107m .    .  .  .   8[0;37;43m8[0;1;30;90;47mS[0;1;37;97;47m [0;33;47m8[0;37;5;47;107m; t[0;33;47m8[0;37;5;41;101m8[0;37;5;43;103m8[0;37;5;41;101m8[0;1;37;97;47mt[0;1;37;97;5;43;103m@8[0;37;5;47;107m8[0;37;5;43;103m8[0;1;37;97;5;43;103m8[0;37;5;47;107m8[0;37;5;43;103m8[0;1;37;97;5;43;103m8[0;1;37;97;47mt[0;37;5;43;103m8[0;1;37;97;47m:[0;37;5;47;107m.  t[0;1;37;97;47m [0;37;5;47;107m8[0;1;37;97;47m;[0;37;5;47;107m8;8[0;37;5;41;101m8[0;1;33;93;5;41;101m8[0;37;5;43;103m8[0;1;31;91;5;43;103m8[0;1;33;93;5;41;101m8[0;37;5;47;107m8:[0;1;30;90;47m%[0;37;5;47;107m8:[0m
[0;37;5;47;107m       .     . @[0;1;37;97;47mt ..[0;37;5;47;107m88[0;1;37;97;47mSX[0;1;31;91;5;43;103m8[0;1;33;93;47m8[0;37;5;41;101m8[0;1;33;93;47m8[0;37;5;43;103m8[0;37;5;47;107m8[0;37;5;43;103m88[0;37;5;47;107m8[0;37;5;43;103m8[0;1;37;97;5;43;103m@[0;37;5;47;107m8[0;37;5;43;103m8[0;1;37;97;5;43;103m8[0;1;33;93;47mS[0;37;5;41;101m8[0;1;37;97;47mX[0;37;5;47;107m@:.::...8[0;37;5;43;103m@88[0;37;5;47;107m8S%.8: [0m
[0;37;5;47;107m     .   . . S[0;33;47mX[0;1;31;91;5;43;103m8[0;1;31;91;47m8[0;1;33;93;5;41;101m8[0;1;31;91;5;43;103m8[0;1;33;93;5;41;101m8[0;37;5;41;101m8[0;1;33;93;47m@S[0;37;5;43;103m8[0;37;5;41;101m8[0;1;33;93;5;41;101m8[0;1;33;93;47m@[0;31;5;41;101m:[0;37;5;47;107m8[0;37;5;43;103m8[0;1;33;93;5;47;107m8[0;1;37;97;5;43;103m8[0;37;5;43;103m8[0;37;5;47;107m8[0;1;31;91;5;43;103m@[0;1;33;93;5;47;107m8[0;37;5;43;103m88[0;1;33;93;47m8[0;33;5;41;101m.[0;37;5;43;103m8[0;1;37;97;47m.X[0;37;5;47;107m8..  .t8[0;37;5;41;101m8[0;37;5;47;107mX:      [0m
[0;37;5;47;107m  .    .    [0;1;37;97;47mS[0;33;47m8[0;1;33;93;5;41;101m8[0;1;33;93;47mS[0;1;33;93;5;41;101m8[0;1;33;93;47mS[0;1;31;91;47m@[0;1;33;93;47m88[0;37;5;41;101m8[0;1;31;91;5;43;103m8[0;1;31;91;47m@[0;37;5;43;103m8[0;37;5;41;101m8[0;1;31;91;47m8[0;1;30;90;43m8[0;37;5;43;103m88[0;1;33;93;47mXS[0;37;5;43;103m88[0;1;33;93;47mX[0;1;31;91;5;43;103m8[0;1;33;93;47m%[0;37;5;41;101m8[0;37;43m@[0;33;47m8[0;33;5;41;101m [0;37;5;43;103m88[0;1;37;97;47m [0;37;5;47;107m8:%@8[0;1;33;93;47m8[0;37;5;41;101m8[0;37;5;47;107m. .  .  .[0m
[0;37;5;47;107m   .      .;[0;1;31;91;43m8[0;1;33;93;47m8[0;37;5;41;101m8[0;1;33;93;47m8[0;37;5;41;101m8[0;1;33;93;5;41;101m8[0;1;31;91;47m8[0;33;5;41;101m:[0;1;33;93;47m8[0;1;31;91;47m8[0;37;5;43;103m8[0;37;5;41;101m88[0;37;43m@[0;33;5;41;101m [0;1;33;93;47m8[0;37;5;43;103m8[0;1;33;93;47m8[0;1;31;91;5;43;103m8[0;1;33;93;47mX[0;37;5;43;103m8[0;1;33;93;5;41;101m8[0;1;37;97;47m:[0;37;5;43;103m8[0;37;5;41;101m8[0;37;43mX[0;33;5;41;101m [0;33;47m8[0;37;43m@[0;33;5;41;101m [0;1;33;93;47m8[0;1;33;93;5;41;101m@[0;1;33;93;47m@[0;37;5;41;101m8[0;37;5;43;103m8[0;33;5;41;101m.[0;1;33;93;47m8[0;1;37;97;47m.[0;37;5;47;107m        . [0m
[0;37;5;47;107m .   .  .   [0;1;37;97;47mX[0;33;47m8[0;33;5;41;101m [0;1;33;93;47m8[0;33;47m88[0;37;5;43;103m8[0;37;43m8[0;33;5;41;101m [0;1;33;93;47m8[0;35;5;41;101m.[0;33;47m8[0;33;5;41;101m.[0;33;47m8[0;1;33;93;47m8[0;37;43m8[0;1;33;93;47m8[0;33;47m8[0;1;33;93;47mS[0;1;37;97;47m  ;[0;37;5;43;103mX[0;33;47m8[0;37;5;43;103m@[0;33;47m8[0;37;43mX[0;33;5;41;101m:[0;33;47m8[0;37;43m8[0;33;5;41;101m [0;33;47m@8[0;1;33;93;47mX[0;1;37;97;47mS[0;37;5;47;107m.;    . .    [0m
[0;37;5;47;107m      .     .:S[0;1;33;93;47m888[0;33;47mX8[0;1;31;91;43m8[0;1;30;90;47m8[0;1;31;91;43m8[0;33;47m8S[0;37;5;47;107mX888t:;.t:;X[0;1;30;90;47m8[0;33;5;41;101m:[0;33;47m@[0;33;5;41;101m;[0;33;47m8[0;37;43m8[0;1;37;97;47m [0;37;5;47;107m8t.    .     .  [0m
[0;37;5;47;107m  . .    .    :t:.8[0;1;37;97;47m [0;1;31;91;47m8[0;1;33;93;47m8[0;1;31;91;47m8[0;33;47m8[0;1;37;97;47m:[0;37;5;47;107m  .:. ...  .;[0;1;37;97;47m8[0;1;33;93;47m@[0;33;47m8[0;33;5;41;101mt[0;1;33;93;47m8[0;37;5;41;101m8[0;1;37;97;47m ;[0;37;5;47;107m.  .    .    .[0m
[0;37;5;47;107m       .    . .. .88[0;1;37;97;47m%[0;37;5;47;107m88[0;1;37;97;47m.[0;37;5;47;107m  . ..    .  .:: t888t      .   .   [0m
                                                                          
Primary Contact: GSAG - gsag@geeksoc.org
Purpose: None

This server is Puppet managed - local changes may be overwritten!

"
    }
  
    class {'ssh::sshd':
      sshd_config_AllowGroups => 'sysadmin-games sysadmin gsag root',
    }
    
    class {'sudo':
      sudoers => '%sysadmin-games',
    }

  # Roles
  include global
}
