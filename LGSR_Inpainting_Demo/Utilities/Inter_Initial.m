
function im_r=Inter_Initial(im_n,c)

[x,y]=find(c==0);

[M,N]=size(im_n);

[x1,y1]=meshgrid(1:M,1:N);

im_r=griddata(x,y,im_n(find(c==0)),x1,y1);

im_r=im_r';

I=find(isnan(im_r)==0);

I=find(isnan(im_r)==1);

im_r(I)=128;