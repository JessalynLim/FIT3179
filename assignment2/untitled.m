clear all; close all; clc;
setlist = readtable("data/setlist_data.csv");
filename = "setlist_tree.txt";
fid = fopen(filename, "w");
fprintf(fid, '[\n');
fprintf(fid, '{\n"id": 1,\n"name": "Ed Sheeran"\n},\n');
albums = string(setlist.Album);
unique_albums = unique(albums);
unique_albums = [unique_albums(1), unique_albums(4), unique_albums(5), unique_albums(3), unique_albums(2)];
for i = 1:numel(unique_albums)
    fprintf(fid, '{\n"id": %i,\n"name": "%s",\n"parent": 1\n},\n', i+1, unique_albums(i));
end
songs = string(setlist.Song);
for j = 1:numel(songs)
    parent_num = find(albums(j) == unique_albums) + 1;
    fprintf(fid, '{\n"id": %i,\n"name": "%s",\n"parent": %i\n},\n', j+i+1, songs(j), parent_num);
end
fprintf(fid, "]\n");
fclose(fid);