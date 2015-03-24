
%%%%% The contents of prb_set should be between 0 to num_dl_rb -1.  See
%%%%% 36.213 9.1.4.4
function comb_index = COMB_IDX(num_dl_rb, prb_set)

comb_index = 0;
[prb_set order]= sort(prb_set);
epdcch_prb_set_size = length(prb_set);

if prb_set(end) > num_dl_rb -1 ...
        || not(epdcch_prb_set_size == 2  ...
            || epdcch_prb_set_size ==4 ...
            || epdcch_prb_set_size ==8)
    disp('Invalid PRB set (index greater than max DL_RB or # PRB pairs not 2,4, or 8)');    
else    
    for k=0:1:epdcch_prb_set_size-1
        
        X = num_dl_rb-(prb_set(k+1)+1);
        Y = epdcch_prb_set_size -k;
        if X>=Y
           ext_bin_coef = nchoosek(X , Y );
        else
           ext_bin_coef = 0;
        end
        comb_index = comb_index + ext_bin_coef;
    end
end   
end
