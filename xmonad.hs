--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--
 
import XMonad
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Prompt
import XMonad.Prompt.Workspace
import XMonad.Hooks.ManageDocks
import XMonad.Actions.GridSelect 
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Dmenu
import XMonad.Layout.ShowWName
import XMonad.Actions.OnScreen
import XMonad.Actions.PhysicalScreens

import XMonad.Actions.CycleWS
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Config.Gnome

import Control.Monad



-- Confirmation.  mod-shift-q is only occasionally a problem, but
--  it's really aggravating to footshoot that way.

confirm :: String -> X () -> X ()
confirm msg f = do
    a <- dmenu [msg,"y","n"]
    when (a=="y") f














-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "xterm"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Width of the window border in pixels.
--
myBorderWidth   = 1

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod4Mask

-- The mask for the numlock key. Numlock status is "masked" from the
-- current modifier status, so the keybindings will work with numlock on or
-- off. You may need to change this on some systems.
--
-- You can find the numlock modifier by running "xmodmap" and looking for a
-- modifier with Num_Lock bound to it:
--
-- > $ xmodmap | grep Num
-- > mod2        Num_Lock (0x4d)
--
-- Set numlockMask = 0 if you don't have a numlock key, or want to treat
-- numlock status separately.
--

-- myNumlockMask   = mod3Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces    = ["p1","p2","p3","p4","p5","p6","p7","p8","p9","p0",
                   "mail","web","chrome",
                   "Sysedit","dir1","dir2",
                   "tsmmon","tsmshell","tsmsess",
                   "osgadmin", "todo", "rdesk", "IM", 
                   "acroread", 
                   "doc1e","doc1d",
                   "doc2e","doc2d",
                   "doc3e","doc3d", 
                   "doc4e","doc4d", 
                   "doc5e","doc5d",  
                   "doc6e","doc6d",  
                   "doc7e","doc7d",  
                   "doc8e","doc8d",  
                   "doc9e","doc9d",  
                   "doc0e","doc0d",  
                   "dd1","dd2" ]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#ff0000"


data ScrUple = Int String


------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ 
      ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
      
    
    , ((modm, xK_s),      gridselectWorkspace defaultGSConfig   W.greedyView  )

    , ((modm .|. shiftMask, xK_s ), do { windows (viewOnScreen 0 "tsmmon" ) >> windows (viewOnScreen 1 "tsmsess" ) } )   
    , ((modm .|. shiftMask, xK_f ), do { windows (viewOnScreen 0 "dd1" ) >> windows (viewOnScreen 1 "dd2" ) } )   
      
    , ((modm .|. shiftMask, xK_n     ), windows (viewOnScreen 0 "mail"  ))
    
    
    , ((modm .|. shiftMask, xK_a ), do { windows (viewOnScreen 0 "tsmmon" ) >> 
                                         windows (viewOnScreen 2 "tsmsess" ) >> 
                                         windows (viewOnScreen 1 "mail" ) >> 
                                         windows (viewOnScreen 3 "web" )
                                       } )   
      
    
    , ((modm .|. shiftMask, xK_d ), do { windows (viewOnScreen 0 "dir1" ) >> windows (viewOnScreen 2 "dir2" ) } )   

    , ((modm .|. controlMask, xK_1 ), do { windows (viewOnScreen 0 "doc1e" ) >> windows (viewOnScreen 2 "doc1d" ) } )   
    , ((modm .|. controlMask, xK_2 ), do { windows (viewOnScreen 0 "doc2e" ) >> windows (viewOnScreen 2 "doc2d" ) } )   
    , ((modm .|. controlMask, xK_3 ), do { windows (viewOnScreen 0 "doc3e" ) >> windows (viewOnScreen 2 "doc3d" ) } )   
    , ((modm .|. controlMask, xK_4 ), do { windows (viewOnScreen 0 "doc4e" ) >> windows (viewOnScreen 2 "doc4d" ) } )   
    , ((modm .|. controlMask, xK_5 ), do { windows (viewOnScreen 0 "doc5e" ) >> windows (viewOnScreen 2 "doc5d" ) } )   
    , ((modm .|. controlMask, xK_6 ), do { windows (viewOnScreen 0 "doc6e" ) >> windows (viewOnScreen 2 "doc6d" ) } )   
    , ((modm .|. controlMask, xK_7 ), do { windows (viewOnScreen 0 "doc7e" ) >> windows (viewOnScreen 2 "doc7d" ) } )   
    , ((modm .|. controlMask, xK_8 ), do { windows (viewOnScreen 0 "doc8e" ) >> windows (viewOnScreen 2 "doc8d" ) } )   
    , ((modm .|. controlMask, xK_9 ), do { windows (viewOnScreen 0 "doc9e" ) >> windows (viewOnScreen 2 "doc9d" ) } )   
    , ((modm .|. controlMask, xK_0 ), do { windows (viewOnScreen 0 "doc0e" ) >> windows (viewOnScreen 2 "doc0d" ) } )   
    

    , ((modm .|. shiftMask, xK_l),               spawn "xscreensaver-command --lock")
    , ((controlMask .|. mod1Mask, xK_l),               spawn "xscreensaver-command --lock")
      
      
    , ((modm,     xK_Right),   nextWS)
    , ((modm,     xK_Left),    prevWS)
