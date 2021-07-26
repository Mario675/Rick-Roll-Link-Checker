#SingleInstance, Force
#Persistent
; This has to be here for it to check constantly. 
OnClipboardChange("clipboard_changed")
return
;my_picturefile = D:\1.Autohotkey\AHK-Studio-master\Projects\rickroll detector\Imgusedforrickrolldetecrtor.jpg

clipboard_changed(1)
{
    rick_roll_checker(Clipboard)
    return
}





{
    /* ; This may be Annoying to pop up the animation each time it's checking. Since it will check when the clipboard changes But this would be needed if it is a link shortner
        ;Or we need to do some cmd stuff (hard programming essentially)
        BlockInput,On

        Gui, Color, black
        Gui +AlwaysOnTop
        Gui -Caption
        Gui, Font, underline
        Gui, Show, x90 y167 w1200 h600
        Gui, Add, Picture,w1200 h900, %my_picturefile%

        Sleep,500

        SoundSet -100
        Run, %rrl%
        Sleep, 2000

        Click, 559, 71 Left, 1

        Sleep, 10
        Send, ^c
        Sleep, 300
        Send, ^w
        Sleep, 1000

        SoundSet +50
        Gui, Destroy
        BlockInput,Off
    */

    
}

rick_roll_checker(Url_Unknown_RickRoll)
{

    ; ["dQw4w9WgXcQ", "theraleighregister", "rr.noordstar.me"] ; Haystack

    ; The text file has to be created in advance.
    Path_of__List_Of_RickRolls := "ricklist.txt"

    HayStack_of_known_RickRolls := readData(Path_of__List_Of_RickRolls)
      


    ; Url_Unknown_RickRoll is the needle. 

    For index, in HayStack_of_RickRolls ; This goes through each index in the haystack array.
    {
        ; This first starts at index 1, which is `"dQw4w9WgXcQ"`. Then it checks if your needle is simalar with the haystack `https://rr.noordstar.me/46b105f1`.
        ;However! Be advised, since there could be false positives, since you would have https:// in the input. Meaning every string that you give it may be false positive if the url has https in it. Would recomend some user instructions to exclude that (Easy way), or program it to remove it (Hard way).
        If (InStr(HayStack_of_known_RickRolls, Url_Unknown_RickRoll)) 
        {

            ;This will interrupt the user before he pastes it into his browser. 
            MsgBox % "Found RickRoll in URL!"
        }

    }


    ;If nothing got found in the haystack, then it goes down to the below command. 
    ;MsgBox, 0, , it aint a rickroll but still use caution cause this might be diff link or smtn, 5

    ;Changed Msgbox to a tooltip, as that is less intrusive.

    Show_tooltip_while__combo_held__("No RickRoll found.")

    return
}

Show_tooltip_while__combo_held__(msg)
{

    while GetKeyState("Ctrl", "P")
    {
        ToolTip, %msg%
    }

    ToolTip


    return
}



readData(path){
    FileRead, content, % path
    return, StrSplit(content, "`n", "`r") ; Separate your known Rick Roll links by pressing enter, once you've finished typing your Rick Roll link. The lines will be in the array. The "n", "r" are excluded from the split function to make the strings useable.
}
