function annotation_mirtoolbox
%% Song path
finf = dir('song_file\*.mp3');
n = length(finf);

for file=1:n
    song_name = finf(file).name;
    song_path = ['song_file\',song_name];
    song_id = strtok(song_name,'-');
    if isfolder('annotation_file_mirtoolbox')==0
        mkdir annotation_file_mirtoolbox
    end
    
    file_path = strcat('annotation_file_mirtoolbox\',song_id);
    if isfolder(file_path)==0
        mkdir(fullfile(file_path))
    end

    export_fname_brightness = strcat(file_path,'\',song_id,'-mirbrightness.txt');
    export_fname_c = strcat(file_path,'\',song_id,'-mirchromagram.txt');
    export_fname_key = strcat(file_path,'\',song_id,'-mirkey.txt');
    export_fname_mode = strcat(file_path,'\',song_id,'-mirmode.txt');
    export_fname_pitch = strcat(file_path,'\',song_id,'-mirpitch.txt');
    
    export_fname_brightness_r = strcat(file_path,'\',song_id,'-mirbrightness-r.txt');
    export_fname_key_r = strcat(file_path,'\',song_id,'-mirkey-r.txt');
    export_fname_mode_r = strcat(file_path,'\',song_id,'-mirmode-r.txt');
    
    try
        %% mirbrightness
        bright = mirbrightness(song_path,'frame');

        %% mirkey, mirmode
        c = mirchromagram(song_path);
        mode = mirmode(song_path,'frame');
        [k,kc,ks] = mirkey(song_path,'frame');

    %% mirsegment, mirpitch
        o = mironsets(song_path,'Attacks','Contrast',.1);
        sg = mirsegment(song_path,o);
        pitch = mirpitch(sg,'mono');

    %% Export  statistical information and raw data of  features
        mirexport(export_fname_brightness, bright);
        mirexport(export_fname_c, c);
        mirexport(export_fname_key, k,kc,ks);
        mirexport(export_fname_mode, mode);
        mirexport(export_fname_pitch, pitch);

        mirexport(export_fname_brightness_r, 'Raw', bright);
        mirexport(export_fname_key_r, 'Raw', k,kc,ks);
        mirexport(export_fname_mode_r, 'Raw', mode);
%         Raw data of mirchromagram, mirsegment, mirpitch are same with
%         the processed data of them.

%         display('Strike any key to continue...');
%         pause
        close all
        
    catch ME
        ME
    end
end