---    , ((modm .|. controlMask ,     xK_Right), onNextNeighbour W.view )
---    , ((modm .|. controlMask ,     xK_Left),  onPrevNeighbour W.view )
--    , ((modm .|. controlMask ,     xK_Right), onNextNeighbour W.shift )
--    , ((modm .|. controlMask ,     xK_Left),  onPrevNeighbour W.shift )
      
    , ((modm .|. shiftMask, xK_Right),   shiftToNext)
    , ((modm .|. shiftMask, xK_Left),    shiftToPrev)
      
    , ((modm, xK_KP_Subtract),     spawn "amixer --   sset Master playback 10%-")
    , ((modm, xK_KP_Add)     ,     spawn "amixer --   sset Master playback 10%+")
      
    , ((modm .|. shiftMask, xK_i     ), windows $ W.greedyView "IM" )
    , ((modm .|. shiftMask, xK_e     ), windows $ W.greedyView "acroread" )
    , ((modm .|. shiftMask, xK_m     ), windows $ W.greedyView "mail" )
    , ((modm .|. shiftMask, xK_w     ), windows $ W.greedyView "web" )
    , ((modm .|. shiftMask, xK_o     ), windows $ W.greedyView "osgadmin" )
    , ((modm .|. shiftMask, xK_z     ), windows $ W.greedyView "Sysedit" )
    , ((modm .|. shiftMask, xK_t     ), windows $ W.greedyView "todo" )
    , ((modm .|. shiftMask, xK_r     ), windows $ W.greedyView "rdesk" )
      
     
     
--- End of Allen's Mods?


     -- launch dmenu
    , ((modm,          xK_p ), spawn "dmenu_run")


    -- launch gmrun 
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun foopy227")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), confirm "Exist XMONAD session?"   $ io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_q     ),  confirm "Reload" $  spawn "xmonad  --recompile; xmonad  --restart")
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9 ] ++ [xK_0])
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    


    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
--  ++
--    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
--        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
--        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--


myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout =  showWName ( avoidStruts(  tiled ||| Mirror tiled  ||| Full ))
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "MPlayer"          --> doFloat
    , className =? "Gimp"             --> doFloat
    , resource  =? "desktop_window"   --> doIgnore
    , resource  =? "kdesktop"         --> doIgnore 
-- asr mods     
--     , className =? "Cssh"             --> doFloat
    , className =? "Pidgin"           --> doFloat >> doShift "IM" 
    , className =? "Acroread"         --> doShift "acroread"
    , className =? "Firefox"          --> doShift "web"
    , className =? "chromium-browser" --> doShift "chrome"
    , className =? "Chromium-browser" --> doShift "chrome"
    
    , resource  =? "tsmsess [1]"          --> doShift "tsmsess"
    , title     =? "tsmsess [1]"          --> doShift "tsmsess"
    , className =? "tsmsess [1]"          --> doShift "tsmsess"
    , resource  =? "tsmsess: glint"          --> doShift "tsmsess"
    , title     =? "tsmsess: glint"          --> doShift "tsmsess"
    , className =? "tsmsess: glint"          --> doShift "tsmsess"
    , className =? "Thunderbird"      --> doShift "mail"
    , title     =? "fluffy"           --> doShift "fluffy"   -- a la xterm 'title'
    , resource  =? "fluffy"           --> doShift "fluffy"   -- a la xterm 'name'
     ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = return ()

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do 
     xmonad defaults

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = defaultConfig {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
---        numlockMask        = myNumlockMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = avoidStruts myLayout,
        manageHook         = manageDocks <+> myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }
