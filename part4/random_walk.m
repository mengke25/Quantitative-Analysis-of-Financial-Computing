clear all;close all;clc
n=70000;        %游走的步数。也是图像中像素个数，有些位置可能重复，所以白像素小于等于n
x=0;            %初始x坐标
y=0;            %初始y坐标
pix=zeros(n,2); %游走产生的像素坐标
neighbour=[-1 -1;-1 0;-1 1;0 -1;0 1;1 -1;1 0;1 1];  %当前像素邻域
for i=1:n
    r=floor(1+8*rand());    %八邻域随机选一个来走
    y=y+neighbour(r,1);     %y方向游走
    x=x+neighbour(r,2);     %x方向游走
    pix(i,:)=[y x];         %保存坐标
end
miny=min(pix(:,1));         %图像坐标不可能为负，所以找最小值再整体提升为正
minx=min(pix(:,2));         %同上
pix(:,1)=pix(:,1)-miny+1;   %像素坐标整体变为正
pix(:,2)=pix(:,2)-minx+1;
maxy=max(pix(:,1));         %找最大坐标值，为开辟图像做准备
maxx=max(pix(:,2));
img=zeros(maxy,maxx);       %根据maxy、maxx产生图像
for i=1:n                   %将游走的值赋给图像
    img(pix(i,1),pix(i,2))=1;
end
imshow(img)