%% Created by Youshan Zhang 01/26/2023 for Deep Learning course Lecture 2
clear % delete all variables
clc   % clean command window history 
close all % close all plots

%% Read color image
im_c = imread('color.png');
% separating Color channels
imR = im_c(: ,: ,1);
imG = im_c(: ,: ,2);
imB = im_c(: ,: ,3);
% show images
figure,
subplot(2,2,1);imshow(im_c);title('Original image')
subplot(2,2,2);imshow(imR);title('Red channel')
subplot(2,2,3);imshow(imG);title('Green channel')
subplot(2,2,4);imshow(imB);title('Blue channel')

%% Read an image
im = imread('bird.png');
% show the image
figure,imshow(im)

%% Convert it into a binary image
im_b = rgb2gray(im);
figure,imshow(im_b)
% check the size of image
disp(['The hight length is ', num2str(size(im_b,1))])
disp(['The width length is ', num2str(size(im_b,2))])
% check maximum and minimum pixel number
disp(['The maximum  pixel number is ', num2str(max(im_b(:)))])
disp(['The minimum pixel number is ', num2str(min(im_b(:)))])
% image pixels
im_b(100:120,50:190)
% show one line
figure,
subplot(2,1,1);imshow(im_b);line ([1 430] ,[160 160] , 'color','r') ;
subplot(2,1,2);plot(im_b(160,:));



%% Basic Image Manipulation

% Image cropping in eye RGB image
img1 = imread ('eye.png');
% Resize / Change its dimensions
disp ('Resizing Image ... ')
im1 = imresize ( img1 ,[320 ,480]) ;

disp ('Image after resizing and keeping it in color')
[ row , col , dim ] = size ( im1 );
disp ([ row , col , dim ])
subplot (1 ,2 ,1) ; imshow ( im1 ) ,title ('Original Image')
%% cropping Image
imCropped = im1 (90:250 ,80:300 ,:) ;
subplot (1 ,2 ,2) ; imshow ( imCropped ) ,title ('Cropped Image')



%% Addition of two images
img1 = rgb2gray ( imread ('bird.png'));
img2 = rgb2gray ( imread ('cloud.png'));
img1 = imresize ( img1 ,[320 ,480]) ;
img2 = imresize ( img2 ,[320 ,480]) ;
summed = img1 + img2 ;
figure,imshow(summed)
figure,imshow(img1/2 + img2/2)
figure,imshow(summed/2)



%% Blending images
img1 = rgb2gray (imread ('bird.png'));
img2 = rgb2gray (imread ('cat.png'));
img1 = imresize (img1 ,[320 ,480]) ;
img2 = imresize (img2 ,[320 ,480]) ;
figure,
imshow ( blendImg (img1 , img2 , 0.9, 0.1) );% totoal weights should be equal to


%% Histogram
img1 = imread ('BM_lowCont.png') ;
img1 = imresize ( img1 ,[320 ,480]) ;
figure,
imshow ( img1 )
figure,
% Image Histogram
subplot (1 ,2 ,1) , imshow ( img1 ) ,title ('Low contrast Image')
subplot (1 ,2 ,2) , imhist ( img1 ) ,title ('Histogram of Low contrast Image')

% Image Histogram Equalization
J = histeq ( img1 );
figure
subplot (1 ,2 ,1) , imshow (J) ,title ('Histogram Equalized Image')
subplot (1 ,2 ,2) , imhist (J) ,title ('Histogram of Equalized Image')

% Transformation function
[J1 , T1 ] = histeq ( img1 );
figure ; plot ( T1 .*255) ; title (' Transformation Curve')


%% Add noise
im =  rgb2gray(imread('bridge.png'));
J = imnoise(im,'salt & pepper',0.02);
figure,imshow(J)
% figure,imshow(im);line ([1 421] ,[120 120] , 'color','r') ;
% figure,plot(im_b(120,:));
% figure,imshow(J);line ([1 421] ,[120 120] , 'color','r') ;set(gcf,'color','w')
% figure,plot(J(120,:));set(gcf,'color','w')

noise = randn ([1 100000]) ; %randn = normally distributed random numbers with 0 mean and 1 SD.
[n x] = hist ( noise , linspace( -3 , 3, 31) ); % 21 = odd number , to have 0 as well
figure, plot (x , n) ;


im =  rgb2gray(imread('bridge.png'));
% Gaussian white noise with mean m =0
J1 = imnoise ( im,'gaussian');
figure,imshow ( J1 )

%% add random noise
im =  rgb2gray(imread('bridge.png'));
% Noise image with m x n
% image is in Uint8
sigma = 0.3;
randomNoise = im2uint8 ( randn ( size (im )) .* sigma);
figure, imshow ( randomNoise ); 
% Add Image and noise image
noisyImg = im + randomNoise ;
figure; imshow ( noisyImg )















