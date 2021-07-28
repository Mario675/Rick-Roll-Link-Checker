#SingleInstance, Force
#Persistent
; This has to be here for it to check constantly. 
OnClipboardChange("clipboard_changed")
return

clipboard_changed(1)
{
    rick_roll_checker(Clipboard)
    return
}

rick_roll_checker(Url_Unknown_RickRoll)
{

    ; ["dQw4w9WgXcQ", "theraleighregister", "rr.noordstar.me"] ; Haystack

    ; The text file has to be created in advance.
    Path_of__List_Of_RickRolls := "ricklist.txt"

    HayStack_of_known_RickRolls := readData(Path_of__List_Of_RickRolls)
      
    ;msgbox % HayStack_of_known_RickRolls[1]

    ; Url_Unknown_RickRoll is the needle. 
    ; The needle is the data in the clipboard

    index := 1

    For index, in HayStack_of_known_RickRolls ; This goes through each index in the haystack array.
    {
        ; This first starts at index 1, which is `"dQw4w9WgXcQ"`. Then it checks if your needle is simalar with the haystack in ricklist.txt Needle:`https://randomSite/dQw4w9WgXcQ`.
        If InStr(HayStack_of_known_RickRolls[index], Url_Unknown_RickRoll)
        {
            msgbox % HayStack_of_known_RickRolls[index]
            ;This will interrupt the user before he pastes it into his browser. 
            MsgBox % "Found RickRoll in URL!"
        }

    }

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
    ;msgbox % content
    return, StrSplit(content, "`n", "`r") ; Separate your known Rick Roll links by pressing enter, once you've finished typing your Rick Roll link. The lines will be in the array. The "n", "r" are excluded from the split function to make the strings useable.
}
