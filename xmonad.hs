import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


main = xmonad defaultConfig
        { modMask = mod4Mask -- Use Super instead of Alt
        -- more changes
        }
