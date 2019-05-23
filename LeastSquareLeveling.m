function Heights = LeastSquareLeveling(Observations,FirstPointHeight)
%Observations is a Nx3 or Nx4 matrix
%1st column is the point from which height difference is measured
%2nd column is the point to which height difference is measured
%3rd column is the observed height difference in meters
%4th column is the presicion of the observation in milimeters
%For example consider the following table
% ----------------------------------
%| From | To |   dH    | Precision  |
% ----------------------------------
%|  1   | 2  | 10.509  |   6        |
% ----------------------------------
%|  2   | 3  | 5.360   |   4        |
% ----------------------------------
%|  3   | 4  | -8.523  |   5        |
% ----------------------------------
%|  4   | 1  | -7.348  |   3        |
% ----------------------------------
%|  2   | 4  | -3.167  |   4        |
% ----------------------------------
%|  1   | 3  | 15.881  |   12       |
% ----------------------------------
% Based on the above table, we have the following observations
% H2-H1 = 10.509 with precision 6 milimeters
% H3-H2 = 5.360 with precision 4 milimeters
% H4-H3 = -8.523 with precision 5 milimeters
% H1-H4 = -7.348 with precision 3 milimeters
% H4-H2 = -3.167 with precision 6 milimeters
% H3-H1 = 15.881 with precision 12 milimeters
NumberOfPoints = max(max(Observations(:,1:2)));
NumberOfObservations = size(Observations,1);
A = zeros(NumberOfObservations,NumberOfPoints-1);
L = zeros(NumberOfObservations,1);
    for i = 1:NumberOfObservations
        if Observations(i,1) == 1
            A(i,Observations(i,2)-1) = 1;
            L(i,1)= FirstPointHeight + Observations(i,3);
        elseif Observations(i,2) == 1
            A(i,Observations(i,1)-1) = -1;
            L(i,1)= Observations(i,3) - FirstPointHeight;
        else
            A(i,Observations(i,2)-1) = 1;
            A(i,Observations(i,1)-1) = -1;
            L(i,1)= Observations(i,3);
        end
    end
end

