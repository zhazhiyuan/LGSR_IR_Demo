clc
clear
m_1=0; 
m_2=0;    
m_3=0;  
m_4=0;  
m_5=0; 


m_6=0; 
m_7=0;    
m_8=0;  
m_9=0;  
m_10=0; 


m_11=0; 
m_12=0;    
m_13=0;  
m_14=0;  
m_15=0; 
m_16=0;  
m_17=0;  
m_18=0; 

All_data_Results_1 = cell(1,400);
All_data_Results_2 = cell(1,400);
All_data_Results_3 = cell(1,400);
All_data_Results_4 = cell(1,400);
All_data_Results_5 = cell(1,400);


All_data_Results_6 = cell(1,400);
All_data_Results_7 = cell(1,400);
All_data_Results_8 = cell(1,400);
All_data_Results_9 = cell(1,400);
All_data_Results_10 = cell(1,400);


All_data_Results_11 = cell(1,400);
All_data_Results_12 = cell(1,400);
All_data_Results_13 = cell(1,400);
All_data_Results_14 = cell(1,400);
All_data_Results_15 = cell(1,400);

All_data_Results_16 = cell(1,400);
All_data_Results_17 = cell(1,400);
All_data_Results_18 = cell(1,400);

for i = 14
ImageNum =i;

switch ImageNum
               case 1
                filename = 'b15';
             case 2
                filename = 'b60';
             case 3
                filename = 'b78';
             case 4
                filename = 'Bahoon_256';
             case 5
                filename = 'Barbara256rgb';
             case 6
                filename = 'Bear';
             case 7
                filename = 'Butterfly';
             case 8
                filename = 'Fence';
             case 9
                filename = 'flickr_d_35_1';
              case 10
                filename = 'flickr_w_35_2';
                
             case 11
                filename = 'flickr_w_72_1';
             case 12
                filename = 'flickr_w_109_2';
             case 13
                filename = 'House';
             case 14
                filename = 'Lake256';
             case 15
                filename = 'leaves';
             case 16
                filename = 'lena';
             case 17
                filename = 'light';
             case 18
                filename = 'lily';
             case 19
                filename = 'Mickey';
              case 20
                filename = 'pepper';    
                
             case 21
                filename = 'Starfish';
             case 22
                filename = 'wsd_6_2';
             case 23
                filename = 'wsd_36_1';
             case 24
                filename = 'wsd_61_3';
             case 25
                filename = 'wsd_86_2';
             case 26
                filename = 'wsd_124_2';
             case 27
                filename = 'wsd_162_4';
             case 28
                filename = 'wsd_167_2';
             case 29
                filename = 'wsd_231_4';
              case 30
                filename = 'wsd_5_1';  
                
             case 31
                filename = 'wsd_185_3';
             case 32
                filename = 'wsd_259_1';
                
             case 33
                filename = 'lisha_ori_Deblurring';
             case 34
                filename = '53';          

end

for j  =   1:6
    


 
miss_rate          =     [0.1, 0.2, 0.3, 0.4, 0.5, 0.6]; % 0.6 represents Inlayed Text Removal

     


IterNum            =       400;

p_miss             =       miss_rate(j)



c1                 =      1;

