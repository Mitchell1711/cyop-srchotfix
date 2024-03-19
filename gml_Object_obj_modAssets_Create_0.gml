global.loadedAssets = []
//argument0 = folder to load, argument1 = force load
function switchAssetFolder(argument0, argument1) //gml_Script_switchAssetFolder
{
    if(argument0 == undefined)
        argument0 = false
    //modfolder first checks if the list of files got changed since the last load
    global.modFolder = argument0
    var checkAssets = gml_Script_find_files_recursive(mod_folder(""), "*")
    if (argument1 || checkAssets != [] && (!(array_equals(global.loadedAssets, checkAssets))))
    {
        global.loadedAssets = checkAssets
        ass_unloadAssets()
        if font_exists(global.editorfont)
            font_delete(global.editorfont)
        if (argument0 != "")
            ass_loadFolderAssets(mod_folder(""))
        global.tilesetData = json_parse(file_text_read_all(editor_folder("tilesets.json")))
        var defaultTiles = []
        var defFolderNames = variable_struct_get_names(global.tilesetData.folders)
        for (var i = 0; i < array_length(defFolderNames); i++)
        {
            var f = struct_get(global.tilesetData.folders, defFolderNames[i])
            for (var j = 0; j < array_length(f); j++)
                array_push(defaultTiles, f[j])
        }
        if (array_length(global.tileset_names) > 0)
        {
            global.tilesetData.order = gml_Script_array_concat(["custom"], global.tilesetData.order)
            struct_set(global.tilesetData.folders, [["custom", array_duplicate(global.tileset_names)]])
        }
        ass_loadFolderAssets(editor_folder(""), 1)
        global.defaultTilesets = defaultTiles
        for (i = 0; i < array_length(defaultTiles); i++)
            ass_addTileset(defaultTiles[i], 32, 1, ass_getAutotileList(editor_folder(("autotile/" + defaultTiles[i])), 0))
        global.defaultSongs = struct_new()
        global.defaultSong_names = []
        global.defaultSong_display = struct_new()
        var jt = file_text_read_all(editor_folder("songs.json"))
        var songData = json_parse(jt)
        for (i = 0; i < array_length(songData); i++)
        {
            if (songData[i][0] != "")
            {
                struct_set(global.defaultSongs, [[songData[i][0], songData[i][1]]])
                struct_set(global.defaultSong_display, [[songData[i][1], songData[i][0]]])
            }
            array_push(global.defaultSong_names, songData[i][0])
        }
        global.editorfont = font_add_sprite_ext(_spr("smallfont"), "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789?!.:-<>()_{},[]/\"´¨", 0, -1)
        object_set_sprite(obj_sprite, _spr("sprite_preview"))
        object_set_sprite(obj_camera_region, _spr("z_oldeditor/spr_camera"))
        object_set_sprite(obj_warp_number, _spr("warp_number"))
        object_set_sprite(obj_destroyable3_escape, _spr("z_oldeditor/escape_destroyable3"))
    }
}