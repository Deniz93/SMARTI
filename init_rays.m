function I_top1=init_rays(rdm_ray_dir,theta,alpha,nr_of_rays,width_cell,wavelength_min,wavelength_max,wavelength_step);
% the starting point of the rays will always be the x.y-plane of the
% coordinate system
% - lambda_min needs to be >= to 300nm (stepsize is multiple of 10)
% - lambda_max needs to be <= to 1260nm (stepsize is multiple of 10)
% - lambda_step needs to be >= to 10nm (stepsize is multiple of 10)

if rdm_ray_dir==1;
    A=angles2vector(randi(1000000)/1000000*90,randi(1000000)/1000000*180);
else
    A=angles2vector(theta,alpha);
end

counter=1;
I_top1=struct('nr',[],'wavelength',[],'start_loc',[],'dir_vector',[],'ray_col',[]);

for x=1:nr_of_rays;
for wavelength=wavelength_min:wavelength_step:wavelength_max;
    
    I_top1(counter).nr=counter;
    I_top1(counter).wavelength=wavelength;
    I_top1(counter).start_loc=[randi(1000000)/1000000*width_cell; randi(1000000)/1000000*width_cell; 0];
    I_top1(counter).dir_vector=A';
    I_top1(counter).ray_col=[round(rand) round(rand) round(rand)];
counter=counter+1;
end
end