c2                 =      1;


             

 if  p_miss==0.1
     
     mu =  0.001;  alpha = 0.00001; beta = 0.00001;
     

 [Ori, p_miss, alpha, beta, mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= Inpainting_LGSR_Test(filename, IterNum, p_miss, alpha, beta, mu, c1, c2);
 
 m_1= m_1+1;
 
 s=strcat('A',num2str(m_1));
 
 All_data_Results_1{m_1}={Ori, p_miss,  mu, alpha, beta, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('Inpaint_LR_GSC_90_miss_Test_Final_Lisha.xls', All_data_Results_1{m_1},'sheet1',s);
 

 
 
elseif  p_miss==0.2
    
    
       mu =  0.0008;  alpha = 0.00003; beta = 0.00002;
    

         
[Ori, p_miss, alpha, beta, mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= Inpainting_LGSR_Test(filename, IterNum, p_miss, alpha, beta, mu, c1, c2);

 m_4= m_4+1;
 
 s=strcat('A',num2str(m_4));
 
 All_data_Results_4{m_4}={Ori, p_miss,  mu, alpha, beta, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('Inpaint_LR_GSC_80_miss_Test_Final_Lisha.xls', All_data_Results_4{m_4},'sheet1',s);


 
 elseif  p_miss==0.3
     
     
       mu =  0.0008;  alpha = 0.00001; beta = 0.00003;
     

[Ori, p_miss, alpha, beta, mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= Inpainting_LGSR_Test(filename, IterNum, p_miss, alpha, beta, mu, c1, c2);

 m_7= m_7+1;
 
 s=strcat('A',num2str(m_7));
 
 All_data_Results_7{m_7}={Ori, p_miss,  mu, alpha, beta, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('Inpaint_LR_GSC_70_miss_Test_Final.xls', All_data_Results_7{m_7},'sheet1',s);
 
 
 
 
  elseif  p_miss==0.4
      
            mu =  0.0008;  alpha = 0.00004; beta = 0.00003;
     
    
[Ori, p_miss, alpha, beta, mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= Inpainting_LGSR_Test(filename, IterNum, p_miss, alpha, beta, mu, c1, c2);

 m_10=  m_10+1;
 
 s=strcat('A',num2str( m_10));
 
 All_data_Results_10{ m_10}={Ori, p_miss,  mu, alpha, beta, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('Inpaint_LR_GSC_60_miss_Test_Final.xls', All_data_Results_10{ m_10},'sheet1',s);
 

 
 
 elseif p_miss==0.5
     
                mu =  0.0008;  alpha = 0.00004; beta = 0.00003;
     
     
[Ori, p_miss, alpha, beta, mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= Inpainting_LGSR_Test(filename, IterNum, p_miss, alpha, beta, mu, c1, c2);

 m_13=  m_13+1;
 
 s=strcat('A',num2str( m_13));
 
 All_data_Results_13{ m_13}={Ori, p_miss,  mu, alpha, beta, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('Inpaint_LR_GSC_50_miss_Test_Final.xls', All_data_Results_13{ m_13},'sheet1',s);


 
 else
     
                mu =  0.0008;  alpha = 0.00001; beta = 0.00001;
     
  
[Ori, p_miss, alpha, beta, mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= Inpainting_LGSR_Test(filename, IterNum, p_miss, alpha, beta, mu, c1, c2);

 m_16=  m_16+1;
 
 s=strcat('A',num2str( m_16));
 
 All_data_Results_16{ m_16}={Ori, p_miss,  mu, alpha, beta, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('Inpaint_LR_GSC_text_miss_Test_Final.xls', All_data_Results_16{ m_16},'sheet1',s);        
       


 
 end

    
clearvars -except filename  i m_1 All_data_Results_1 m_2 All_data_Results_2 m_3 All_data_Results_3 m_4 All_data_Results_4 m_5 All_data_Results_5 ...
m_6 All_data_Results_6 m_7 All_data_Results_7 m_8 All_data_Results_8 m_9 All_data_Results_9 m_10 All_data_Results_10 m_11 All_data_Results_11 ...
m_12 All_data_Results_12 m_13 All_data_Results_13 m_14 All_data_Results_14 m_15 All_data_Results_15 m_16 All_data_Results_16 ...
m_17 All_data_Results_17 m_18 All_data_Results_18
end

    
clearvars -except filename   m_1 All_data_Results_1 m_2 All_data_Results_2 m_3 All_data_Results_3 m_4 All_data_Results_4 m_5 All_data_Results_5 ...
m_6 All_data_Results_6 m_7 All_data_Results_7 m_8 All_data_Results_8 m_9 All_data_Results_9 m_10 All_data_Results_10 m_11 All_data_Results_11 ...
m_12 All_data_Results_12 m_13 All_data_Results_13 m_14 All_data_Results_14 m_15 All_data_Results_15 m_16 All_data_Results_16 ...
m_17 All_data_Results_17 m_18 All_data_Results_18
end


         