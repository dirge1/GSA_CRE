function result=CRECC(fx,fy)
    result=1-(condition_CRE4(fx,fy)+condition_CRE4(fy,fx))/(cumu_res_entropy(fy)+cumu_res_entropy(fx));
    result=sqrt(result);
end