one=imread('Numbers\1.bmp');  
two=imread('Numbers\2.bmp');
four=imread('Numbers\4.bmp');
three=imread('Numbers\3.bmp');
five=imread('Numbers\5.bmp'); 
six=imread('Numbers\6.bmp');
seven=imread('Numbers\7.bmp');
eight=imread('Numbers\8.bmp');
nine=imread('Numbers\9.bmp'); 
zero=imread('Numbers\0.bmp');
number=[one two three four five six seven eight nine zero];
templates = mat2cell(number,42,[24 24 24 24 24 24 24 24 24 24]);
save ('templates','templates')