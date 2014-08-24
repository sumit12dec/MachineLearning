function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%
%0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30
% You need to return the following variables correctly.
C = 1;
sigma = 0.3;
error_master=1.0;
C_vect = [0.01 0.03 0.1 0.3 1 3 10 30];
sigma_vect = [0.01 0.03 0.1 0.3 1 3 10 30];
for a=1:length(C_vect)
for b=1:length(sigma_vect)
model = svmTrain(X, y, C_vect(a), @(x1, x2) gaussianKernel(x1, x2, sigma_vect(b)));
predictions = svmPredict(model, Xval);
error1 = mean(double(predictions ~= yval));
[vc, inc]  = min(C_vect);
[vs, ins] = min(sigma_vect);
if(error1<error_master)
error_master = error1;
C=C_vect(a);
sigma=sigma_vect(b);
endif
end
end


% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
% =========================================================================
end
