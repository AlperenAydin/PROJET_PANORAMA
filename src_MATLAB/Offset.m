function [x_min, x_max, y_min, y_max] = Offset(invH, Q2)

Q1 = invH*Q2;
Q1(1,:) = Q1(1,:)./Q1(3,:);
Q1(2,:) = Q1(2,:)./Q1(3,:);
Q1(3,:) = Q1(3,:)./Q1(3,:);
Q1 = round(Q1);

x_min = min(min( Q1(1,:), Q2(1,:) ));
x_max = max(max( Q1(1,:), Q2(1,:) ));
y_min = min(min( Q1(2,:), Q2(2,:) ));
y_max = max(max( Q1(2,:), Q2(2,:) ));
end