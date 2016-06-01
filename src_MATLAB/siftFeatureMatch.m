function [Q1,Q2] =siftFeatureMatch(I1, I2, N)


run('../lib/VLFeat/vlfeat-0.9.20/toolbox/vl_setup.m');
[f1, d1] = vl_sift(single(I1)) ;
[f2, d2] = vl_sift(single(I2)) ;
[matches, scores] = vl_ubcmatch(d1, d2) ;

for n = 1:N
    [~,i] = min(scores);
    Q1(n,1) = f1(1,matches(1,i));
    Q1(n,2) = f1(2,matches(1,i));

    Q2(n,1) = f2(1,matches(2,i));
    Q2(n,2) = f2(2,matches(2,i));
    scores(i) = Inf;
end

end