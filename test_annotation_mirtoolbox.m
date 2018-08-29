function test
%% Song path
finf = dir('test_file\*.mp3')
n = length(finf);

for file=1:n
    song_name = finf(file).name;
    song_path = ['test_file\',song_name];
    song_id = strtok(song_name,'-');
    if isfolder('annotation_file_mirtoolbox')==0
        mkdir annotation_file_mirtoolbox
    end
    
    file_path = strcat('annotation_file_mirtoolbox\',song_id)
    if isfolder(file_path)==0
        mkdir(fullfile(file_path))
    end

%     export_fname_frame = strcat(file_path,'\',song_id,'-mirframe.txt');
    export_fname_brightness = strcat(file_path,'\',song_id,'-mirbrightness.txt');
    export_fname_c = strcat(file_path,'\',song_id,'-mirchromagram.txt');
    export_fname_key = strcat(file_path,'\',song_id,'-mirkey.txt');
    export_fname_mode = strcat(file_path,'\',song_id,'-mirmode.txt');
%     export_fname_sg = strcat(file_path,'\',song_id,'-mirsegment.txt');
    export_fname_pitch = strcat(file_path,'\',song_id,'-mirpitch.txt');
    
%     export_fname_frame_r = strcat(file_path,'\',song_id,'-mirframe-r.txt');
    export_fname_brightness_r = strcat(file_path,'\',song_id,'-mirbrightness-r.txt');
    export_fname_key_r = strcat(file_path,'\',song_id,'-mirkey-r.txt');
    export_fname_mode_r = strcat(file_path,'\',song_id,'-mirmode-r.txt');
    
    try
       %% miraudio, mirspectrum
        audio = miraudio(song_path);
        frame = mirframe(audio);
    
        %% mirbrightness
        bright = mirbrightness(song_path,'frame');

        %% mirkey, mirmode
%         mirchromagram(song_path,'wrap','no');
        c = mirchromagram(song_path);
        mode = mirmode(song_path,'frame');

        % ks = mirkeystrength(c)
        % [k kc ks] = mirkey(ks)
        [k,kc,ks] = mirkey(song_path,'frame');

    %% mirsegment, mirpitch
        o = mironsets(song_path,'Attacks','Contrast',.1);
        sg = mirsegment(song_path,o);
        pitch = mirpitch(sg,'mono');

    %% Export  statistical information and raw data of  features
%         mirexport(export_fname_frame, frame);
        mirexport(export_fname_brightness, bright);
        mirexport(export_fname_c, c);
        mirexport(export_fname_key, k,kc,ks);
        mirexport(export_fname_mode, mode);
%         mirexport(export_fname_sg, sg);
        mirexport(export_fname_pitch, pitch);

%         mirexport(export_fname_frame_r, 'Raw', frame);
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