function [pnt, d] = find_point_length(I, oper, rc, ri)
gradientCurve = zeros(rc-2, 1);
if size(oper,1)<size(oper,2)
    for i=1:rc-2
        block = I(i:i+2, floor(rc/2)-20:floor(rc/2)+19);
        grad = oper.*block;
        grad = sum(grad);
        grad = abs(grad);
        meanGrad = mean(grad);
        gradientCurve(i) = meanGrad;
    end
else
    for i=1:rc-2
        block = I(floor(rc/2)-20:floor(rc/2)+19, i:i+2);
        grad = oper.*block;
        grad = sum(grad);
        grad = abs(grad);
        meanGrad = mean(grad);
        gradientCurve(i) = meanGrad;
    end
end
%gradientCurve = medfilt1(gradientCurve, 30);
gradientCurve = smooth(gradientCurve);
%stdDev = std(gradientCurvex)
gradientCurve = gradientCurve(16:end-15);

figure; plot(gradientCurve);
% gradientCurveLeft = gradientCurve(1:floor(end/2));
% gradientCurveRight = gradientCurve(floor(end/2)+1:end);
% 
% i1 = max(gradientCurveLeft);
% i2 = max(gradientCurveRight);
while true
[x1, i1] = max(gradientCurve);

gradientCurve(i1) = 0;
[x2, i2] = max(gradientCurve);
gradientCurve(i2) = 0;
if abs(i1-i2)>100
    break;
end
end
i1 = i1+15;
i2 = i2+15;
pnt = min(i1,i2)*ri/rc;
d = (max(i1,i2)*ri/rc) - pnt;

end

