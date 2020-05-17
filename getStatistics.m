function [corr, err, noth] = getStatistics(indx_cl1, indx_cl1_net,indx_cl2_net)
   corr = 0;
   err = 0;
   noth = 0;
   for x=1:length(indx_cl1)
            if(any(indx_cl1_net(:)==indx_cl1(x)))
                corr= corr + 1;
            elseif(any(indx_cl2_net(:)== indx_cl1(x)))
                err = err +1;
            else 
                noth = noth+1;
            end
   end
        
        
end

