Config {
    font = "xft:Droid Sans Mono:size=10:bold:antialias=true"
    bgColor = "#000000",
    fgColor = "#ffffff",
    position = Static { xpos = 0, ypos = 0, width = 1920, height = 16 },
    lowerOnStart = True,
    commands = [
         --Run Weather "UUDD" ["-t","<tempC>°C","-L","18","-H","25","--normal","green","--high","red","--low","lightblue"] 36000
         Run Memory ["-t","<used>/<total>M (<cache>M)","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10
        ,Run Network "eth0" [
             "-t"    ,"rx:<rx>, tx:<tx>"
            ,"-H"   ,"200"
            ,"-L"   ,"10"
            ,"-h"   ,"#FFB6B0"
            ,"-l"   ,"#CEFFAC"
            ,"-n"   ,"#FFFFCC"
            , "-c"  , " "
            , "-w"  , "2"
            ] 10
        ,Run Date "%Y.%m.%d %H:%M:%S" "date" 10
        ,Run MultiCpu [ "--template" , "<autototal>"
            , "--Low"      , "50"         -- units: %
            , "--High"     , "85"         -- units: %
            , "--low"      , "gray"
            , "--normal"   , "darkorange"
            , "--high"     , "darkred"
            , "-c"         , " "
            , "-w"         , "3"
        ] 10
        ,Run CoreTemp [ "--template" , "<core0> <core1> <core2> <core3>°C"
            , "--Low"      , "70"        -- units: °C
            , "--High"     , "80"        -- units: °C
            , "--low"      , "darkgreen"
            , "--normal"   , "darkorange"
            , "--high"     , "darkred"
        ] 50
        ,Run PipeReader "/tmp/.volume-pipe" "vol"
        ,Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %coretemp% | %multicpu% | %memory%  | %eth0% | %vol% | <fc=#FFFFCC>%date%</fc>   "
}
