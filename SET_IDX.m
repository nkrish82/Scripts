%%%%% The contents of prb_set should be between 0 to num_dl_rb -1.  See
%%%%% 36.213 9.1.4.4
function prb_set = SET_IDX(num_dl_rb, comb_index, epdcch_prb_set_size)

temp_comb_index = comb_index;
prb_index =1;
for idx =1:1:epdcch_prb_set_size 
    flag=0;
    while flag ==0
        X = num_dl_rb-prb_index;
        Y = epdcch_prb_set_size- (idx-1);
        if X>=Y
            ext_bin_coef = nchoosek(X,Y);
        else
            ext_bin_coef = 0;
        end
        temp_comb_index =temp_comb_index - ext_bin_coef;
        if temp_comb_index <0
            temp_comb_index = comb_index;
            prb_index = prb_index +1;
        else
            flag = 1;
        end        
    end
    prb_set(idx) = prb_index-1;
    comb_index = temp_comb_index;
end

end
