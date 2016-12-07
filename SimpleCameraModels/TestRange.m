function [] = TestRange(Parameter, MinVal, MaxVal, Name)
% Test Range
% Tests the range of Parameter against MinVal and MaxVal
% If the test fails an error message results quoting the parameter as an
% identifier and MATLAB exits

if Parameter < MinVal || Parameter > MaxVal
    error('Input parameter %s, value %d, was out of range', Name, Parameter)
end
end

