function [filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final, Time_s, iter]     =  LGSR_Denoising_Test (filename, Sigma, gamma, lambda, mu, c1, c2)


randn ('seed',0);

time0         =   clock;

fn               =     [filename, '.jpg'];


I                =     imread(fn);



colorI           =      I;

[~, ~, kk]       =     size (I);

if kk==3
    
    I     = rgb2gray (I);
    
    x_yuv = rgb2ycbcr(colorI);
    
  %  x_yuv_noise   =  x_yuv;
    
    
    x_inpaint_yuv(:,:,2) = x_yuv(:,:,2); % Copy U Componet
    
    x_inpaint_yuv(:,:,3) = x_yuv(:,:,3); % Copy V Componet
    

    
end



I            =     double(I);



par              =    LGSR_Para_Set (Sigma,I, gamma, lambda, mu, c1, c2);

par.nim          =    par.I + par.nSig* randn(size( par.I ));



[Denoising ,  iter]             =    LGSR_Denoising( par);

   Time_s =(etime(clock,time0));

im  = Denoising{iter-1};


PSNR_Final       =   csnr (im, par.I,0,0);
FSIM_Final       =   FeatureSIM(im, par.I);
SSIM_Final       =   cal_ssim (im, par.I,0,0);



if Sigma==10

Final_denoisng= strcat(filename,'LGSR_BSD_200','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./10_Result/',Final_denoisng));


if (kk==3)
    
x_inpaint_yuv(:,:,1) = uint8(im);
x_inpaint_rgb = ycbcr2rgb(uint8(x_inpaint_yuv));
    
Final_color_denoisng= strcat(filename,'LGSR_BSD_200','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(x_inpaint_rgb),strcat('./10_Result/',Final_color_denoisng));

end



elseif Sigma==20

Final_denoisng= strcat(filename,'LGSR_BSD_200','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./20_Result/',Final_denoisng));


if (kk==3)
    
x_inpaint_yuv(:,:,1) = uint8(im);
x_inpaint_rgb = ycbcr2rgb(uint8(x_inpaint_yuv));
    
Final_color_denoisng= strcat(filename,'LGSR_BSD_200','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(x_inpaint_rgb),strcat('./20_Result/',Final_color_denoisng));

end


elseif Sigma==30
    
Final_denoisng= strcat(filename,'LGSR_BSD_200','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./30_Result/',Final_denoisng));


if (kk==3)
    
x_inpaint_yuv(:,:,1) = uint8(im);
x_inpaint_rgb = ycbcr2rgb(uint8(x_inpaint_yuv));
    
Final_color_denoisng= strcat(filename,'LGSR_BSD_200','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(x_inpaint_rgb),strcat('./30_Result/',Final_color_denoisng));

end

elseif Sigma==40
    
Final_denoisng= strcat(filename,'LGSR_BSD_200','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./40_Result/',Final_denoisng));


if (kk==3)
    
x_inpaint_yuv(:,:,1) = uint8(im);
x_inpaint_rgb = ycbcr2rgb(uint8(x_inpaint_yuv));
    
Final_color_denoisng= strcat(filename,'LGSR_BSD_200','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(x_inpaint_rgb),strcat('./40_Result/',Final_color_denoisng));

end


elseif Sigma==50
    
Final_denoisng= strcat(filename,'LGSR_BSD_200','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./50_Result/',Final_denoisng));


if (kk==3)
    
x_inpaint_yuv(:,:,1) = uint8(im);
x_inpaint_rgb = ycbcr2rgb(uint8(x_inpaint_yuv));
    
Final_color_denoisng= strcat(filename,'LGSR_BSD_200','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(x_inpaint_rgb),strcat('./50_Result/',Final_color_denoisng));

end



elseif Sigma==75
    
Final_denoisng= strcat(filename,'LGSR_BSD_200','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./75_Result/',Final_denoisng));


if (kk==3)
    
x_inpaint_yuv(:,:,1) = uint8(im);
x_inpaint_rgb = ycbcr2rgb(uint8(x_inpaint_yuv));
    
Final_color_denoisng= strcat(filename,'LGSR_BSD_200','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(x_inpaint_rgb),strcat('./75_Result/',Final_color_denoisng));

end



else
    
Final_denoisng= strcat(filename,'LGSR_BSD_200','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./100_Result/',Final_denoisng));



if (kk==3)
    
x_inpaint_yuv(:,:,1) = uint8(im);
x_inpaint_rgb = ycbcr2rgb(uint8(x_inpaint_yuv));
    
Final_color_denoisng= strcat(filename,'LGSR_BSD_200','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(x_inpaint_rgb),strcat('./100_Result/',Final_color_denoisng));

end
end



end

