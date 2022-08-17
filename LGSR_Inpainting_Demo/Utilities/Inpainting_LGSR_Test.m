function  [filename, p_miss, alpha, beta, mu,  c1, c2, j, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= Inpainting_LGSR_Test(filename, IterNum, p_miss, alpha,beta, mu,c1, c2 )


        time0                       =              clock;
        
        Orgname                     =              [filename '.tif'];
        
        x_rgb                       =              imread(Orgname); 
        
        [~, ~, kkk ]                =              size(x_rgb);
          
       if kkk==3
        
        x_yuv                       =             rgb2ycbcr(x_rgb);
         
        x                           =             double(x_yuv(:,:,1)); 
        
        x_inpaint_re                =             zeros(size(x_yuv));
        
        x_inpaint_re(:,:,2)         =             x_yuv(:,:,2); 
        
        x_inpaint_re(:,:,3)         =             x_yuv(:,:,3); 
        
       else
            x                       =             double(x_rgb);
       end
         
         
         x_org                      =             x;
        
        
        ratio                       =             p_miss; 

        if ratio==0.6  %text mask
            
            MaskType                =            2; 
            
        else
            
            MaskType                =            1; % random mask; 
            
        end
        
        switch MaskType
            
            case 1  %random mask;
                
                rand('seed',0);
                
                O = double(rand(size(x)) > (1-ratio));
                
            case 2  %text mask
                
                O = imread('TextMask256.png');
                
                O = double(O>128);
                
        end
        
        y                        =                           x.* O;  % Observed Image
        
        
       Opts                   =                           [];

       if ~isfield(Opts,'alpha') 
           
             Opts.alpha = alpha;
             
       end
       
       if ~isfield(Opts,'beta') 
           
             Opts.beta = beta;
             
       end
       
       if ~isfield(Opts,'mu') 
           
             Opts.mu = mu;
             
       end  
       
       if ~isfield(Opts,'c1') 
           
             Opts.c1 = c1;
             
       end
       
       if ~isfield(Opts,'c2') 
           
             Opts.c2 = c2;
             
       end       

       if ~isfield(Opts,'A')
           
            Opts.A = O;
            
       end

       if ~isfield(Opts,'IterNums')
           
            Opts.IterNums = IterNum;
            
       end

       if ~isfield(Opts,'initial')
           
            Opts.initial = Interpolation_Initial(y,~O);
            
       end

       if ~isfield(Opts,'org')
           
            Opts.org = x_org;
            
       end

       if ~isfield(Opts,'patch')
           
            Opts.patch = 7;
            
       end

       if ~isfield(Opts,'Region')
           
            Opts.Region = 25;
            
       end

       if ~isfield(Opts,'Sim')
           
            Opts.Sim = 60;
            
       end

       if ~isfield(Opts,'step')
           
           Opts.step = 4;
           
       end

      if ~isfield(Opts,'sigma')
          
           Opts.nSig = sqrt(2);
           
      end


      fprintf('.........................................\n');

     fprintf(filename);
     
     fprintf('\n');
     
     fprintf('..........................................\n');
     
     if ratio==0.6
         
     fprintf('..................LGSR Algorithm for text removal.............\n');
     
     else
         
     fprintf('..............LGSR Algorithm for random missing pixels.....   ratio = %f\n',ratio);
     
     end
      
     fprintf('..................................................\n');
     
     
     [reconstructed_image, PSNR_Final,FSIM_Final,SSIM_Final, All_PSNR,j, Err_or] = Inpainting_LGSR_Main(y,Opts);
     
      Time_s                         =                 (etime(clock,time0)); 
      
      
        if kkk==3
            
        x_inpaint_re(:,:,1)         =                  uint8(reconstructed_image);
        
        x_inpainting_recon          =                  ycbcr2rgb(uint8(x_inpaint_re));
        
        else     
        x_inpainting_recon          =                  reconstructed_image;
        
        end
        
        
        if ratio==0.1
            
         Final_Name= strcat(filename,'_LGSR_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');
            
        imwrite(uint8(x_inpainting_recon),strcat('./90_Missing_Results/',Final_Name));
        
        Final_Name1= strcat(filename,'_LGSR_miss_',num2str(1-ratio),'.txt');
        dlmwrite(Final_Name1,All_PSNR);
        
        elseif ratio==0.2
            
         Final_Name= strcat(filename,'_LGSR_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');
         
         
        imwrite(uint8(x_inpainting_recon),strcat('./80_Missing_Results/',Final_Name));
        
                Final_Name1= strcat(filename,'_LGSR_miss_',num2str(1-ratio),'.txt');
        dlmwrite(Final_Name1,All_PSNR);
        


        elseif ratio==0.3
            
            Final_Name= strcat(filename,'_LGSR_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');
            
            
        imwrite(uint8(x_inpainting_recon),strcat('./70_Missing_Results/',Final_Name));
        
                Final_Name1= strcat(filename,'_LGSR_miss_',num2str(1-ratio),'.txt');
        dlmwrite(Final_Name1,All_PSNR);
        


        elseif ratio==0.4
            
                  Final_Name= strcat(filename,'_LGSR_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');
            
         
        imwrite(uint8(x_inpainting_recon),strcat('./60_Missing_Results/',Final_Name));
        
        
                Final_Name1= strcat(filename,'_LGSR_miss_',num2str(1-ratio),'.txt');
        dlmwrite(Final_Name1,All_PSNR);
        

        
        elseif ratio==0.5
            
            
             Final_Name= strcat(filename,'_LGSR_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');
             
             
        imwrite(uint8(x_inpainting_recon),strcat('./50_Missing_Results/',Final_Name));
        
        
                Final_Name1= strcat(filename,'_LGSR_miss_',num2str(1-ratio),'.txt');
        dlmwrite(Final_Name1,All_PSNR);
        

                
        else
            
                Final_Name= strcat(filename,'_LGSR_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');
         
        imwrite(uint8(x_inpainting_recon),strcat('./Text_Inlayed_Results/',Final_Name));
        
                Final_Name1= strcat(filename,'_LGSR_miss_',num2str(1-ratio),'.txt');
        dlmwrite(Final_Name1,All_PSNR);
        
      %      Final_Name1= strcat(filename,'_GSC_LR_',num2str(1-ratio),'.txt');
  % dlmwrite(Final_Name1,All_PSNR);
                                
        end           

end

