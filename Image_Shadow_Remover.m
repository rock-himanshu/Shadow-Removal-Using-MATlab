% Shadow Removel Program
% By Himanshu Agarwal
% WWW.github.com/Rock-Himanshu
% All Copywrite are reserved under licence under copywrite act.
% To use or Site on journal use www.github.com/Rock-Himanshu.

I=imread('im2.png');
[x,y,z]=size(I);
figure('Name','Processing Steps'),subplot(3,2,1), imshow(I),title('Image 1: Original Image');

I=uint8(I);
temp1=I;

half_intensity=I/2;
subplot(3,2,2), imshow(half_intensity),title('Image 2: Half Intensity Image');

Double_intensity=I*2;
subplot(3,2,3), imshow(Double_intensity),title('Image 3: Double Intensity Image');
temp2=Double_intensity;

for i=1:1:x
   for j=1:1:y
       
      if (Double_intensity(i,j,1)>=252 ||Double_intensity(i,j,2)>=252||Double_intensity(i,j,3)>=252) %Bright background removel
        Double_intensity(i,j,:)=0;
      end
      
      if (temp1(i,j,1)<=120 && temp1(i,j,1)>=12) %Shadow part Removel
        temp1(i,j,:)=0;
      end
      
   end
end
%  I= imnoise(Double_intensity,'salt & pepper', 1);
  Double_intensity(:,:,1)= medfilt2(Double_intensity(:,:,1), [3,3]); 
Double_intensity(:,:,2)= medfilt2(Double_intensity(:,:,2), [3,3]);
Double_intensity(:,:,3)= medfilt2(Double_intensity(:,:,3), [3,3]);
intensity_difference=temp2-half_intensity;
output=temp1+Double_intensity;
subplot(3,2,4), imshow(Double_intensity),title("Image 4: Shadow Object's"),

subplot(3,2,5), imshow(temp1),title('Image 5: bight background'),

subplot(3,2,6), imshow(output),title('Image 6: Output 1: most accurate result'),

% subplot(3,2,7), imshow(intensity_difference),title('Image 7: output 2:Intensity difference');

figure('Name','Original Image Vs Processed Image'),
subplot(1,2,1),imshow(I),title("Original Image"),
subplot(1,2,2),imshow(output),title("Processed Image"),
