% clc - clear command window
% close all - 
% clear all - 

clc, close all, clear all;

% Read image from graphics file
% A = imread(filename, fmt) fmt is format of the file 
imagen = imread('TEST_1.jpg');

% displays image in new window
% imshow(filename, map)
imshow(imagen);
title('INPUT IMAGE WITH NOISE');

% To check wheather the image is rgb or not
% converts rgb image of x bit to grayscale image of x bit.
if size(imagen,3)==3 
    imagen = rgb2gray(imagen);
end

% computes a global threshold (level) using Otsu's method, that can be used to convert an intensity image to binary image with im2bw
threshold = graythresh(imagen);
imagen = ~im2bw(imagen,threshold);

% remove small objects whose pixels are less than 30 from binary image
imagen = bwareaopen(imagen,30);

% create dynamic matrix
word = [ ];

re = imagen;
fid = fopen('text.txt', 'wt');

load templates
global templates


% return number of coloumns in templates
num_letras = size(templates,2);


while 1
    [fl re] = lines(re);
    imgn = fl;
    [L Ne] = bwlabel(imgn);   

    for n = 1:Ne
        [r,c] = find(L==n);
        n1 = imgn(min(r):max(r),min(c):max(c));  
        img_r = imresize(n1,[42 24]);
        letter = read_letter(img_r,num_letras);
        word = [word letter];
    end
    
    fprintf(fid,'%s\n',word);
    word = [ ];

    % check weather array is empty (returns 1 if array is empty)
    if isempty(re)  
        break
    end    
end

fclose(fid);
winopen('text.txt');